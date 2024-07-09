const admin = require('../firebase');

const changePhoneNumber = async (req, res) => {
    const { uid, phoneNumber} = req.body;
    try {
      await admin.auth().updateUser(uid, {
        phoneNumber: phoneNumber,
      });
  
      res.status(200).json({ status: 200 });
    } catch (error) {
      console.error('Error sending SOS:', error.response?.data || error.message);
      res.status(500).json({ status: 500, error: error.response?.data || error.message });
    }
  };

  module.exports = { changePhoneNumber }