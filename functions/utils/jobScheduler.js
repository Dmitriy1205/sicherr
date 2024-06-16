// utils/jobScheduler.js
const schedule = require('node-schedule');
const admin = require('../firebase');
const { sendPushNotification } = require('./pushNotification');
const { log } = require('firebase-functions/logger');

const scheduledJobs = {};

const scheduleJob = (jobId, date, callback) => {
  if (scheduledJobs[jobId]) {
    scheduledJobs[jobId].cancel();
  }

  scheduledJobs[jobId] = schedule.scheduleJob(date, callback);
};

const cancelJob = (jobId) => {
  if (scheduledJobs[jobId]) {
    scheduledJobs[jobId].cancel();
    delete scheduledJobs[jobId];
  }
};

const cancelJobsByUserId = (userId) => {
    const jobId1 = userId + "_warning";
    const jobId2 = userId + "_trigger";
    cancelJob(jobId1);
    cancelJob(jobId2);
};

const scheduleTimerJobs = (userId, date, warningData, triggerData, sosData) => {
  const warningDate = new Date(date.getTime() - 5 * 60000); // 5 minutes before date
  scheduleJob(`${userId}_warning`, warningDate, () => {
    sendPushNotification([sosData.phone], warningData.title, warningData.message);
  });

  scheduleJob(`${userId}_trigger`, date, () => {
    sendPushNotification([sosData.phone], triggerData.title, triggerData.message)
      .then(() => {
        sendPushNotification(sosData.phones, `SOS`, sosData.message, {
          type: 'sos',
          link: sosData.lat && sosData.long ? `https://www.google.com/maps?q=${sosData.lat},${sosData.long}&z=15` : ""
        });
      });
  });
};

module.exports = { scheduleTimerJobs, cancelJobsByUserId };
