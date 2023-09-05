-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mar. 29 août 2023 à 15:43
-- Version du serveur : 10.6.12-MariaDB-0ubuntu0.22.04.1
-- Version de PHP : 8.1.2-1ubuntu2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `papyrus`
--

-- --------------------------------------------------------

--
-- Structure de la table `ENTCOM`
--

CREATE TABLE `ENTCOM` (
  `NUMCOM` varchar(50) NOT NULL,
  `OBSCOM` varchar(255) DEFAULT NULL,
  `DATCOM` date NOT NULL,
  `NUMFOU` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `FOURNIS`
--

CREATE TABLE `FOURNIS` (
  `NUMFOU` varchar(50) NOT NULL,
  `NOMFOU` varchar(255) NOT NULL,
  `RUEFOU` varchar(255) NOT NULL,
  `CP_FOU` varchar(10) NOT NULL,
  `VILFOU` varchar(100) NOT NULL,
  `CONFOU` varchar(255) NOT NULL,
  `SATISF` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `LIGCOM`
--

CREATE TABLE `LIGCOM` (
  `NUMCOM` varchar(50) NOT NULL,
  `NUMLIG` int(11) NOT NULL,
  `CODART` varchar(50) NOT NULL,
  `QTECDE` int(11) NOT NULL,
  `PRIUNI` decimal(10,2) NOT NULL,
  `QTELIV` int(11) DEFAULT NULL,
  `DERLIV` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `PRODUIT`
--

CREATE TABLE `PRODUIT` (
  `CODART` varchar(50) NOT NULL,
  `LIBART` varchar(255) NOT NULL,
  `STKALE` int(11) NOT NULL,
  `STKPHY` int(11) NOT NULL,
  `QTEANN` int(11) NOT NULL,
  `UNIMES` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `VENTE`
--

CREATE TABLE `VENTE` (
  `CODART` varchar(50) NOT NULL,
  `NUMFOU` varchar(50) NOT NULL,
  `DELLIV` date NOT NULL,
  `QTE1` int(11) NOT NULL,
  `PRIX1` decimal(10,2) NOT NULL,
  `QTE2` int(11) DEFAULT NULL,
  `PRIX2` decimal(10,2) DEFAULT NULL,
  `QTE3` int(11) DEFAULT NULL,
  `PRIX3` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `ENTCOM`
--
ALTER TABLE `ENTCOM`
  ADD PRIMARY KEY (`NUMCOM`),
  ADD KEY `NUMFOU` (`NUMFOU`);

--
-- Index pour la table `FOURNIS`
--
ALTER TABLE `FOURNIS`
  ADD PRIMARY KEY (`NUMFOU`);

--
-- Index pour la table `LIGCOM`
--
ALTER TABLE `LIGCOM`
  ADD PRIMARY KEY (`NUMCOM`,`NUMLIG`),
  ADD KEY `CODART` (`CODART`);

--
-- Index pour la table `PRODUIT`
--
ALTER TABLE `PRODUIT`
  ADD PRIMARY KEY (`CODART`);

--
-- Index pour la table `VENTE`
--
ALTER TABLE `VENTE`
  ADD PRIMARY KEY (`CODART`,`NUMFOU`),
  ADD KEY `NUMFOU` (`NUMFOU`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `LIGCOM`
--
ALTER TABLE `LIGCOM`
  ADD CONSTRAINT `LIGCOM_ibfk_1` FOREIGN KEY (`NUMCOM`) REFERENCES `ENTCOM` (`NUMCOM`),
  ADD CONSTRAINT `LIGCOM_ibfk_2` FOREIGN KEY (`CODART`) REFERENCES `PRODUIT` (`CODART`);

--
-- Contraintes pour la table `VENTE`
--
ALTER TABLE `VENTE`
  ADD CONSTRAINT `VENTE_ibfk_1` FOREIGN KEY (`CODART`) REFERENCES `PRODUIT` (`CODART`),
  ADD CONSTRAINT `VENTE_ibfk_2` FOREIGN KEY (`NUMFOU`) REFERENCES `FOURNIS` (`NUMFOU`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
