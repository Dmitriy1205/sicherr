const functions = require('firebase-functions');
const express = require('express');
const admin = require('firebase-admin');
const bodyParser = require('body-parser');
const axios = require('axios');

admin.initializeApp();

const app = express();
app.use(bodyParser.json());

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

// Utility function to send push notifications
const sendPushNotification = (phones, title, message, data = {}) => {
  const promises = phones.map(phone => {
    return admin.firestore().collection('users').where('phone', '==', phone).get()
      .then(snapshot => {
        snapshot.forEach(doc => {
          doc.ref.collection('fcm_tokens').orderBy('createdAt', 'desc').limit(1).get()
            .then(tokenSnapshot => {
              tokenSnapshot.forEach(tokenDoc => {
                const tokenData = tokenDoc.data();
                const fcmMessage = {
                  token: tokenData.token,
                  notification: {
                    title: title,
                    body: message
                  },
                  data: data
                };
                admin.messaging().send(fcmMessage)
                  .then(response => console.log('Successfully sent message:', response))
                  .catch(error => console.error('Error sending message:', error));
              });
            });
        });
      });
  });

  return Promise.all(promises);
};

// Middleware to validate send_sos request body
const validateSosBody = (req, res, next) => {
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

// Middleware to validate send_notification request body
const validateNotificationBody = (req, res, next) => {
  const { phones, title, message, data } = req.body;

  if (!phones || !Array.isArray(phones) || phones.length === 0) {
    return res.status(400).json({ error: 'Phones parameter is missing or empty' });
  }

  if (typeof title !== 'string' || typeof message !== 'string') {
    return res.status(400).json({ error: 'Title or message parameter is invalid' });
  }

  if (data !== undefined && typeof data !== 'object') {
    return res.status(400).json({ error: 'Data parameter is invalid' });
  }

  req.notificationData = { phones, title, message, data: data || {} };
  next();
};

// Route for sending SOS
app.post('/send_sos', verifyToken, validateSosBody, (req, res) => {
  const { phones, message, lat, long, phone } = req.sosData;

  sendPushNotification(phones, `SOS | ${phone}`, message || "SOS", {
    type: 'sos',
    link: lat && long ? `https://www.google.com/maps?q=${lat},${long}&z=15` : ""
  }).then(async () => {
    const smsMessages = phones.map(sendToPhone => ({
      from: "Sicherr",
      to: sendToPhone,
      source: "sdk",
      body: `SOS | ${phone}\n${lat && long ? `${message}\nhttps://www.google.com/maps?q=${lat},${long}&z=15` : message}`
    }));

    const clickSendMessage = { messages: smsMessages };

    try {
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
  }).catch(error => {
    console.error('Error sending SOS:', error);
    res.status(500).json({ status: 500, error: error.stack });
  });
});

// Route for sending notification
app.post('/send_notification', verifyToken, validateNotificationBody, (req, res) => {
  const { phones, title, message, data } = req.notificationData;

  sendPushNotification(phones, title, message, data)
    .then(() => {
      res.status(200).json({ status: 200 });
    })
    .catch(error => {
      console.error('Error sending notification:', error);
      res.status(500).json({ status: 500, error: error.stack });
    });
});

exports.api = functions.https.onRequest(app);