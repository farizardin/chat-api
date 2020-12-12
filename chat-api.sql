-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Des 2020 pada 07.06
-- Versi server: 10.2.10-MariaDB
-- Versi PHP: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chat-api`
--
CREATE DATABASE IF NOT EXISTS `chat-api` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `chat-api`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ar_internal_metadata`
--

CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `conversations`
--

CREATE TABLE `conversations` (
  `id` bigint(20) NOT NULL,
  `sender` bigint(20) DEFAULT NULL,
  `destination` bigint(20) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `unread` tinyint(1) DEFAULT NULL,
  `room_id` bigint(20) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `conversation_rooms`
--

CREATE TABLE `conversation_rooms` (
  `id` bigint(20) NOT NULL,
  `participant_1` bigint(20) DEFAULT NULL,
  `participant_2` bigint(20) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `last_message` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `schema_migrations`
--

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password_digest` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `ar_internal_metadata`
--
ALTER TABLE `ar_internal_metadata`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_rails_4680ee231d` (`sender`),
  ADD KEY `fk_rails_607771b7a8` (`destination`),
  ADD KEY `fk_rails_38c3e84198` (`room_id`);

--
-- Indeks untuk tabel `conversation_rooms`
--
ALTER TABLE `conversation_rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_rails_ced3bc9397` (`participant_1`),
  ADD KEY `fk_rails_ced8970de4` (`participant_2`),
  ADD KEY `fk_rails_e0319c6db5` (`last_message`);

--
-- Indeks untuk tabel `schema_migrations`
--
ALTER TABLE `schema_migrations`
  ADD PRIMARY KEY (`version`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `conversation_rooms`
--
ALTER TABLE `conversation_rooms`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `conversations`
--
ALTER TABLE `conversations`
  ADD CONSTRAINT `fk_rails_38c3e84198` FOREIGN KEY (`room_id`) REFERENCES `conversation_rooms` (`id`),
  ADD CONSTRAINT `fk_rails_4680ee231d` FOREIGN KEY (`sender`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_rails_607771b7a8` FOREIGN KEY (`destination`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `conversation_rooms`
--
ALTER TABLE `conversation_rooms`
  ADD CONSTRAINT `fk_rails_ced3bc9397` FOREIGN KEY (`participant_1`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_rails_ced8970de4` FOREIGN KEY (`participant_2`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_rails_e0319c6db5` FOREIGN KEY (`last_message`) REFERENCES `conversations` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
