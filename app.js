// app.js

// Require necessary modules
const express = require('express');
const bodyParser = require('body-parser');
const mongoose = require('mongoose');

// Create Express app
const app = express();

// Body Parser Middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// MongoDB Connection
mongoose.connect('mongodb://localhost:27017/healthcareDB', {
  useNewUrlParser: true,
  useUnifiedTopology: true
});
const db = mongoose.connection;
db.on('error', console.error.bind(console, 'MongoDB connection error:'));
db.once('open', function() {
  console.log('Connected to MongoDB');
});

// Define routes
// Example route - replace with your endpoints and logic
app.get('/', (req, res) => {
  res.send('Welcome to Healthcare Management System!');
});

// Listen to a specific port
const port = 3000; // You can use any port you prefer
app.listen(port, () => {
  console.log(`Server started on port ${port}`);
});
