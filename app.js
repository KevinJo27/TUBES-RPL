const express = require('express');
const app = express();
const port = 3000;

app.set('view engine', 'ejs');

app.set('views', app.js + '/views');

app.get('/', (req, res) => {
  res.render('login');
});

app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});
