// controllers/notificationController.js
const { sendPushNotification } = require('../utils/pushNotification');

const sendNotification = (req, res) => {
  const { phones, title, message, data } = req.notificationData;

  sendPushNotification(phones, title, message, data)
    .then(() => {
      res.status(200).json({ status: 200 });
    })
    .catch(error => {
      console.error('Error sending notification:', error);
      res.status(500).json({ status: 500, error: error.stack });
    });
};

module.exports = { sendNotification };
