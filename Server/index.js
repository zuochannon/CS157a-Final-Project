// Import required modules
const express = require('express');

// Create an instance of Express
const app = express();
const port = 3000; // You can change this to any port you prefer
const path = require('path');
const mysql = require('mysql');

// Create a connection to the database
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'password',
  database: 'MusicDatabase',
});

// Connect to the database
connection.connect((err) => {
  if (err) {
    console.error('Error connecting to the database:', err);
    return;
  }
  console.log('Connected to the database');
  
  
});



// Serve static files from the 'public' directory
app.use(express.static(path.join(__dirname, 'Frontend/public')));



app.get('/api/artists', (req, res) => {
  connection.query('SELECT * FROM ARTISTS', (queryError, results) => {
    console.log(results);
    res.json(results)
});
})
app.get('/api/discography/:id', (req, res) => {
  const artistId = parseInt(req.params.id);
  connection.query(`SELECT * FROM DISCOGRAPHYVIEW WHERE ARTIST_ID=${artistId}`,
   (queryError, results) => {
    console.log(results);
    res.json(results)
});
})
app.get('/api/mostpopular/:id', (req, res) => {
  const artistId = parseInt(req.params.id);
  connection.query(`SELECT * FROM ARTISTMOSTPOPULARVIEW WHERE ARTIST_ID=${artistId}`,
   (queryError, results) => {
    console.log(results);
    res.json(results)
});
})
app.get('/api/album/:id', (req, res) => {
  const artistId = parseInt(req.params.id);
  connection.query(`SELECT * FROM ALBUMVIEW WHERE ARTIST_ID=${artistId}`,
   (queryError, results) => {
    console.log(results);
    res.json(results)
});
})
app.get('/api/playlist/:id', (req, res) => {
  const artistId = parseInt(req.params.id);
  connection.query(`SELECT * FROM PLAYLISTVIEW WHERE ARTIST_ID=${artistId}`,
   (queryError, results) => {
    console.log(results);
    res.json(results)
});
})


// Catch-all route to serve the main HTML file
app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname, 'Frontend/public', 'index.html'));
});
// Start the server
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
