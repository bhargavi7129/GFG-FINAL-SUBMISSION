// routes/doctor.js

const express = require('express');
const router = express.Router();
const Patient = require('../models/patient');

// Handle GET request to retrieve waiting patients
router.get('/patients/waiting', async (req, res) => {
  try {
    // Find waiting patients
    const waitingPatients = await Patient.find({ status: 'waiting' }).select('name');
    res.json(waitingPatients);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

// Handle GET request to retrieve patient details by ID
router.get('/patients/:id/details', async (req, res) => {
  try {
    const patient = await Patient.findById(req.params.id).select('name problem');
    res.json(patient);
  } catch (err) {
    res.status(404).json({ message: 'Patient not found' });
  }
});

// Handle POST request to update patient record after reviewing
router.post('/patients/:id/review', async (req, res) => {
  try {
    const { acceptReject, pdf, estimatedCost, prescription } = req.body;

    const patient = await Patient.findById(req.params.id);

    if (!patient) {
      return res.status(404).json({ message: 'Patient not found' });
    }

    patient.status = acceptReject === 'accept' ? 'accepted' : 'rejected';
    patient.pdf = pdf;
    patient.estimatedCost = estimatedCost;
    patient.prescription = prescription;

    const updatedPatient = await patient.save();
    res.json(updatedPatient);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
});

module.exports = router;
