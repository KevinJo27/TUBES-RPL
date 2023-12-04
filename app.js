const express = require('express');
const path = require('path');
const session = require('express-session');
const app = express();
const port = 3000;

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

// Authentication middleware
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
  const users = [
    { username: '6182001019', password: '12345678' },
    { username: 'PAN', password: '12345678' }
  ];

  return users.some(user => user.username === username && user.password === password);
}

// Login route
app.post('/login', (req, res) => {
  const { username, password } = req.body;

  // Check if the provided username and password match any user in the mock database
  if (isValidUser(username, password)) {
    // Set the user as authenticated in the session
    req.session.user = { authenticated: true, username };
    res.redirect('/home-asdos');
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

app.get('/home-asdos', (req, res) => {
  res.render('asdos/home-asdos');
});

app.get('/home-dosen', authenticateUser, (req, res) => {
  res.render('dosen/home-dosen');
});

app.post('/logout', (req, res) => {
  req.session.user = null;
  res.redirect('/');
});

app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});
