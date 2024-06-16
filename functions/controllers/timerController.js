// controllers/timerController.js
const admin = require('../firebase');

const startTimer = async (req, res) => {
  try {
    const { executionDate, userId, phones, warning_title, warning_message, trigger_title, trigger_message, phone, sos_message, seconds } = req.body;

    const timerSnapshot = await admin.firestore().collection('timers').where('userId', '==', userId).get();

    if (!timerSnapshot.empty) {
        return res.status(404).json({ error: 'Timer already started' });
    }

    await admin.firestore().collection('timers').add({
      userId,
      seconds,
      executionDate: new Date(executionDate),
      status: 'started',
      phones,
      warning_title,
      warning_message,
      trigger_title,
      trigger_message,
      sos_message,
      phone
    });

    res.status(200).json({ status: 'Timer scheduled successfully' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Failed to schedule timer' });
  }
};

const stopTimer = async (req, res) => {
    try {
        const { userId } = req.body;
    
        const timerSnapshot = await admin.firestore().collection('timers').where('userId', '==', userId).get();
    
        if (timerSnapshot.empty) {
          return res.status(404).json({ error: 'No active timer found' });
        }
    
        const batch = admin.firestore().batch();
    
        timerSnapshot.forEach(doc => {
          batch.delete(doc.ref);
        });
    
        await batch.commit();
    
        res.status(200).json({ status: 'Timer stopped successfully' });
      } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to stop timer' });
      }
};

module.exports = { startTimer, stopTimer };
