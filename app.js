const express = require('express');
const path = require('path');
const session = require('express-session');
const mysql = require('mysql2'); // Add this line
const app = express();
const port = 3000;

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'DATABASE_TUBES'
});

connection.connect((err) => {
  if (err) {
    console.error('Error connecting to MySQL:', err);
    return;
  }
  console.log('Connected to MySQL');
});

const staticPath = path.join(__dirname, 'includes');
const cssPath = path.join(staticPath, 'css');

app.use(express.urlencoded({ extended: true })); // Parse form data
app.use('/includes', express.static(staticPath));
app.use('/css', express.static(cssPath));

app.use(session({
  secret: 'your-secret-key',
  resave: false,
  saveUninitialized: true
}));

app.set('views', path.join(__dirname, 'pages'));
app.set('view engine', 'ejs');

function authenticateUser(req, res, next) {
  if (req.session.user && req.session.user.authenticated) {
    // User is authenticated, allow access to the route
    next();
  } else {
    // User is not authenticated, redirect to the login page
    res.redirect('/');
  }
}


function isValidUser(username, password) {
  const query = 'SELECT * FROM pengguna WHERE id_user = ? AND katasandi = ?';
  connection.query(query, [username, password], (err, results) => {
    if (err) {
      console.error('Error querying database:', err);
      return false;
    }

    if (results.length > 0) {
      req.session.user = { authenticated: true, username };
      return true;
    }

    // User does not exist or incorrect password
    return false;
  });
}

app.post('/login', (req, res) => {
  const { username, password } = req.body;

  if (isValidUser(username, password)) {
    if (username.length === 3) {
      res.redirect('/home-dosen');
    } else {
      res.redirect('/home-asdos');
    }
  } else {
    res.redirect('/');
  }
});

app.get('/', (req, res) => {
  res.render('all/Login');
});


app.get('/signup', (req, res) => {
  res.render('asdos/sign-up');
});

//app.get('/home-asdos', authenticateUser, (req, res) => {
  app.get('/home-asdos', authenticateUser, (req, res) => {
    const userId = req.session.user.userId;
    res.render('asdos/home-asdos');
  });
  

app.get('/home-dosen', (req, res) => {
  res.render('dosen/home-dosen');
});

app.get('/daftar-asdos', (req, res) =>{
  res.render('asdos/daftar-asdos');
})

app.get('/jadwal-asdos', (req, res) =>{
  res.render('asdos/jadwal-asdos');
})

app.post('/logout', (req, res) => {
  req.session.user = null;
  res.redirect('/');
});

app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});
