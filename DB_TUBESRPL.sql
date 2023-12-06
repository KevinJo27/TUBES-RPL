
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