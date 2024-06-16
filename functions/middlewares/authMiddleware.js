// middlewares/authMiddleware.js
const admin = require('../firebase');

const verifyToken = (req, res, next) => {
  const authToken = req.headers.authorization;

  if (!authToken || !authToken.startsWith('Bearer ')) {
    return res.status(403).json({ error: 'Unauthorized' });
  }

  const idToken = authToken.split('Bearer ')[1];

  admin.auth().verifyIdToken(idToken)
    .then(decodedToken => {
      req.user = decodedToken;
      req.userId = decodedToken.uid;
      next();
    })
    .catch(error => {
      console.error('Error verifying token:', error);
      res.status(403).json({ error: 'Unauthorized' });
    });
};

module.exports = { verifyToken };
