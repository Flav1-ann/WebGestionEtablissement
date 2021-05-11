-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 11 mai 2021 à 16:10
-- Version du serveur :  10.4.17-MariaDB
-- Version de PHP : 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `etablissement_scolaire`
--

DELIMITER $$
--
-- Procédures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteDirecteur` (IN `dir_id_directeur` INT, OUT `erreur` INT)  BEGIN
    DECLARE is_row_deleted INT;
    START TRANSACTION;
    
    IF dir_id_directeur > 0 THEN
    
        -- Update personne

        DELETE FROM `personne`
        WHERE personne.id_personne = dir_id_directeur;
        
        SET is_row_deleted = ROW_COUNT();
       
        IF is_row_deleted = 1 THEN
            -- Update personne_phys
            
            DELETE FROM `personne_phys`
            WHERE personne_phys.id_phys = dir_id_directeur;
            
            -- Update étudiant 
            
            DELETE FROM `directeur`
            WHERE directeur.id_dir = dir_id_directeur;
            
            -- Commit queries
            SET erreur = 0;
            COMMIT;
        ELSE 
            SET erreur = -1;
            ROLLBACK;
        END IF;
    ELSE
        -- Commit if id isn't correct ROLLBACK to cancel any actions did before
        ROLLBACK;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteEcole` (IN `ec_id_ecole` INT, OUT `erreur` INT)  BEGIN
    DECLARE is_row_deleted INT;

    START TRANSACTION;
    
    IF ec_id_ecole > 0 THEN
    
        DELETE FROM `personne`
        WHERE personne.id_personne = ec_id_ecole;

        SET is_row_deleted = ROW_COUNT();
       
        IF is_row_deleted = 1 THEN
            
            DELETE FROM `personne_phys`
            WHERE personne_phys.id_phys = ec_id_ecole;

            DELETE FROM `ecole`
            WHERE ecole.id_ecole = ec_id_ecole;

            -- Commit queries
            SET erreur = 0;
            COMMIT;
        ELSE
            SET erreur = -1;
            ROLLBACK;
        END IF;
    ELSE
        
        -- Commit if id isn't correct ROLLBACK to cancel any actions did before
        ROLLBACK;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteEnseignant` (IN `en_id_enseignant` INT, OUT `erreur` INT)  BEGIN
    DECLARE is_row_deleted INT;

    START TRANSACTION;
    
    IF en_id_enseignant > 0 THEN
    
        -- Update personne

        DELETE FROM `personne`
        WHERE personne.id_personne = en_id_enseignant;
        
        SET is_row_deleted = ROW_COUNT();
       
        IF is_row_deleted = 1 THEN
            -- Update personne_phys
            
            DELETE FROM `personne_phys`
            WHERE personne_phys.id_phys = en_id_enseignant;
            
            -- Update étudiant 
            
            DELETE FROM `enseignant`
            WHERE enseignant.id_ens = en_id_enseignant;
            
            -- Commit queries
            SET erreur = 0;
            COMMIT;
        ELSE
            SET erreur = -1;
            ROLLBACK;
        END IF;
    ELSE
        -- Commit if id isn't correct ROLLBACK to cancel any actions did before
        ROLLBACK;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteEtudiant` (IN `e_id_etudiant` INT, OUT `erreur` INT)  BEGIN
    DECLARE is_row_deleted INT;

    START TRANSACTION;
    
    IF e_id_etudiant > 0 THEN
    
        -- delete personne

        DELETE FROM `personne`
        WHERE personne.id_personne = e_id_etudiant;

        SET is_row_deleted = ROW_COUNT();
       
        IF is_row_deleted = 1 THEN

            -- delete personne_phys
            DELETE FROM `personne_phys`
            WHERE personne_phys.id_phys = e_id_etudiant;
            
            -- delete étudiant 
            
            DELETE FROM `etudiant`
            WHERE etudiant.id_etudiant = e_id_etudiant;
            
            -- Commit queries
            SET erreur = 0;
            COMMIT;
        ELSE
            SET erreur = -1;
            ROLLBACK;
        END IF;
    ELSE
        -- Commit if id isn't correct ROLLBACK to cancel any actions did before
        ROLLBACK;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteNote` (IN `n_id_notes` INT, OUT `erreur` INT)  BEGIN
    START TRANSACTION;
    
    IF n_id_notes > 0 THEN
    
            DELETE FROM `notes`
            where notes.id_note=n_id_notes;
            
            SET erreur = 0;

            -- Commit queries
            COMMIT;
    ELSE
        -- Commit if id isn't correct ROLLBACK to cancel any actions did before
        ROLLBACK;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteResponsable` (IN `res_id_responsable` INT, OUT `erreur` INT)  BEGIN
    DECLARE is_row_deleted INT;

    START TRANSACTION;
    
    IF res_id_responsable > 0 THEN
    
        -- Update personne
       
        DELETE FROM `personne`
        WHERE personne.id_personne = res_id_responsable;
       
        SET is_row_deleted = ROW_COUNT();
       
        IF is_row_deleted = 1 THEN
            -- Update personne_phys
        
            DELETE FROM `personne_phys`
            WHERE personne_phys.id_phys = res_id_responsable;
        
            -- Update étudiant 
            
            DELETE FROM `res_etude`
            WHERE res_etude.id_res = res_id_responsable;
            
            -- Commit queries
            SET erreur = 0;
            COMMIT;
        ELSE
            SET erreur = -1;
            ROLLBACK;
        END IF;
    ELSE
        -- Commit if id isn't correct ROLLBACK to cancel any actions did before
        ROLLBACK;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertDirecteur` (IN `dir_nom` VARCHAR(50), IN `dir_prenom` VARCHAR(50), IN `dir_email` VARCHAR(50), IN `dir_adresse` VARCHAR(50), IN `dir_telephone` VARCHAR(50), IN `dir_mdp` VARCHAR(50), IN `dir_salt` VARCHAR(50), IN `dir_nom_role` VARCHAR(50), OUT `erreur` INT)  BEGIN
    DECLARE personne_id INT DEFAULT 0;
    DECLARE is_row_exist INT;

    SELECT EXISTS(SELECT * from personne WHERE personne.email = dir_email) as is_exist into is_row_exist;
    
    START TRANSACTION;
    INSERT INTO `personne`(`nom`, `email`, `adresse`, `telephone`) 
    VALUES (dir_nom, dir_email, dir_adresse, dir_telephone);
    SET personne_id = LAST_INSERT_ID();
    IF (personne_id > 0) && (is_row_exist != 1) THEN
        INSERT INTO `personne_phys`(`id_phys`, `prenom`, `mdp`, `salt`, `id_role`) 
        VALUES (personne_id, dir_prenom, dir_mdp, dir_salt, (SELECT id_role from role where role.libelle = dir_nom_role) );
        INSERT INTO `directeur`(`id_dir`) VALUES (personne_id);
        SET erreur = 0;
        COMMIT;
    ELSEIF personne_id = 0 THEN
        SET erreur = -1;
        ROLLBACK;
    ELSEIF is_row_exist = 1 THEN
        SET erreur = -2;
        ROLLBACK;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertEcole` (IN `ec_nom` VARCHAR(50), IN `ec_email` VARCHAR(50), IN `ec_adresse` VARCHAR(50), IN `ec_telephone` VARCHAR(50), IN `ec_id_directeur` VARCHAR(50), OUT `erreur` INT)  BEGIN
    DECLARE personne_id INT DEFAULT 0;
    DECLARE is_row_exist INT;

    SELECT EXISTS(SELECT * from personne WHERE personne.email = ec_email) as is_exist into is_row_exist;

    START TRANSACTION;
    INSERT INTO `personne`(`nom`, `email`, `adresse`, `telephone`) 
    VALUES (ec_nom, ec_email, ec_adresse, ec_telephone);
    SET personne_id = LAST_INSERT_ID();
    IF (personne_id > 0) && (is_row_exist != 1) THEN
        INSERT INTO `ecole`(`id_ecole`, `id_directeur`) VALUES (personne_id, ec_id_directeur );
        SET erreur = 0;
        COMMIT;
    ELSEIF personne_id = 0 THEN
        SET erreur = -1;
        ROLLBACK;
    ELSEIF is_row_exist = 1 THEN
        SET erreur = -2;
        ROLLBACK;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertEnseignant` (IN `en_nom` VARCHAR(50), IN `en_prenom` VARCHAR(50), IN `en_email` VARCHAR(50), IN `en_adresse` VARCHAR(50), IN `en_telephone` VARCHAR(50), IN `en_mdp` VARCHAR(50), IN `en_salt` VARCHAR(50), IN `en_nom_role` VARCHAR(50), IN `en_mat_ens` VARCHAR(50), OUT `erreur` INT)  BEGIN
    DECLARE personne_id INT DEFAULT 0;
    DECLARE is_row_exist INT;

    SELECT EXISTS(SELECT * from personne WHERE personne.email = en_email) as is_exist into is_row_exist;

    START TRANSACTION;
    INSERT INTO `personne`(`nom`, `email`, `adresse`, `telephone`) 
    VALUES (en_nom, en_email, en_adresse, en_telephone);
    SET personne_id = LAST_INSERT_ID();
    IF (personne_id > 0) && (is_row_exist != 1) THEN
        INSERT INTO `personne_phys`(`id_phys`, `prenom`, `mdp`, `salt`, `id_role`) 
        VALUES (personne_id, en_prenom, en_mdp, en_salt, (SELECT id_role from role where role.libelle = en_nom_role) );
        INSERT INTO `enseignant`(`id_ens`, `mat_ens`) 
        VALUES (personne_id, en_mat_ens);
        SET erreur = 0;
        COMMIT;
    ELSEIF personne_id = 0 THEN
        SET erreur = -1;
        ROLLBACK;
    ELSEIF is_row_exist = 1 THEN
        SET erreur = -2;
        ROLLBACK;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertEtudiant` (IN `e_nom` VARCHAR(50), IN `e_prenom` VARCHAR(50), IN `e_email` VARCHAR(50), IN `e_adresse` VARCHAR(50), IN `e_telephone` VARCHAR(50), IN `e_mdp` VARCHAR(50), IN `e_salt` VARCHAR(50), IN `e_nom_role` VARCHAR(50), IN `e_date_naissance` DATE, OUT `erreur` INT)  BEGIN
    DECLARE personne_id INT DEFAULT 0;
    DECLARE is_row_exist INT;

    SELECT EXISTS(SELECT * from personne WHERE personne.email = e_email) as is_exist into is_row_exist;

    START TRANSACTION;
    INSERT INTO `personne`(`nom`, `email`, `adresse`, `telephone`) 
    VALUES (e_nom, e_email, e_adresse, e_telephone);
    SET personne_id = LAST_INSERT_ID();
    IF (personne_id > 0) && (is_row_exist != 1) THEN
        INSERT INTO `personne_phys`(`id_phys`, `prenom`, `mdp`, `salt`, `id_role`) 
        VALUES (personne_id, e_prenom, e_mdp, e_salt, (SELECT id_role from role where role.libelle = e_nom_role) );
        INSERT INTO `etudiant`(`id_etudiant`, `date_naissance`) 
        VALUES (personne_id, e_date_naissance);
        SET erreur = 0;
        COMMIT;
    ELSEIF personne_id = 0 THEN
        SET erreur = -1;
        ROLLBACK;
    ELSEIF is_row_exist = 1 THEN
        SET erreur = -2;
        ROLLBACK;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertNote` (IN `n_id_etudiant` INT, IN `n_id_matiere` INT, IN `n_note` INT, IN `n_coeif` INT, OUT `erreur` INT)  BEGIN
    
    START TRANSACTION;
    
    IF (n_id_etudiant > 0) && (n_id_matiere > 0) THEN
    
            INSERT INTO `notes`(`note`,`coeif`, `id_matiere`, `id_etudiant`)
            VALUES (n_note, n_coeif, n_id_matiere, n_id_etudiant);
            SET erreur = 0;

            -- Commit queries
            COMMIT;
    ELSE
        -- Commit if id isn't correct ROLLBACK to cancel any actions did before
        ROLLBACK;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertRes_etude` (IN `res_nom` VARCHAR(50), IN `res_prenom` VARCHAR(50), IN `res_email` VARCHAR(50), IN `res_adresse` VARCHAR(50), IN `res_telephone` VARCHAR(50), IN `res_mdp` VARCHAR(50), IN `res_salt` VARCHAR(50), IN `res_nom_role` VARCHAR(50), OUT `erreur` INT)  BEGIN
    DECLARE personne_id INT DEFAULT 0;
    DECLARE is_row_exist INT;

    SELECT EXISTS(SELECT * from personne WHERE personne.email = res_email) as is_exist into is_row_exist;

    START TRANSACTION;
    INSERT INTO `personne`(`nom`, `email`, `adresse`, `telephone`) 
    VALUES (res_nom, res_email, res_adresse, res_telephone);
    SET personne_id = LAST_INSERT_ID();
    IF (personne_id > 0) && (is_row_exist != 1) THEN
        INSERT INTO `personne_phys`(`id_phys`, `prenom`, `mdp`, `salt`, `id_role`) 
        VALUES (personne_id, res_prenom, res_mdp, res_salt, (SELECT id_role from role where role.libelle = res_nom_role) );
        INSERT INTO `res_etude`(`id_res`) VALUES (personne_id);
        SET erreur = 0;
        COMMIT;
    ELSEIF personne_id = 0 THEN
        SET erreur = -1;
        ROLLBACK;
    ELSEIF is_row_exist = 1 THEN
        SET erreur = -2;
        ROLLBACK;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateDirecteur` (IN `dir_id_directeur` INT, IN `dir_nom` VARCHAR(50), IN `dir_prenom` VARCHAR(50), IN `dir_email` VARCHAR(50), IN `dir_adresse` VARCHAR(50), IN `dir_telephone` VARCHAR(50), IN `dir_mdp` VARCHAR(50), IN `dir_salt` VARCHAR(50), IN `dir_nom_role` VARCHAR(50), OUT `erreur` INT)  BEGIN
    DECLARE is_row_updated INT;
    START TRANSACTION;
    
    IF dir_id_directeur > 0 THEN

        -- Update personne
        UPDATE `personne`
        SET `nom`=dir_nom,`email`=dir_email,`adresse`=dir_adresse,`telephone`=dir_telephone 
        WHERE personne.id_personne = dir_id_directeur;
        
        SET is_row_updated = ROW_COUNT();
       
        IF is_row_updated = 1 THEN
            
            -- Update personne_phys
            UPDATE `personne_phys` 
            SET `prenom`=dir_prenom,`mdp`=dir_mdp,`salt`=dir_salt, `id_role`= (SELECT id_role from role where role.libelle = dir_nom_role)
            WHERE personne_phys.id_phys = dir_id_directeur;
            SET erreur = 0;
            COMMIT;
        ELSE
            SET erreur = -1;
            ROLLBACK;
        END IF;
        -- Commit queries
    ELSE
        -- Commit if id isn't correct ROLLBACK to cancel any actions did before
        ROLLBACK;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateEcole` (IN `ec_id_ecole` INT, IN `ec_nom` VARCHAR(50), IN `ec_email` VARCHAR(50), IN `ec_adresse` VARCHAR(50), IN `ec_telephone` VARCHAR(50), IN `ec_id_directeur` VARCHAR(50), OUT `erreur` INT)  BEGIN
    DECLARE is_row_updated INT;

    START TRANSACTION;
    
    IF ec_id_ecole > 0 THEN
    
        -- Update personne
        UPDATE `personne`
        SET `nom`=e_nom,`email`=e_email,`adresse`=e_adresse,`telephone`=e_telephone 
        WHERE personne.id_personne = ec_id_ecole;
        
        SET is_row_updated = ROW_COUNT();

        IF is_row_updated = 1 THEN
            -- Update personne_phys
            
            UPDATE `ecole`
            SET `id_directeur`= ec_id_directeur
            WHERE ecole.id_ecole = ec_id_ecole;

            SET erreur = 0;

            -- Commit queries
            COMMIT;
        ELSE 
            SET erreur = -1;
            ROLLBACK;
        END IF;
    ELSE
        -- ROLLBACK to cancel any actions did before due to error
        ROLLBACK;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateEnseignant` (IN `en_id_enseignant` INT, IN `en_nom` VARCHAR(50), IN `en_prenom` VARCHAR(50), IN `en_email` VARCHAR(50), IN `en_adresse` VARCHAR(50), IN `en_telephone` VARCHAR(50), IN `en_mdp` VARCHAR(50), IN `en_salt` VARCHAR(50), IN `en_nom_role` VARCHAR(50), IN `en_mat_ens` VARCHAR(50), OUT `erreur` INT)  BEGIN
    DECLARE is_row_updated INT;
    
    START TRANSACTION;
    
    IF en_id_enseignant > 0 THEN
    
        -- Update personne
        UPDATE `personne`
        SET `nom`=en_nom,`email`=en_email,`adresse`=en_adresse,`telephone`=en_telephone 
        WHERE personne.id_personne = en_id_enseignant;
        
        SET is_row_updated = ROW_COUNT();

        IF is_row_updated = 1 THEN
            
            -- Update personnen_phys
            UPDATE `personne_phys` 
            SET `prenom`=en_prenom,`mdp`=en_mdp,`salt`=en_salt,`id_role`=(SELECT id_role from role where role.libelle = en_nom_role) 
            WHERE personne_phys.id_phys = en_id_enseignant;

            UPDATE `enseignant`
            SET `mat_ens`=en_mat_ens
            WHERE enseignant.mat_ens = en_id_enseignant;

            SET erreur = 0;

            -- Commit queries
            COMMIT;
        ELSE
            SET erreur = -1;
            ROLLBACK;
            -- Update étudiant
        END IF;
    ELSE
        -- Commit if id isn't correct ROLLBACK to cancel any actions did before
        ROLLBACK;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateEtudiant` (IN `e_id_etudiant` INT, IN `e_nom` VARCHAR(50), IN `e_prenom` VARCHAR(50), IN `e_email` VARCHAR(50), IN `e_adresse` VARCHAR(50), IN `e_telephone` VARCHAR(50), IN `e_mdp` VARCHAR(50), IN `e_salt` VARCHAR(50), IN `e_nom_role` VARCHAR(50), IN `e_date_naissance` DATE, OUT `erreur` INT)  BEGIN
    DECLARE is_row_updated INT;

    START TRANSACTION;
    
    IF e_id_etudiant > 0 THEN
    
        -- Update personne
        UPDATE `personne`
        SET `nom`=e_nom,`email`=e_email,`adresse`=e_adresse,`telephone`=e_telephone 
        WHERE personne.id_personne = e_id_etudiant;
        
        SET is_row_updated = ROW_COUNT();

        IF is_row_updated = 1 THEN
            -- Update personne_phys
            
            UPDATE `personne_phys` 
            SET `prenom`=e_prenom,`mdp`=e_mdp,`salt`=e_salt,`id_role`=(SELECT id_role from role where role.libelle = e_nom_role) 
            WHERE personne_phys.id_phys = e_id_etudiant;
            
            -- Update étudiant
            
            UPDATE `etudiant`
            set etudiant.date_naissance=e_date_naissance
            WHERE etudiant.id_etudiant = e_id_etudiant;

            SET erreur = 0;

            -- Commit queries
            COMMIT;
        ELSE  
            SET erreur = -1;
            ROLLBACK;
        END IF;
    ELSE
        -- ROLLBACK to cancel any actions did before due to error
        ROLLBACK;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateNote` (IN `n_id_notes` INT, IN `n_id_etudiant` INT, IN `n_id_matiere` INT, IN `n_note` INT, IN `n_coeif` INT, OUT `erreur` INT)  BEGIN
    
    START TRANSACTION;
    
    IF n_id_notes > 0 THEN
    
            UPDATE `notes`
            SET `note`=n_note,`coeif`=n_coeif
            where notes.id_note=n_id_notes;
            
            SET erreur = 0;

            -- Commit queries
            COMMIT;
    ELSE
        -- Commit if id isn't correct ROLLBACK to cancel any actions did before
        ROLLBACK;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateResponsable` (IN `res_id_responsable` INT, IN `res_nom` VARCHAR(50), IN `res_prenom` VARCHAR(50), IN `res_email` VARCHAR(50), IN `res_adresse` VARCHAR(50), IN `res_telephone` VARCHAR(50), IN `res_mdp` VARCHAR(50), IN `res_salt` VARCHAR(50), IN `res_nom_role` VARCHAR(50), OUT `erreur` INT)  BEGIN
    DECLARE is_row_updated INT;
    START TRANSACTION;
    
    IF res_id_responsable > 0 THEN
    
        -- Update personne
        UPDATE `personne`
        SET `nom`=res_nom,`email`=res_email,`adresse`=res_adresse,`telephone`=res_telephone 
        WHERE personne.id_personne = res_id_responsable;
        
        SET is_row_updated = ROW_COUNT();
        
        IF is_row_updated = 1 THEN
            -- Update personnres_phys
            UPDATE `personne_phys`
            SET `prenom`=res_prenom,`mdp`=res_mdp,`salt`=res_salt, `id_role`= (SELECT id_role from role where role.libelle = res_nom_role)
            WHERE personne_phys.id_phys = res_id_responsable;
            
            SET erreur = 0;

            -- Commit queries
            COMMIT;
        ELSE
            SET erreur = -1;
            ROLLBACK;
        END IF;
    ELSE
        -- Commit if id isn't correct ROLLBACK to cancel any actions did before
        ROLLBACK;
    END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

CREATE TABLE `cours` (
  `id_cours` int(11) NOT NULL,
  `theme` varchar(50) DEFAULT NULL,
  `nb_heures` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `cours`
--

INSERT INTO `cours` (`id_cours`, `theme`, `nb_heures`) VALUES
(1, 'Math', 5),
(2, 'Physique', 2),
(3, 'Informatique', 40),
(4, 'Droit', 10);

-- --------------------------------------------------------

--
-- Structure de la table `directeur`
--

CREATE TABLE `directeur` (
  `id_dir` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `directeur`
--

INSERT INTO `directeur` (`id_dir`) VALUES
(7);

-- --------------------------------------------------------

--
-- Structure de la table `ecole`
--

CREATE TABLE `ecole` (
  `id_ecole` int(11) NOT NULL,
  `id_directeur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `enseignant`
--

CREATE TABLE `enseignant` (
  `id_ens` int(11) NOT NULL,
  `mat_ens` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `id_etudiant` int(11) NOT NULL,
  `date_naissance` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`id_etudiant`, `date_naissance`) VALUES
(10, NULL),
(11, NULL),
(12, NULL),
(14, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `gerer`
--

CREATE TABLE `gerer` (
  `id_res` int(11) NOT NULL,
  `id_ecole` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

CREATE TABLE `matiere` (
  `id_matiere` int(11) NOT NULL,
  `libelle` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `matiere`
--

INSERT INTO `matiere` (`id_matiere`, `libelle`) VALUES
(1, 'math'),
(2, 'Francais'),
(3, 'Dev'),
(4, 'Dart'),
(5, 'python');

-- --------------------------------------------------------

--
-- Structure de la table `notes`
--

CREATE TABLE `notes` (
  `id_note` int(11) NOT NULL,
  `note` int(11) NOT NULL,
  `coeif` int(11) NOT NULL,
  `id_matiere` int(11) NOT NULL,
  `id_etudiant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `notes`
--

INSERT INTO `notes` (`id_note`, `note`, `coeif`, `id_matiere`, `id_etudiant`) VALUES
(1, 14, 1, 1, 10),
(2, 20, 1, 1, 11),
(3, 2, 1, 1, 12),
(4, 10, 1, 1, 10),
(5, 20, 1, 1, 11),
(6, 0, 1, 3, 10),
(7, 0, 1, 5, 10);

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

CREATE TABLE `personne` (
  `id_personne` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `adresse` varchar(50) DEFAULT NULL,
  `telephone` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `personne`
--

INSERT INTO `personne` (`id_personne`, `nom`, `email`, `adresse`, `telephone`) VALUES
(7, 'directeurN', 'directeur@gmail.com', '14 rue des directeurs', '0161380575'),
(9, 'responsableN', 'responsable.etude@gmail.com', '1 bis Avenue du 8 Mai 1945, 78280 Guyancourt', '0161380575'),
(10, 'Annaix aANN', 'flavien.annaix@gmail.com', 'azezaeerza', '0521455'),
(11, 'test', 'test', NULL, 'test'),
(12, 'retzezrt', 'zetrterz', NULL, 'zterztre'),
(14, 'qsdf', 'Fraximonstro@gmail.com', 'qdsf', '055');

-- --------------------------------------------------------

--
-- Structure de la table `personne_phys`
--

CREATE TABLE `personne_phys` (
  `id_phys` int(11) NOT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `mdp` varchar(50) DEFAULT NULL,
  `salt` varchar(50) DEFAULT NULL,
  `id_role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `personne_phys`
--

INSERT INTO `personne_phys` (`id_phys`, `prenom`, `mdp`, `salt`, `id_role`) VALUES
(7, 'directeurN', 'nboOEaF6O4n7JA5Jbp8yxuCbDlM6Px+MRCGre6z2zsQ=', '8OpvtT/aDj5+j2bXrqdUTjvvQ3I=', 1),
(9, 'responsableP', 'UlkmPJqdUH+bm5fb/1G17Crk6QjzpsAJG/WBAUl5Fi0=', 'dRAfq70K4Rl3iPHSeJi3JKUTOKU=', 4),
(10, 'Flavien', '', '', 2),
(11, 'test', '3gXn+IR5orvj7usZTWk9NOF83klrK4b+yF1af1DoWCA=', '7POsZFdk4cIspcOzOmeTlP7UUcs=', 2),
(12, 'zetrtezr', '+AgJ0+PymDowdmhaSx7/DOW2ebg0jX1Zv/N+PuqOaEc=', '5OD+NdLuN6GUUB2EnbSz3eURJ5E=', 2),
(14, 'qdfs', 'st7VMdDPWdF6dkhFtjPl9Vwou6JySnyKxmCBbRoYEPA=', '1n47Wpe/i/xoGXhM6kHZF8omOew=', 2);

-- --------------------------------------------------------

--
-- Structure de la table `res_etude`
--

CREATE TABLE `res_etude` (
  `id_res` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `res_etude`
--

INSERT INTO `res_etude` (`id_res`) VALUES
(9);

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `id_role` int(11) NOT NULL,
  `libelle` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id_role`, `libelle`) VALUES
(1, 'directeur'),
(2, 'etudiant'),
(3, 'enseignant'),
(4, 'responsable');

-- --------------------------------------------------------

--
-- Structure de la table `suivre`
--

CREATE TABLE `suivre` (
  `id_etudiant` int(11) NOT NULL,
  `id_cours` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `suivre`
--

INSERT INTO `suivre` (`id_etudiant`, `id_cours`) VALUES
(10, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `cours`
--
ALTER TABLE `cours`
  ADD PRIMARY KEY (`id_cours`);

--
-- Index pour la table `directeur`
--
ALTER TABLE `directeur`
  ADD PRIMARY KEY (`id_dir`);

--
-- Index pour la table `ecole`
--
ALTER TABLE `ecole`
  ADD PRIMARY KEY (`id_ecole`),
  ADD KEY `id_directeur` (`id_directeur`);

--
-- Index pour la table `enseignant`
--
ALTER TABLE `enseignant`
  ADD PRIMARY KEY (`id_ens`);

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`id_etudiant`);

--
-- Index pour la table `gerer`
--
ALTER TABLE `gerer`
  ADD PRIMARY KEY (`id_res`,`id_ecole`),
  ADD KEY `id_ecole` (`id_ecole`);

--
-- Index pour la table `matiere`
--
ALTER TABLE `matiere`
  ADD PRIMARY KEY (`id_matiere`);

--
-- Index pour la table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id_note`),
  ADD KEY `id_matiere` (`id_matiere`),
  ADD KEY `id_etudiant` (`id_etudiant`);

--
-- Index pour la table `personne`
--
ALTER TABLE `personne`
  ADD PRIMARY KEY (`id_personne`);

--
-- Index pour la table `personne_phys`
--
ALTER TABLE `personne_phys`
  ADD PRIMARY KEY (`id_phys`),
  ADD KEY `id_role` (`id_role`);

--
-- Index pour la table `res_etude`
--
ALTER TABLE `res_etude`
  ADD PRIMARY KEY (`id_res`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- Index pour la table `suivre`
--
ALTER TABLE `suivre`
  ADD PRIMARY KEY (`id_etudiant`,`id_cours`),
  ADD KEY `id_cours` (`id_cours`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `cours`
--
ALTER TABLE `cours`
  MODIFY `id_cours` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `directeur`
--
ALTER TABLE `directeur`
  MODIFY `id_dir` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `ecole`
--
ALTER TABLE `ecole`
  MODIFY `id_ecole` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `enseignant`
--
ALTER TABLE `enseignant`
  MODIFY `id_ens` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `id_etudiant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `matiere`
--
ALTER TABLE `matiere`
  MODIFY `id_matiere` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `notes`
--
ALTER TABLE `notes`
  MODIFY `id_note` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `personne`
--
ALTER TABLE `personne`
  MODIFY `id_personne` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `personne_phys`
--
ALTER TABLE `personne_phys`
  MODIFY `id_phys` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `res_etude`
--
ALTER TABLE `res_etude`
  MODIFY `id_res` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `suivre`
--
ALTER TABLE `suivre`
  MODIFY `id_etudiant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `directeur`
--
ALTER TABLE `directeur`
  ADD CONSTRAINT `directeur_ibfk_1` FOREIGN KEY (`id_dir`) REFERENCES `personne_phys` (`id_phys`) ON DELETE CASCADE;

--
-- Contraintes pour la table `ecole`
--
ALTER TABLE `ecole`
  ADD CONSTRAINT `ecole_ibfk_1` FOREIGN KEY (`id_ecole`) REFERENCES `personne` (`id_personne`) ON DELETE CASCADE,
  ADD CONSTRAINT `ecole_ibfk_2` FOREIGN KEY (`id_directeur`) REFERENCES `directeur` (`id_dir`) ON DELETE CASCADE;

--
-- Contraintes pour la table `enseignant`
--
ALTER TABLE `enseignant`
  ADD CONSTRAINT `enseignant_ibfk_1` FOREIGN KEY (`id_ens`) REFERENCES `personne_phys` (`id_phys`) ON DELETE CASCADE;

--
-- Contraintes pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `etudiant_ibfk_1` FOREIGN KEY (`id_etudiant`) REFERENCES `personne_phys` (`id_phys`) ON DELETE CASCADE;

--
-- Contraintes pour la table `gerer`
--
ALTER TABLE `gerer`
  ADD CONSTRAINT `gerer_ibfk_1` FOREIGN KEY (`id_res`) REFERENCES `res_etude` (`id_res`) ON DELETE CASCADE,
  ADD CONSTRAINT `gerer_ibfk_2` FOREIGN KEY (`id_ecole`) REFERENCES `ecole` (`id_ecole`) ON DELETE CASCADE;

--
-- Contraintes pour la table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id_matiere`) ON DELETE CASCADE,
  ADD CONSTRAINT `notes_ibfk_2` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`) ON DELETE CASCADE;

--
-- Contraintes pour la table `personne_phys`
--
ALTER TABLE `personne_phys`
  ADD CONSTRAINT `personne_phys_ibfk_1` FOREIGN KEY (`id_phys`) REFERENCES `personne` (`id_personne`) ON DELETE CASCADE,
  ADD CONSTRAINT `personne_phys_ibfk_2` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`) ON DELETE CASCADE;

--
-- Contraintes pour la table `res_etude`
--
ALTER TABLE `res_etude`
  ADD CONSTRAINT `res_etude_ibfk_1` FOREIGN KEY (`id_res`) REFERENCES `personne_phys` (`id_phys`) ON DELETE CASCADE;

--
-- Contraintes pour la table `suivre`
--
ALTER TABLE `suivre`
  ADD CONSTRAINT `suivre_ibfk_1` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`) ON DELETE CASCADE,
  ADD CONSTRAINT `suivre_ibfk_2` FOREIGN KEY (`id_cours`) REFERENCES `cours` (`id_cours`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
