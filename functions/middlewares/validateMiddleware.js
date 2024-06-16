// middlewares/validateMiddleware.js
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
  
  module.exports = { validateSosBody, validateNotificationBody };
  