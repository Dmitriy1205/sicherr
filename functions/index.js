
// index.js
const functions = require('firebase-functions');
const admin = require('firebase-admin');
const app = require('./app');

exports.api = functions.https.onRequest(app);

exports.checkTimers = functions.pubsub.schedule('every 2 minutes').onRun(async (context) => {
  const now = new Date();
  const warningThreshold = new Date(now.getTime() + 5 * 60000);

  try {
    // Query timers with status 'started' and executionDate within the next 5 minutes
    const warningQuerySnapshot = await admin.firestore().collection('timers')
      .where('status', '==', 'started')
      .where('executionDate', '<=', warningThreshold)
      .get();

    const batch = admin.firestore().batch();

    warningQuerySnapshot.forEach(doc => {
      const timer = doc.data();
      // Send warning notification
      sendNotification(timer.userId, timer.warning_title, timer.warning_message);
      batch.update(doc.ref, { status: 'warning_sent' });
    });

    // Query timers with status 'warning_sent' and executionDate <= now
    const triggerQuerySnapshot = await admin.firestore().collection('timers')
      .where('status', '==', 'warning_sent')
      .where('executionDate', '<=', now)
      .get();

    triggerQuerySnapshot.forEach(doc => {
      const timer = doc.data();
      // Send trigger notification and SOS
      sendNotification(timer.userId, timer.trigger_title, timer.trigger_message);
      sendPushNotification(timer.phones, 'SOS', timer.sos_message);
      batch.delete(doc.ref);
    });

    await batch.commit();
  } catch (error) {
    console.error('Error processing timers:', error);
  }
});

const sendNotification = async (userId, title, message) => {
  const snapshot = await admin.firestore().collection('users').doc(userId).collection('fcm_tokens').orderBy('createdAt', 'desc').limit(1).get();
  if (!snapshot.empty) {
    const tokenDoc = snapshot.docs[0];
    const tokenData = tokenDoc.data();
    const fcmMessage = {
      token: tokenData.token,
      notification: { title, body: message }
    };

    await admin.messaging().send(fcmMessage);
  }
};

const sendPushNotification = (phones, title, message) => {
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