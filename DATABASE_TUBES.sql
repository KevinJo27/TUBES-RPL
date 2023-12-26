CREATE TABLE roles (
	id INT PRIMARY KEY AUTO_INCREMENT,
	role_name VARCHAR(255) NOT NULL
);

INSERT INTO
	roles (role_name)
VALUES
	('Mahasiswa');

INSERT INTO
	roles (role_name)
VALUES
	('Admin');

INSERT INTO
	roles (role_name)
VALUES
	('Dosen');

CREATE TABLE subjects (
	id INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(50) NOT NULL,
	asdos_quota INT NOT NULL
);

CREATE TABLE users (
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
	npm VARCHAR(255) NOT NULL,
	password VARCHAR(255) NOT NULL,
	semester INT,
	role_id INT,
	FOREIGN KEY (role_id) REFERENCES roles(id)
);

CREATE TABLE asdos_submissions (
	id INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT NOT NULL,
	pdf_path VARCHAR(100) NOT NULL,
	cv_path VARCHAR(100) NOT NULL,
	surat_lamaran_path VARCHAR(100) NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE dosen_subjects (
	id INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT NOT NULL,
	subject_id INT NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (subject_id) REFERENCES subjects(id)
);

CREATE TABLE asdos_subjects (
	id INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT NOT NULL,
	subject_id INT NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (subject_id) REFERENCES subjects(id)
);

CREATE TABLE asdos_assigns (
	id INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT NOT NULL,
	subject_id INT NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (subject_id) REFERENCES subjects(id)
);

CREATE TABLE course_schedules (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  schedule_category ENUM('matakuliah', 'asistensi') NOT NULL,
  start_time INT NOT NULL,
  end_time INT NOT NULL,
  day_of_week VARCHAR(20) NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (subject_id) REFERENCES subjects(id)
);




INSERT INTO
	subjects(title, asdos_quota)
VALUES
	('Pemrograman Berbasis Web', 4);

INSERT INTO
	subjects(title, asdos_quota)
VALUES
	('Pemrograman Berorientasi Objek', 3);

INSERT INTO
	subjects(title, asdos_quota)
VALUES
	('Algoritma dan Struktur Data', 4);

INSERT INTO
	users(
		name,
		npm,
		password,
		semester,
		role_id
	)
VALUES
	(
		'Pascal',
		'PANadmin',
		'12345',
		0,
		2
	);

INSERT INTO
	users(
		name,
		npm,
		password,
		semester,
		role_id
	)
VALUES
	(
		'Hunsul',
		'HUHadmin',
		'12345',
		0,
		3
	);

INSERT INTO
	users(
		name,
		npm,
		password,
		semester,
		role_id
	)
VALUES
	(
		'Pascal',
		'PAN',
		'12345',
		0,
		3
	);

INSERT INTO
	users(
		name,
		npm,
		password,
		semester,
		role_id
	)
VALUES
	(
		'Raymond',
		'RCP',
		'12345',
		0,
		3
	);

INSERT INTO
	users(
		name,
		npm,
		password,
		semester,
		role_id
	)
VALUES
	(
		'Husnul',
		'HUH',
		'12345',
		0,
		3
	);



INSERT INTO
	dosen_subjects(user_id, subject_id)
VALUES
	('2', '1');

INSERT INTO
	dosen_subjects(user_id, subject_id)
VALUES
	('1', '2');

INSERT INTO
	dosen_subjects(user_id, subject_id)
VALUES
	('3', '3');


INSERT INTO
	users(
		name,
		npm,
		password,
		semester,
		role_id
	)
VALUES
	(
		'Kevin',
		6182001001,
		'kevin123',
		4,
		1
	);

INSERT INTO
	users(
		name,
		npm,
		password,
		semester,
		role_id
	)
VALUES
	(
		'Ahmad',
		6182001002,
		'ahmad123',
		6,
		1
	);

INSERT INTO
	users(
		name,
		npm,
		password,
		semester,
		role_id
	)
VALUES
	(
		'Alda',
		6182001003,
		'alda123',
		4,
		1
	);

INSERT INTO
	users(
		name,
		npm,
		password,
		semester,
		role_id
	)
VALUES
	(
		'Jessica',
		6182001004,
		'jessica123',
		5,
		1
	);

INSERT INTO
	users(
		name,
		npm,
		password,
		semester,
		role_id
	)
VALUES
	(
		'Mark',
		6182001005,
		'mark123',
		5,
		1
	);

INSERT INTO
	users(
		name,
		npm,
		password,
		semester,
		role_id
	)
VALUES
	(
		'Angel',
		6182001006,
		'angel123',
		4,
		1
	);

INSERT INTO
	users(
		name,
		npm,
		password,
		semester,
		role_id
	)
VALUES
	(
		'Dian',
		6182001007,
		'dian123',
		6,
		1
	);

INSERT INTO
	users(
		name,
		npm,
		password,
		semester,
		role_id
	)
VALUES
	(
		'Jovan',
		6182001008,
		'jovan123',
		4,
		1
	);

INSERT INTO
	users(
		name,
		npm,
		password,
		semester,
		role_id
	)
VALUES
	(
		'Jacelyn',
		6182001009,
		'jacelyn123',
		4,
		1
	);

INSERT INTO
	users(
		name,
		npm,
		password,
		semester,
		role_id
	)
VALUES
	(
		'Adi',
		6182001010,
		'adi123',
		5,
		1
	);

INSERT INTO
	users(
		name,
		npm,
		password,
		semester,
		role_id
	)
VALUES
	(
		'Michael',
		6182001011,
		'michael123',
		6,
		1
	);


INSERT INTO
	asdos_assigns(user_id, subject_id)
VALUES
	('4', '1');

INSERT INTO
	asdos_assigns(user_id, subject_id)
VALUES
	('5', '1');

INSERT INTO
	asdos_assigns(user_id, subject_id)
VALUES
	('6', '1');

INSERT INTO
	asdos_assigns(user_id, subject_id)
VALUES
	('7', '1');

INSERT INTO
	asdos_assigns(user_id, subject_id)
VALUES
	('8', '2');

INSERT INTO
	asdos_assigns(user_id, subject_id)
VALUES
	('9', '2');

INSERT INTO
	asdos_assigns(user_id, subject_id)
VALUES
	('10', '2');

INSERT INTO
	asdos_assigns(user_id, subject_id)
VALUES
	('11', '3');

INSERT INTO
	asdos_assigns(user_id, subject_id)
VALUES
	('12', '3');

INSERT INTO
	asdos_assigns(user_id, subject_id)
VALUES
	('13', '3');

INSERT INTO
	asdos_assigns(user_id, subject_id)
VALUES
	('14', '3');

INSERT INTO
	asdos_submissions(user_id, pdf_path)
VALUES
	('4', '');

INSERT INTO
	asdos_submissions(user_id, pdf_path)
VALUES
	('5', '');

INSERT INTO
	asdos_submissions(user_id, pdf_path)
VALUES
	('6', '');

INSERT INTO
	asdos_submissions(user_id, pdf_path)
VALUES
	('7', '');

INSERT INTO
	asdos_submissions(user_id, pdf_path)
VALUES
	('8', '');