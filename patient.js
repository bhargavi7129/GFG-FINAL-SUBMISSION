// routes/patient.js

const express = require('express');
const router = express.Router();
const Patient = require('../models/patient');

// Handle POST request to add a new patient
router.post('/patients/add', async (req, res) => {
  try {
    const { name, doctor, appointmentDate, appointmentTime } = req.body;

    // Create a new Patient instance
    const newPatient = new Patient({
      name: name,
      doctor: doctor,
      appointmentDate: appointmentDate,
      appointmentTime: appointmentTime
    });

    // Save the new patient to the database
    const savedPatient = await newPatient.save();

    res.status(201).json(savedPatient);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
});

module.exports = router;
