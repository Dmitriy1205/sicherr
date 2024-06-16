// utils/pushNotification.js
const admin = require('../firebase');

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

module.exports = { sendPushNotification };
