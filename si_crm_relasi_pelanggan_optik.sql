-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 15, 2023 at 08:09 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `si crm relasi pelabbgan optik`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id_barang` varchar(5) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `stok` int(11) NOT NULL,
  `id_distributor` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_distributor`
--

CREATE TABLE `tb_distributor` (
  `id_distributor` varchar(5) NOT NULL,
  `nama` int(50) NOT NULL,
  `no_telp` int(50) NOT NULL,
  `email` int(50) NOT NULL,
  `alamat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_konsumen`
--

CREATE TABLE `tb_konsumen` (
  `id_konsumen` varchar(5) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `no_telp` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_kritiksaran`
--

CREATE TABLE `tb_kritiksaran` (
  `id_kritiksaran` varchar(5) NOT NULL,
  `id_pengguna` varchar(5) NOT NULL,
  `kritik_saran` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pegawai`
--

CREATE TABLE `tb_pegawai` (
  `id_pegawai` varchar(5) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `no_hp` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pelanggan`
--

CREATE TABLE `tb_pelanggan` (
  `id_pelanggan` varchar(5) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `no_hp` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengguna`
--

CREATE TABLE `tb_pengguna` (
  `id_pengguna` varchar(5) NOT NULL,
  `username` varchar(50) NOT NULL,
  `kata_sandi` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `kategori_pengguna` enum('pelanggan','konsumen','pegawai') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_poin`
--

CREATE TABLE `tb_poin` (
  `id_poin` varchar(5) NOT NULL,
  `nama_pelanggan` varchar(50) NOT NULL,
  `id_pelanggan` varchar(5) NOT NULL,
  `poin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaksi_konsumen`
--

CREATE TABLE `tb_transaksi_konsumen` (
  `id_transaksi` varchar(5) NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  `id_konsumen` varchar(5) NOT NULL,
  `id_barang` varchar(5) NOT NULL,
  `jenis_transaksi` varchar(20) NOT NULL,
  `id_pegawai` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaksi_pelanggan`
--

CREATE TABLE `tb_transaksi_pelanggan` (
  `id_transaksi` varchar(5) NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  `id_pelanggan` varchar(5) NOT NULL,
  `id_barang` varchar(5) NOT NULL,
  `jenis_transaksi` varchar(20) NOT NULL,
  `id_pegawai` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tp_penukaran_poin`
--

CREATE TABLE `tp_penukaran_poin` (
  `id_penukaran` varchar(5) NOT NULL,
  `tanggal_penukaran` date NOT NULL,
  `id_poin` varchar(5) NOT NULL,
  `jumlah_tukar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD UNIQUE KEY `id_distributor` (`id_distributor`);

--
-- Indexes for table `tb_distributor`
--
ALTER TABLE `tb_distributor`
  ADD PRIMARY KEY (`id_distributor`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `tb_konsumen`
--
ALTER TABLE `tb_konsumen`
  ADD PRIMARY KEY (`id_konsumen`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `tb_kritiksaran`
--
ALTER TABLE `tb_kritiksaran`
  ADD UNIQUE KEY `id_pengguna` (`id_pengguna`);

--
-- Indexes for table `tb_pegawai`
--
ALTER TABLE `tb_pegawai`
  ADD PRIMARY KEY (`id_pegawai`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  ADD PRIMARY KEY (`id_pengguna`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `tb_poin`
--
ALTER TABLE `tb_poin`
  ADD PRIMARY KEY (`id_poin`),
  ADD UNIQUE KEY `id_pelanggan` (`id_pelanggan`);

--
-- Indexes for table `tb_transaksi_konsumen`
--
ALTER TABLE `tb_transaksi_konsumen`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD UNIQUE KEY `id_konsumen` (`id_konsumen`,`id_barang`),
  ADD UNIQUE KEY `id_pegawai` (`id_pegawai`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `tb_transaksi_pelanggan`
--
ALTER TABLE `tb_transaksi_pelanggan`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD UNIQUE KEY `id_pelanggan` (`id_pelanggan`,`id_barang`),
  ADD UNIQUE KEY `id_pegawai` (`id_pegawai`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `tp_penukaran_poin`
--
ALTER TABLE `tp_penukaran_poin`
  ADD PRIMARY KEY (`id_penukaran`),
  ADD UNIQUE KEY `id_poin` (`id_poin`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD CONSTRAINT `tb_barang_ibfk_1` FOREIGN KEY (`id_distributor`) REFERENCES `tb_distributor` (`id_distributor`);

--
-- Constraints for table `tb_kritiksaran`
--
ALTER TABLE `tb_kritiksaran`
  ADD CONSTRAINT `tb_kritiksaran_ibfk_1` FOREIGN KEY (`id_pengguna`) REFERENCES `tb_pengguna` (`id_pengguna`);

--
-- Constraints for table `tb_poin`
--
ALTER TABLE `tb_poin`
  ADD CONSTRAINT `tb_poin_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `tb_pelanggan` (`id_pelanggan`);

--
-- Constraints for table `tb_transaksi_konsumen`
--
ALTER TABLE `tb_transaksi_konsumen`
  ADD CONSTRAINT `tb_transaksi_konsumen_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `tb_barang` (`id_barang`),
  ADD CONSTRAINT `tb_transaksi_konsumen_ibfk_2` FOREIGN KEY (`id_konsumen`) REFERENCES `tb_konsumen` (`id_konsumen`),
  ADD CONSTRAINT `tb_transaksi_konsumen_ibfk_3` FOREIGN KEY (`id_pegawai`) REFERENCES `tb_pegawai` (`id_pegawai`);

--
-- Constraints for table `tb_transaksi_pelanggan`
--
ALTER TABLE `tb_transaksi_pelanggan`
  ADD CONSTRAINT `tb_transaksi_pelanggan_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `tb_pelanggan` (`id_pelanggan`),
  ADD CONSTRAINT `tb_transaksi_pelanggan_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `tb_barang` (`id_barang`),
  ADD CONSTRAINT `tb_transaksi_pelanggan_ibfk_3` FOREIGN KEY (`id_pegawai`) REFERENCES `tb_pegawai` (`id_pegawai`);

--
-- Constraints for table `tp_penukaran_poin`
--
ALTER TABLE `tp_penukaran_poin`
  ADD CONSTRAINT `tp_penukaran_poin_ibfk_1` FOREIGN KEY (`id_poin`) REFERENCES `tb_poin` (`id_poin`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
