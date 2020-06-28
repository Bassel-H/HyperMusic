-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Dim 28 Juin 2020 à 11:02
-- Version du serveur :  10.3.22-MariaDB-0+deb10u1
-- Version de PHP :  7.3.14-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `SiteSuperMusique`
--
CREATE DATABASE IF NOT EXISTS `SiteSuperMusique` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `SiteSuperMusique`;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(55) NOT NULL,
  `username` varchar(255) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `email`, `username`, `nickname`, `password`) VALUES
(1, 'guestUser@guest', 'guest', 'guestUser', '1234'),
(2, 'test@test.com', 'test', 'testu', '$2y$10$53I6IwEFYvCvnTbk/K4nd.kuxVWy0P7nnymL2GYSKIYZg5s0fgeXe');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;--
-- Base de données :  `epytodo`
--
CREATE DATABASE IF NOT EXISTS `epytodo` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `epytodo`;

-- --------------------------------------------------------

--
-- Structure de la table `task`
--

CREATE TABLE `task` (
  `task_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `begin` datetime NOT NULL DEFAULT current_timestamp(),
  `end` datetime DEFAULT NULL,
  `status` enum('not started','in progress','done') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'not started'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`) VALUES
(0, 'nicol', 'f2d81a260dea8a100dd517984e53c56a7523d96942a834b9cdc249bd4e8c7aa9');

-- --------------------------------------------------------

--
-- Structure de la table `user_has_task`
--

CREATE TABLE `user_has_task` (
  `fk_user_id` int(11) NOT NULL,
  `fk_task_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
--
-- Base de données :  `ligue1`
--
CREATE DATABASE IF NOT EXISTS `ligue1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ligue1`;

-- --------------------------------------------------------

--
-- Structure de la table `equipe`
--

CREATE TABLE `equipe` (
  `id_equipe` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `stade` varchar(50) NOT NULL,
  `ville` varchar(30) NOT NULL,
  `points` int(11) NOT NULL DEFAULT 0,
  `buts` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `equipe`
--

INSERT INTO `equipe` (`id_equipe`, `nom`, `stade`, `ville`, `points`, `buts`) VALUES
(1, 'FC Girondins de Bordeaux', 'Matmut Atlantique', 'Bordeaux', 3, 0),
(2, 'OGC Nice', 'Allianz Riviera', 'Nice', 0, 0),
(3, 'AS Monaco', 'Stade Louis II', 'Monaco', 0, 0),
(4, 'PSG', 'Parc des Princes', 'Paris', 0, 0),
(5, 'ASSE', 'Stade Geoffroy Guichard', 'Saint-Etienne', 0, 0),
(6, 'TFC', 'Stadium', 'Toulouse', 0, 0),
(7, 'FC Metz', 'Stade Saint-Symphorien', 'Metz', 0, 0),
(8, 'DFCO', 'Stade Gaston Gérard', 'Dijon', 0, 0),
(9, 'SCO Angers', 'Stade Raymond Koppa', 'Angers', 0, 0),
(10, 'LOSC', 'Stade Pierre Mauroy', 'Lille', 0, 0),
(11, 'MHSC', 'Stade de la Mosson', 'Montpellier', 0, 0),
(12, 'OM', 'Stade Vélodrome', 'Marseille', 0, 0),
(13, 'OL', 'Groupama Stadium', 'Lyon', 0, 0),
(14, 'Stade Rennais', 'Roazhon Pak', 'Rennes', 0, 0),
(15, 'Nimes Olympique', 'Stade des Costières', 'Nimes', 0, 0),
(16, 'Amiens SC', 'Stade de la Licorne', 'Amiens', 0, 0),
(17, 'FC Nantes', 'Stade de la Beaujoire', 'Nantes', 0, 0),
(18, 'Brest', 'Stade Francis le Blé', 'Brest', 0, 0),
(19, 'Reims', 'Stade Auguste Delaune', 'Reims', 0, 0),
(20, 'Racing Club de Strasbourg', 'Stade de la Meinau', 'Strasbourg', 0, 0);

--
-- Déclencheurs `equipe`
--
DELIMITER $$
CREATE TRIGGER `TGR_BI_EQUIPE` BEFORE INSERT ON `equipe` FOR EACH ROW BEGIN	
	SET new.ville = UPPER(new.ville);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `rencontre`
--

CREATE TABLE `rencontre` (
  `id_domicile` int(11) NOT NULL,
  `id_visiteurs` int(11) NOT NULL,
  `date_match` datetime NOT NULL DEFAULT current_timestamp(),
  `score_domicile` tinyint(4) DEFAULT NULL,
  `score_visiteurs` tinyint(4) DEFAULT NULL,
  `Nom_arbitre` varchar(80) DEFAULT NULL,
  `prenom_arbitre` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `rencontre`
--

INSERT INTO `rencontre` (`id_domicile`, `id_visiteurs`, `date_match`, `score_domicile`, `score_visiteurs`, `Nom_arbitre`, `prenom_arbitre`) VALUES
(1, 2, '2020-02-04 00:00:00', 2, 1, 'Frank Sifflet', 0),
(1, 2, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(1, 3, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(1, 4, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(1, 5, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(1, 6, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(1, 7, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(1, 8, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(1, 9, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(1, 10, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(1, 11, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(1, 12, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(1, 13, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(1, 14, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(1, 15, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(1, 16, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(1, 17, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(1, 18, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(1, 19, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(1, 20, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(2, 1, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(2, 3, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(2, 4, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(2, 5, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(2, 6, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(2, 7, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(2, 8, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(2, 9, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(2, 10, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(2, 11, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(2, 12, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(2, 13, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(2, 14, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(2, 15, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(2, 16, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(2, 17, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(2, 18, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(2, 19, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(2, 20, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(3, 1, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(3, 2, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(3, 4, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(3, 5, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(3, 6, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(3, 7, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(3, 8, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(3, 9, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(3, 10, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(3, 11, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(3, 12, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(3, 13, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(3, 14, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(3, 15, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(3, 16, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(3, 17, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(3, 18, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(3, 19, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(3, 20, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(4, 1, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(4, 2, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(4, 3, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(4, 5, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(4, 6, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(4, 7, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(4, 8, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(4, 9, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(4, 10, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(4, 11, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(4, 12, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(4, 13, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(4, 14, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(4, 15, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(4, 16, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(4, 17, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(4, 18, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(4, 19, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(4, 20, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(5, 1, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(5, 2, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(5, 3, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(5, 4, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(5, 6, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(5, 7, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(5, 8, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(5, 9, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(5, 10, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(5, 11, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(5, 12, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(5, 13, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(5, 14, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(5, 15, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(5, 16, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(5, 17, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(5, 18, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(5, 19, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(5, 20, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(6, 1, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(6, 2, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(6, 3, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(6, 4, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(6, 5, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(6, 7, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(6, 8, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(6, 9, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(6, 10, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(6, 11, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(6, 12, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(6, 13, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(6, 14, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(6, 15, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(6, 16, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(6, 17, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(6, 18, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(6, 19, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(6, 20, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(7, 1, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(7, 2, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(7, 3, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(7, 4, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(7, 5, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(7, 6, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(7, 8, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(7, 9, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(7, 10, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(7, 11, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(7, 12, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(7, 13, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(7, 14, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(7, 15, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(7, 16, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(7, 17, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(7, 18, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(7, 19, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(7, 20, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(8, 1, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(8, 2, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(8, 3, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(8, 4, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(8, 5, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(8, 6, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(8, 7, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(8, 9, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(8, 10, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(8, 11, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(8, 12, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(8, 13, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(8, 14, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(8, 15, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(8, 16, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(8, 17, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(8, 18, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(8, 19, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(8, 20, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(9, 1, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(9, 2, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(9, 3, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(9, 4, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(9, 5, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(9, 6, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(9, 7, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(9, 8, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(9, 10, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(9, 11, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(9, 12, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(9, 13, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(9, 14, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(9, 15, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(9, 16, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(9, 17, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(9, 18, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(9, 19, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(9, 20, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(10, 1, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(10, 2, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(10, 3, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(10, 4, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(10, 5, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(10, 6, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(10, 7, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(10, 8, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(10, 9, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(10, 11, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(10, 12, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(10, 13, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(10, 14, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(10, 15, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(10, 16, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(10, 17, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(10, 18, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(10, 19, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(10, 20, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(11, 1, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(11, 2, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(11, 3, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(11, 4, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(11, 5, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(11, 6, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(11, 7, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(11, 8, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(11, 9, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(11, 10, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(11, 12, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(11, 13, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(11, 14, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(11, 15, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(11, 16, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(11, 17, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(11, 18, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(11, 19, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(11, 20, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(12, 1, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(12, 2, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(12, 3, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(12, 4, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(12, 5, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(12, 6, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(12, 7, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(12, 8, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(12, 9, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(12, 10, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(12, 11, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(12, 13, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(12, 14, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(12, 15, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(12, 16, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(12, 17, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(12, 18, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(12, 19, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(12, 20, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(13, 1, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(13, 2, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(13, 3, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(13, 4, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(13, 5, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(13, 6, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(13, 7, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(13, 8, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(13, 9, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(13, 10, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(13, 11, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(13, 12, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(13, 14, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(13, 15, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(13, 16, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(13, 17, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(13, 18, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(13, 19, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(13, 20, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(14, 1, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(14, 2, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(14, 3, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(14, 4, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(14, 5, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(14, 6, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(14, 7, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(14, 8, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(14, 9, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(14, 10, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(14, 11, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(14, 12, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(14, 13, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(14, 15, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(14, 16, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(14, 17, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(14, 18, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(14, 19, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(14, 20, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(15, 1, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(15, 2, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(15, 3, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(15, 4, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(15, 5, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(15, 6, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(15, 7, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(15, 8, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(15, 9, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(15, 10, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(15, 11, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(15, 12, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(15, 13, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(15, 14, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(15, 16, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(15, 17, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(15, 18, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(15, 19, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(15, 20, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(16, 1, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(16, 2, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(16, 3, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(16, 4, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(16, 5, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(16, 6, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(16, 7, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(16, 8, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(16, 9, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(16, 10, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(16, 11, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(16, 12, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(16, 13, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(16, 14, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(16, 15, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(16, 17, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(16, 18, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(16, 19, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(16, 20, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(17, 1, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(17, 2, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(17, 3, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(17, 4, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(17, 5, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(17, 6, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(17, 7, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(17, 8, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(17, 9, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(17, 10, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(17, 11, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(17, 12, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(17, 13, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(17, 14, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(17, 15, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(17, 16, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(17, 18, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(17, 19, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(17, 20, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(18, 1, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(18, 2, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(18, 3, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(18, 4, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(18, 5, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(18, 6, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(18, 7, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(18, 8, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(18, 9, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(18, 10, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(18, 11, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(18, 12, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(18, 13, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(18, 14, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(18, 15, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(18, 16, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(18, 17, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(18, 19, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(18, 20, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(19, 1, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(19, 2, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(19, 3, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(19, 4, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(19, 5, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(19, 6, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(19, 7, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(19, 8, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(19, 9, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(19, 10, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(19, 11, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(19, 12, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(19, 13, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(19, 14, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(19, 15, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(19, 16, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(19, 17, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(19, 18, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(19, 20, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(20, 1, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(20, 2, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(20, 3, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(20, 4, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(20, 5, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(20, 6, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(20, 7, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(20, 8, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(20, 9, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(20, 10, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(20, 11, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(20, 12, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(20, 13, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(20, 14, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(20, 15, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(20, 16, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(20, 17, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(20, 18, '2020-06-23 09:58:23', NULL, NULL, NULL, 0),
(20, 19, '2020-06-23 09:58:23', NULL, NULL, NULL, 0);

--
-- Déclencheurs `rencontre`
--
DELIMITER $$
CREATE TRIGGER `TGR_Insert_rencontre` BEFORE INSERT ON `rencontre` FOR EACH ROW BEGIN
    SET new.Nom_arbitre = UPPER(new.Nom_arbitre);
    SET new.prenom_arbitre = CONCAT( UPPER(SUBSTR(new.prenom_arbitre,1,1)),              (SUBSTR(new.prenom_arbitre,2,LENGTH(new.prenom_arbitre))));
END
$$
DELIMITER ;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `equipe`
--
ALTER TABLE `equipe`
  ADD PRIMARY KEY (`id_equipe`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `equipe`
--
ALTER TABLE `equipe`
  MODIFY `id_equipe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;--
-- Base de données :  `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Structure de la table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Structure de la table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Structure de la table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Structure de la table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Structure de la table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Structure de la table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Structure de la table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Structure de la table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Structure de la table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Structure de la table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Contenu de la table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('boumerxp', '[{\"db\":\"Login\",\"table\":\"user\"}]'),
('root', '[{\"db\":\"ligue1\",\"table\":\"rencontre\"},{\"db\":\"ligue1\",\"table\":\"equipe\"},{\"db\":\"SiteSuperMusique\",\"table\":\"user\"},{\"db\":\"SiteSuperMusique\",\"table\":\"test\"},{\"db\":\"SiteSuperMusique\",\"table\":\"connexion\"},{\"db\":\"SiteSuperMusique\",\"table\":\"email\"},{\"db\":\"epytodo\",\"table\":\"user\"},{\"db\":\"Login\",\"table\":\"user\"}]');

-- --------------------------------------------------------

--
-- Structure de la table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Structure de la table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Structure de la table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Structure de la table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Structure de la table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Structure de la table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Structure de la table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Contenu de la table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('boumerxp', '2020-04-15 19:58:00', '{\"lang\":\"fr\",\"collation_connection\":\"utf8mb4_unicode_ci\"}'),
('root', '2020-04-20 11:07:20', '{\"collation_connection\":\"utf8mb4_unicode_ci\",\"lang\":\"fr\"}');

-- --------------------------------------------------------

--
-- Structure de la table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Structure de la table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Index pour les tables exportées
--

--
-- Index pour la table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Index pour la table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Index pour la table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Index pour la table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Index pour la table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Index pour la table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Index pour la table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Index pour la table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Index pour la table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Index pour la table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Index pour la table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Index pour la table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Index pour la table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Index pour la table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Index pour la table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Index pour la table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Index pour la table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Index pour la table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
