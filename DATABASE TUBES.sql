/*Drop dlu smua tabel siapatau ada salah, slalu bikin ulang n insert ulang tinggal run all*/
DROP TABLE pengguna;
DROP TABLE admin;
DROP TABLE lurah;
DROP TABLE saksi;
DROP TABLE camil;
DROP TABLE tps;
DROP TABLE rt;
DROP TABLE rw;
DROP TABLE kelurahan;
DROP TABLE kecamatan;
DROP TABLE kota;
DROP TABLE DATA;
DROP TABLE datacamil;
DROP TABLE foto;

/*bikin"tabel*/
CREATE TABLE pengguna(
 idPengguna CHAR(16) NOT NULL,
 namaPengguna VARCHAR(50) NOT NULL,
 passPengguna VARCHAR(50) NOT NULL,
 email VARCHAR(50),
 PRIMARY KEY (idPengguna)
);

CREATE TABLE admin(
 idAdmin CHAR(16) NOT NULL,
 namaAdmin VARCHAR(50) NOT NULL,
 PRIMARY KEY (idAdmin)
);

CREATE TABLE lurah(
 idLurah CHAR(16) NOT NULL,
 noHP VARCHAR(12) NOT NULL,
 tptlahir VARCHAR(50) NOT NULL,
 tgllahir DATE NOT NULL,
 idKota CHAR(3) NOT NULL,
 idKecamatan CHAR(3) NOT NULL,
 idKelurahan CHAR(3) NOT NULL,
 alamat VARCHAR(50) NOT NULL,
 PRIMARY KEY (idLurah)
);

CREATE TABLE kota(
 idKota CHAR(3) NOT NULL,
 ket VARCHAR(150),
 PRIMARY KEY(idKota)
);

CREATE TABLE kecamatan(
 idKecamatan CHAR(3) NOT NULL,
 ket VARCHAR(150),
 idKota CHAR(3) NOT NULL,
 PRIMARY KEY(idKecamatan)
);

CREATE TABLE kelurahan(
 idKelurahan CHAR(3) NOT NULL,
 ket VARCHAR(150),
 idKecamatan CHAR(3) NOT NULL,
 PRIMARY KEY(idKelurahan)
);

CREATE TABLE rw(
 idRW CHAR(3) NOT NULL,
 ket VARCHAR(150),
 idKelurahan CHAR(3),
 PRIMARY KEY(idRW)
);

CREATE TABLE rt(
 idRT CHAR(3) NOT NULL,
 ket VARCHAR(150),
 idRW CHAR(3) NOT NULL,
 PRIMARY KEY(idRT)
);

CREATE TABLE tps(
 idTPS INT NOT NULL AUTO_INCREMENT,
 ket VARCHAR(150),
 lokasi VARCHAR(150),
 idRT CHAR(3),
 capacity INT(3) NOT NULL,
 used INT(3),
 PRIMARY KEY(idTPS)
);

CREATE TABLE camil(
 idCamil CHAR(16) NOT NULL,
 noHP VARCHAR(12) NOT NULL,
 tptlahir VARCHAR(50) NOT NULL,
 tgllahir DATE NOT NULL,
 idRT CHAR(3) NOT NULL,
 idRW CHAR(3) NOT NULL,
 idKota CHAR(3) NOT NULL,
 idKecamatan CHAR(3) NOT NULL,
 idKelurahan CHAR(3) NOT NULL,
 idTPS CHAR(3),
 alamat VARCHAR(50) NOT NULL,
 PRIMARY KEY(idCamil)
);

CREATE TABLE foto(
idCamil CHAR(16) NOT NULL,
filename VARCHAR(100)NOT NULL,
PRIMARY KEY(idCamil)
);

CREATE TABLE saksi(
 NIK CHAR(16) NOT NULL,
 partai VARCHAR(50) NOT NULL,
 PRIMARY KEY(NIK)
);

CREATE TABLE DATA(
 id CHAR(16) NOT NULL,
 statuscamil CHAR(1) NOT NULL,
 tglUp DATE NOT NULL,
 PRIMARY KEY (id) 
);

/*bikin kota (bandung)*/
INSERT INTO kota(idKota, ket)
VALUES('1','Bandung');

/*bikin kecamatan (bandung)*/
INSERT INTO kecamatan(idkecamatan,ket, idKota)
VALUES('1','Andir','1');

INSERT INTO kecamatan(idkecamatan,ket, idKota)
VALUES('2','Astana Anyar','1');

INSERT INTO kecamatan(idkecamatan,ket, idKota)
VALUES('3','Antapani','1');

INSERT INTO kecamatan(idkecamatan,ket, idKota)
VALUES('4','Arcamanik','1');

INSERT INTO kecamatan(idkecamatan,ket, idKota)
VALUES('5','Babakan Ciparay','1');

/*bikin kelurahan (Babakan ciparay)*/
INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('1','Margahayu', '5');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('2','Babakan', '5');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('3','Margasuka', '5');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('4','Sukahaji', '5');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('5','Cirangrang', '5');

/*bikin kelurahan (andir)*/
INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('6','Campaka', '1');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('7','Ciroyom', '1');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('8','Garuda', '1');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('9','KebonJeruk', '1');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('10','Maleber', '1');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('11','Cibadak', '2');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('12','Karanganyar', '2');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('13','Karasak', '2');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('14','Nyengseret', '2');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('15','Panjunan', '2');



INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('16','Antapani Kidul', '3');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('17','Antapani Kulon', '3');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('18','Antapani Tengah', '3');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('19','Antapani Wetan', '3');



INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('20','Cisaranten Bina Harapan', '4');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('21','Cisaranten Endah', '4');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('22','Cisaranten Kulon', '4');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('23','Sukamiskin', '4');

/*Jakarta*/
INSERT INTO kota(idKota, ket)
VALUES('2','Jakarta');

/*Kecamatan*/
INSERT INTO kecamatan(idkecamatan,ket, idKota)
VALUES('6','Cempaka Putih','2');

INSERT INTO kecamatan(idkecamatan,ket, idKota)
VALUES('7','Gambir','2');

INSERT INTO kecamatan(idkecamatan,ket, idKota)
VALUES('8','Johar Baru','2');

INSERT INTO kecamatan(idkecamatan,ket, idKota)
VALUES('9','Kemayoran','2');

INSERT INTO kecamatan(idkecamatan,ket, idKota)
VALUES('10','Menteng','2');

/*Kelurahan*/
INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('24','Cempaka Putih Barat', '6');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('25','Cempaka Putih Timur', '6');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('26','Rawasari', '6');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('27','Cideng', '7');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('28','Duri Pulo', '7');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('29','Gambir', '7');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('30','Kebon Kelapa', '7');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('31','Petojo Selatan', '7');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('32','Petojo Utara', '7');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('33','Galur', '8');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('34','Johar Baru', '8');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('35','Kampung Rawa', '8');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('36','Tanah Tinggi', '8');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('37','Cempaka Baru', '9');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('38','Gunung Sahari Selatan', '9');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('39','Harapan Mulya', '9');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('40','Kebon Kosong', '9');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('41','Kemayoran', '9');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('42','Cikini', '10');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('43','Gondangdia', '10');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('44','Kebon Sirih', '10');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('45','Menteng', '10');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('46','Pegangsaan', '10');

/*Surabaya*/
INSERT INTO kota(idKota, ket)
VALUES('3','Surabaya');

/*Kecamatan*/
INSERT INTO kecamatan(idkecamatan,ket, idKota)
VALUES('11','Asemrowo','3');

INSERT INTO kecamatan(idkecamatan,ket, idKota)
VALUES('12','Benowo','3');

INSERT INTO kecamatan(idkecamatan,ket, idKota)
VALUES('13','Bubutan','3');

INSERT INTO kecamatan(idkecamatan,ket, idKota)
VALUES('14','Bulak','3');

INSERT INTO kecamatan(idkecamatan,ket, idKota)
VALUES('15','Dukuh Pakis','3');

/*Kelurahan*/
INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('47','Asemrowo', '11');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('48','Genting Kalianak', '11');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('49','Tambak Sarioso', '11');


INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('50','Kandangan', '12');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('51','Romokalisari', '12');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('52','Sememi', '12');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('53','Tambak Osowilangun', '12');


INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('54','Alun-alun Contong', '13');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('55','Bubutan', '13');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('56','Gundih', '13');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('57','Jepara', '13');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('58','Tembok Dukuh', '13');


INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('59','Bulak', '14');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('60','Kedungcowek', '14');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('61','Kenjeran', '14');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('62','Sukolilo Baru', '14');


INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('63','Dukuh Kupang', '15');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('64','Dukuh Pakis', '15');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('65','Gunung Sari', '15');

INSERT INTO kelurahan(idKelurahan, ket, idKecamatan)
VALUES('66','Pradah Kalikendal', '15');

/*bikin rt/rw (ciparay) mungkin diilangin*/
INSERT INTO rw(idRW, ket, idKelurahan)
VALUES('1','rw01','1');

INSERT INTO rt(idRT,ket,idRW)
VALUES('1','rt01','1');

/*bikin tps*/
INSERT INTO tps( ket, idRT, capacity, used)
VALUES('Aula SMA BPK Holis (Margahayu)','1', '50', '0');

INSERT INTO tps( ket, idRT, capacity, used)
VALUES('Aula SMA Aloysius Holis (Margahayu)','1', '50', '0');

INSERT INTO tps(ket, idRT, capacity, used)
VALUES('Aula SMA Trinitas Holis (Margahayu)','1', '50', '0');

INSERT INTO tps(ket, idRT, capacity, used)
VALUES('Aula SMA BPK Talenta (Margahayu)','1', '50', '0');

/*insert user - user, admin, lurah, camil*/


/*admin*/
INSERT INTO admin (idAdmin, namaAdmin)
VALUES ('6969696969696969', 'Mak');

INSERT INTO admin (idAdmin, namaAdmin)
VALUES ('6666666699999999', 'Kejol Gepeng');

INSERT INTO admin (idAdmin, namaAdmin)
VALUES ('9999999966666666', 'Vettel');

INSERT INTO pengguna (idPengguna, namaPengguna, passPengguna)
VALUES ('6969696969696969', 'Mak Kimak', 'duar');

INSERT INTO pengguna (idPengguna, namaPengguna, passPengguna)
VALUES ('6666666699999999', 'Kejol Gepeng', 'cibay');

INSERT INTO pengguna (idPengguna, namaPengguna, passPengguna)
VALUES ('9999999966666666', 'Vettel', 'cbal');

/*lurah*/
INSERT INTO pengguna (idPengguna, namaPengguna, passPengguna)
VALUES ('1111111111111111', 'Yog Doyog', '123');

INSERT INTO lurah(idLurah, noHP, tptlahir, tgllahir, idKota, idKecamatan, idKelurahan, alamat)
VALUES('1111111111111111', '123456123456', 'Bandung', '20010911', '5', '1', '1','Saritem 12');

--

INSERT INTO pengguna (idPengguna, namaPengguna, passPengguna)
VALUES ('3548965858958487', 'Yag Dayag', '321');

INSERT INTO lurah(idLurah, noHP, tptlahir, tgllahir, idKota, idKecamatan, idKelurahan, alamat)
VALUES('3548965858958487', '123456123456', 'Bandung', '20010911', '1', '4', '20','Saritem 12');

--

INSERT INTO pengguna (idPengguna, namaPengguna, passPengguna)
VALUES ('4587878798989898', 'Yok Ayok', '333');

INSERT INTO lurah(idLurah, noHP, tptlahir, tgllahir, idKota, idKecamatan, idKelurahan, alamat)
VALUES('4587878798989898', '123456123456', 'Bandung', '20010911', '2', '9', '37','Saritem 12');

--

INSERT INTO pengguna (idPengguna, namaPengguna, passPengguna)
VALUES ('6565252598985858', 'Yay Iyaya', '351');

INSERT INTO lurah(idLurah, noHP, tptlahir, tgllahir, idKota, idKecamatan, idKelurahan, alamat)
VALUES('6565252598985858', '123456123456', 'Bandung', '20010911', '2', '10', '43','Saritem 12');


/*camil*/
INSERT INTO camil(idCamil, noHP, tptlahir, tgllahir, idRT, idRW, idKota, idKecamatan, idKelurahan, alamat)
VALUES ('2222222222222222','081123456789','Bandung','19990614','1','1','1','5','1','Jl. Maleber No. 02');

INSERT INTO pengguna (idPengguna, email, namaPengguna, passPengguna)
VALUES ('2222222222222222', 'arisyami@gmail.com', 'Arisyami Munisa', '123');

INSERT INTO DATA(id, statuscamil, tglup)
VALUES('2222222222222222', 'Y', '1999-01-01');

INSERT INTO foto(idCamil, filename)
VALUES('2222222222222222','2222222222222222.jpg');

--

INSERT INTO camil(idCamil, noHP, tptlahir, tgllahir, idRT, idRW, idKota, idKecamatan, idKelurahan, alamat)
VALUES('1234567812345678', '123456123456', 'Bandung', '20010911', '1', '1', '1', '5', '1','Saritem 12');

INSERT INTO pengguna(idPengguna, email, namaPengguna, passPengguna)
VALUES('1234567812345678', 'email.com', 'tester', 'waw');

INSERT INTO DATA(id, statuscamil, tglup)
VALUES('1234567812345678', 'N', '1999-01-01');

INSERT INTO foto(idCamil, filename)
VALUES('1234567812345678','foto.jpg');

--

INSERT INTO camil(idCamil, noHP, tptlahir, tgllahir, idRT, idRW, idKota, idKecamatan, idKelurahan, alamat, idTPS)
VALUES ('1231231231231112','081123456879','Jakarta','19890604','1','2','2','6','25','Jl. Jakarta raya', '3');

INSERT INTO pengguna (idPengguna, email, namaPengguna, passPengguna)
VALUES ('1231231231231112', 'nurul@gmail.com', 'Nurul Adinda', '155');

INSERT INTO DATA(id, statuscamil, tglup)
VALUES('1231231231231112', 'Y', '2023-01-01');

INSERT INTO foto(idCamil, filename)
VALUES('1231231231231112','duar.jpg');

INSERT INTO saksi(NIK, partai)
VALUES('1231231231231112', 'SHHK');

--

INSERT INTO camil(idCamil, noHP, tptlahir, tgllahir, idRT, idRW, idKota, idKecamatan, idKelurahan, alamat, idTPS)
VALUES ('1234521478542698','081123456987','Jakarta','19890605','1','2','2','7','27','Jl. Jakarta Barat', '4');

INSERT INTO pengguna (idPengguna, email, namaPengguna, passPengguna)
VALUES ('1234521478542698', 'jumad@gmail.com', 'Ahmad Rizal', '122');

INSERT INTO DATA(id, statuscamil, tglup)
VALUES('1234521478542698', 'Y', '2023-01-03');

INSERT INTO foto(idCamil, filename)
VALUES('1234521478542698','saya.jpg');

INSERT INTO saksi(NIK, partai)
VALUES('1234521478542698', 'SBYJAYA');

--

INSERT INTO camil(idCamil, noHP, tptlahir, tgllahir, idRT, idRW, idKota, idKecamatan, idKelurahan, alamat)
VALUES ('1547852684859625','081123456087','Bandung','19890607','1','2','1','5','1','Jl. Bandung Barat');

INSERT INTO pengguna (idPengguna, email, namaPengguna, passPengguna)
VALUES ('1547852684859625', 'agus@gmail.com', 'Agus Winata', '133');

INSERT INTO DATA(id, statuscamil, tglup)
VALUES('1547852684859625', 'N', '2023-01-03');

INSERT INTO foto(idCamil, filename)
VALUES('1547852684859625','dia.jpg');

--

INSERT INTO camil(idCamil, noHP, tptlahir, tgllahir, idRT, idRW, idKota, idKecamatan, idKelurahan, alamat)
VALUES ('1515151515151515','081123456687','Bandung','19890607','1','2','1','5','1','Jl. Bandung Barat');

INSERT INTO pengguna (idPengguna, email, namaPengguna, passPengguna)
VALUES ('1515151515151515', 'dor@gmail.com', 'Dor Winata', '124');

INSERT INTO DATA(id, statuscamil, tglup)
VALUES('1515151515151515', 'N', '2023-01-03');

INSERT INTO foto(idCamil, filename)
VALUES('1515151515151515','dia.jpg');

--

INSERT INTO camil(idCamil, noHP, tptlahir, tgllahir, idRT, idRW, idKota, idKecamatan, idKelurahan, alamat)
VALUES ('1313131313131313','081123456687','Bandung','19890607','1','2','1','5','1','Jl. Bandung Barat');

INSERT INTO pengguna (idPengguna, email, namaPengguna, passPengguna)
VALUES ('1313131313131313', 'der@gmail.com', 'Der Winata', '156');

INSERT INTO DATA(id, statuscamil, tglup)
VALUES('1313131313131313', 'N', '2023-01-03');

INSERT INTO foto(idCamil, filename)
VALUES('1313131313131313','dia.jpg');

--

INSERT INTO camil(idCamil, noHP, tptlahir, tgllahir, idRT, idRW, idKota, idKecamatan, idKelurahan, alamat)
VALUES ('4564561512345789','081123456097','Bandung','19890607','1','2','2','4','20','Jl. Bandung Utara');

INSERT INTO pengguna (idPengguna, email, namaPengguna, passPengguna)
VALUES ('4564561512345789', 'gun@gmail.com', 'Gun Winata', '144');

INSERT INTO DATA(id, statuscamil, tglup)
VALUES('4564561512345789', 'N', '2023-01-03');

INSERT INTO foto(idCamil, filename)
VALUES('4564561512345789','kmi.jpg');

--

INSERT INTO camil(idCamil, noHP, tptlahir, tgllahir, idRT, idRW, idKota, idKecamatan, idKelurahan, alamat, idTPS)
VALUES ('1786357887459987','081123456397','Jakarta','19890607','1','2','2','8','35','Jl. Jakarta Utara', '5');

INSERT INTO pengguna (idPengguna, email, namaPengguna, passPengguna)
VALUES ('1786357887459987', 'Noni@gmail.com', 'Noni Winata', '155');

INSERT INTO DATA(id, statuscamil, tglup)
VALUES('1786357887459987', 'Y', '2023-01-03');

INSERT INTO foto(idCamil, filename)
VALUES('1786357887459987','a.jpg');

INSERT INTO saksi(NIK, partai)
VALUES('1786357887459987', 'Prabowo');

--

INSERT INTO camil(idCamil, noHP, tptlahir, tgllahir, idRT, idRW, idKota, idKecamatan, idKelurahan, alamat)
VALUES ('4564785445874859','081123456297','Jakarta','19890607','1','2','2','9','37','Jl. Jakarta Timur');

INSERT INTO pengguna (idPengguna, email, namaPengguna, passPengguna)
VALUES ('4564785445874859', 'lolo@gmail.com', 'Lolo Winata', '166');

INSERT INTO DATA(id, statuscamil, tglup)
VALUES('4564785445874859', 'N', '2023-01-03');

INSERT INTO foto(idCamil, filename)
VALUES('4564785445874859','b.jpg');

--

INSERT INTO camil(idCamil, noHP, tptlahir, tgllahir, idRT, idRW, idKota, idKecamatan, idKelurahan, alamat, idTPS)
VALUES ('1232123654789563','081123456797','Bandung','19890608','1','2','2','1','8','Jl. Bandung Timur', '1');

INSERT INTO pengguna (idPengguna, email, namaPengguna, passPengguna)
VALUES ('1232123654789563', 'lala@gmail.com', 'Lala Winata', '177');

INSERT INTO DATA(id, statuscamil, tglup)
VALUES('1232123654789563', 'Y', '2023-01-03');

INSERT INTO foto(idCamil, filename)
VALUES('1232123654789563','c.jpg');

INSERT INTO saksi(NIK, partai)
VALUES('1232123654789563', 'PDI');

--

INSERT INTO camil(idCamil, noHP, tptlahir, tgllahir, idRT, idRW, idKota, idKecamatan, idKelurahan, alamat)
VALUES ('7548167548198354','081123456797','Jakarta','19890608','1','2','2','10','43','Jl. Jakarta Selatan');

INSERT INTO pengguna (idPengguna, email, namaPengguna, passPengguna)
VALUES ('7548167548198354', 'lili@gmail.com', 'Lili Winata', '199');

INSERT INTO DATA(id, statuscamil, tglup)
VALUES('7548167548198354', 'N', '2023-01-03');

INSERT INTO foto(idCamil, filename)
VALUES('7548167548198354','g.jpg');

/*selector buat view smua data gampang*/
SELECT * FROM pengguna;
SELECT * FROM admin;
SELECT * FROM lurah;
SELECT * FROM camil;
SELECT * FROM kota;
SELECT * FROM kecamatan ORDER BY idKecamatan DESC;
SELECT * FROM kelurahan ORDER BY idKelurahan DESC;
SELECT * FROM rw;
SELECT * FROM rt;
SELECT * FROM tps;
SELECT * FROM saksi;
SELECT * FROM DATA;
SELECT * FROM foto;