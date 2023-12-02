/*import express from "express";
import mysql from "mysql";
import bodyParser from "body parser";
import session from "express-session"
//import path from "path";
import crypto from "crypto";*/


const express = require('express');
const path = require('path');
const app = express();
const port = 3000;


app.use('/includes', express.static(staticPath));
app.use('/css', express.static(cssPath));

app.set('views', path.join(__dirname, 'pages'));

app.set('view engine', 'ejs');

app.get('/', (req, res) => {
  res.render('all/Login');
});

app.get('/signup', (req, res) => {
  res.render('asdos/sign-up');
});


app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});
