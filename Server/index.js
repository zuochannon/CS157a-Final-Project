// Import required modules
const express = require('express');
const bodyParser = require('body-parser');
// Create an instance of Express
const app = express();
const port = 3000; // You can change this to any port you prefer
const path = require('path');
const mysql = require('mysql');
const e = require('express');
// Parse JSON bodies
app.use(bodyParser.json());

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
    res.json(results)
});
})
app.get('/api/albums', (req, res) => {
  connection.query(`SELECT * FROM ALBUMINFOVIEW`, (queryError, results) => {
    res.json(results)
});
})
app.get('/api/playlists', (req, res) => {
  connection.query('SELECT * FROM PLAYLISTINFOVIEW', (queryError, results) => {
    res.json(results)
});
})
app.get('/api/discography/:id', (req, res) => {
  const artistId = parseInt(req.params.id);
  connection.query(`SELECT * FROM DISCOGRAPHYVIEW WHERE ARTIST_ID=${artistId}`,
   (queryError, results) => {
    res.json(results)
});
})
app.get('/api/mostpopular/:id', (req, res) => {
  const artistId = parseInt(req.params.id);
  connection.query(`SELECT * FROM ARTISTMOSTPOPULARVIEW WHERE ARTIST_ID=${artistId}`,
   (queryError, results) => {
    res.json(results)
});
})
app.get('/api/album/:id', (req, res) => {
  const albumID = parseInt(req.params.id);
  connection.query(`SELECT * FROM ALBUMSONGSVIEW WHERE ALBUM_ID=${albumID}`,
   (queryError, results) => {
    res.json(results)
});
})
app.get('/api/playlist/:id', (req, res) => {
  const playlistID = parseInt(req.params.id);
  connection.query(`SELECT * FROM PLAYLISTSONGVIEW WHERE PLAYLIST_ID=${playlistID}`,
   (queryError, results) => {
    res.json(results)
});
})

app.post('/api/query',(req, res) => {
  const insertRegex = /^INSERT\s+INTO\s+/i;
  const selectRegex = /^SELECT\s+/i;
  if (!insertRegex.test(req.body.query) && !selectRegex.test(req.body.query)){
    res.json({error:{sqlMessage:"Invalid query type. SELECT or INSERT only"}})
    return;
  }
  connection.query(req.body.query,
   (queryError, results) => {
    if (queryError){
      res.json({error:queryError});
    }
    else{
      res.json(results)
    }
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
