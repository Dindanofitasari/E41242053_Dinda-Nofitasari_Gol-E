-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Nov 2024 pada 13.56
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mahasiswa`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `akun`
--

CREATE TABLE `akun` (
  `nim` varchar(10) NOT NULL,
  `password` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `akun`
--

INSERT INTO `akun` (`nim`, `password`) VALUES
('E4123456', '12345678');

-- --------------------------------------------------------

--
-- Struktur dari tabel `daftar_dosen`
--

CREATE TABLE `daftar_dosen` (
  `NIP` char(10) NOT NULL,
  `nama_dosen` varchar(50) NOT NULL,
  `no_hp` char(10) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `daftar_dosen`
--

INSERT INTO `daftar_dosen` (`NIP`, `nama_dosen`, `no_hp`, `alamat`) VALUES
('0160436012', 'Sabrina Sari', '0812349900', 'Pekanbaru'),
('0260432002', 'Maya Ari Putri', '0812345234', 'Palembang'),
('0275430005', 'Susi Indriani', '0812656532', 'Bogor'),
('0480432066', 'Tia Santrini', '0812451177', 'Padang'),
('0576431001', 'M.Sidiq', '0812979005', 'Jakarta'),
('0770435006', 'Rubin Hadi', '0812567678', 'Papua'),
('0869437003', 'Mustalifah', '0812338877', 'Aceh'),
('1080432007', 'Arif Budiman', '0812456345', 'Makasar');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_krs`
--

CREATE TABLE `detail_krs` (
  `kode_krs` char(10) DEFAULT NULL,
  `kode_matkul` char(5) DEFAULT NULL,
  `hari` varchar(7) DEFAULT NULL,
  `jam` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `detail_krs`
--

INSERT INTO `detail_krs` (`kode_krs`, `kode_matkul`, `hari`, `jam`) VALUES
('F100000001', 'CITRA', 'Senin', '12:00:00'),
('F100000002', 'FIDAS', 'Selasa', '12:00:00'),
('F100000003', 'JRKOM', 'Rabu', '14:00:00'),
('F100000004', 'MMDAS', 'Kamis', '15:00:00'),
('F100000001', 'CITRA', 'Jum\'at', '19:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurusan`
--

CREATE TABLE `jurusan` (
  `nama_jur` varchar(255) DEFAULT NULL,
  `kode_jur` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jurusan`
--

INSERT INTO `jurusan` (`nama_jur`, `kode_jur`) VALUES
('Teknologi Informasi', '00001'),
('Produksi Perkebunan', '00002'),
('Teknik', '00003'),
('Kesehatan', '00004'),
('Peternakan', '00005');

-- --------------------------------------------------------

--
-- Struktur dari tabel `krs`
--

CREATE TABLE `krs` (
  `kode_krs` char(10) NOT NULL,
  `tgl_krs` datetime DEFAULT NULL,
  `nim` char(9) DEFAULT NULL,
  `kode_jur` char(5) DEFAULT NULL,
  `jumlah_krs` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `krs`
--

INSERT INTO `krs` (`kode_krs`, `tgl_krs`, `nim`, `kode_jur`, `jumlah_krs`) VALUES
('F100000001', '2024-11-01 23:03:32', 'E4123456', '00001', 3),
('F100000002', '2024-11-01 23:03:34', 'E4123456', '00002', 4),
('F100000003', '2024-11-01 23:03:36', 'E4123456', '00001', 3),
('F100000004', '2024-11-01 23:03:37', 'E4123456', '00003', 5),
('F100000005', '2024-11-01 23:03:39', 'E4123456', '00004', 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mata_kuliah`
--

CREATE TABLE `mata_kuliah` (
  `kode_matkul` char(5) NOT NULL,
  `nama_matkul` varchar(50) NOT NULL,
  `jumlah_SKS` tinyint(3) UNSIGNED DEFAULT 2,
  `kode_jur` char(5) DEFAULT NULL,
  `nip` char(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mata_kuliah`
--

INSERT INTO `mata_kuliah` (`kode_matkul`, `nama_matkul`, `jumlah_SKS`, `kode_jur`, `nip`) VALUES
('CITRA', 'Pengolahan CITRA', 2, '00001', '0160436012'),
('FIDAS', 'Fisika Dasar', 2, '00002', '0480432066'),
('JRKOM', 'Jaringan Komputer', 2, '00004', '0576431001'),
('KIMDA', 'Kimia Dasar', 2, '00001', '0869437003'),
('MMDAS', 'Matematika Dasar', 4, '00001', '1080432007'),
('PBASE', 'Pengantar Database', 2, '00001', '0275430005');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mhs`
--

CREATE TABLE `mhs` (
  `nim` varchar(10) NOT NULL,
  `nama` varchar(225) NOT NULL,
  `alamat` varchar(225) NOT NULL,
  `phone` int(20) NOT NULL,
  `kode_jur` char(5) DEFAULT NULL,
  `nip` char(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mhs`
--

INSERT INTO `mhs` (`nim`, `nama`, `alamat`, `phone`, `kode_jur`, `nip`) VALUES
(' E41241747', 'Ramadhan Rahmatullah', 'Jember', 2147483647, '00001', '0160436012'),
('E4123456', 'Mongkey D Luffy', 'East Blue', 812345678, '00002', '0260432002'),
('E41241919', 'Abiyyu Ijlal Rasib Novamatin', 'Jember', 2147483647, '00004', '0576431001'),
('E41242046', 'Fara Yuanita Agustin', 'Situbondo', 2147483647, '00001', '1080432007'),
('E41242053', 'Dinda Nofitasari', 'Banyuwangi', 2147483647, '00004', '0260432002'),
('E41242150', 'Muhammad Zaidan Al Hafidz', 'Jember', 2147483647, '00005', '0480432066'),
('E4654321', 'Zoro', 'Nort Blue', 2147483647, '00001', '0260432002');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`nim`);

--
-- Indeks untuk tabel `daftar_dosen`
--
ALTER TABLE `daftar_dosen`
  ADD PRIMARY KEY (`NIP`);

--
-- Indeks untuk tabel `detail_krs`
--
ALTER TABLE `detail_krs`
  ADD KEY `kode_matkul` (`kode_matkul`),
  ADD KEY `detail_krs_ibfk_1` (`kode_krs`);

--
-- Indeks untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`kode_jur`);

--
-- Indeks untuk tabel `krs`
--
ALTER TABLE `krs`
  ADD PRIMARY KEY (`kode_krs`),
  ADD KEY `kode_jur` (`kode_jur`),
  ADD KEY `nim` (`nim`);

--
-- Indeks untuk tabel `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD PRIMARY KEY (`kode_matkul`),
  ADD KEY `kode_jur` (`kode_jur`),
  ADD KEY `nip` (`nip`);

--
-- Indeks untuk tabel `mhs`
--
ALTER TABLE `mhs`
  ADD PRIMARY KEY (`nim`),
  ADD KEY `kode_jur` (`kode_jur`),
  ADD KEY `nip` (`nip`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `akun`
--
ALTER TABLE `akun`
  ADD CONSTRAINT `ambilNim` FOREIGN KEY (`nim`) REFERENCES `mhs` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `detail_krs`
--
ALTER TABLE `detail_krs`
  ADD CONSTRAINT `detail_krs_ibfk_1` FOREIGN KEY (`kode_krs`) REFERENCES `krs` (`kode_krs`),
  ADD CONSTRAINT `detail_krs_ibfk_2` FOREIGN KEY (`kode_matkul`) REFERENCES `mata_kuliah` (`kode_matkul`);

--
-- Ketidakleluasaan untuk tabel `krs`
--
ALTER TABLE `krs`
  ADD CONSTRAINT `krs_ibfk_2` FOREIGN KEY (`kode_jur`) REFERENCES `jurusan` (`kode_jur`),
  ADD CONSTRAINT `krs_ibfk_4` FOREIGN KEY (`nim`) REFERENCES `mhs` (`nim`);

--
-- Ketidakleluasaan untuk tabel `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD CONSTRAINT `mata_kuliah_ibfk_1` FOREIGN KEY (`kode_jur`) REFERENCES `jurusan` (`kode_jur`),
  ADD CONSTRAINT `mata_kuliah_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `daftar_dosen` (`NIP`);

--
-- Ketidakleluasaan untuk tabel `mhs`
--
ALTER TABLE `mhs`
  ADD CONSTRAINT `mhs_ibfk_1` FOREIGN KEY (`kode_jur`) REFERENCES `jurusan` (`kode_jur`),
  ADD CONSTRAINT `mhs_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `daftar_dosen` (`NIP`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
