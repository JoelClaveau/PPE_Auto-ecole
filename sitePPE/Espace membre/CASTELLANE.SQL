DROP DATABASE IF EXISTS CASTELLANE;

CREATE DATABASE IF NOT EXISTS CASTELLANE;
USE CASTELLANE;

 # -----------------------------------------------------------------------------
#       TABLE : ADMINISTATEUR
# -----------------------------------------------------------------------------
 Create table if not exists ADMIN
 (
 Identifiant varchar(255)not null,
 Nom char(255) null,
 Prenom char(255)null,
 MDP varchar(255)null,
 Primary key (Identifiant) )

# -----------------------------------------------------------------------------
#       TABLE : MOIS
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS MOIS
 (
   NumMOIS INT(11) NOT NULL ,
   ANNEE varchar(255) NULL , 
   PRIMARY KEY (NumMOIS) 
 ) 

# -----------------------------------------------------------------------------
#       TABLE : MOTO
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS MOTO
 (
   CODE_MODELE int(11) NOT NULL Auto_Increment  ,
   CYLINDRE CHAR(10) NULL  ,
   PUISSANCE CHAR(10) NULL  ,
   NOM_MODELE CHAR(50) NULL  ,
   ANNEE_MODELE DATE NULL  ,
   PRIMARY KEY (CODE_MODELE) 
 ) 

# -----------------------------------------------------------------------------
#       TABLE : EXAM
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EXAM
 (
   ID_EXAM int(11) NOT NULL  ,
   CODE_TYPE int(11) NOT NULL , 
   PRIMARY KEY (ID_EXAM) 
 ) 

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EXAM
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_EXAM_TYPE_EXAM
     ON EXAM (CODE_TYPE ASC);

# -----------------------------------------------------------------------------
#       TABLE : EXAM_CODE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EXAM_CODE
 (
   ID_EXAM int(11) NOT NULL  ,
   NumC INT(11) NOT NULL  ,
   DATE_C DATE NULL  ,
   HEURE_C TIME NULL  ,
   RESULTAT_C CHAR(15) NULL , 
   PRIMARY KEY (ID_EXAM,NumC) 
 ) 

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EXAM_CODE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_EXAM_CODE_EXAM
     ON EXAM_CODE (ID_EXAM ASC);

CREATE  INDEX I_FK_EXAM_CODE_CLIENT
     ON EXAM_CODE (NumC ASC);

# -----------------------------------------------------------------------------
#       TABLE : EXAM_PERMIS
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EXAM_PERMIS
 (
 ID_EXAM INT(20) NOT NULL  ,
   NumC INT(11) NOT NULL  ,
   DATE_P DATE NULL  ,
   HEURE_P TIME NULL  ,
   RESULTAT_P CHAR(15) NULL , 
   PRIMARY KEY (NumC,ID_EXAM) 
 ) 
 
# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EXAM_PERMIS
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_EXAM_PERMIS_CLIENT
     ON EXAM_PERMIS (NumC ASC);

CREATE  INDEX I_FK_EXAM_PERMIS_EXAM
     ON EXAM_PERMIS (ID_EXAM ASC);

# -----------------------------------------------------------------------------
#       TABLE : VOITURE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS VOITURE
 (
   CODE_MODELE int(11) NOT NULL Auto_Increment  ,
   Num_IMMATRICULATION CHAR(40) NULL,
   NOM_MODELE CHAR(50) NULL  ,
   ANNEE_MODELE DATE NULL , 
   NB_KILOMETRE INT (11) NULL,
   PRIMARY KEY (CODE_MODELE) 
 ) 


# -----------------------------------------------------------------------------
#       TABLE : MODELE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS MODELE
 (
   CODE_MODELE int(11) NOT NULL Auto_Increment  ,
   NOM_MODELE CHAR(50) NULL  ,
   CYLINDRE float(11) NULL ,
   PRIMARY KEY (CODE_MODELE) 
 ) 

# -----------------------------------------------------------------------------
#       TABLE : VEHICULE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS VEHICULE
 (
   NumVEHICULE int(11) NOT NULL Auto_Increment  ,
   CODE_MODELE int(11) NOT NULL   ,
   NumIMMATRICULATION CHAR(20) NULL  ,
   DATE_ACHAT DATE NULL  ,
   NB_KM_INITIAL INTEGER(8) NULL , 
   PRIMARY KEY (NumVEHICULE) 
 ) 

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE VEHICULE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_VEHICULE_MODELE
     ON VEHICULE (CODE_MODELE ASC);

# -----------------------------------------------------------------------------
#       TABLE : CLIENT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CLIENT
 (
   NumC int(11) NOT NULL  ,
   NOM CHAR(30) NOT NULL  ,
   PRENOM CHAR(30) NOT NULL  ,
   DATE_N DATE NULL  ,
   TELEPHONE INT(11) NULL  ,
   DATE_INSCRIPTION DATE NULL  ,
   MDP VARCHAR(255) NULL ,
   EMAIL VARCHAR(255) NOT NULL ,
   MODE_FACTURATION CHAR(30) NULL, 
   ADRESSE varchar(255),
   CODE boolean,
   PERMIS boolean,
   PRIMARY KEY (NumC) 
 ) 
 
# -----------------------------------------------------------------------------
#       TABLE : MONITEUR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS MONITEUR
 (
   NumMONITEUR int(11) NOT NULL  ,
   NOM CHAR(30) NULL  ,
   DATE_EMBAUCHE DATE NULL ,
   PRIMARY KEY (NumMONITEUR) 
 ) 

# -----------------------------------------------------------------------------
#       TABLE : LECON
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS LECON
 (
   NumLECON int(11) NOT NULL  ,
   DATE_LECON DATE NULL  ,
   HEURE_LECON CHAR(5) NULL  ,
   TARIF_HEURE CHAR(5) NULL , 
   PRIMARY KEY (NumLECON) 
 ) 
 

# -----------------------------------------------------------------------------
#       TABLE : ROULER
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ROULER
 (
   NumMOIS int(11) NOT NULL  ,
   NumVEHICULE INT(11) NOT NULL  ,
   Num_KM_PARCOURRUS_DANS_LE_MOIS INTEGER(8) NULL , 
   PRIMARY KEY (NumMOIS,NumVEHICULE) 
 ) 

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE ROULER
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_ROULER_MOIS
     ON ROULER (NumMOIS ASC);

CREATE  INDEX I_FK_ROULER_VEHICULE
     ON ROULER (NumVEHICULE ASC);

# -----------------------------------------------------------------------------
#       TABLE : UTILISER
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS UTILISER
 (
   NumLECON int(11) NOT NULL  ,
   NumVEHICULE INTEGER(10) NOT NULL,
   PRIMARY KEY (NumLECON,NumVEHICULE) 
 ) 

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE UTILISER
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_UTILISER_LECON
     ON UTILISER (NumLECON ASC);

CREATE  INDEX I_FK_UTILISER_VEHICULE
     ON UTILISER (NumVEHICULE ASC);

# -----------------------------------------------------------------------------
#       TABLE : PLANNING
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PLANNING
 (
   NumLECON int(11) NOT NULL  ,
   NumC INT(11) NOT NULL  ,
   NumMONITEUR INT(11) NOT NULL  ,
   CODE_MODELE INT(11) NOT NULL  ,
   DATE_HEURE_DEBUT DATETIME NULL  ,
   DATE_HEURE_FIN DATETIME NULL , 
   PRIMARY KEY (NumLECON,NumC,NumMONITEUR,CODE_MODELE) 
 ) 
 
# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PLANNING
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_PLANNING_LECON
     ON PLANNING (NumLECON ASC);

CREATE  INDEX I_FK_PLANNING_CLIENT
     ON PLANNING (NumC ASC);

CREATE  INDEX I_FK_PLANNING_MONITEUR
     ON PLANNING (NumMONITEUR ASC);

CREATE  INDEX I_FK_PLANNING_MODELE
     ON PLANNING (CODE_MODELE ASC);

# -----------------------------------------------------------------------------
#       TABLE : H_NumLECON_LECON
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS H_NumLECON_LECON
 (
   NumLECON INTEGER(2) NOT NULL ,
   DATE_HISTO DATE NOT NULL , 
   PRIMARY KEY (NumLECON,DATE_HISTO) 
 ) 
 comment = "Table d'historisation des modifications de la table LECON";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE H_NumLECON_LECON
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_H_NumLECON_LECON_LECON
     ON H_NumLECON_LECON (NumLECON ASC);


# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------



ALTER TABLE MOTO 
  ADD FOREIGN KEY (CODE_MODELE)
      REFERENCES MODELE (CODE_MODELE) ;



ALTER TABLE VOITURE 
  ADD FOREIGN KEY FK_VOITURE_MODELE (CODE_MODELE)
      REFERENCES MODELE (CODE_MODELE) ;



ALTER TABLE VEHICULE 
  ADD FOREIGN KEY FK_VEHICULE_MODELE (CODE_MODELE)
      REFERENCES MODELE (CODE_MODELE) ;


ALTER TABLE ROULER 
  ADD FOREIGN KEY FK_ROULER_MOIS (NumMOIS)
      REFERENCES MOIS (NumMOIS) ;


ALTER TABLE ROULER 
  ADD FOREIGN KEY FK_ROULER_VEHICULE (NumVEHICULE)
      REFERENCES VEHICULE (NumVEHICULE) ;


ALTER TABLE EXAM_CODE 
  ADD FOREIGN KEY FK_EXAM_CODE_EXAM (ID_EXAM)
      REFERENCES EXAM (ID_EXAM) ;


ALTER TABLE EXAM_CODE 
  ADD FOREIGN KEY FK_EXAM_CODE_CLIENT (Numc)
      REFERENCES CLIENT (NumC) ;


ALTER TABLE UTILISER 
  ADD FOREIGN KEY FK_UTILISER_LECON (NumLECON)
      REFERENCES LECON (NumLECON) ;


ALTER TABLE UTILISER 
  ADD FOREIGN KEY FK_UTILISER_VEHICULE (NumVEHICULE)
      REFERENCES VEHICULE (NumVEHICULE) ;


ALTER TABLE PLANNING 
  ADD FOREIGN KEY FK_PLANNING_LECON (NumLECON)
      REFERENCES LECON (NumLECON) ;


ALTER TABLE PLANNING 
  ADD FOREIGN KEY FK_PLANNING_CLIENT (Numc)
      REFERENCES CLIENT (Numc) ;


ALTER TABLE PLANNING 
  ADD FOREIGN KEY FK_PLANNING_MONITEUR (NumMONITEUR)
      REFERENCES MONITEUR (NumMONITEUR) ;


ALTER TABLE PLANNING 
  ADD FOREIGN KEY FK_PLANNING_MODELE (CODE_MODELE)
      REFERENCES MODELE (CODE_MODELE) ;


ALTER TABLE EXAM_PERMIS 
  ADD FOREIGN KEY FK_EXAM_PERMIS_CLIENT (Numc)
      REFERENCES CLIENT (Numc) ;


ALTER TABLE EXAM_PERMIS 
  ADD FOREIGN KEY FK_EXAM_PERMIS_EXAM (ID_EXAM)
      REFERENCES EXAM (ID_EXAM) ;


ALTER TABLE H_NumLECON_LECON 
  ADD FOREIGN KEY FK_H_NumLECON_LECON_LECON (NumLECON)
      REFERENCES LECON (NumLECON) ;
	  

	ALTER TABLE lecon ADD FOREIGN KEY (NumLECON) REFERENCES client (NumC);
  

