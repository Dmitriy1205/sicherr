// app.js
const express = require('express');
const bodyParser = require('body-parser');
const { verifyToken } = require('./middlewares/authMiddleware');
const { validateSosBody, validateNotificationBody } = require('./middlewares/validateMiddleware');
const { sendSos } = require('./controllers/sosController');
const { sendNotification } = require('./controllers/notificationController');
const { startTimer, stopTimer } = require('./controllers/timerController');
const { changePhoneNumber } = require('./controllers/changePhoneNumberController');

const app = express();
app.use(bodyParser.json());

// Route for sending SOS
app.post('/send_sos', verifyToken, validateSosBody, sendSos);

// Route for sending notification
app.post('/send_notification', verifyToken, validateNotificationBody, sendNotification);

// Route for starting timer
app.post('/start_timer', verifyToken, startTimer);

// Route for stopping timer
app.post('/stop_timer', verifyToken, stopTimer);

app.post('/change_phone_number', verifyToken, changePhoneNumber);

module.exports = app;