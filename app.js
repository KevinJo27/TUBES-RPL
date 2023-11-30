const express = require('express');
const path = require('path');
const app = express();
const port = 3000;

app.set('views', path.join(__dirname, 'pages'));

app.set('view engine', 'ejs');

app.use('/includes', express.static(path.join(__dirname, 'includes')));

app.get('/', (req, res) => {
  res.render('all/Login');
});

app.get('/signup', (req, res) => {
  res.render('asdos/sign-up');
});

app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});
