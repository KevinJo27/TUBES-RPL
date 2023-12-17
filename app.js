const express = require('express');
const path = require('path');
const session = require('express-session');
const mysql = require('mysql2'); // Add this line
const app = express();
const port = 3000;

//const __dirname = path.resolve();

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'database_rpltb'
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
    next();
  } else {
    res.redirect('/');
  }
}

function getUserDetailsByUsername(username) {
  return new Promise((resolve, reject) => {
    const query = 'SELECT id, name FROM users WHERE npm = ?';
    connection.query(query, [username], (err, results) => {
      if (err) {
        console.error('Error querying database:', err);
        reject(err);
      }

      if (results.length > 0) {
        resolve(results[0]);
      } else {
        resolve(null);
      }
    });
  });
}

function isValidUser(req, username, password) {
  return new Promise((resolve, reject) => {
    const query = 'SELECT * FROM users WHERE npm = ? AND password = ?';
    connection.query(query, [username, password], (err, results) => {
      if (err) {
        console.error('Error querying database:', err);
        reject(err);
      }

      if (results.length > 0) {
        req.session.user = { authenticated: true, userId: results[0].id };
        resolve(true);
      } else {
        resolve(false);
      }
    });
  });
}

app.post('/login', async (req, res) => {
  const { username, password } = req.body;

  try {
    const isValid = await isValidUser(req, username, password);
    if (isValid) {
      const user = await getUserDetailsByUsername(username);
      if (user) {
        req.session.user = {
          authenticated: true,
          userId: user.id,
          userName: user.name
        };

        if (username.length === 3) {
          res.redirect('/home-dosen');
        } else if (username.length === 8) {
          res.redirect('/home-koordinator');
        } else {
          res.redirect('/home-asdos');
        }
      } else {
        res.redirect('/');
      }
    } else {
      res.redirect('/');
    }
  } catch (error) {
    console.error('Error:', error);
    res.redirect('/');
  }
});

app.get('/', (req, res) => {
  res.render('all/Login');
});


app.get('/signup', (req, res) => {
  res.render('asdos/sign-up');
});

app.post('/signup', (req, res) => {
  const { nama, npm_npwp, password } = req.body;
  console.log(nama, npm_npwp, password);
  // Validation logic
  // Check if npm_npwp length is correct and contains only digits
  if (npm_npwp.length !== 10 || !/^\d+$/.test(npm_npwp)) {
    console.error('Invalid npm_npwp');
    res.redirect('/signup'); // Redirect back to the signup page on error
    return;
  }

  // Calculate semester
  const currentYear = new Date().getFullYear();
  const npmSemesterDigits = npm_npwp.substring(3, 5);
  const npmSemester = parseInt(npmSemesterDigits, 10);
  const currentSemester = Math.floor(((currentYear % 100) - npmSemester) / 2) + 1;

  // Check if npm_npwp semester is valid
  if (npmSemester === currentYear % 100 || currentSemester <= 0 || currentSemester > 8) {
    console.error('Invalid semester');
    res.redirect('/signup?error=semester'); // Redirect back to the signup page with an error query parameter
    return;
  }

  // Example: Insert the user into the database
  const query = 'INSERT INTO users (name, npm, password, semester, role_id) VALUES (?, ?, ?, ?, 1)';
  const role_id = 3; // Assuming 3 is the role_id for Mahasiswa

  connection.query(query, [nama, npm_npwp, password, currentSemester, role_id], (err) => {
    if (err) {
      console.error('Error inserting user into the database:', err);
      res.redirect('/signup'); // Redirect back to the signup page on error
      return;
    }
  
    console.log('User registered successfully');
    res.redirect('/');
  });  
});



app.get('/home-dosen', authenticateUser, (req, res) => {
  const { userName } = req.session.user;
  res.render('dosen/home-dosen', { userName });
});

app.get('/home-asdos', authenticateUser, (req, res) => {
  const { userName } = req.session.user;
  res.render('asdos/home-asdos',{userName});
});

app.get('/daftar-asdos', (req, res) =>{
  res.render('asdos/daftar-asdos');
})

app.get('/jadwal-asdos', (req, res) =>{
  res.render('asdos/jadwal-asdos');
})

app.get('/matakuliah', (req, res) =>{
  res.render('dosen/matakuliah');
})

app.get('/AsistenDosen', (req, res) =>{
  res.render('dosen/AssistenDosen');
})

app.get('/home-koordinator', (req, res) =>{
  const { userName } = req.session.user;
  res.render('dosenkoorinator/home-koordinator',{userName});
})

app.get('/Asdos-list', (req, res) =>{
  res.render('dosenkoorinator/Asdos-list');
})

app.get('/Assign-jadwal', (req, res) =>{
  res.render('dosenkoorinator/Assign-jadwal');
})

app.post('/logout', (req, res) => {
  req.session.user = null;
  res.redirect('/');
});

app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});
