// controllers/sosController.js
const axios = require('axios');
const { sendPushNotification } = require('../utils/pushNotification');

const sendSos = async (req, res) => {
  const { phones, message, lat, long, phone } = req.sosData;

  try {
    await sendPushNotification(phones, `SOS | ${phone}`, message || "SOS", {
      type: 'sos',
      link: lat && long ? `https://www.google.com/maps?q=${lat},${long}&z=15` : ""
    });
    
    res.status(200).json({ status: 200 });
  } catch (error) {
    console.error('Error sending SOS:', error.response?.data || error.message);
    res.status(500).json({ status: 500, error: error.response?.data || error.message });
  }
};

module.exports = { sendSos };
