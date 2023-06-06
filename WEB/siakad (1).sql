-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 03, 2023 at 04:15 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `siakad`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ID_ADMIN` int(11) NOT NULL,
  `NIP` varchar(255) NOT NULL,
  `NAMA` varchar(255) NOT NULL,
  `ALAMAT` varchar(255) NOT NULL,
  `TTL` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`ID_ADMIN`, `NIP`, `NAMA`, `ALAMAT`, `TTL`, `password`) VALUES
(1, '87654321', 'Jess Amalia', 'Jalan Bandung', '7 Desember 1998', '123');

-- --------------------------------------------------------

--
-- Table structure for table `daftar_kelas`
--

CREATE TABLE `daftar_kelas` (
  `ID_KELAS` int(11) NOT NULL,
  `NAMA` varchar(255) NOT NULL,
  `ID_WALI_KELAS` int(11) NOT NULL,
  `TINGKAT` int(1) NOT NULL,
  `JADWAL` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `daftar_kelas`
--

INSERT INTO `daftar_kelas` (`ID_KELAS`, `NAMA`, `ID_WALI_KELAS`, `TINGKAT`, `JADWAL`) VALUES
(1, 'X MIPA 1', 2, 1, NULL),
(2, 'XI MIPA 1', 3, 2, NULL),
(3, 'XII MIPA 1', 1, 3, 'jadwal.JPG'),
(4, 'X MIPA 2', 4, 1, NULL),
(5, 'X MIPA 3', 5, 1, NULL),
(6, 'XI MIPA 2', 6, 2, NULL),
(7, 'XI MIPA 3', 7, 2, NULL),
(8, 'XII MIPA 2', 8, 3, NULL),
(9, 'XII MIPA 3', 10, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `daftar_mapel`
--

CREATE TABLE `daftar_mapel` (
  `ID_MAPEL` int(11) NOT NULL,
  `NAMA` varchar(255) NOT NULL,
  `KETERANGAN` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `daftar_mapel`
--

INSERT INTO `daftar_mapel` (`ID_MAPEL`, `NAMA`, `KETERANGAN`) VALUES
(1, 'FISIKA', ''),
(2, 'BIOLOGI', ''),
(3, 'KIMIA', ''),
(4, 'MATEMATIKA WAJIB', ''),
(5, 'MATEMATIKA PEMINATAN', ''),
(6, 'FIQIH', ''),
(7, 'QURAN HADIST', ''),
(8, 'AKIDAH AKHLAQ', ''),
(9, 'BAHASA INDONESIA', ''),
(10, 'PENDIDIKAN KEWARGANEGARAAN', ''),
(11, 'OLAHRAGA', ''),
(12, 'BAHAS ARAB', ''),
(13, 'Bahasa prancis', 'tes');

-- --------------------------------------------------------

--
-- Table structure for table `daftar_siswa`
--

CREATE TABLE `daftar_siswa` (
  `ID_SISWA` int(11) NOT NULL,
  `NIS` varchar(255) NOT NULL,
  `NAMA` varchar(255) NOT NULL,
  `ALAMAT` varchar(255) NOT NULL,
  `TTL` varchar(255) NOT NULL,
  `ID_KELAS` int(11) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `daftar_siswa`
--

INSERT INTO `daftar_siswa` (`ID_SISWA`, `NIS`, `NAMA`, `ALAMAT`, `TTL`, `ID_KELAS`, `password`) VALUES
(1, '0033132404', 'Farrel Muhammad Raihan Akhdan', 'Perum Ikip Tegalgondo Asri Blok 2J/20', 'Malang, 4 Januari 2003', 3, '12345'),
(2, '2041720097', 'Maulana Syarief Hidayatullah', 'Mulyorejo', 'Malang, 31 Desember 2001', 3, '12345'),
(3, '2041720090', 'Primo Afga Parlevi', 'Jl Pisang Kipas', 'Malang, 1 Januari 2002', 3, '12345'),
(4, '2041720193', 'Al Kautsar', 'Perum Griyasanta', 'Bekasi, 29 November 2001', 1, '123'),
(5, '2041720020', 'Favian Apta', 'Blimbing', 'Malang, 17 Agustus 2002', 1, '123'),
(6, '2041720030', 'Rayhan Hidayatullah', 'Sawojajar', 'Malang, 10 November 2001', 1, '123'),
(7, '2041720023', 'Atma Sagita', 'Sawojajar', 'Malang, 12 Desember 2001', 3, '123'),
(8, '2041720024', 'Lil Hamka', 'Mergosono gang 5', 'Malang, 12 November 2001', 1, '123'),
(9, '2041720012', 'Aryo Bags', 'Jl. Ampel Gading', 'Malang, 13 Juni 2001', 3, '123'),
(10, '2041720013', 'Rijal Ammar', 'Jl. Velodrom Sawojajar', 'Malang, 8 Desember 2001', 2, '123'),
(11, '2041720191', 'Soo Lee Heen', 'Jl. Pisang Kipas', 'Korea, 11 Juni 2000', 1, '123'),
(12, '2041720192', 'Soo Lee Kien', 'Jl. Sudimoro', 'Malang, 10 Oktober 2001', 3, '123'),
(13, '2041720195', 'Agus Stefan', 'Jl. ijen Raya No 20', 'Jakarta, 12 Maret 2001', 3, '123'),
(14, '2041720194', 'Indah Willy', 'Blitar kota', 'Blitar, 10 November 2001', 3, '123'),
(15, '2014172003', 'Aldant Yafi', 'pisang kipas no 13', 'Pasuruan, 12 Mei 2002', 3, '123'),
(16, '3041720011', 'Muhammad Fadhil', 'Jl. Rawi Sari Mulyorejo', 'Malang, 13 Desember 2001', 3, '1234'),
(17, '3041720012', 'Nabila Faizah', 'Jl. Muharto gang 5', 'Jember, 1 Januari 2001', 3, '123'),
(18, '3041720013', 'Nikita Willy', 'Jl. Bayam Bumiayu Malang', 'Medan, 12 Februari 2002', 3, '123'),
(19, '3041720014', 'Elsa Apreliani ', 'Jl. Kendalsari', 'Blitar, 8 April 2001', 2, '123'),
(20, '2041720014', 'Akhmad Dhani Nur Azizi', 'Jl. kapri Bumiayu Malang', 'Malang, 11 Desember 2001', 2, '123'),
(21, '2041720015', 'Nur Hikmah', 'Jl. Bandung', 'Malang 12 November 2001', 2, '123'),
(22, '2041720016', 'Afga Primo', 'Jl. Kendal Payak Gang 14', 'Malang, 2 Februari 2001', 2, '123'),
(23, '2041720017', 'Paidi', 'Madiun', 'Madiun, 11 Desember 2022', 2, '123'),
(24, '2041720018', 'Paidi dua', 'Nganjuk', 'Nganjuk, 12 Desember 2022', 2, '123'),
(25, '2041720019', 'Paidi Tiga', 'Ngawi', 'Ngawi, 11 Desember 2022', 2, '123'),
(26, '2041710010', 'Sargunem ', 'Ponorogo', 'Ponorogo, 10 Maret 2001', 1, '123'),
(27, '2041740010', 'Afif', 'Malang', 'Malang, 30 April 2002', 4, '123'),
(28, '2041740011', 'Vanila', 'Malang', 'Malang, 21 April 2001', 4, '123'),
(29, '2041740012', 'Malikin Ula', 'Malang', 'Malang, 12 Agustus 2002', 4, '123'),
(30, '2041740013', 'Sanu Man', 'Malang', 'Malang, 30 Agustus 2002', 4, '123'),
(31, '2041740014', 'Dablek', 'Malang', 'Malang, 30 Januari 2002', 4, '123'),
(32, '2041740015', 'Sarip Dimas', 'Malang', 'Malang, 1 April 2002', 4, '123'),
(33, '2041740016', 'Gito', 'Malang', 'Malang, 3 Maret 2002', 4, '123'),
(34, '2041750010', 'Fifi', 'Lumajang', 'Malang, 3 Juni 2002', 5, '123'),
(35, '2041750011', 'Fia Siva', 'Malang', 'Malang, 10 Februari 2002', 5, '123'),
(36, '2041750012', 'Siva', 'Malang', 'Malang, 10 Juli 2001', 5, '123'),
(37, '2041750013', 'Vila', 'Malang', 'Malang, 1 Februari 2001', 5, '123'),
(38, '2041750014', 'Alvita', 'Malang', 'Malang, 1 Agustus 2001', 5, '123'),
(39, '2041750015', 'Nila', 'Malang', 'Malang, 1 Mei 2001', 5, '123'),
(40, '2041760010', 'Lana', 'Malang', 'Malang, 11 Februari 2001', 6, '123'),
(41, '2041760011', 'Analu', 'Malang', 'Malang, 11 Maret 2001', 6, '123'),
(42, '2041760012', 'Putra', 'Malang', 'Malang, 21 Februari 2001', 6, '123'),
(43, '2041760013', 'Putri', 'Malang', 'Malang, 21 Mei 2001', 6, '123'),
(44, '2041760014', 'Ani', 'Malang', 'Malang, 21 Agustus 2001', 6, '123'),
(45, '2041760015', 'Budi', 'Malang', 'Malang, 1 Oktober 2001', 6, '123'),
(46, '2041760016', 'Wati', 'Malang', 'Malang, 2 Februari 2001', 6, '123'),
(47, '2041770010', 'Wanto', 'Malang', 'Malang, 21 Oktober 2002', 6, '123'),
(48, '2041770011', 'Wito', 'Malang', 'Malang, 21 November 2002', 7, '123'),
(49, '2041770012', 'Warsan', 'Malang', 'Malang, 5 Oktober 2002', 7, '123'),
(50, '2041770013', 'Waluya', 'Malang', 'Malang, 5 Maret 2002', 7, '123'),
(51, '2041770014', 'Wakidi', 'Malang', 'Malang, 25 Maret 2002', 7, '123'),
(52, '2041770015', 'Wagiman', 'Malang', 'Malang, 25 Agustus 2002', 7, '123'),
(53, '2041770016', 'Mulyono', 'Malang', 'Malang, 25 Maret 2001', 7, '123'),
(54, '2041780010', 'Danila', 'Malang', 'Malang, 25 Maret 2000', 8, '123'),
(55, '2041780011', 'Dea Wisma', 'Malang', 'Malang, 5 Mei 2000', 8, '123'),
(56, '2041780012', 'Wisnu Utama', 'Malang', 'Malang, 15 Oktober 2000', 8, '123'),
(57, '2041780013', 'Giman Toro', 'Malang', 'Malang, 15 Januari 2000', 8, '123'),
(58, '2041780014', 'Rumastiko', 'Malang', 'Malang, 15 Agustus 2000', 8, '123'),
(59, '2041780015', 'Maertha', 'Malang', 'Malang, 15 Juli 2001', 8, '123'),
(60, '2041790010', 'Soleh', 'Malang', 'Malang, 25 Oktober 2000', 9, '123'),
(61, '2041790011', 'Soleh', 'Malang', 'Malang, 13 Oktober 2000', 9, '123'),
(62, '2041790012', 'Saleh', 'Malang', 'Malang, 11 Oktober 2000', 9, '123'),
(63, '2041790013', 'Siti Ropeah', 'Malang', 'Malang, 11 Maret 2000', 9, '123'),
(64, '2041790014', 'Lisa Bule', 'Malang', 'Malang, 11 Juli 2000', 9, '123'),
(65, '2041790015', 'Maertha Sinus', 'Malang', 'Malang, 11 Desember 2002', 9, '123'),
(68, '12223', 'nama', 'malang', 'malang 2001', 1, '12223');

-- --------------------------------------------------------

--
-- Table structure for table `daftar_tugas`
--

CREATE TABLE `daftar_tugas` (
  `ID_TUGAS` int(11) NOT NULL,
  `ID_GURU` int(11) NOT NULL,
  `ID_MAPEL` int(11) NOT NULL,
  `ID_KELAS` int(11) NOT NULL,
  `NAMA` varchar(100) NOT NULL,
  `KETERANGAN` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `daftar_tugas`
--

INSERT INTO `daftar_tugas` (`ID_TUGAS`, `ID_GURU`, `ID_MAPEL`, `ID_KELAS`, `NAMA`, `KETERANGAN`) VALUES
(1, 1, 4, 3, 'TUGAS 1', ''),
(2, 1, 4, 3, 'TUGAS 2', ''),
(3, 1, 4, 1, 'TUGAS BAB 1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `daftar_uh`
--

CREATE TABLE `daftar_uh` (
  `ID_UH` int(11) NOT NULL,
  `ID_GURU` int(11) NOT NULL,
  `ID_MAPEL` int(11) NOT NULL,
  `ID_KELAS` int(11) NOT NULL,
  `NAMA` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `daftar_uh`
--

INSERT INTO `daftar_uh` (`ID_UH`, `ID_GURU`, `ID_MAPEL`, `ID_KELAS`, `NAMA`) VALUES
(1, 1, 4, 3, 'BAB 1'),
(2, 1, 4, 3, 'BAB 2'),
(3, 1, 4, 3, 'BAB 3'),
(4, 1, 4, 3, 'UH 4');

-- --------------------------------------------------------

--
-- Table structure for table `data_nilai_tugas`
--

CREATE TABLE `data_nilai_tugas` (
  `ID` int(11) NOT NULL,
  `ID_MAPEL` int(11) NOT NULL,
  `ID_GURU` int(11) NOT NULL,
  `ID_KELAS` int(11) NOT NULL,
  `ID_TUGAS` int(11) NOT NULL,
  `ID_SISWA` int(11) NOT NULL,
  `NILAI` int(3) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `data_nilai_tugas`
--

INSERT INTO `data_nilai_tugas` (`ID`, `ID_MAPEL`, `ID_GURU`, `ID_KELAS`, `ID_TUGAS`, `ID_SISWA`, `NILAI`) VALUES
(1, 4, 1, 3, 1, 1, 0),
(2, 4, 1, 3, 2, 1, 0),
(3, 4, 1, 3, 1, 2, 0),
(4, 4, 1, 3, 2, 2, 0),
(5, 4, 1, 3, 1, 3, 0),
(6, 4, 1, 3, 2, 3, 0),
(7, 4, 1, 3, 1, 7, 0),
(8, 4, 1, 3, 2, 7, 0),
(9, 4, 1, 3, 1, 9, 0),
(10, 4, 1, 3, 2, 9, 0),
(11, 4, 1, 3, 1, 12, 0),
(12, 4, 1, 3, 2, 12, 0),
(13, 4, 1, 3, 1, 13, 0),
(14, 4, 1, 3, 2, 13, 0),
(15, 4, 1, 3, 1, 14, 0),
(16, 4, 1, 3, 2, 14, 0),
(17, 4, 1, 3, 1, 15, 0),
(18, 4, 1, 3, 2, 15, 0),
(19, 4, 1, 3, 1, 16, 0),
(20, 4, 1, 3, 2, 16, 0),
(21, 4, 1, 3, 1, 17, 0),
(22, 4, 1, 3, 2, 17, 0),
(23, 4, 1, 3, 1, 18, 0),
(24, 4, 1, 3, 2, 18, 0),
(25, 4, 1, 1, 3, 4, 90),
(26, 4, 1, 1, 3, 5, 0),
(27, 4, 1, 1, 3, 6, 0),
(28, 4, 1, 1, 3, 8, 0),
(29, 4, 1, 1, 3, 11, 0),
(30, 4, 1, 1, 3, 26, 0);

-- --------------------------------------------------------

--
-- Table structure for table `data_nilai_uas`
--

CREATE TABLE `data_nilai_uas` (
  `ID_UAS` int(11) NOT NULL,
  `ID_MAPEL` int(11) NOT NULL,
  `ID_GURU` int(11) NOT NULL,
  `ID_KELAS` int(11) NOT NULL,
  `ID_SISWA` int(11) NOT NULL,
  `NILAI` int(3) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `data_nilai_uas`
--

INSERT INTO `data_nilai_uas` (`ID_UAS`, `ID_MAPEL`, `ID_GURU`, `ID_KELAS`, `ID_SISWA`, `NILAI`) VALUES
(1, 4, 1, 3, 1, 92),
(2, 4, 1, 3, 3, 90),
(3, 4, 1, 3, 2, 93),
(4, 4, 1, 3, 7, 0),
(5, 4, 1, 3, 9, 0),
(6, 4, 1, 3, 12, 0),
(7, 4, 1, 3, 13, 90),
(8, 4, 1, 3, 14, 0),
(9, 4, 1, 3, 15, 0),
(10, 4, 1, 3, 16, 0),
(11, 4, 1, 3, 17, 0),
(12, 4, 1, 3, 18, 0),
(13, 2, 3, 6, 40, 0),
(14, 2, 3, 6, 41, 0),
(15, 2, 3, 6, 42, 0),
(16, 2, 3, 6, 43, 0),
(17, 2, 3, 6, 44, 0),
(18, 2, 3, 6, 45, 0),
(19, 2, 3, 6, 46, 0),
(20, 2, 3, 6, 47, 0);

-- --------------------------------------------------------

--
-- Table structure for table `data_nilai_uh`
--

CREATE TABLE `data_nilai_uh` (
  `ID` int(11) NOT NULL,
  `ID_MAPEL` int(11) NOT NULL,
  `ID_GURU` int(11) NOT NULL,
  `ID_KELAS` int(11) NOT NULL,
  `ID_UH` int(11) NOT NULL,
  `ID_SISWA` int(11) NOT NULL,
  `NILAI` int(3) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `data_nilai_uh`
--

INSERT INTO `data_nilai_uh` (`ID`, `ID_MAPEL`, `ID_GURU`, `ID_KELAS`, `ID_UH`, `ID_SISWA`, `NILAI`) VALUES
(1, 4, 1, 3, 1, 2, 91),
(2, 4, 1, 3, 1, 1, 95),
(3, 4, 1, 3, 1, 3, 95),
(4, 4, 1, 3, 1, 7, 0),
(5, 4, 1, 3, 2, 7, 0),
(6, 4, 1, 3, 3, 7, 0),
(7, 4, 1, 3, 1, 9, 0),
(8, 4, 1, 3, 2, 9, 0),
(9, 4, 1, 3, 3, 9, 0),
(10, 4, 1, 3, 1, 12, 0),
(11, 4, 1, 3, 2, 12, 0),
(12, 4, 1, 3, 3, 12, 0),
(13, 4, 1, 3, 1, 13, 99),
(14, 4, 1, 3, 2, 13, 0),
(15, 4, 1, 3, 3, 13, 0),
(16, 4, 1, 3, 1, 14, 0),
(17, 4, 1, 3, 2, 14, 0),
(18, 4, 1, 3, 3, 14, 0),
(19, 4, 1, 3, 1, 15, 0),
(20, 4, 1, 3, 2, 15, 0),
(21, 4, 1, 3, 3, 15, 0),
(22, 4, 1, 3, 1, 16, 0),
(23, 4, 1, 3, 2, 16, 0),
(24, 4, 1, 3, 3, 16, 0),
(25, 4, 1, 3, 1, 17, 0),
(26, 4, 1, 3, 2, 17, 0),
(27, 4, 1, 3, 3, 17, 0),
(28, 4, 1, 3, 1, 18, 0),
(29, 4, 1, 3, 2, 18, 0),
(30, 4, 1, 3, 3, 18, 0),
(31, 4, 1, 3, 2, 1, 0),
(32, 4, 1, 3, 3, 1, 0),
(33, 4, 1, 3, 2, 2, 0),
(34, 4, 1, 3, 3, 2, 0),
(35, 4, 1, 3, 2, 3, 0),
(36, 4, 1, 3, 3, 3, 0),
(37, 4, 1, 3, 4, 1, 0),
(38, 4, 1, 3, 4, 2, 0),
(39, 4, 1, 3, 4, 3, 0),
(40, 4, 1, 3, 4, 7, 0),
(41, 4, 1, 3, 4, 9, 0),
(42, 4, 1, 3, 4, 12, 0),
(43, 4, 1, 3, 4, 13, 0),
(44, 4, 1, 3, 4, 14, 0),
(45, 4, 1, 3, 4, 15, 0),
(46, 4, 1, 3, 4, 16, 0),
(47, 4, 1, 3, 4, 17, 0),
(48, 4, 1, 3, 4, 18, 0);

-- --------------------------------------------------------

--
-- Table structure for table `data_nilai_uts`
--

CREATE TABLE `data_nilai_uts` (
  `ID_UTS` int(11) NOT NULL,
  `ID_MAPEL` int(11) NOT NULL,
  `ID_GURU` int(11) NOT NULL,
  `ID_KELAS` int(11) NOT NULL,
  `ID_SISWA` int(11) NOT NULL,
  `NILAI` int(3) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `data_nilai_uts`
--

INSERT INTO `data_nilai_uts` (`ID_UTS`, `ID_MAPEL`, `ID_GURU`, `ID_KELAS`, `ID_SISWA`, `NILAI`) VALUES
(1, 4, 1, 3, 3, 95),
(2, 4, 1, 3, 2, 90),
(3, 4, 1, 3, 1, 92),
(4, 4, 1, 3, 7, 0),
(5, 4, 1, 3, 9, 0),
(6, 4, 1, 3, 12, 0),
(7, 4, 1, 3, 13, 0),
(8, 4, 1, 3, 14, 0),
(9, 4, 1, 3, 15, 0),
(10, 4, 1, 3, 16, 0),
(11, 4, 1, 3, 17, 0),
(12, 4, 1, 3, 18, 0),
(13, 2, 3, 6, 40, 0),
(14, 2, 3, 6, 41, 0),
(15, 2, 3, 6, 42, 0),
(16, 2, 3, 6, 43, 0),
(17, 2, 3, 6, 44, 0),
(18, 2, 3, 6, 45, 0),
(19, 2, 3, 6, 46, 0),
(20, 2, 3, 6, 47, 0);

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `ID` int(11) NOT NULL,
  `NIG` varchar(255) NOT NULL,
  `NAMA` varchar(255) NOT NULL,
  `ALAMAT` varchar(255) NOT NULL,
  `TTL` varchar(255) NOT NULL,
  `STATUS` int(11) NOT NULL DEFAULT 0,
  `MENGAJAR` int(11) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`ID`, `NIG`, `NAMA`, `ALAMAT`, `TTL`, `STATUS`, `MENGAJAR`, `password`) VALUES
(1, '12345678', 'Dita Leni Rafia', 'Jl Soekarno-Hatta', 'Malang, 11 Agustus 1987', 3, 4, '123'),
(2, '123456789', 'Prima Dona', 'Kudus', 'Kudus, 29 Februari 1980', 1, 1, '123'),
(3, '12345679', 'Farid Attar', 'Jalan Soekarno Hatta', 'Malang, 23 Agustus 1997', 2, 2, '123'),
(4, '23456781', 'Difarina Indra', 'Jl. Sigura gura', 'Jakarta, 12 April 1992', 4, 3, '123'),
(5, '234567892', 'Sulaimah', 'Jl. Bandung', 'Malang 11 Juni 1987', 5, 8, '123'),
(6, '234567893', 'Fanny Soegi', 'Jl. Kidul Pasar Besar Malang', 'Semarang, 17 Agustus 1990', 6, 5, '123'),
(7, '234567894', 'Andika Pratama', 'Jl. Mergosono', 'Malang, 11 Agustus 1987', 7, 6, '123'),
(8, '234567895', 'Arafad Yazeed', 'Jl. Kudusan', 'Malang, 4 April 1995', 8, 7, '123'),
(9, '234567896', 'Habibi Akhmad', 'Jl. Aris Munandar', 'Malang 5 Mei 1985', 9, 9, '123'),
(10, '12344', 'waluyo f', 'malang', 'malang 10 agustus 1987', 0, 10, '12344');

-- --------------------------------------------------------

--
-- Table structure for table `kbm`
--

CREATE TABLE `kbm` (
  `ID` int(11) NOT NULL,
  `ID_GURU` int(11) NOT NULL,
  `ID_KELAS` int(11) NOT NULL,
  `ID_MAPEL` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kbm`
--

INSERT INTO `kbm` (`ID`, `ID_GURU`, `ID_KELAS`, `ID_MAPEL`) VALUES
(1, 1, 3, 4),
(2, 1, 1, 1),
(3, 3, 1, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID_ADMIN`),
  ADD UNIQUE KEY `NIP` (`NIP`);

--
-- Indexes for table `daftar_kelas`
--
ALTER TABLE `daftar_kelas`
  ADD PRIMARY KEY (`ID_KELAS`),
  ADD KEY `ID_WALI_KELAS` (`ID_WALI_KELAS`);

--
-- Indexes for table `daftar_mapel`
--
ALTER TABLE `daftar_mapel`
  ADD PRIMARY KEY (`ID_MAPEL`);

--
-- Indexes for table `daftar_siswa`
--
ALTER TABLE `daftar_siswa`
  ADD PRIMARY KEY (`ID_SISWA`),
  ADD UNIQUE KEY `NIS` (`NIS`),
  ADD KEY `ID_KELAS` (`ID_KELAS`);

--
-- Indexes for table `daftar_tugas`
--
ALTER TABLE `daftar_tugas`
  ADD PRIMARY KEY (`ID_TUGAS`);

--
-- Indexes for table `daftar_uh`
--
ALTER TABLE `daftar_uh`
  ADD PRIMARY KEY (`ID_UH`),
  ADD KEY `ID_GURU` (`ID_GURU`),
  ADD KEY `ID_MAPEL` (`ID_MAPEL`),
  ADD KEY `ID_KELAS` (`ID_KELAS`);

--
-- Indexes for table `data_nilai_tugas`
--
ALTER TABLE `data_nilai_tugas`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `data_nilai_uas`
--
ALTER TABLE `data_nilai_uas`
  ADD PRIMARY KEY (`ID_UAS`),
  ADD KEY `ID_MAPEL` (`ID_MAPEL`),
  ADD KEY `ID_GURU` (`ID_GURU`),
  ADD KEY `ID_KELAS` (`ID_KELAS`),
  ADD KEY `ID_SISWA` (`ID_SISWA`);

--
-- Indexes for table `data_nilai_uh`
--
ALTER TABLE `data_nilai_uh`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_MAPEL` (`ID_MAPEL`),
  ADD KEY `ID_GURU` (`ID_GURU`),
  ADD KEY `ID_KELAS` (`ID_KELAS`),
  ADD KEY `ID_UH` (`ID_UH`),
  ADD KEY `ID_SISWA` (`ID_SISWA`);

--
-- Indexes for table `data_nilai_uts`
--
ALTER TABLE `data_nilai_uts`
  ADD PRIMARY KEY (`ID_UTS`),
  ADD KEY `ID_MAPEL` (`ID_MAPEL`),
  ADD KEY `ID_GURU` (`ID_GURU`),
  ADD KEY `ID_KELAS` (`ID_KELAS`),
  ADD KEY `ID_SISWA` (`ID_SISWA`);

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `NIG` (`NIG`),
  ADD KEY `MENGAJAR` (`MENGAJAR`);

--
-- Indexes for table `kbm`
--
ALTER TABLE `kbm`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_GURU` (`ID_GURU`),
  ADD KEY `ID_KELAS` (`ID_KELAS`),
  ADD KEY `ID_MAPEL` (`ID_MAPEL`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `ID_ADMIN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `daftar_kelas`
--
ALTER TABLE `daftar_kelas`
  MODIFY `ID_KELAS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `daftar_mapel`
--
ALTER TABLE `daftar_mapel`
  MODIFY `ID_MAPEL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `daftar_siswa`
--
ALTER TABLE `daftar_siswa`
  MODIFY `ID_SISWA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `daftar_tugas`
--
ALTER TABLE `daftar_tugas`
  MODIFY `ID_TUGAS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `daftar_uh`
--
ALTER TABLE `daftar_uh`
  MODIFY `ID_UH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `data_nilai_tugas`
--
ALTER TABLE `data_nilai_tugas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `data_nilai_uas`
--
ALTER TABLE `data_nilai_uas`
  MODIFY `ID_UAS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `data_nilai_uh`
--
ALTER TABLE `data_nilai_uh`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `data_nilai_uts`
--
ALTER TABLE `data_nilai_uts`
  MODIFY `ID_UTS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `guru`
--
ALTER TABLE `guru`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `kbm`
--
ALTER TABLE `kbm`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `daftar_kelas`
--
ALTER TABLE `daftar_kelas`
  ADD CONSTRAINT `daftar_kelas_ibfk_1` FOREIGN KEY (`ID_WALI_KELAS`) REFERENCES `guru` (`ID`);

--
-- Constraints for table `daftar_siswa`
--
ALTER TABLE `daftar_siswa`
  ADD CONSTRAINT `daftar_siswa_ibfk_1` FOREIGN KEY (`ID_KELAS`) REFERENCES `daftar_kelas` (`ID_KELAS`);

--
-- Constraints for table `daftar_uh`
--
ALTER TABLE `daftar_uh`
  ADD CONSTRAINT `daftar_uh_ibfk_1` FOREIGN KEY (`ID_GURU`) REFERENCES `guru` (`ID`),
  ADD CONSTRAINT `daftar_uh_ibfk_2` FOREIGN KEY (`ID_KELAS`) REFERENCES `daftar_kelas` (`ID_KELAS`),
  ADD CONSTRAINT `daftar_uh_ibfk_3` FOREIGN KEY (`ID_MAPEL`) REFERENCES `daftar_mapel` (`ID_MAPEL`);

--
-- Constraints for table `data_nilai_uas`
--
ALTER TABLE `data_nilai_uas`
  ADD CONSTRAINT `data_nilai_uas_ibfk_1` FOREIGN KEY (`ID_GURU`) REFERENCES `guru` (`ID`),
  ADD CONSTRAINT `data_nilai_uas_ibfk_2` FOREIGN KEY (`ID_KELAS`) REFERENCES `daftar_kelas` (`ID_KELAS`),
  ADD CONSTRAINT `data_nilai_uas_ibfk_3` FOREIGN KEY (`ID_SISWA`) REFERENCES `daftar_siswa` (`ID_SISWA`),
  ADD CONSTRAINT `data_nilai_uas_ibfk_4` FOREIGN KEY (`ID_MAPEL`) REFERENCES `daftar_mapel` (`ID_MAPEL`);

--
-- Constraints for table `data_nilai_uh`
--
ALTER TABLE `data_nilai_uh`
  ADD CONSTRAINT `data_nilai_uh_ibfk_1` FOREIGN KEY (`ID_GURU`) REFERENCES `guru` (`ID`),
  ADD CONSTRAINT `data_nilai_uh_ibfk_2` FOREIGN KEY (`ID_SISWA`) REFERENCES `daftar_siswa` (`ID_SISWA`),
  ADD CONSTRAINT `data_nilai_uh_ibfk_3` FOREIGN KEY (`ID_MAPEL`) REFERENCES `daftar_mapel` (`ID_MAPEL`),
  ADD CONSTRAINT `data_nilai_uh_ibfk_4` FOREIGN KEY (`ID_KELAS`) REFERENCES `daftar_kelas` (`ID_KELAS`),
  ADD CONSTRAINT `data_nilai_uh_ibfk_5` FOREIGN KEY (`ID_UH`) REFERENCES `daftar_uh` (`ID_UH`);

--
-- Constraints for table `data_nilai_uts`
--
ALTER TABLE `data_nilai_uts`
  ADD CONSTRAINT `data_nilai_uts_ibfk_1` FOREIGN KEY (`ID_MAPEL`) REFERENCES `daftar_mapel` (`ID_MAPEL`),
  ADD CONSTRAINT `data_nilai_uts_ibfk_2` FOREIGN KEY (`ID_GURU`) REFERENCES `guru` (`ID`),
  ADD CONSTRAINT `data_nilai_uts_ibfk_3` FOREIGN KEY (`ID_SISWA`) REFERENCES `daftar_siswa` (`ID_SISWA`),
  ADD CONSTRAINT `data_nilai_uts_ibfk_4` FOREIGN KEY (`ID_KELAS`) REFERENCES `daftar_kelas` (`ID_KELAS`);

--
-- Constraints for table `guru`
--
ALTER TABLE `guru`
  ADD CONSTRAINT `guru_ibfk_1` FOREIGN KEY (`MENGAJAR`) REFERENCES `daftar_mapel` (`ID_MAPEL`);

--
-- Constraints for table `kbm`
--
ALTER TABLE `kbm`
  ADD CONSTRAINT `kbm_ibfk_1` FOREIGN KEY (`ID_GURU`) REFERENCES `guru` (`ID`),
  ADD CONSTRAINT `kbm_ibfk_2` FOREIGN KEY (`ID_MAPEL`) REFERENCES `daftar_mapel` (`ID_MAPEL`),
  ADD CONSTRAINT `kbm_ibfk_3` FOREIGN KEY (`ID_KELAS`) REFERENCES `daftar_kelas` (`ID_KELAS`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
