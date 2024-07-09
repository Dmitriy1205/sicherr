const admin = require('../firebase');

const sendPushNotification = async (phones, title, message, data = {}) => {
  try {
    const userSnapshots = await admin.firestore().collection('users')
      .where('phone', 'in', phones).get();

    const tokenPromises = [];
    const userDocs = [];

    userSnapshots.forEach(userDoc => {
      userDocs.push(userDoc);
      tokenPromises.push(
        userDoc.ref.collection('fcm_tokens').orderBy('createdAt', 'desc').limit(1).get()
      );
    });

    const tokenSnapshots = await Promise.all(tokenPromises);

    const messagePromises = [];

    tokenSnapshots.forEach((snapshot, index) => {
      snapshot.forEach(tokenDoc => {
        const tokenData = tokenDoc.data();
        const fcmMessage = {
          token: tokenData.token,
          notification: {
            title: title,
            body: message,
          },
          apns: {
            payload: {
              aps: {
                sound: "syren.wav"
              }
            }
          },
          data: data,
        };

        // Send notification
        const sendNotificationPromise = admin.messaging().send(fcmMessage)
          .then(response => {
            console.log('Successfully sent message:', response);
            // Write notification to Firestore
            const userDoc = userDocs[index];
            const notificationData = {
              title: title,
              message: message,
              data: data,
              timestamp: admin.firestore.FieldValue.serverTimestamp()
            };
            return userDoc.ref.collection('notifications').add(notificationData);
          })
          .then(() => console.log('Notification saved to Firestore'))
          .catch(error => {
            console.error('Error sending message or saving notification:', error);
            throw error;
          });

        messagePromises.push(sendNotificationPromise);
      });
    });

    return Promise.all(messagePromises);
  } catch (error) {
    console.error('Error in sendPushNotification:', error);
    throw error;
  }
};

module.exports = { sendPushNotification };
