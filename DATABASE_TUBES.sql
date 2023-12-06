
DROP TABLE role_user;
DROP TABLE pengguna;
DROP TABLE matkul;
DROP TABLE asdos_submission;
DROP TABLE dosen_matkul;
DROP TABLE asdos_matkul;
DROP TABLE asdos_assign;
DROP TABLE jadwal_kuliah;

CREATE TABLE role_user (
	id_role INT NOT NULL,
	role_name VARCHAR(50) NOT NULL,
	PRIMARY KEY(id_role)
)

CREATE TABLE pengguna (
	id_user INT NOT NULL,
	nama VARCHAR(100) NOT NULL,
	npm VARCHAR (15) NOT NULL,
	katasandi VARCHAR(255) NOT NULL,
	semester INT,
	role_id INT NOT NULL,
	PRIMARY KEY(id_user),
	FOREIGN KEY (role_id) REFERENCES role_user(id_role)
)

CREATE TABLE matkul (
	id_matkul VARCHAR(50) NOT NULL,
	nama_matkul VARCHAR(50) NOT NULL,
	kuota_asdos INT NOT NULL,
	PRIMARY KEY (id_matkul)
)

CREATE TABLE asdos_submission (
	submission_id INT NOT NULL,
	id_user INT NOT NULL,
	pdf_path VARCHAR(100) NOT NULL,
	PRIMARY KEY(submission_id),
	FOREIGN KEY (id_user) REFERENCES pengguna(id_user)
)

CREATE TABLE dosen_matkul (
	id_dosen INT NOT NULL,
	id_user INT NOT NULL,
	id_matkul VARCHAR(50) NOT NULL,
	PRIMARY KEY (id_dosen),
	FOREIGN KEY (id_user) REFERENCES pengguna(id_user),
	FOREIGN KEY (id_matkul) REFERENCES matkul(id_matkul)
)

CREATE TABLE asdos_matkul (
	id_asdos INT NOT NULL,
	id_user INT NOT NULL,
	id_matkul VARCHAR(50) NOT NULL,
	PRIMARY KEY (id_asdos),
	FOREIGN KEY (id_user) REFERENCES pengguna(id_user),
	FOREIGN KEY (id_matkul) REFERENCES matkul(id_matkul)
)

CREATE TABLE asdos_assign (
	id_assign INT NOT NULL,
	id_user INT NOT NULL,
	id_matkul VARCHAR(50) NOT NULL,
	PRIMARY KEY (id_assign),
	FOREIGN KEY (id_user) REFERENCES pengguna(id_user),
	FOREIGN KEY (id_matkul) REFERENCES matkul(id_matkul)
)

CREATE TABLE jadwal_kuliah (
	id_jadwal INT NOT NULL,
	id_user INT NOT NULL,
	id_matkul VARCHAR(50) NOT NULL,
	start_time TIME NOT NULL,
	end_time TIME NOT NULL,
	day_of_week DATE NOT NULL,
	PRIMARY KEY (id_jadwal),
	FOREIGN KEY (id_user) REFERENCES pengguna(id_user),
	FOREIGN KEY (id_matkul) REFERENCES matkul(id_matkul)
)

--mengisi tabel role user
INSERT INTO role_user(id_role, role_name)
VALUES ('1', 'Asisten Dosen');

INSERT INTO role_user(id_role, role_name)
VALUES ('2', 'Admin');

INSERT INTO role_user(id_role, role_name)
VALUES ('3', 'Dosen');

--mengisi tabel pengguna
INSERT INTO pengguna(id_user, nama, npm, katasandi, semester, role_id)
VALUES ('6182001001', 'Kevin', '6182001001', 'kevin123', '4', '1');

INSERT INTO pengguna(id_user, nama, npm, katasandi, semester, role_id)
VALUES ('6182001002', 'Ahmad', '6182001002', 'ahmad123', '6', '1');

INSERT INTO pengguna(id_user, nama, npm, katasandi, semester, role_id)
VALUES ('6182001003', 'Alda', '6182001003', 'alda123', '4', '1');

INSERT INTO pengguna(id_user, nama, npm, katasandi, semester, role_id)
VALUES ('6182001004', 'Jessica', '6182001004', 'jessica123', '5', '1');

INSERT INTO pengguna(id_user, nama, npm, katasandi, semester, role_id)
VALUES ('6182001005', 'Mark', '6182001005', 'mark123', '5', '1');

INSERT INTO pengguna(id_user, nama, npm, katasandi, semester, role_id)
VALUES ('6182001006', 'Angel', '6182001006', 'angel123', '4', '1');

INSERT INTO pengguna(id_user, nama, npm, katasandi, semester, role_id)
VALUES ('6182001007', 'Dian', '6182001007', 'dian123', '6', '1');

INSERT INTO pengguna(id_user, nama, npm, katasandi, semester, role_id)
VALUES ('6182001008', 'Jovan', '6182001008', 'jovan123', '4', '1');

INSERT INTO pengguna(id_user, nama, npm, katasandi, semester, role_id)
VALUES ('6182001009', 'Jacelyn', '6182001009', 'jacelyn123', '4', '1');

INSERT INTO pengguna(id_user, nama, npm, katasandi, semester, role_id)
VALUES ('6182001010', 'Adi', '6182001010', 'adi123', '5', '1');

INSERT INTO pengguna(id_user, nama, npm, katasandi, semester, role_id)
VALUES ('6182001011', 'Michael', '6182001011', 'michael123', '6', '1');

--mengisi tabel matkul
INSERT INTO matkul(id_matkul, nama_matkul, kuota_asdos)
VALUES ('1', 'Pemrograman Berbasis Web', '4');

INSERT INTO matkul(id_matkul, nama_matkul, kuota_asdos)
VALUES ('2', 'Pemrograman Berorientasi Objek', '3');

INSERT INTO matkul(id_matkul, nama_matkul, kuota_asdos)
VALUES ('3', 'Algoritma dan Struktur Data', '4');

--mengisi tabel asdos_submission
INSERT INTO asdos_submission(submission_id, id_user, pdf_path)
VALUES ('1', '6182001001', '')

INSERT INTO asdos_submission(submission_id, id_user, pdf_path)
VALUES ('2', '6182001002', '')

INSERT INTO asdos_submission(submission_id, id_user, pdf_path)
VALUES ('3', '6182001003', '')

INSERT INTO asdos_submission(submission_id, id_user, pdf_path)
VALUES ('4', '6182001004', '')

INSERT INTO asdos_submission(submission_id, id_user, pdf_path)
VALUES ('5', '6182001005', '')

--mengisi tabel dosen_matkul
INSERT INTO dosen_matkul(id_dosen, id_user, id_matkul)
VALUES ('RCP', '1', '1')

INSERT INTO dosen_matkul(id_dosen, id_user, id_matkul)
VALUES ('PAN', '2', '2')

INSERT INTO dosen_matkul(id_dosen, id_user, id_matkul)
VALUES ('HUH', '3', '3')

--mengisi tabel asdos_assign
INSERT INTO asdos_assign(id_assign, id_user, id_matkul)
VALUES ('1', '6182001001', '1')

INSERT INTO asdos_assign(id_assign, id_user, id_matkul)
VALUES ('2', '6182001002', '1')

INSERT INTO asdos_assign(id_assign, id_user, id_matkul)
VALUES ('3', '6182001003', '1')

INSERT INTO asdos_assign(id_assign, id_user, id_matkul)
VALUES ('4', '6182001004', '1')

INSERT INTO asdos_assign(id_assign, id_user, id_matkul)
VALUES ('5', '6182001005', '2')

INSERT INTO asdos_assign(id_assign, id_user, id_matkul)
VALUES ('6', '6182001006', '2')

INSERT INTO asdos_assign(id_assign, id_user, id_matkul)
VALUES ('7', '6182001007', '2')

INSERT INTO asdos_assign(id_assign, id_user, id_matkul)
VALUES ('8', '6182001008', '3')

INSERT INTO asdos_assign(id_assign, id_user, id_matkul)
VALUES ('9', '6182001009', '3')

INSERT INTO asdos_assign(id_assign, id_user, id_matkul)
VALUES ('10', '6182001010', '3')																																																																																																																																																																																																							

INSERT INTO asdos_assign(id_assign, id_user, id_matkul)
VALUES ('11', '6182001011', '3')

--mengisi tabel jadwal_kuliah
