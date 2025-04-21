-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 21, 2025 at 04:35 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dqlab_mart`
--

-- --------------------------------------------------------

--
-- Table structure for table `ms_pelanggan`
--

CREATE TABLE `ms_pelanggan` (
  `no_urut` int(2) NOT NULL,
  `kode_pelanggan` varchar(8) NOT NULL,
  `nama_pelanggan` varchar(50) NOT NULL,
  `alamat` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ms_pelanggan`
--

INSERT INTO `ms_pelanggan` (`no_urut`, `kode_pelanggan`, `nama_pelanggan`, `alamat`) VALUES
(1, 'cust0001', 'Eva Novianti, S.H.', 'Vila Sempilan, No. 67'),
(2, 'cust0002', 'Heidi Goh', 'Ruko Sawit Permai 72 No. 1'),
(3, 'cust0003', 'Unang Handoko', 'Vila Sempilan No. 1'),
(4, 'cust0004', 'Jokolono Sukarman', 'Permata Intan Berkilau Residence, Blok C5-7'),
(5, 'cust0005', 'Tommy Sinaga', 'Avatar Village, Blok C8 No. 888'),
(6, 'cust0006', 'Irwan Setianto', 'Rukan Gunung Seribu, Blok O1 - No. 1'),
(7, 'cust0007', 'Agus Cahyono', 'Jalan Motivasi Tinggi, Blok F4 - No. 8'),
(8, 'cust0008', 'Maria Sirait', 'Cluster Akasia Residence, Blok AA No. 3'),
(9, 'cust0009', 'Ir. Ita Nugraha', 'Perumahan Sagitarius, Gang Kelapa No. 6'),
(10, 'cust0010', 'Djoko Wardoyo, Drs.', 'Bukit Pintar Data, Blok A1 No. 1');

-- --------------------------------------------------------

--
-- Table structure for table `ms_produk`
--

CREATE TABLE `ms_produk` (
  `no_urut` int(2) NOT NULL,
  `kode_produk` varchar(8) NOT NULL,
  `nama_produk` varchar(50) NOT NULL,
  `harga` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ms_produk`
--

INSERT INTO `ms_produk` (`no_urut`, `kode_produk`, `nama_produk`, `harga`) VALUES
(1, 'prod-01', 'Kotak Pensil DQLab', 60500),
(2, 'prod-02', 'Flashdisk DQLab 64 GB', 55000),
(3, 'prod-03', 'Gift Voucher DQLab 100rb', 100000),
(4, 'prod-04', 'Flashdisk DQLab 32 GB', 40000),
(5, 'prod-05', 'Gift Voucher DQLab 250rb', 250000),
(6, 'prod-06', 'Pulpen Multifunction + Laser DQLab', 92500),
(7, 'prod-07', 'Tas Travel Organizer DQLab', 48000),
(8, 'prod-08', 'Gantungan Kunci DQLab', 15800),
(9, 'prod-09', 'Buku Planner Agenda DQLab', 92000),
(10, 'prod-10', 'Sticky Notes DQLab 500 sheets', 55000);

-- --------------------------------------------------------

--
-- Table structure for table `tr_penjualan`
--

CREATE TABLE `tr_penjualan` (
  `kode_transaksi` varchar(7) NOT NULL,
  `kode_pelanggan` varchar(8) NOT NULL,
  `tanggal_transaksi` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tr_penjualan`
--

INSERT INTO `tr_penjualan` (`kode_transaksi`, `kode_pelanggan`, `tanggal_transaksi`) VALUES
('tr-0001', 'cust0007', '2019-06-07'),
('tr-0002', 'cust0001', '2019-06-07'),
('tr-0003', 'cust0004', '2019-06-08'),
('tr-0004', 'cust0004', '2019-06-08'),
('tr-0005', 'cust0003', '2019-06-09'),
('tr-0006', 'cust0008', '2019-06-09');

-- --------------------------------------------------------

--
-- Table structure for table `tr_penjualan_detail`
--

CREATE TABLE `tr_penjualan_detail` (
  `kode_transaksi` varchar(7) NOT NULL,
  `kode_produk` varchar(7) NOT NULL,
  `qty` int(2) NOT NULL,
  `harga_satuan` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tr_penjualan_detail`
--

INSERT INTO `tr_penjualan_detail` (`kode_transaksi`, `kode_produk`, `qty`, `harga_satuan`) VALUES
('tr-0001', 'prod-04', 3, 40000),
('tr-0001', 'prod-02', 1, 55000),
('tr-0002', 'prod-08', 2, 15800),
('tr-0003', 'prod-10', 1, 55000),
('tr-0004', 'prod-09', 1, 92000),
('tr-0005', 'prod-06', 1, 92500),
('tr-0006', 'prod-08', 2, 15800),
('tr-0002', 'prod-08', 2, 15800),
('tr-0003', 'prod-07', 1, 50000),
('tr-0005', 'prod-01', 2, 62500),
('tr-0003', 'prod-04', 3, 48000),
('tr-0004', 'prod-08', 1, 15800),
('tr-0001', 'prod-04', 1, 40000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ms_pelanggan`
--
ALTER TABLE `ms_pelanggan`
  ADD PRIMARY KEY (`kode_pelanggan`);

--
-- Indexes for table `ms_produk`
--
ALTER TABLE `ms_produk`
  ADD PRIMARY KEY (`kode_produk`);

--
-- Indexes for table `tr_penjualan`
--
ALTER TABLE `tr_penjualan`
  ADD PRIMARY KEY (`kode_transaksi`),
  ADD KEY `kode_pelanggan` (`kode_pelanggan`);

--
-- Indexes for table `tr_penjualan_detail`
--
ALTER TABLE `tr_penjualan_detail`
  ADD KEY `kode_transaksi` (`kode_transaksi`),
  ADD KEY `kode_produk` (`kode_produk`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tr_penjualan`
--
ALTER TABLE `tr_penjualan`
  ADD CONSTRAINT `kode_pelanggan` FOREIGN KEY (`kode_pelanggan`) REFERENCES `ms_pelanggan` (`kode_pelanggan`);

--
-- Constraints for table `tr_penjualan_detail`
--
ALTER TABLE `tr_penjualan_detail`
  ADD CONSTRAINT `kode_produk` FOREIGN KEY (`kode_produk`) REFERENCES `ms_produk` (`kode_produk`),
  ADD CONSTRAINT `kode_transaksi` FOREIGN KEY (`kode_transaksi`) REFERENCES `tr_penjualan` (`kode_transaksi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
