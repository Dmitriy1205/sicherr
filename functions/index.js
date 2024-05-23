const functions = require('firebase-functions');
const express = require('express');
const admin = require('firebase-admin');
const bodyParser = require('body-parser');
const axios = require('axios');

admin.initializeApp();

const app = express();

// Middleware to verify authorization token
const verifyToken = (req, res, next) => {
  const authToken = req.headers.authorization;

  if (!authToken || !authToken.startsWith('Bearer ')) {
    return res.status(403).json({ error: 'Unauthorized' });
  }

  const idToken = authToken.split('Bearer ')[1];

  admin.auth().verifyIdToken(idToken)
    .then(decodedToken => {
      req.user = decodedToken;
      next();
    })
    .catch(error => {
      console.error('Error verifying token:', error);
      res.status(403).json({ error: 'Unauthorized' });
    });
};

// Middleware to validate request body
const validateBody = (req, res, next) => {
  const { phones, message, lat, long, phone } = req.body;

  if (!phones || !Array.isArray(phones) || phones.length === 0) {
    return res.status(400).json({ error: 'Phones parameter is missing or empty' });
  }

  if (typeof message !== 'string') {
    return res.status(400).json({ error: 'Message parameter is invalid' });
  }

  req.sosData = { phones, message, lat, long, phone };
  next();
};

// Route for sending SOS
app.post('/send_sos', verifyToken, validateBody, (req, res) => {
  const { phones, message, lat, long, phone } = req.sosData;
  const promises = [];

  phones.forEach(sendToPhone => {
    const userRef = admin.firestore().collection('users').where('phone', '==', sendToPhone).get();

    promises.push(userRef.then(snapshot => {
      snapshot.forEach(doc => {
        const fcmTokensRef = doc.ref.collection('fcm_tokens');
        fcmTokensRef.orderBy('createdAt', 'desc').limit(1).get().then(tokenSnapshot => {
          tokenSnapshot.forEach(tokenDoc => {
            const tokenData = tokenDoc.data();
            const displayMessage = message === null || message === "" ? "SOS" : message;
            const fcmMessage = {
              token: tokenData.token,
              notification: {
                title: `SOS | ${phone}`,
                body: lat && long ?
                  `${displayMessage}\nhttps://www.google.com/maps?q=${lat},${long}&z=15` : displayMessage
              },
              data: {
                type: 'sos',
                link: lat && long ? `https://www.google.com/maps?q=${lat},${long}&z=15` : ""
              }
            };
            admin.messaging().send(fcmMessage)
              .then(response => console.log('Successfully sent message:', response))
              .catch(error => console.error('Error sending message:', error));
          });
        });
      });
    }));
  });

  Promise.all(promises)
    .then(async () => {
  const displayMessage = message === null || message === "" ? "SOS" : message;
      // Constructing SMS messages array
  const smsMessages = phones.map(sendToPhone => ({
    from: "Sicherr",
    to: sendToPhone,
    source: "sdk",
    body: `SOS | ${phone}\n` + (lat && long ?
                  `${displayMessage}\nhttps://www.google.com/maps?q=${lat},${long}&z=15` : displayMessage)
  }));

  // Constructing ClickSend request payload
  const clickSendMessage = {
    messages: smsMessages
  };

  try {
    // Sending SMS using ClickSend API with Basic Authentication
    const username = 'info@wecallsmart.de';
    const password = 'AD733F48-165D-7C09-D289-97018F3DD398';
    const authHeader = `Basic ${Buffer.from(`${username}:${password}`).toString('base64')}`;

    const response = await axios.post('https://rest.clicksend.com/v3/sms/send', clickSendMessage, {
      headers: {
        'Authorization': authHeader,
        'Content-Type': 'application/json'
      }
    });

    console.log('Successfully sent SMS:', response.data);
    res.status(200).json({ status: 200 });
  } catch (error) {
    console.error('Error sending SOS:', error.response.data);
    res.status(500).json({ status: 500, error: error.response.data });
  }
    })
    .catch(error => {
      console.error('Error sending SOS:', error);
      res.status(500).json({ status: 500, error: error.stack });
    });
});

exports.api = functions.https.onRequest(app);