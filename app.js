  const express = require('express');
  const path = require('path');
  const session = require('express-session');
  const mysql = require('mysql2'); // Add this line
  const app = express();
  const port = 3000;
  const multer = require('multer');
  const storage = multer.diskStorage({
    destination: 'uploads/',
    filename: function (req, file, cb) {
      const userId = req.session.user ? req.session.user.userId : null;
      const subject = req.body.subject;

      if (!userId) {
        console.error('User ID not found in session');
        return cb(new Error('Unauthorized'), null);
      }

      let fileName;
      if (file.fieldname === 'transkrip') {
        fileName = `${userId}_transkrip_${subject}.${file.originalname}`;
      } else if (file.fieldname === 'cv') {
        fileName = `${userId}_cv_${subject}.${file.originalname}`;
      } else if (file.fieldname === 'suratLamaran') {
        fileName = `${userId}_suratLamaran_${subject}.${file.originalname}`;
      } else {
        // Handle other file types if needed
        fileName = file.originalname;
      }

      cb(null, fileName);
    }
  });

  const upload = multer({ storage: storage });
  // const __dirname = path.resolve();

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

  app.use('/uploads', express.static('uploads'));
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

    const getUserIdQuery = 'SELECT id FROM users WHERE name = ?';

    connection.query(getUserIdQuery, [userName], (err, results) => {
      if (err) {
        console.error('Error fetching user ID:', err);
        return res.status(500).send('Internal Server Error');
      }

      const user_id = results.length > 0 ? results[0].id : null;

      res.render('asdos/home-asdos', { userName, user_id });
    });
  });


  app.get('/daftar-asdos', (req, res) =>{
    res.render('asdos/daftar-asdos');
  })

  app.get('/upload', authenticateUser, (req, res) => {
    // Assuming user_id is available in the session
    const userId = req.session.user ? req.session.user.userId : null;

    if (!userId) {
      console.error('User ID not found in session');
      return res.status(401).send('Unauthorized');
    }

    // Fetch user IDs from asdos_submissions where pdf_path is not null
    const query = `
      SELECT DISTINCT user_id
      FROM asdos_submissions
      WHERE pdf_path IS NOT NULL
    `;

    connection.query(query, (err, results) => {
      if (err) {
        console.error('Error querying database:', err);
        return res.status(500).send('Internal Server Error');
      }

      // Extract user IDs from the query results
      const userIds = results.map(result => result.user_id);

      // Pass user IDs to the Asdos-list route
      res.redirect(`/Asdos-list?userIds=${userIds.join(',')}`);
    });
  });


  app.post('/upload', upload.fields([
    { name: 'transkrip', maxCount: 1 },
    { name: 'cv', maxCount: 1 },
    { name: 'suratLamaran', maxCount: 1 }
  ]), (req, res) => {
    const { user } = req.session;

    // Check if user and user.userId are defined
    if (user && user.userId) {
      const { transkrip, cv, suratLamaran } = req.files;

      if (!transkrip || !cv || !suratLamaran) {
        return res.status(400).send('All files are required.');
      }

      // Assuming user_id is available in the session
      const userId = user.userId;

      // Assuming the pdf_path in the database is a URL or file path
      const transkripPath = `/uploads/${userId}_transkrip_${req.body.subject}.${transkrip[0].originalname}`;
      const cvPath = `/uploads/${userId}_cv_${req.body.subject}.${cv[0].originalname}`;
      const suratLamaranPath = `/uploads/${userId}_suratLamaran_${req.body.subject}.${suratLamaran[0].originalname}`;

      // Insert data into the asdos_submissions table
      const query = 'INSERT INTO asdos_submissions (user_id, pdf_path, cv_path, surat_lamaran_path) VALUES (?, ?, ?, ?)';
      connection.query(query, [userId, transkripPath, cvPath, suratLamaranPath], (err) => {
        if (err) {
          console.error('Error inserting data into the database:', err);
          return res.status(500).send('Internal Server Error');
        }

        console.log('Data inserted successfully');
        res.redirect('/home-asdos');
      });
    } else {
      // Handle the case where user or user.userId is undefined or null
      res.status(401).send('Unauthorized');
    }
  });


  app.get('/jadwal-asdos', (req, res) => {
    console.log('Session:', req.session);
  
    if (!req.session.user || !req.session.user.userName) {
      console.error('User session or userName not available');
      return res.status(401).send('Unauthorized');
    }
  
    const { userName } = req.session.user;
  
    const getUserIdQuery = 'SELECT id FROM users WHERE name = ?';
  
    connection.query(getUserIdQuery, [userName], (err, results) => {
      if (err) {
        console.error('Error fetching user ID:', err);
        return res.status(500).send('Internal Server Error');
      }
  
      const user_id = results.length > 0 ? results[0].id : null;
  
      if (!user_id) {
        console.error('User ID not found in the database');
        return res.status(500).send('Internal Server Error');
      }
  
      // Fetch schedule data for the user
      const getScheduleQuery = 'SELECT * FROM course_schedules WHERE user_id = ?';
  
      connection.query(getScheduleQuery, [user_id], (scheduleErr, scheduleResults) => {
        if (scheduleErr) {
          console.error('Error fetching schedule data:', scheduleErr);
          return res.status(500).send('Internal Server Error');
        }
  
        const scheduleData = scheduleResults || [];
  
        res.render('asdos/jadwal-asdos', { user_id, scheduleData });
      });
    });
  });
  
  
  


  app.get('/matakuliah', (req, res) => {
    if (!req.session.user || !req.session.user.authenticated) {
      return res.redirect('/');
    }

    // Get the user ID from the session
    const userId = req.session.user.userId;
    const query = `
    SELECT ds.*, s.title
    FROM dosen_subjects ds
    JOIN subjects s ON ds.subject_id = s.id
    WHERE ds.user_id = ?
    `;

    // Execute the query and handle the result
    connection.query(query, [userId], (err, results) => {
      if (err) {
        console.error('Error querying database:', err);
        return res.status(500).send('Internal Server Error');
      }
    
      // Render the page and pass the results to the template
      res.render('dosen/matakuliah', { subjects: results });
    });
  });

  app.post('/matakuliah', (req, res) => {
    const { subjectId } = req.body;

    // Check if subjectId is provided
    if (!subjectId) {
      return res.status(400).send('Bad Request: Missing subjectId');
    }

    // Delete data from subjects table
    const deleteSubjectQuery = 'DELETE FROM subjects WHERE id = ?';

    connection.query(deleteSubjectQuery, [subjectId], (err, subjectResult) => {
      if (err) {
        console.error('Error deleting subject from database:', err);
        return res.status(500).send('Internal Server Error');
      }

      if (subjectResult.affectedRows === 0) {
        // Subject not found, return an appropriate response or handle it as needed
        return res.status(404).send('Subject not found');
      }

      // If subject is deleted from subjects table, delete from dosen_subjects table
      const deleteDosenSubjectQuery = 'DELETE FROM dosen_subjects WHERE subject_id = ?';

      connection.query(deleteDosenSubjectQuery, [subjectId], (dosenSubjectErr) => {
        if (dosenSubjectErr) {
          console.error('Error deleting dosen_subject from database:', dosenSubjectErr);
          return res.status(500).send('Internal Server Error');
        }

        // Send a success response
        res.status(200).send('Delete successful');
      });
    });
  });


  app.get('/AsistenDosen', (req, res) => {
    if (!req.session.user || !req.session.user.authenticated) {
      return res.redirect('/');
    }

    // Get the user ID from the session
    const userId = req.session.user.userId;

    // Query to get subjects assigned to the user in dosen_subjects
    const dosenSubjectsQuery = `
      SELECT ds.*, s.title as subject_title
      FROM dosen_subjects ds
      JOIN subjects s ON ds.subject_id = s.id
      WHERE ds.user_id = ?
    `;

    connection.query(dosenSubjectsQuery, [userId], (dosenSubjectsErr, dosenSubjectsResults) => {
      if (dosenSubjectsErr) {
        console.error('Error querying dosen_subjects:', dosenSubjectsErr);
        return res.status(500).send('Internal Server Error');
      }

      // Iterate through the results and perform additional queries
      const subjectsWithUsersPromises = dosenSubjectsResults.map((subject) => {
        // Query to get the subject_id from subjects table
        const subjectQuery = 'SELECT id FROM subjects WHERE title = ?';

        return new Promise((resolve) => {
          connection.query(subjectQuery, [subject.subject_title], (subjectQueryErr, subjectQueryResults) => {
            if (subjectQueryErr) {
              console.error('Error querying subjects:', subjectQueryErr);
              resolve(null);
            } else if (subjectQueryResults.length === 0) {
              console.error('Subject not found in subjects table');
              resolve(null);
            } else {
              const subjectId = subjectQueryResults[0].id;

              // Query to get users_id from asdos_assigns table
              const asdosAssignsQuery = 'SELECT user_id FROM asdos_assigns WHERE subject_id = ?';

              connection.query(asdosAssignsQuery, [subjectId], (asdosAssignsErr, asdosAssignsResults) => {
                if (asdosAssignsErr) {
                  console.error('Error querying asdos_assigns:', asdosAssignsErr);
                  resolve(null);
                } else if (asdosAssignsResults.length === 0) {
                  console.error('No users assigned to the subject');
                  resolve(null);
                } else {
                  const usersId = asdosAssignsResults.map((asdosAssign) => asdosAssign.user_id);

                  // Query to get users' names from users table
                  const usersQuery = 'SELECT id, name FROM users WHERE id IN (?)';

                  connection.query(usersQuery, [usersId], (usersErr, usersResults) => {
                    if (usersErr) {
                      console.error('Error querying users:', usersErr);
                      resolve(null);
                    } else {
                      const subjectWithUsers = {
                        title: subject.subject_title,
                        users: usersResults,
                      };                    
                      resolve(subjectWithUsers);
                    }
                  });
                }
              });
            }
          });
        });
      });

      // Wait for all promises to resolve and then render the page
      Promise.all(subjectsWithUsersPromises).then((subjectsWithUsers) => {
        res.render('dosen/AssistenDosen', { subjects: subjectsWithUsers });
      });
    });
  });



  app.get('/home-koordinator', (req, res) =>{
    const { userName } = req.session.user;
    res.render('dosenkoorinator/home-koordinator',{userName});
  })

  app.get('/Asdos-list', authenticateUser, (req, res) => {
    const query = `
    SELECT * FROM asdos_submissions INNER JOIN users ON asdos_submissions.user_id = users.id WHERE pdf_path IS NOT NULL;
    `;

    connection.query(query, (err, results) => {
      if (err) {
        console.error('Error querying database:', err);
        return res.status(500).send('Internal Server Error');
      }
      console.log(results);

      // Render the page with the data
      res.render('dosenkoorinator/Asdos-list', { submissions: results });
    });
  });




  app.post('/Asdos-list', authenticateUser, (req, res) => {
    // Assuming user_id is available in the session
    const userId = req.session.user.userId;

    // Assuming you have form data in req.body
    const { someFormData } = req.body;

    // Update the asdos_submissions table based on the user_id
    const updateQuery = 'UPDATE asdos_submissions SET some_column = ? WHERE user_id = ?';

    connection.query(updateQuery, [someFormData, userId], (updateErr) => {
      if (updateErr) {
        console.error('Error updating database:', updateErr);
        return res.status(500).send('Internal Server Error');
      }

      // Redirect to the Asdos-list page after processing the form
      res.redirect('/Asdos-list');
    });
  });


  // app.get('/Asdos-list', (req, res) => {
  //   res.render('dosenkoorinator/Asdos-list');
  // });

  // ...

  app.get('/jadwal-views', (req, res) => {
    if (!req.session.user || !req.session.user.authenticated) {
      return res.redirect('/');
    }

    // Get the user ID from the session
    const userId = req.session.user.userId;

    // Query to get the user's name from the users table
    const userNameQuery = 'SELECT name FROM users WHERE id = ?';

    connection.query(userNameQuery, [userId], (userNameErr, userNameResults) => {
      if (userNameErr) {
        console.error('Error querying user name:', userNameErr);
        return res.status(500).send('Internal Server Error');
      }

      // If user name is found, store it in a variable
      const userName = userNameResults.length > 0 ? userNameResults[0].name : 'Unknown';

      // Render the EJS template and pass the user name
      res.render('dosen/jadwal-views', { userName });
    });
  });

  app.get('/jadwal-insert', (req, res) => {
    if (!req.session.user || !req.session.user.authenticated) {
      return res.redirect('/');
    }

    const userId = req.session.user.userId;

    const userNameQuery = 'SELECT name FROM users WHERE id = ?';

    connection.query(userNameQuery, [userId], (userNameErr, userNameResults) => {
      if (userNameErr) {
        console.error('Error querying user name:', userNameErr);
        return res.status(500).send('Internal Server Error');
      }

      const userName = userNameResults.length > 0 ? userNameResults[0].name : 'Unknown';
      
      res.render('dosenkoorinator/jadwal-insert', { userName });
    });
  });



  app.get('/Assign-jadwal', (req, res) =>{
    res.render('dosenkoorinator/Assign-jadwal');
  })

  app.post('/logout', (req, res) => {
    req.session.user = null;
    res.redirect('/');
  });

  app.post('/submitSchedule', (req, res) => {
    const { user_id, start_time, end_time, day_of_week } = req.body;

    // Check for overlapping schedules
    const conflictCheckQuery = `
        SELECT * FROM course_schedules
        WHERE user_id = ? 
        AND day_of_week = ?
        AND (
            (start_time <= ? AND end_time >= ?)   -- New schedule starts in existing schedule
            OR (start_time <= ? AND end_time >= ?) -- New schedule ends in existing schedule
            OR (start_time >= ? AND end_time <= ?) -- New schedule is within existing schedule
        );
    `;

    connection.query(
        conflictCheckQuery,
        [user_id, day_of_week, start_time, start_time, end_time, end_time, start_time, end_time],
        (conflictCheckErr, conflictCheckResults) => {
            if (conflictCheckErr) {
                console.error('Error checking for conflicting schedules:', conflictCheckErr);
                return res.status(500).send('Internal Server Error');
            }

            if (conflictCheckResults.length > 0) {
                // Conflict found. Send an alert to the client
                const alertMessage = 'Jadwal bertabrakan';
                return res.status(200).send(`<script>alert('${alertMessage}');</script>`);
            }

            const insertQuery = `
                INSERT INTO course_schedules (user_id, schedule_category, start_time, end_time, day_of_week)
                VALUES (?, 'matakuliah', ?, ?, ?)
            `;

            connection.query(insertQuery, [user_id, start_time, end_time, day_of_week], (err, result) => {
                console.log(user_id);
                console.log(start_time);
                console.log(end_time);
                console.log(day_of_week);

                if (err) {
                    console.error('Error inserting data into course_schedules:', err);
                    res.status(500).send('Internal Server Error');
                } else {
                    console.log('Data inserted into course_schedules.');
                    res.redirect(302, `/jadwal-asdos?user_id=${user_id}`);

                }
            });
        }
    );
});


  // Assuming you have already defined your express app and MySQL connection...

// Add this route for removing a schedule
app.post('/removeSchedule', (req, res) => {
  const { user_id, start_time, end_time, day_of_week } = req.body;

  const deleteQuery = `
      DELETE FROM course_schedules 
      WHERE user_id = ? 
      AND start_time = ? 
      AND end_time = ? 
      AND day_of_week = ?;
  `;

  connection.query(deleteQuery, [user_id, start_time, end_time, day_of_week], (err, result) => {
      console.log(user_id);
      console.log(start_time);
      console.log(end_time);
      console.log(day_of_week);

      if (err) {
          console.error('Error deleting data from course_schedules:', err);
          res.status(500).send('Internal Server Error');
      } else {
          console.log('Data deleted from course_schedules.');
          res.redirect('/jadwal-asdos', { user_id });
      }
  });
});


  app.listen(port, () => {
    console.log(`Server is running at http://localhost:${port}`);
  });