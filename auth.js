const express = require('express');
const router = express.Router();
const User = require('../models/user');
const bcrypt = require('bcrypt');

// Register a new user
router.post('/PatlogR', (req, res) => {
  try {
    const hashedPassword = await bcrypt.hash(req.body.password, 10);
    const user = new User({
      fullName: req.body.fullName,
      username: req.body.username,
      address: req.body.address,
      phoneNo: req.body.phoneNo,
      password: hashedPassword,
    });
    await user.save();
    res.send('User registered successfully');
  } catch (error) {
    res.status(500).send('Error registering user');
  }
});

router.post('/doclogR', async (req, res) => {
  try {
    const hashedPassword = await bcrypt.hash(req.body.password, 10);
    const user = new User({
      fullName: req.body.fullName,
      username: req.body.username,
      address: req.body.address,
      phoneNo: req.body.phoneNo,
      password: hashedPassword,
    });
    await user.save();
    res.send('User registered successfully');
  } catch (error) {
    res.status(500).send('Error registering user');
  }
});

// Login
router.post('/doclogL', async (req, res) => {
  const user = await User.findOne({ username: req.body.username });
  if (user) {
    const validPassword = await bcrypt.compare(req.body.password, user.password);
    if (validPassword) {
      res.send('Login successful');
    } else {
      res.status(400).send('Invalid password');
    }
  } else {
    res.status(400).send('User not found');
  }
});

router.post('/patlogL', async (req, res) => {
  const user = await User.findOne({ username: req.body.username });
  if (user) {
    const validPassword = bcrypt.compare(req.body.password, user.password);
    if (validPassword) {
      res.send('Login successful');
    } else {
      res.status(400).send('Invalid password');
    }
  } else {
    res.status(400).send('User not found');
  }
});

// Forget password - Implementation can vary, usually involves sending a reset link to user's email

module.exports = router;
