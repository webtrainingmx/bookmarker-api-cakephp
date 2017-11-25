-- phpMyAdmin SQL Dump
-- version 4.7.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 25, 2017 at 12:04 AM
-- Server version: 5.7.20
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookmarker_db`
--
CREATE DATABASE IF NOT EXISTS `bookmarker_db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bookmarker_db`;

-- --------------------------------------------------------

--
-- Table structure for table `bookmarks`
--

DROP TABLE IF EXISTS `bookmarks`;
CREATE TABLE `bookmarks` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `description` text,
  `url` text,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookmarks`
--

INSERT INTO `bookmarks` (`id`, `user_id`, `title`, `description`, `url`, `created`, `modified`) VALUES
(1, 1, 'Webtraining.Zone :)', 'Plataforma para ayudar', 'https://webtraining.zone/', '2017-11-24 22:06:51', '2017-11-24 23:57:30'),
(2, 1, 'Angular (official website)', 'One framework. Mobile & desktop.', 'https://angular.io/', '2017-11-24 22:07:59', '2017-11-24 22:07:59'),
(3, 1, 'Node.js (official website)', 'Node.js® is a JavaScript runtime built on Chrome\'s V8 JavaScript engine. Node.js uses an event-driven, non-blocking I/O model that makes it lightweight and efficient. Node.js\' package ecosystem, npm, is the largest ecosystem of open source libraries in the world.', 'https://nodejs.org/en/', '2017-11-24 22:08:25', '2017-11-24 22:08:25'),
(4, 1, 'Webtraining Blog', 'Webtraining Blog | Porque creemos que la única forma de ser mejores es ayudando a otros', 'http://blog.webtraining.zone/', '2017-11-24 22:09:19', '2017-11-24 22:09:19'),
(5, 2, 'Angular 5 La Evolución Sigue', 'Si bien la nueva versión de Angular había sido planeada para ser liberada el pasado 23 de octubre de 2017; eso no sucedió, pero no te preocupes hoy se acaba de liberar el Release Candidate #7 por lo que es muy probable que en muy próximos días Angular 5 ya esté con nosotros. Finalmente tenemos versión 5.0 estable y lista para ser usada.', 'http://blog.webtraining.zone/angular-5-la-evolucion-sigue/', '2017-11-24 22:10:17', '2017-11-24 22:10:54'),
(6, 2, 'Angular Material', 'Material Design components for Angular\r\n', 'https://material.angular.io/', '2017-11-24 22:10:47', '2017-11-24 22:10:47'),
(7, 2, 'Socket.io', 'Una excelente opción para implementar aplicaciones de tiempo real con Node.js', 'https://socket.io/', '2017-11-24 22:11:40', '2017-11-24 22:11:40'),
(8, 2, 'JSONLint', 'JSONLint is a validator and reformatter for JSON, a lightweight data-interchange format. Copy and paste, directly type, or input a URL in the editor above and let JSONLint tidy and validate your messy JSON code.', 'https://jsonlint.com/', '2017-11-24 23:44:36', '2017-11-24 23:44:36');

-- --------------------------------------------------------

--
-- Table structure for table `bookmarks_tags`
--

DROP TABLE IF EXISTS `bookmarks_tags`;
CREATE TABLE `bookmarks_tags` (
  `bookmark_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookmarks_tags`
--

INSERT INTO `bookmarks_tags` (`bookmark_id`, `tag_id`) VALUES
(1, 1),
(4, 1),
(1, 2),
(2, 2),
(5, 2),
(6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `title`, `created`, `modified`) VALUES
(1, 'Enterprise Training', '2017-11-24 22:07:10', '2017-11-24 22:07:10'),
(2, 'Angular', '2017-11-24 22:07:20', '2017-11-24 22:07:20');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `created`, `modified`) VALUES
(1, 'esmeralda@webtraining.mx', 'esmeralda', '2017-11-24 22:06:08', '2017-11-24 22:06:08'),
(2, 'luis@webtraining.mx', 'luis', '2017-11-24 22:09:37', '2017-11-24 22:09:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_key` (`user_id`);

--
-- Indexes for table `bookmarks_tags`
--
ALTER TABLE `bookmarks_tags`
  ADD PRIMARY KEY (`bookmark_id`,`tag_id`),
  ADD KEY `tag_key` (`tag_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookmarks`
--
ALTER TABLE `bookmarks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD CONSTRAINT `bookmarks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `bookmarks_tags`
--
ALTER TABLE `bookmarks_tags`
  ADD CONSTRAINT `bookmarks_tags_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`),
  ADD CONSTRAINT `bookmarks_tags_ibfk_2` FOREIGN KEY (`bookmark_id`) REFERENCES `bookmarks` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
