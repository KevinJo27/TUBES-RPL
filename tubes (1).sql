-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 23, 2023 at 02:53 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tubes`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `idAdmin` char(16) NOT NULL,
  `namaAdmin` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`idAdmin`, `namaAdmin`) VALUES
('6666666699999999', 'Kevin Jonathan'),
('6969696969696969', 'Mark Lowell'),
('9999999966666666', 'Doni Andrian');

-- --------------------------------------------------------

--
-- Table structure for table `camil`
--

CREATE TABLE `camil` (
  `idCamil` char(16) NOT NULL,
  `noHP` varchar(12) NOT NULL,
  `tptlahir` varchar(50) NOT NULL,
  `tgllahir` date NOT NULL,
  `idRT` char(3) NOT NULL,
  `idRW` char(3) NOT NULL,
  `idKota` char(3) NOT NULL,
  `idKecamatan` char(3) NOT NULL,
  `idKelurahan` char(3) NOT NULL,
  `idTPS` char(3) DEFAULT NULL,
  `alamat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `camil`
--

INSERT INTO `camil` (`idCamil`, `noHP`, `tptlahir`, `tgllahir`, `idRT`, `idRW`, `idKota`, `idKecamatan`, `idKelurahan`, `idTPS`, `alamat`) VALUES
('0000000000000000', '081234567', 'Bandung', '2023-09-08', '003', '002', '1', '1', '7', NULL, 'Babakan Ciparay 02'),
('1111111111111111', '081234567891', 'Bandung', '2023-09-02', '1', '1', '2', '6', '24', NULL, 'sad'),
('1231231231231112', '081123456879', 'Jakarta', '1989-06-04', '1', '2', '2', '5', '1', '3', 'Jl. Jakarta raya'),
('1232123654789563', '081123456797', 'Bandung', '1989-06-08', '1', '2', '2', '5', '1', NULL, 'Jl. Bandung Timur'),
('1232132321222222', '081234567891', 'Bandung', '2023-11-10', '009', '888', '1', '1', '7', NULL, 'Ciparay no 8'),
('1234521478542698', '081123456987', 'Jakarta', '1989-06-05', '1', '2', '2', '5', '1', NULL, 'Jl. Jakarta Barat'),
('1234567812345678', '123456123456', 'Bandung', '2001-09-11', '1', '1', '1', '5', '1', NULL, 'Saritem 12'),
('1313131313131313', '081123456687', 'Bandung', '1989-06-07', '1', '2', '1', '5', '1', NULL, 'Jl. Bandung Barat'),
('1515151515151515', '081123456687', 'Bandung', '1989-06-07', '1', '2', '1', '5', '1', NULL, 'Jl. Bandung Barat'),
('1547852684859625', '081123456087', 'Bandung', '1989-06-07', '1', '2', '1', '5', '1', NULL, 'Jl. Bandung Barat'),
('1786357887459987', '081123456397', 'Jakarta', '1989-06-07', '1', '2', '2', '5', '1', '5', 'Jl. Jakarta Utara'),
('2222222222222222', '081123456789', 'Bandung', '1999-06-14', '1', '1', '1', '5', '1', NULL, 'Jl. Maleber No. 02'),
('3333333333333333', '081234567891', 'Bandung', '2023-06-10', '1', '1', '1', '1', '7', NULL, 'sarijadi no 7'),
('4444444444444444', '081234567891', 'Bandung', '2023-06-10', '002', '001', '1', '5', '1', '3', 'Babakan Ciparay 02'),
('4564561512345789', '081123456097', 'Bandung', '1989-06-07', '1', '2', '2', '4', '20', NULL, 'Jl. Bandung Utara'),
('4564785445874859', '081123456297', 'Jakarta', '1989-06-07', '1', '2', '2', '9', '37', NULL, 'Jl. Jakarta Timur'),
('5555555555555555', '081234567891', 'Bandung', '2023-06-02', '1', '1', '1', '5', '1', NULL, 'papua utara no 9'),
('6548978954654987', '081234567265', 'Bandung', '2023-06-08', '1', '1', '1', '5', '1', NULL, 'Babakan Ciparay 02'),
('7548167548198354', '081123456797', 'Jakarta', '1989-06-08', '1', '2', '2', '10', '43', NULL, 'Jl. Jakarta Selatan'),
('8888888888888888', '081234567891', 'Papua', '2023-11-09', '001', '002', '1', '1', '1', NULL, 'papua utara no 9');

-- --------------------------------------------------------

--
-- Table structure for table `data`
--

CREATE TABLE `data` (
  `id` char(16) NOT NULL,
  `statuscamil` char(1) NOT NULL,
  `tglUp` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `data`
--

INSERT INTO `data` (`id`, `statuscamil`, `tglUp`) VALUES
('0000000000000000', 'N', '2023-09-22'),
('1231231231231112', 'Y', '2023-01-01'),
('1232123654789563', 'Y', '2023-01-03'),
('1232132321222222', 'N', '2023-11-22'),
('1234521478542698', 'Y', '2023-01-03'),
('1234567812345678', 'Y', '1999-01-01'),
('1313131313131313', 'N', '2023-01-03'),
('1515151515151515', 'Y', '2023-01-03'),
('1547852684859625', 'Y', '2023-01-03'),
('1786357887459987', 'Y', '2023-01-03'),
('2222222222222222', 'Y', '1999-01-01'),
('3333333333333333', 'Y', '2023-06-17'),
('4444444444444444', 'Y', '2023-06-20'),
('4564561512345789', 'Y', '2023-01-03'),
('4564785445874859', 'Y', '2023-01-03'),
('5555555555555555', 'Y', '2023-06-19'),
('6548978954654987', 'Y', '2023-06-19'),
('7548167548198354', 'Y', '2023-01-03'),
('8888888888888888', 'Y', '2023-06-19');

-- --------------------------------------------------------

--
-- Table structure for table `foto`
--

CREATE TABLE `foto` (
  `idCamil` char(16) NOT NULL,
  `filename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `foto`
--

INSERT INTO `foto` (`idCamil`, `filename`) VALUES
('0000000000000000', '0000000000000000.jpg'),
('1111111111111111', '1111111111111111.jpg'),
('1231231231231112', 'duar.jpg'),
('1232123654789563', 'c.jpg'),
('1232132321222222', '1232132321222222.jpg'),
('1234521478542698', 'saya.jpg'),
('1234567812345678', 'foto.jpg'),
('1313131313131313', 'dia.jpg'),
('1515151515151515', 'dia.jpg'),
('1547852684859625', 'dia.jpg'),
('1786357887459987', 'a.jpg'),
('2222222222222222', 'foto.jpg'),
('3333333333333333', '3333333333333333.jpg'),
('4444444444444444', '4444444444444444.jpg'),
('4564561512345789', 'kmi.jpg'),
('4564785445874859', 'b.jpg'),
('5555555555555555', '5555555555555555.jpg'),
('6548978954654987', '6548978954654987.jpg'),
('7548167548198354', 'g.jpg'),
('8888888888888888', '8888888888888888.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `kecamatan`
--

CREATE TABLE `kecamatan` (
  `idKecamatan` int NOT NULL,
  `ket` varchar(150) DEFAULT NULL,
  `idkota` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kecamatan`
--

INSERT INTO `kecamatan` (`idKecamatan`, `ket`, `idkota`) VALUES
(1, 'Andir', 1),
(2, 'Astana_Anyar', 1),
(3, 'Antapani', 1),
(4, 'Arcamanik', 1),
(5, 'Babakan_Ciparay', 1),
(6, 'Cempaka_Putih', 2),
(7, 'Gambir', 2),
(8, 'Johar_Baru', 2),
(9, 'Kemayoran', 2),
(10, 'Menteng', 2),
(11, 'Asemrowo', 3),
(12, 'Benowo', 3),
(13, 'Bubutan', 3),
(14, 'Bulak', 3),
(15, 'Dukuh_Pakis', 3);

-- --------------------------------------------------------

--
-- Table structure for table `kelurahan`
--

CREATE TABLE `kelurahan` (
  `idKelurahan` int NOT NULL,
  `ket` varchar(150) DEFAULT NULL,
  `idKecamatan` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kelurahan`
--

INSERT INTO `kelurahan` (`idKelurahan`, `ket`, `idKecamatan`) VALUES
(1, 'Margahayu', 5),
(2, 'Babakan', 5),
(3, 'Margasuka', 5),
(4, 'Sukahaji', 5),
(5, 'Cirangrang', 5),
(6, 'Campaka', 1),
(7, 'Ciroyom', 1),
(8, 'Garuda', 1),
(9, 'KebonJeruk', 1),
(10, 'Maleber', 1),
(11, 'Cibadak', 2),
(12, 'Karanganyar', 2),
(13, 'Karasak', 2),
(14, 'Nyengseret', 2),
(15, 'Panjunan', 2),
(16, 'Antapani Kidul', 3),
(17, 'Antapani Kulon', 3),
(18, 'Antapani Tengah', 3),
(19, 'Antapani Wetan', 3),
(20, 'Cisaranten Bina Harapan', 4),
(21, 'Cisaranten Endah', 4),
(22, 'Cisaranten Kulon', 4),
(23, 'Sukamiskin', 4),
(24, 'Cempaka Putih Barat', 6),
(25, 'Cempaka Putih Timur', 6),
(26, 'Rawasari', 6),
(27, 'Cideng', 7),
(28, 'Duri Pulo', 7),
(29, 'Gambir', 7),
(30, 'Kebon Kelapa', 7),
(31, 'Petojo Selatan', 7),
(32, 'Petojo Utara', 7),
(33, 'Galur', 8),
(34, 'Johar Baru', 8),
(35, 'Kampung Rawa', 8),
(36, 'Tanah Tinggi', 8),
(37, 'Cempaka Baru', 9),
(38, 'Gunung Sahari Selatan', 9),
(39, 'Harapan Mulya', 9),
(40, 'Kebon Kosong', 9),
(41, 'Kemayoran', 9),
(42, 'Cikini', 10),
(43, 'Gondangdia', 10),
(44, 'Kebon Sirih', 10),
(45, 'Menteng', 10),
(46, 'Pegangsaan', 10),
(47, 'Asemrowo', 11),
(48, 'Genting Kalianak', 11),
(49, 'Tambak Sarioso', 11),
(50, 'Kandangan', 12),
(51, 'Romokalisari', 12),
(52, 'Sememi', 12),
(53, 'Tambak Osowilangun', 12),
(54, 'Alun-alun Contong', 13),
(55, 'Bubutan', 13),
(56, 'Gundih', 13),
(57, 'Jepara', 13),
(58, 'Tembok Dukuh', 13),
(59, 'Bulak', 14),
(60, 'Kedungcowek', 14),
(61, 'Kenjeran', 14),
(62, 'Sukolilo Baru', 14),
(63, 'Dukuh Kupang', 15),
(64, 'Dukuh Pakis', 15),
(65, 'Gunung Sari', 15),
(66, 'Pradah Kalikendal', 15);

-- --------------------------------------------------------

--
-- Table structure for table `kota`
--

CREATE TABLE `kota` (
  `idkota` int NOT NULL,
  `ket` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kota`
--

INSERT INTO `kota` (`idkota`, `ket`) VALUES
(1, 'Bandung'),
(2, 'Jakarta'),
(3, 'Surabaya');

-- --------------------------------------------------------

--
-- Table structure for table `lurah`
--

CREATE TABLE `lurah` (
  `idLurah` char(16) NOT NULL,
  `noHP` varchar(12) NOT NULL,
  `tptlahir` varchar(50) NOT NULL,
  `tgllahir` date NOT NULL,
  `idKota` char(3) NOT NULL,
  `idKecamatan` char(3) NOT NULL,
  `idKelurahan` char(3) NOT NULL,
  `alamat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `lurah`
--

INSERT INTO `lurah` (`idLurah`, `noHP`, `tptlahir`, `tgllahir`, `idKota`, `idKecamatan`, `idKelurahan`, `alamat`) VALUES
('1111111111111111', '123456123456', 'Bandung', '2001-09-11', '5', '1', '1', 'Saritem 12'),
('3548965858958487', '123456123456', 'Bandung', '2001-09-11', '1', '4', '20', 'Saritem 12'),
('4587878798989898', '123456123456', 'Bandung', '2001-09-11', '2', '9', '37', 'Saritem 12'),
('6565252598985858', '123456123456', 'Bandung', '2001-09-11', '2', '10', '43', 'Saritem 12');

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `idPengguna` char(16) NOT NULL,
  `namaPengguna` varchar(50) NOT NULL,
  `passPengguna` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`idPengguna`, `namaPengguna`, `passPengguna`, `email`) VALUES
('0000000000000000', 'asdasd', 'pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=', 'doniandrian.talenta@gmail.com'),
('1111111111111111', 'Yog Doyog', 'pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=', 'yog@gmail.com'),
('1231231231231112', 'Nurul Adinda', '155', 'nurul@gmail.com'),
('1232123654789563', 'Lala Winata', '177', 'lala@gmail.com'),
('1232132321222222', 'pines tree', 'pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=', 'pinestree@gmail.com'),
('1234521478542698', 'Ahmad Rizal', '122', 'jumad@gmail.com'),
('1234567812345678', 'tester', 'waw', 'email.com'),
('1313131313131313', 'Der Winata', '156', 'der@gmail.com'),
('1515151515151515', 'Dor Winata', '124', 'dor@gmail.com'),
('1547852684859625', 'Agus Winata', '133', 'agus@gmail.com'),
('1786357887459987', 'Noni Winata', '155', 'Noni@gmail.com'),
('2222222222222222', 'Arisyami Munisa', '123', 'arisyami@gmail.com'),
('3333333333333333', 'lukman wijaya', 'pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=', 'lukman@gmail.com'),
('3548965858958487', 'Yag Dayag', 'pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=', 'yag@gmail.com'),
('4444444444444444', 'wawan', 'pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=', 'wawan2@gmail.com'),
('4564561512345789', 'Gun Winata', '144', 'gun@gmail.com'),
('4564785445874859', 'Lolo Winata', '166', 'lolo@gmail.com'),
('4587878798989898', 'Yok Ayok', 'pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=', 'yok@gmail.com'),
('5555555555555555', 'yellow', 'pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=', 'lukman@gmail.com'),
('6548978954654987', 'Wawan Razak', 'pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=', 'wawan@gmail.com'),
('6565252598985858', 'Yay Iyaya', 'pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=', 'yay@gmail.com'),
('6666666699999999', 'Kevin Jonathan', 'pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=', 'kejo@gmail.com'),
('6969696969696969', 'Mark Lowell', 'pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=', 'mark@gmail.com'),
('7548167548198354', 'Lili Winata', '199', 'lili@gmail.com'),
('8888888888888888', 'abdulrahman wahid', 'pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=', 'abdul@gmail.com'),
('9999999966666666', 'Doni Andrian', 'pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=', 'doni@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `rt`
--

CREATE TABLE `rt` (
  `idRT` char(3) NOT NULL,
  `ket` varchar(150) DEFAULT NULL,
  `idRW` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `rt`
--

INSERT INTO `rt` (`idRT`, `ket`, `idRW`) VALUES
('1', 'rt01', '1');

-- --------------------------------------------------------

--
-- Table structure for table `rw`
--

CREATE TABLE `rw` (
  `idRW` char(3) NOT NULL,
  `ket` varchar(150) DEFAULT NULL,
  `idKelurahan` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `rw`
--

INSERT INTO `rw` (`idRW`, `ket`, `idKelurahan`) VALUES
('1', 'rw01', '1');

-- --------------------------------------------------------

--
-- Table structure for table `saksi`
--

CREATE TABLE `saksi` (
  `NIK` char(16) NOT NULL,
  `partai` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `saksi`
--

INSERT INTO `saksi` (`NIK`, `partai`) VALUES
('', 'PDI'),
('1231231231231112', 'SHHK'),
('1232123654789563', 'PDI'),
('1234521478542698', 'SBYJAYA'),
('1786357887459987', 'Prabowo'),
('2222222222222222', 'BAnteng BIRU'),
('4444444444444444', 'NASDEM'),
('8888888888888888', 'BANTENG MERAH');

-- --------------------------------------------------------

--
-- Table structure for table `tps`
--

CREATE TABLE `tps` (
  `idTPS` int NOT NULL,
  `ket` varchar(150) DEFAULT NULL,
  `lokasi` varchar(150) DEFAULT NULL,
  `idRT` char(3) DEFAULT NULL,
  `capacity` int NOT NULL,
  `used` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tps`
--

INSERT INTO `tps` (`idTPS`, `ket`, `lokasi`, `idRT`, `capacity`, `used`) VALUES
(1, 'Aula SMA BPK Holis (Margahayu)', NULL, '1', 50, 0),
(2, 'Aula SMA Aloysius Holis (Margahayu)', NULL, '1', 50, 0),
(3, 'Aula SMA Trinitas Holis (Margahayu)', NULL, '1', 50, 0),
(6, 'TKI', NULL, '2', 50, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`idAdmin`);

--
-- Indexes for table `camil`
--
ALTER TABLE `camil`
  ADD PRIMARY KEY (`idCamil`);

--
-- Indexes for table `data`
--
ALTER TABLE `data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `foto`
--
ALTER TABLE `foto`
  ADD PRIMARY KEY (`idCamil`);

--
-- Indexes for table `kecamatan`
--
ALTER TABLE `kecamatan`
  ADD PRIMARY KEY (`idKecamatan`);

--
-- Indexes for table `kelurahan`
--
ALTER TABLE `kelurahan`
  ADD PRIMARY KEY (`idKelurahan`);

--
-- Indexes for table `kota`
--
ALTER TABLE `kota`
  ADD PRIMARY KEY (`idkota`);

--
-- Indexes for table `lurah`
--
ALTER TABLE `lurah`
  ADD PRIMARY KEY (`idLurah`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`idPengguna`);

--
-- Indexes for table `rt`
--
ALTER TABLE `rt`
  ADD PRIMARY KEY (`idRT`);

--
-- Indexes for table `rw`
--
ALTER TABLE `rw`
  ADD PRIMARY KEY (`idRW`);

--
-- Indexes for table `saksi`
--
ALTER TABLE `saksi`
  ADD PRIMARY KEY (`NIK`);

--
-- Indexes for table `tps`
--
ALTER TABLE `tps`
  ADD PRIMARY KEY (`idTPS`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tps`
--
ALTER TABLE `tps`
  MODIFY `idTPS` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
