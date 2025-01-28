-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 11 jan. 2025 à 20:11
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `tozodealer`
--

-- --------------------------------------------------------

--
-- Structure de la table `achat`
--

DROP TABLE IF EXISTS `achat`;
CREATE TABLE IF NOT EXISTS `achat` (
  `id_achat` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `prix` int(11) NOT NULL,
  `promotion` int(11) DEFAULT NULL,
  `prix_total` int(11) NOT NULL,
  `statut` varchar(20) NOT NULL,
  `livraison` varchar(20) DEFAULT NULL,
  `adresse_client` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_achat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `annonce`
--

DROP TABLE IF EXISTS `annonce`;
CREATE TABLE IF NOT EXISTS `annonce` (
  `id_annonce` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(500) NOT NULL,
  `statut` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `heure` int(11) NOT NULL,
  `prix` int(11) NOT NULL,
  `id_boutique` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL,
  PRIMARY KEY (`id_annonce`),
  KEY `id_boutique` (`id_boutique`),
  KEY `id_produit` (`id_produit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `boutique`
--

DROP TABLE IF EXISTS `boutique`;
CREATE TABLE IF NOT EXISTS `boutique` (
  `id_boutique` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `commune` varchar(25) NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `date_creation` date NOT NULL,
  `image_couverture` varchar(50) NOT NULL,
  `note` double NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_boutique`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `compensation`
--

DROP TABLE IF EXISTS `compensation`;
CREATE TABLE IF NOT EXISTS `compensation` (
  `id_compensation` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `image1` varchar(50) NOT NULL,
  `image2` varchar(50) NOT NULL,
  `image3` varchar(50) NOT NULL,
  `image4` varchar(50) NOT NULL,
  `image5` varchar(50) NOT NULL,
  `prix` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL,
  `id_achat` int(11) NOT NULL,
  PRIMARY KEY (`id_compensation`),
  KEY `id_produit` (`id_produit`),
  KEY `id_achat` (`id_achat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `evaluation`
--

DROP TABLE IF EXISTS `evaluation`;
CREATE TABLE IF NOT EXISTS `evaluation` (
  `id_evaluation` int(11) NOT NULL AUTO_INCREMENT,
  `note` int(11) NOT NULL,
  `id_boutique` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_evaluation`),
  KEY `id_boutique` (`id_boutique`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

DROP TABLE IF EXISTS `facture`;
CREATE TABLE IF NOT EXISTS `facture` (
  `id_facture` int(11) NOT NULL AUTO_INCREMENT,
  `id_achat` int(11) NOT NULL,
  `id_boutique` int(11) NOT NULL,
  `statut` varchar(20) NOT NULL,
  PRIMARY KEY (`id_facture`),
  KEY `id_achat` (`id_achat`),
  KEY `id_boutique` (`id_boutique`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `id_message` int(11) NOT NULL AUTO_INCREMENT,
  `id_userEnvoi` int(11) NOT NULL,
  `id_userRecoit` int(11) NOT NULL,
  `heure` int(11) NOT NULL,
  `date` date NOT NULL,
  `statut` varchar(20) NOT NULL,
  `contenue` varchar(500) NOT NULL,
  PRIMARY KEY (`id_message`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `notification`
--

DROP TABLE IF EXISTS `notification`;
CREATE TABLE IF NOT EXISTS `notification` (
  `id_notification` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `contenue` varchar(500) NOT NULL,
  `date` date NOT NULL,
  `heure` int(11) NOT NULL,
  `statut` varchar(20) NOT NULL,
  `id_etrange` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_notification`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--

DROP TABLE IF EXISTS `panier`;
CREATE TABLE IF NOT EXISTS `panier` (
  `id_panier` int(11) NOT NULL AUTO_INCREMENT,
  `quantite` int(11) NOT NULL,
  `prix_total` int(11) NOT NULL,
  `statut` varchar(20) NOT NULL,
  `id_produit` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_achat` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_panier`),
  KEY `id_achat` (`id_achat`),
  KEY `id_user` (`id_user`),
  KEY `id_produit` (`id_produit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `piece_jointe`
--

DROP TABLE IF EXISTS `piece_jointe`;
CREATE TABLE IF NOT EXISTS `piece_jointe` (
  `id_pieceJointe` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(50) NOT NULL,
  `id_annonce` int(11) NOT NULL,
  PRIMARY KEY (`id_pieceJointe`),
  KEY `id_annonce` (`id_annonce`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `id_produit` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `couleur` varchar(25) NOT NULL,
  `prix` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `id_boutique` int(11) NOT NULL,
  PRIMARY KEY (`id_produit`),
  KEY `id_boutique` (`id_boutique`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `type` varchar(20) NOT NULL,
  `date_naissance` date NOT NULL,
  `numero` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mot_de_passe` varchar(50) NOT NULL,
  `sexe` varchar(20) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `facture`
--
ALTER TABLE `facture`
  ADD CONSTRAINT `facture_ibfk_1` FOREIGN KEY (`id_boutique`) REFERENCES `boutique` (`id_boutique`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
