-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Lun 12 Juin 2017 à 23:41
-- Version du serveur :  10.1.21-MariaDB
-- Version de PHP :  5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `castellane2`
--
CREATE DATABASE IF NOT EXISTS `castellane2` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `castellane2`;

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `Identifiant` varchar(255) NOT NULL,
  `Nom` char(255) DEFAULT NULL,
  `Prenom` char(255) DEFAULT NULL,
  `MDP` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `admin`
--

INSERT INTO `admin` (`Identifiant`, `Nom`, `Prenom`, `MDP`) VALUES('al', 'Azer', 'Alain', 'mdp');
INSERT INTO `admin` (`Identifiant`, `Nom`, `Prenom`, `MDP`) VALUES('co', 'Terner', 'Coralie', 'mdp\r\n');
INSERT INTO `admin` (`Identifiant`, `Nom`, `Prenom`, `MDP`) VALUES('ha', 'Losto', 'Harry', 'mdp');
INSERT INTO `admin` (`Identifiant`, `Nom`, `Prenom`, `MDP`) VALUES('jo', 'Orageux', 'Joel', 'mdp');
INSERT INTO `admin` (`Identifiant`, `Nom`, `Prenom`, `MDP`) VALUES('po', 'Popote', 'Hans', 'mdp');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `NumC` int(11) NOT NULL,
  `NOM` char(30) NOT NULL,
  `PRENOM` char(30) NOT NULL,
  `DATE_N` date DEFAULT NULL,
  `TELEPHONE` int(11) DEFAULT NULL,
  `DATE_INSCRIPTION` date DEFAULT NULL,
  `MDP` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `MODE_FACTURATION` varchar(30) DEFAULT NULL,
  `ADRESSE` varchar(255) DEFAULT NULL,
  `CODE` varchar(22) DEFAULT NULL,
  `PERMIS` varchar(22) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`NumC`, `NOM`, `PRENOM`, `DATE_N`, `TELEPHONE`, `DATE_INSCRIPTION`, `MDP`, `EMAIL`, `MODE_FACTURATION`, `ADRESSE`, `CODE`, `PERMIS`) VALUES(9, 'mathiousalem', 'mathiou', '2017-06-01', 787108974, NULL, '4552a9b58f12be4881a1efd372f713991c22c9e1', 'mathiousalem@gmail.com', 'Espece', 'Paris', 'Array', 'Array');
INSERT INTO `client` (`NumC`, `NOM`, `PRENOM`, `DATE_N`, `TELEPHONE`, `DATE_INSCRIPTION`, `MDP`, `EMAIL`, `MODE_FACTURATION`, `ADRESSE`, `CODE`, `PERMIS`) VALUES(10, 'Tictac', 'Jean', '2017-06-14', 847436478, '2017-06-20', 'f7e79ca8eb0b31ee4d5d6c181416667ffee528ed', 'tictac@gmail.com', 'Carte bancaire', 'Belgique', 'Array', 'Array');
INSERT INTO `client` (`NumC`, `NOM`, `PRENOM`, `DATE_N`, `TELEPHONE`, `DATE_INSCRIPTION`, `MDP`, `EMAIL`, `MODE_FACTURATION`, `ADRESSE`, `CODE`, `PERMIS`) VALUES(11, 'Balta', 'Bella', '2017-06-22', NULL, '2017-06-11', 'b78b647728101ba462182b4c7e5b2ca57b9f5a99', 'baba@gmail.com', NULL, NULL, 'Array', 'Array');
INSERT INTO `client` (`NumC`, `NOM`, `PRENOM`, `DATE_N`, `TELEPHONE`, `DATE_INSCRIPTION`, `MDP`, `EMAIL`, `MODE_FACTURATION`, `ADRESSE`, `CODE`, `PERMIS`) VALUES(12, 'Chips', 'Fromage', '2017-06-28', NULL, '0000-00-00', 'a924a6bad2bca34c9fa59916cdca897b0c9433ba', 'frofro@gmail.com', NULL, NULL, 'Array', 'Array');

-- --------------------------------------------------------

--
-- Structure de la table `etablissement`
--

DROP TABLE IF EXISTS `etablissement`;
CREATE TABLE `etablissement` (
  `NumEtudiant` int(11) NOT NULL,
  `Nom_Etablissement` varchar(255) NOT NULL,
  `Adresse_Etablissement` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `etablissement`
--

INSERT INTO `etablissement` (`NumEtudiant`, `Nom_Etablissement`, `Adresse_Etablissement`) VALUES(10, 'Iris', '6-8 Impasse des 2 Cousins, 75017 Paris');
INSERT INTO `etablissement` (`NumEtudiant`, `Nom_Etablissement`, `Adresse_Etablissement`) VALUES(11, 'CocoloG', 'Guadeloupe');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
CREATE TABLE `etudiant` (
  `NumC` int(11) NOT NULL,
  `Niveau_Etude` varchar(255) NOT NULL,
  `Ref` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `etudiant`
--

INSERT INTO `etudiant` (`NumC`, `Niveau_Etude`, `Ref`) VALUES(10, 'License', 0);
INSERT INTO `etudiant` (`NumC`, `Niveau_Etude`, `Ref`) VALUES(11, 'bts', 0);

-- --------------------------------------------------------

--
-- Structure de la table `exam`
--

DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam` (
  `ID_EXAM` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `exam`
--

INSERT INTO `exam` (`ID_EXAM`) VALUES(1);
INSERT INTO `exam` (`ID_EXAM`) VALUES(2);
INSERT INTO `exam` (`ID_EXAM`) VALUES(3);
INSERT INTO `exam` (`ID_EXAM`) VALUES(4);

-- --------------------------------------------------------

--
-- Structure de la table `exam_code`
--

DROP TABLE IF EXISTS `exam_code`;
CREATE TABLE `exam_code` (
  `ID_EXAM` int(11) NOT NULL,
  `NumC` int(11) NOT NULL,
  `DATE_C` date DEFAULT NULL,
  `HEURE_C` time DEFAULT NULL,
  `RESULTAT_C` char(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `exam_code`
--

INSERT INTO `exam_code` (`ID_EXAM`, `NumC`, `DATE_C`, `HEURE_C`, `RESULTAT_C`) VALUES(1, 11, '2017-06-13', '09:00:00', NULL);
INSERT INTO `exam_code` (`ID_EXAM`, `NumC`, `DATE_C`, `HEURE_C`, `RESULTAT_C`) VALUES(2, 9, '2017-06-15', '08:00:00', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `exam_permis`
--

DROP TABLE IF EXISTS `exam_permis`;
CREATE TABLE `exam_permis` (
  `ID_EXAM` int(20) NOT NULL,
  `NumC` int(11) NOT NULL,
  `DATE_P` date DEFAULT NULL,
  `HEURE_P` time DEFAULT NULL,
  `RESULTAT_P` char(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `exam_permis`
--

INSERT INTO `exam_permis` (`ID_EXAM`, `NumC`, `DATE_P`, `HEURE_P`, `RESULTAT_P`) VALUES(4, 9, '2017-06-14', '07:00:00', NULL);
INSERT INTO `exam_permis` (`ID_EXAM`, `NumC`, `DATE_P`, `HEURE_P`, `RESULTAT_P`) VALUES(3, 10, '2017-06-21', '13:00:00', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `lecon`
--

DROP TABLE IF EXISTS `lecon`;
CREATE TABLE `lecon` (
  `NumLECON` int(11) NOT NULL,
  `NumeroC` int(11) NOT NULL,
  `DATEL` date DEFAULT NULL,
  `HEURE` time DEFAULT NULL,
  `TARIF_HEURE` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `lecon`
--

INSERT INTO `lecon` (`NumLECON`, `NumeroC`, `DATEL`, `HEURE`, `TARIF_HEURE`) VALUES(38, 9, '2017-05-31', '09:35:00', NULL);
INSERT INTO `lecon` (`NumLECON`, `NumeroC`, `DATEL`, `HEURE`, `TARIF_HEURE`) VALUES(39, 9, '2017-05-31', '09:35:00', NULL);
INSERT INTO `lecon` (`NumLECON`, `NumeroC`, `DATEL`, `HEURE`, `TARIF_HEURE`) VALUES(40, 9, '2017-05-31', '09:35:00', NULL);
INSERT INTO `lecon` (`NumLECON`, `NumeroC`, `DATEL`, `HEURE`, `TARIF_HEURE`) VALUES(41, 9, '2017-05-31', '09:35:00', NULL);
INSERT INTO `lecon` (`NumLECON`, `NumeroC`, `DATEL`, `HEURE`, `TARIF_HEURE`) VALUES(42, 9, '2017-05-31', '09:35:00', NULL);
INSERT INTO `lecon` (`NumLECON`, `NumeroC`, `DATEL`, `HEURE`, `TARIF_HEURE`) VALUES(43, 9, '2017-05-31', '09:35:00', NULL);
INSERT INTO `lecon` (`NumLECON`, `NumeroC`, `DATEL`, `HEURE`, `TARIF_HEURE`) VALUES(44, 9, '2017-05-31', '09:35:00', NULL);
INSERT INTO `lecon` (`NumLECON`, `NumeroC`, `DATEL`, `HEURE`, `TARIF_HEURE`) VALUES(45, 9, '2017-05-31', '09:35:00', NULL);
INSERT INTO `lecon` (`NumLECON`, `NumeroC`, `DATEL`, `HEURE`, `TARIF_HEURE`) VALUES(46, 9, '2017-05-31', '09:35:00', NULL);
INSERT INTO `lecon` (`NumLECON`, `NumeroC`, `DATEL`, `HEURE`, `TARIF_HEURE`) VALUES(47, 9, '2017-05-31', '09:35:00', NULL);
INSERT INTO `lecon` (`NumLECON`, `NumeroC`, `DATEL`, `HEURE`, `TARIF_HEURE`) VALUES(48, 9, '2017-05-31', '09:35:00', NULL);
INSERT INTO `lecon` (`NumLECON`, `NumeroC`, `DATEL`, `HEURE`, `TARIF_HEURE`) VALUES(49, 9, '2017-05-31', '09:35:00', NULL);
INSERT INTO `lecon` (`NumLECON`, `NumeroC`, `DATEL`, `HEURE`, `TARIF_HEURE`) VALUES(50, 9, '2017-05-31', '09:35:00', NULL);
INSERT INTO `lecon` (`NumLECON`, `NumeroC`, `DATEL`, `HEURE`, `TARIF_HEURE`) VALUES(51, 9, '2017-05-31', '09:35:00', NULL);
INSERT INTO `lecon` (`NumLECON`, `NumeroC`, `DATEL`, `HEURE`, `TARIF_HEURE`) VALUES(52, 9, '2017-05-31', '09:35:00', NULL);
INSERT INTO `lecon` (`NumLECON`, `NumeroC`, `DATEL`, `HEURE`, `TARIF_HEURE`) VALUES(53, 9, '2017-05-31', '09:35:00', NULL);
INSERT INTO `lecon` (`NumLECON`, `NumeroC`, `DATEL`, `HEURE`, `TARIF_HEURE`) VALUES(54, 9, '2017-05-31', '09:35:00', NULL);
INSERT INTO `lecon` (`NumLECON`, `NumeroC`, `DATEL`, `HEURE`, `TARIF_HEURE`) VALUES(55, 9, '2017-05-31', '09:35:00', NULL);
INSERT INTO `lecon` (`NumLECON`, `NumeroC`, `DATEL`, `HEURE`, `TARIF_HEURE`) VALUES(56, 9, '2017-05-31', '07:01:00', '55');
INSERT INTO `lecon` (`NumLECON`, `NumeroC`, `DATEL`, `HEURE`, `TARIF_HEURE`) VALUES(57, 9, '2017-05-31', '07:01:00', '55 eu');
INSERT INTO `lecon` (`NumLECON`, `NumeroC`, `DATEL`, `HEURE`, `TARIF_HEURE`) VALUES(58, 9, '2017-05-31', '07:01:00', '55 eu');
INSERT INTO `lecon` (`NumLECON`, `NumeroC`, `DATEL`, `HEURE`, `TARIF_HEURE`) VALUES(59, 9, '2017-05-31', '07:01:00', '55 eu');
INSERT INTO `lecon` (`NumLECON`, `NumeroC`, `DATEL`, `HEURE`, `TARIF_HEURE`) VALUES(60, 9, '2017-05-31', '07:01:00', '55 eu');
INSERT INTO `lecon` (`NumLECON`, `NumeroC`, `DATEL`, `HEURE`, `TARIF_HEURE`) VALUES(61, 9, '2017-05-31', '07:01:00', '55 eu');
INSERT INTO `lecon` (`NumLECON`, `NumeroC`, `DATEL`, `HEURE`, `TARIF_HEURE`) VALUES(62, 9, '2017-05-31', '07:01:00', '55 eu');

-- --------------------------------------------------------

--
-- Structure de la table `modele`
--

DROP TABLE IF EXISTS `modele`;
CREATE TABLE `modele` (
  `CODE_MODELE` int(11) NOT NULL,
  `NOM_MODELE` char(50) DEFAULT NULL,
  `CYLINDRE` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `modele`
--

INSERT INTO `modele` (`CODE_MODELE`, `NOM_MODELE`, `CYLINDRE`) VALUES(1, 'Cliot phase 4', 4);
INSERT INTO `modele` (`CODE_MODELE`, `NOM_MODELE`, `CYLINDRE`) VALUES(2, 'Clio phase 3', 4);
INSERT INTO `modele` (`CODE_MODELE`, `NOM_MODELE`, `CYLINDRE`) VALUES(3, 'Peugeot 208', 4);
INSERT INTO `modele` (`CODE_MODELE`, `NOM_MODELE`, `CYLINDRE`) VALUES(4, 'Suzuki', 6);
INSERT INTO `modele` (`CODE_MODELE`, `NOM_MODELE`, `CYLINDRE`) VALUES(5, 'Yamaha', 6);
INSERT INTO `modele` (`CODE_MODELE`, `NOM_MODELE`, `CYLINDRE`) VALUES(6, 'Ktm', 6);

-- --------------------------------------------------------

--
-- Structure de la table `mois`
--

DROP TABLE IF EXISTS `mois`;
CREATE TABLE `mois` (
  `NumMOIS` int(11) NOT NULL,
  `ANNEE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `mois`
--

INSERT INTO `mois` (`NumMOIS`, `ANNEE`) VALUES(1, '2017');
INSERT INTO `mois` (`NumMOIS`, `ANNEE`) VALUES(2, '2017');
INSERT INTO `mois` (`NumMOIS`, `ANNEE`) VALUES(3, '2017');
INSERT INTO `mois` (`NumMOIS`, `ANNEE`) VALUES(4, '2017');
INSERT INTO `mois` (`NumMOIS`, `ANNEE`) VALUES(5, '2017');
INSERT INTO `mois` (`NumMOIS`, `ANNEE`) VALUES(6, '2017');
INSERT INTO `mois` (`NumMOIS`, `ANNEE`) VALUES(7, '2017');
INSERT INTO `mois` (`NumMOIS`, `ANNEE`) VALUES(8, '2017');
INSERT INTO `mois` (`NumMOIS`, `ANNEE`) VALUES(9, '2017');
INSERT INTO `mois` (`NumMOIS`, `ANNEE`) VALUES(10, '2017');
INSERT INTO `mois` (`NumMOIS`, `ANNEE`) VALUES(11, '2017');
INSERT INTO `mois` (`NumMOIS`, `ANNEE`) VALUES(12, '2017');

-- --------------------------------------------------------

--
-- Structure de la table `moniteur`
--

DROP TABLE IF EXISTS `moniteur`;
CREATE TABLE `moniteur` (
  `NumMONITEUR` int(11) NOT NULL,
  `NOM_MONITEUR` char(30) DEFAULT NULL,
  `DATE_EMBAUCHE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `moniteur`
--

INSERT INTO `moniteur` (`NumMONITEUR`, `NOM_MONITEUR`, `DATE_EMBAUCHE`) VALUES(1, 'Achab', '2017-01-01');
INSERT INTO `moniteur` (`NumMONITEUR`, `NOM_MONITEUR`, `DATE_EMBAUCHE`) VALUES(2, 'Agricola', '2017-03-21');
INSERT INTO `moniteur` (`NumMONITEUR`, `NOM_MONITEUR`, `DATE_EMBAUCHE`) VALUES(3, 'Brutus', '2017-03-09');
INSERT INTO `moniteur` (`NumMONITEUR`, `NOM_MONITEUR`, `DATE_EMBAUCHE`) VALUES(4, 'Ciceron', '2016-12-21');
INSERT INTO `moniteur` (`NumMONITEUR`, `NOM_MONITEUR`, `DATE_EMBAUCHE`) VALUES(5, 'Cléopatre', '2017-04-17');

-- --------------------------------------------------------

--
-- Structure de la table `moto`
--

DROP TABLE IF EXISTS `moto`;
CREATE TABLE `moto` (
  `CODE_MODELE` int(11) NOT NULL,
  `CYLINDRE` char(10) DEFAULT NULL,
  `PUISSANCE` char(10) DEFAULT NULL,
  `NOM_MODELE` char(50) DEFAULT NULL,
  `ANNEE_MODELE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `moto`
--

INSERT INTO `moto` (`CODE_MODELE`, `CYLINDRE`, `PUISSANCE`, `NOM_MODELE`, `ANNEE_MODELE`) VALUES(3, '2', '6', 'Suzuki', '2017-06-11');
INSERT INTO `moto` (`CODE_MODELE`, `CYLINDRE`, `PUISSANCE`, `NOM_MODELE`, `ANNEE_MODELE`) VALUES(4, '2', '6', 'Yamaha', '2017-02-12');
INSERT INTO `moto` (`CODE_MODELE`, `CYLINDRE`, `PUISSANCE`, `NOM_MODELE`, `ANNEE_MODELE`) VALUES(6, '2', '6', 'Ktm', '2016-09-11');

-- --------------------------------------------------------

--
-- Structure de la table `planning`
--

DROP TABLE IF EXISTS `planning`;
CREATE TABLE `planning` (
  `NumLECON` int(11) NOT NULL,
  `NumC` int(11) NOT NULL,
  `NumMONITEUR` int(11) NOT NULL,
  `CODE_MODELE` int(11) NOT NULL,
  `HEURE_DEBUT` time DEFAULT NULL,
  `DATE_COUR` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `planning`
--

INSERT INTO `planning` (`NumLECON`, `NumC`, `NumMONITEUR`, `CODE_MODELE`, `HEURE_DEBUT`, `DATE_COUR`) VALUES(50, 9, 3, 3, '09:35:00', '2017-05-31');
INSERT INTO `planning` (`NumLECON`, `NumC`, `NumMONITEUR`, `CODE_MODELE`, `HEURE_DEBUT`, `DATE_COUR`) VALUES(58, 10, 5, 3, '07:01:00', '2017-05-31');

-- --------------------------------------------------------

--
-- Structure de la table `rouler`
--

DROP TABLE IF EXISTS `rouler`;
CREATE TABLE `rouler` (
  `NumMOIS` int(11) NOT NULL,
  `NumVEHICULE` int(11) NOT NULL,
  `Num_KM_PARCOURRUS_DANS_LE_MOIS` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `rouler`
--

INSERT INTO `rouler` (`NumMOIS`, `NumVEHICULE`, `Num_KM_PARCOURRUS_DANS_LE_MOIS`) VALUES(1, 1, 435);
INSERT INTO `rouler` (`NumMOIS`, `NumVEHICULE`, `Num_KM_PARCOURRUS_DANS_LE_MOIS`) VALUES(3, 2, 565);
INSERT INTO `rouler` (`NumMOIS`, `NumVEHICULE`, `Num_KM_PARCOURRUS_DANS_LE_MOIS`) VALUES(4, 4, 456);
INSERT INTO `rouler` (`NumMOIS`, `NumVEHICULE`, `Num_KM_PARCOURRUS_DANS_LE_MOIS`) VALUES(7, 3, 4646);
INSERT INTO `rouler` (`NumMOIS`, `NumVEHICULE`, `Num_KM_PARCOURRUS_DANS_LE_MOIS`) VALUES(10, 6, 7878);
INSERT INTO `rouler` (`NumMOIS`, `NumVEHICULE`, `Num_KM_PARCOURRUS_DANS_LE_MOIS`) VALUES(11, 5, 877);

-- --------------------------------------------------------

--
-- Structure de la table `salarie`
--

DROP TABLE IF EXISTS `salarie`;
CREATE TABLE `salarie` (
  `NumC` int(11) NOT NULL,
  `Nom_Entreprise` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `salarie`
--

INSERT INTO `salarie` (`NumC`, `Nom_Entreprise`) VALUES(9, NULL);
INSERT INTO `salarie` (`NumC`, `Nom_Entreprise`) VALUES(12, 'normay');

-- --------------------------------------------------------

--
-- Structure de la table `utiliser`
--

DROP TABLE IF EXISTS `utiliser`;
CREATE TABLE `utiliser` (
  `NumLECON` int(11) NOT NULL,
  `NumVEHICULE` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `utiliser`
--

INSERT INTO `utiliser` (`NumLECON`, `NumVEHICULE`) VALUES(40, 4);
INSERT INTO `utiliser` (`NumLECON`, `NumVEHICULE`) VALUES(51, 2);
INSERT INTO `utiliser` (`NumLECON`, `NumVEHICULE`) VALUES(51, 5);
INSERT INTO `utiliser` (`NumLECON`, `NumVEHICULE`) VALUES(59, 6);

-- --------------------------------------------------------

--
-- Structure de la table `vehicule`
--

DROP TABLE IF EXISTS `vehicule`;
CREATE TABLE `vehicule` (
  `NumVEHICULE` int(11) NOT NULL,
  `CODE_MODELE` int(11) NOT NULL,
  `NumIMMATRICULATION` char(20) DEFAULT NULL,
  `DATE_ACHAT` date DEFAULT NULL,
  `NB_KM_INITIAL` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `vehicule`
--

INSERT INTO `vehicule` (`NumVEHICULE`, `CODE_MODELE`, `NumIMMATRICULATION`, `DATE_ACHAT`, `NB_KM_INITIAL`) VALUES(1, 1, 'AB-344-CA', '2017-04-16', 0);
INSERT INTO `vehicule` (`NumVEHICULE`, `CODE_MODELE`, `NumIMMATRICULATION`, `DATE_ACHAT`, `NB_KM_INITIAL`) VALUES(2, 2, 'AR-758-DE', '2016-03-06', 0);
INSERT INTO `vehicule` (`NumVEHICULE`, `CODE_MODELE`, `NumIMMATRICULATION`, `DATE_ACHAT`, `NB_KM_INITIAL`) VALUES(3, 3, 'FH-434-GT', '2017-06-04', 0);
INSERT INTO `vehicule` (`NumVEHICULE`, `CODE_MODELE`, `NumIMMATRICULATION`, `DATE_ACHAT`, `NB_KM_INITIAL`) VALUES(4, 4, 'ZE-788-RT', '2016-02-16', 0);
INSERT INTO `vehicule` (`NumVEHICULE`, `CODE_MODELE`, `NumIMMATRICULATION`, `DATE_ACHAT`, `NB_KM_INITIAL`) VALUES(5, 5, 'SE-656-SZ', '2015-07-13', 0);
INSERT INTO `vehicule` (`NumVEHICULE`, `CODE_MODELE`, `NumIMMATRICULATION`, `DATE_ACHAT`, `NB_KM_INITIAL`) VALUES(6, 6, 'AZ-545-TR', '2017-04-02', 0);

-- --------------------------------------------------------

--
-- Structure de la table `voiture`
--

DROP TABLE IF EXISTS `voiture`;
CREATE TABLE `voiture` (
  `CODE_MODELE` int(11) NOT NULL,
  `Num_IMMATRICULATION` char(40) DEFAULT NULL,
  `NOM_MODELE` char(50) DEFAULT NULL,
  `ANNEE_MODELE` date DEFAULT NULL,
  `NB_KILOMETRE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `voiture`
--

INSERT INTO `voiture` (`CODE_MODELE`, `Num_IMMATRICULATION`, `NOM_MODELE`, `ANNEE_MODELE`, `NB_KILOMETRE`) VALUES(1, 'AB-344-CA', 'Cliot phase 4', '2016-04-19', 40000);
INSERT INTO `voiture` (`CODE_MODELE`, `Num_IMMATRICULATION`, `NOM_MODELE`, `ANNEE_MODELE`, `NB_KILOMETRE`) VALUES(2, 'AR-758-DE', 'Clio phase 3', '2016-04-08', 36484);
INSERT INTO `voiture` (`CODE_MODELE`, `Num_IMMATRICULATION`, `NOM_MODELE`, `ANNEE_MODELE`, `NB_KILOMETRE`) VALUES(3, 'FH-434-GT', 'Peugeot 208', '2014-10-13', 60354);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Identifiant`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`NumC`);

--
-- Index pour la table `etablissement`
--
ALTER TABLE `etablissement`
  ADD PRIMARY KEY (`NumEtudiant`);

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`NumC`);

--
-- Index pour la table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`ID_EXAM`);

--
-- Index pour la table `exam_code`
--
ALTER TABLE `exam_code`
  ADD PRIMARY KEY (`ID_EXAM`,`NumC`),
  ADD KEY `I_FK_EXAM_CODE_EXAM` (`ID_EXAM`),
  ADD KEY `I_FK_EXAM_CODE_CLIENT` (`NumC`);

--
-- Index pour la table `exam_permis`
--
ALTER TABLE `exam_permis`
  ADD PRIMARY KEY (`NumC`,`ID_EXAM`),
  ADD KEY `I_FK_EXAM_PERMIS_CLIENT` (`NumC`),
  ADD KEY `I_FK_EXAM_PERMIS_EXAM` (`ID_EXAM`);

--
-- Index pour la table `lecon`
--
ALTER TABLE `lecon`
  ADD PRIMARY KEY (`NumLECON`),
  ADD KEY `NumLECON` (`NumLECON`),
  ADD KEY `NumeroC` (`NumeroC`);

--
-- Index pour la table `modele`
--
ALTER TABLE `modele`
  ADD PRIMARY KEY (`CODE_MODELE`);

--
-- Index pour la table `mois`
--
ALTER TABLE `mois`
  ADD PRIMARY KEY (`NumMOIS`);

--
-- Index pour la table `moniteur`
--
ALTER TABLE `moniteur`
  ADD PRIMARY KEY (`NumMONITEUR`);

--
-- Index pour la table `moto`
--
ALTER TABLE `moto`
  ADD PRIMARY KEY (`CODE_MODELE`);

--
-- Index pour la table `planning`
--
ALTER TABLE `planning`
  ADD PRIMARY KEY (`NumLECON`,`NumC`,`NumMONITEUR`,`CODE_MODELE`),
  ADD KEY `I_FK_PLANNING_LECON` (`NumLECON`),
  ADD KEY `I_FK_PLANNING_CLIENT` (`NumC`),
  ADD KEY `I_FK_PLANNING_MONITEUR` (`NumMONITEUR`),
  ADD KEY `I_FK_PLANNING_MODELE` (`CODE_MODELE`);

--
-- Index pour la table `rouler`
--
ALTER TABLE `rouler`
  ADD PRIMARY KEY (`NumMOIS`,`NumVEHICULE`),
  ADD KEY `I_FK_ROULER_MOIS` (`NumMOIS`),
  ADD KEY `I_FK_ROULER_VEHICULE` (`NumVEHICULE`);

--
-- Index pour la table `salarie`
--
ALTER TABLE `salarie`
  ADD PRIMARY KEY (`NumC`);

--
-- Index pour la table `utiliser`
--
ALTER TABLE `utiliser`
  ADD PRIMARY KEY (`NumLECON`,`NumVEHICULE`),
  ADD KEY `I_FK_UTILISER_LECON` (`NumLECON`),
  ADD KEY `I_FK_UTILISER_VEHICULE` (`NumVEHICULE`);

--
-- Index pour la table `vehicule`
--
ALTER TABLE `vehicule`
  ADD PRIMARY KEY (`NumVEHICULE`),
  ADD KEY `I_FK_VEHICULE_MODELE` (`CODE_MODELE`);

--
-- Index pour la table `voiture`
--
ALTER TABLE `voiture`
  ADD PRIMARY KEY (`CODE_MODELE`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `NumC` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT pour la table `etablissement`
--
ALTER TABLE `etablissement`
  MODIFY `NumEtudiant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT pour la table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `NumC` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT pour la table `lecon`
--
ALTER TABLE `lecon`
  MODIFY `NumLECON` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT pour la table `modele`
--
ALTER TABLE `modele`
  MODIFY `CODE_MODELE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `moto`
--
ALTER TABLE `moto`
  MODIFY `CODE_MODELE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `salarie`
--
ALTER TABLE `salarie`
  MODIFY `NumC` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT pour la table `vehicule`
--
ALTER TABLE `vehicule`
  MODIFY `NumVEHICULE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `voiture`
--
ALTER TABLE `voiture`
  MODIFY `CODE_MODELE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `etablissement`
--
ALTER TABLE `etablissement`
  ADD CONSTRAINT `FK_etudiant_etablissemnt` FOREIGN KEY (`NumEtudiant`) REFERENCES `etudiant` (`NumC`);

--
-- Contraintes pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `FK_client_etudiant` FOREIGN KEY (`NumC`) REFERENCES `client` (`NumC`);

--
-- Contraintes pour la table `exam_code`
--
ALTER TABLE `exam_code`
  ADD CONSTRAINT `FK_EXAM_CODE_CLIENT` FOREIGN KEY (`NumC`) REFERENCES `client` (`NumC`),
  ADD CONSTRAINT `exam_code_ibfk_1` FOREIGN KEY (`ID_EXAM`) REFERENCES `exam` (`ID_EXAM`);

--
-- Contraintes pour la table `exam_permis`
--
ALTER TABLE `exam_permis`
  ADD CONSTRAINT `FK_EXAM_PERMIS_CLIENT` FOREIGN KEY (`NumC`) REFERENCES `client` (`NumC`),
  ADD CONSTRAINT `FK_EXAM_PERMIS_EXAM` FOREIGN KEY (`ID_EXAM`) REFERENCES `exam` (`ID_EXAM`);

--
-- Contraintes pour la table `lecon`
--
ALTER TABLE `lecon`
  ADD CONSTRAINT `fk_client_numero` FOREIGN KEY (`NumeroC`) REFERENCES `client` (`NumC`);

--
-- Contraintes pour la table `moto`
--
ALTER TABLE `moto`
  ADD CONSTRAINT `FK_MOTO_MODELE` FOREIGN KEY (`CODE_MODELE`) REFERENCES `modele` (`CODE_MODELE`),
  ADD CONSTRAINT `moto_ibfk_1` FOREIGN KEY (`CODE_MODELE`) REFERENCES `modele` (`CODE_MODELE`);

--
-- Contraintes pour la table `planning`
--
ALTER TABLE `planning`
  ADD CONSTRAINT `FK_PLANNING_CLIENT` FOREIGN KEY (`NumC`) REFERENCES `client` (`NumC`),
  ADD CONSTRAINT `FK_PLANNING_LECON` FOREIGN KEY (`NumLECON`) REFERENCES `lecon` (`NumLECON`),
  ADD CONSTRAINT `FK_PLANNING_MODELE` FOREIGN KEY (`CODE_MODELE`) REFERENCES `modele` (`CODE_MODELE`),
  ADD CONSTRAINT `FK_PLANNING_MONITEUR` FOREIGN KEY (`NumMONITEUR`) REFERENCES `moniteur` (`NumMONITEUR`);

--
-- Contraintes pour la table `rouler`
--
ALTER TABLE `rouler`
  ADD CONSTRAINT `rouler_ibfk_1` FOREIGN KEY (`NumMOIS`) REFERENCES `mois` (`NumMOIS`),
  ADD CONSTRAINT `rouler_ibfk_2` FOREIGN KEY (`NumVEHICULE`) REFERENCES `vehicule` (`NumVEHICULE`);

--
-- Contraintes pour la table `salarie`
--
ALTER TABLE `salarie`
  ADD CONSTRAINT `FK_client_salarie` FOREIGN KEY (`NumC`) REFERENCES `client` (`NumC`);

--
-- Contraintes pour la table `utiliser`
--
ALTER TABLE `utiliser`
  ADD CONSTRAINT `FK_UTILISER_LECON` FOREIGN KEY (`NumLECON`) REFERENCES `lecon` (`NumLECON`),
  ADD CONSTRAINT `FK_UTILISER_VEHICULE` FOREIGN KEY (`NumVEHICULE`) REFERENCES `vehicule` (`NumVEHICULE`);

--
-- Contraintes pour la table `vehicule`
--
ALTER TABLE `vehicule`
  ADD CONSTRAINT `vehicule_ibfk_1` FOREIGN KEY (`CODE_MODELE`) REFERENCES `modele` (`CODE_MODELE`);

--
-- Contraintes pour la table `voiture`
--
ALTER TABLE `voiture`
  ADD CONSTRAINT `voiture_ibfk_1` FOREIGN KEY (`CODE_MODELE`) REFERENCES `modele` (`CODE_MODELE`);

  drop trigger if exists ti_etudiant;
DELIMITER //
create trigger ti_etudiant after insert on etudiant for each row 
begin 
declare numrows INT; 
select count(*) into numrows 
from client 
where new.NumC = client.NumC; 
if ( numrows = 0 ) 
THEN 
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Impossible d'ajouter 'etudiant' car 'client' n'nexiste pas."; 
end if; 
end;
//



drop trigger if exists ti_moto;
-- Trigger d'insertion 
DELIMITER //
create trigger ti_moto
after insert on moto for each row
begin
declare numrows INT;
     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de MOTO 
     -- s'il n'existe pas d'occurrence correspondante dans la table MODÉLE.

     select count(*) into numrows
     from modele
     where
          new.CODE_MODELE = modele.CODE_MODELE;
     if 
          (
          numrows = 0 
          )
     THEN
          SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Impossible d'ajouter 'MOTO' car 'MODÉLE' n'existe pas.";
     end if;
end;
//



drop trigger if exists ti_voiture;
-- Trigger d'insertion 
DELIMITER //
create trigger ti_voiture
after insert on voiture for each row
begin
declare numrows INT;

     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de VOITURE 
     -- s'il n'existe pas d'occurrence correspondante dans la table MODÉLE.

     select count(*) into numrows
     from modele
     where
          new.CODE_MODELE = modele.CODE_MODELE;
     if 
          (
          numrows = 0 
          )
     then
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Impossible d'ajouter 'VOITURE' car 'MODÉLE' n'existe pas.";
     end if;

end;
//

drop trigger if exists ti_salarie;
-- Trigger d'insertion 
DELIMITER //
create trigger ti_salarie
after insert on salarie for each row
begin
declare numrows INT;
     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de SALARIÉ 
     -- s'il n'existe pas d'occurrence correspondante dans la table CLIENT.

     select count(*) into numrows
     from client
     where
          new.NumC = client.NumC;
     if 
          (
          numrows = 0 
          )
     then
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT  = "Impossible d'ajouter 'SALARIÉ' car 'CLIENT' n'existe pas.";
     end if;

end;
//


drop trigger IF EXISTS ti_rouler;
-- Trigger d'insertion 
DELIMITER //
create trigger ti_rouler
after insert on rouler for each row
begin
declare numrows INT;

 select count(*) into numrows
     from vehicule
     where
          new.NumVEHICULE = vehicule.NumVEHICULE;
     if 
          (
          numrows = 0 
          )
     then
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Impossible d'ajouter 'ROULER' car 'VÉHICULE' n'existe pas.";
     end if;

end;
//


drop trigger if exists ti_exam_code;
-- Trigger d'insertion
DELIMITER // 
create trigger ti_exam_code
after insert on exam_code for each row
begin
declare numrows INT;
     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de EXAM_CODE 
     -- s'il n'existe pas d'occurrence correspondante dans la table EXAM.

     select count(*) into numrows
     from EXAM
     where
          new.ID_EXAM = EXAM.ID_EXAM;
     if 
          (
          numrows = 0 
          )
     then
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Impossible d'ajouter 'EXAM_CODE' car 'EXAM' n'existe pas.";
     end if;
     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de EXAM_CODE 
     -- s'il n'existe pas d'occurrence correspondante dans la table CLIENT.

     select count(*) into numrows
     from client
     where
          new.NumC = client.NumC;
     if 
          (
          numrows = 0 
          )
     then
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Impossible d'ajouter 'EXAM_CODE' car 'CLIENT' n'existe pas.";
     end if;

end;
//

drop trigger if exists ti_exam_permis;

-- Trigger d'insertion 
DELIMITER //
create trigger ti_exam_permis
after insert on exam_permis for each row
begin
declare numrows INT;
     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de EXAM_PERMIS 
     -- s'il n'existe pas d'occurrence correspondante dans la table CLIENT.

     select count(*) into numrows
     from client
     where
          new.NumC = client.NumC;
     if 
          (
          numrows = 0 
          )
     then
          SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Impossible d'ajouter 'EXAM_PERMIS' car 'CLIENT' n'existe pas.";
     end if;
     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de EXAM_PERMIS 
     -- s'il n'existe pas d'occurrence correspondante dans la table EXAM.

     select count(*) into numrows
     from EXAM
     where
          new.ID_EXAM = EXAM.ID_EXAM;
     if 
          (
          numrows = 0 
          )
     then
          SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Impossible d''ajouter "EXAM_PERMIS" car "EXAM" n''existe pas.';
     end if;

end;
//


  
  
  
  
  
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;






create trigger ti_etudiant after insert on etudiant for each row begin declare numrows INT; 
select count(*) into numrows 
from client 
where new.NumC = client.NumC; 
if ( numrows = 0 ) 
THEN 
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Impossible d'ajouter 'etudiant' car 'client' n'nexiste pas."; 
end if; 
end;





