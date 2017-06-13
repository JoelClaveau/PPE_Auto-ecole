DROP DATABASE IF EXISTS castellane2;

CREATE DATABASE IF NOT EXISTS castellane2;
USE castellane2;

 # -----------------------------------------------------------------------------
#       TABLE : ADMINISTATEUR
# -----------------------------------------------------------------------------
 Create table if not exists ADMIN
 (
 Identifiant varchar(255) not null,
 Nom varchar(255) null,
 Prenom varchar(255) null,
 MDP varchar(255) not null,
 Primary key (Identifiant))

# -----------------------------------------------------------------------------
#       TABLE : MOIS
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS MOIS
 (
   NumMOIS INT(11) NOT NULL ,
   ANNEE varchar(255) NULL , 
   PRIMARY KEY (NumMOIS)) 
 
 


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
   PRIMARY KEY (CODE_MODELE)) 

# -----------------------------------------------------------------------------
#       TABLE : EXAM
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EXAM
 (
   ID_EXAM int(11) NOT NULL  ,
   CODE_TYPE int(11) NOT NULL , 
   PRIMARY KEY (ID_EXAM)) 

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
   PRIMARY KEY (ID_EXAM,NumC) ) 

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
   PRIMARY KEY (NumC,ID_EXAM)) 
 
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
   PRIMARY KEY (CODE_MODELE)) 


# -----------------------------------------------------------------------------
#       TABLE : MODELE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS MODELE
 (
   CODE_MODELE int(11) NOT NULL Auto_Increment  ,
   NOM_MODELE CHAR(50) NULL  ,
   CYLINDRE float(11) NULL ,
   PRIMARY KEY (CODE_MODELE)) 

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
   PRIMARY KEY (NumVEHICULE)) 

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
   NumC int(11) NOT NULL Auto_Increment  ,
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
   PRIMARY KEY (NumC)) 
 
  # -----------------------------------------------------------------------------
#       TABLE : Etudiant
# -----------------------------------------------------------------------------

 Create TABLE IF NOT EXISTS ETUDIANT
 (
 NumC int(11) NOT NULL Auto_Increment,
 Niveau_Etude varchar(255) not null,
 PRIMARY KEY (NumC))
 
   # -----------------------------------------------------------------------------
#       TABLE : Etablissement
# -----------------------------------------------------------------------------

 Create TABLE IF NOT EXISTS ETABLISSEMENT
 (
 NumC int(11) NOT NULL Auto_Increment  ,
 Nom_Etablissement varchar(255) not null,
 Adresse_Etablissement varchar(255) not null,
 PRIMARY KEY (NumC))
 
 
  # -----------------------------------------------------------------------------
#       TABLE : Salarie
# -----------------------------------------------------------------------------

 Create TABLE IF NOT EXISTS SALARIE
 (
 NumC int(11) NOT NULL Auto_Increment  ,
 Nom_Entreprise varchar(255)  null,
 PRIMARY KEY (NumC))
 
 
 
# -----------------------------------------------------------------------------
#       TABLE : MONITEUR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS MONITEUR
 (
   NumMONITEUR int(11) NOT NULL  ,
   NOM CHAR(30) NULL  ,
   DATE_EMBAUCHE DATE NULL ,
   PRIMARY KEY (NumMONITEUR)) 

# -----------------------------------------------------------------------------
#       TABLE : LECON
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS LECON
 (
   NumLECON int(11) NOT NULL  ,
   DATE_LECON DATE NULL  ,
   HEURE_LECON CHAR(5) NULL  ,
   TARIF_HEURE CHAR(5) NULL , 
   PRIMARY KEY (NumLECON)) 
 

# -----------------------------------------------------------------------------
#       TABLE : ROULER
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ROULER
 (
   NumMOIS int(11) NOT NULL  ,
   NumVEHICULE INT(11) NOT NULL  ,
   Num_KM_PARCOURRUS_DANS_LE_MOIS INTEGER(8) NULL , 
   PRIMARY KEY (NumMOIS,NumVEHICULE)) 

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
   PRIMARY KEY (NumLECON,NumVEHICULE)) 

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
   PRIMARY KEY (NumLECON,NumC,NumMONITEUR,CODE_MODELE)) 
 
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
   PRIMARY KEY (NumLECON,DATE_HISTO)) 
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
	  
ALTER TABLE salarie
ADD CONSTRAINT FK_client_salarie
FOREIGN KEY (NumC) REFERENCES client(NumC) 
ON DELETE RESTRICT ON UPDATE RESTRICT
	  
ALTER TABLE etudiant 
ADD CONSTRAINT FK_client_etudiant 
FOREIGN KEY (NumC) REFERENCES client(NumC) 
ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE etablissement
ADD CONSTRAINT FK_etudiant_etablissemnt 
FOREIGN KEY (NumC) REFERENCES client (NumC) 
ON DELETE RESTRICT ON UPDATE RESTRICT;
	  

ALTER TABLE lecon ADD FOREIGN KEY (NumLECON) REFERENCES client (NumC);


drop trigger TI_ETUDIANT
-- Trigger d'insertion 
create trigger TI_ETUDIANT
after insert on ETUDIANT for each row
declare numrows INTEGER;
begin
select count(*) into numrows
     from CLIENT
     where
          :new.N°_CLIENT = CLIENT.N°_CLIENT;
     if 
          (
          numrows = 0 
          )
     then
          raise_application_error(
               -20002,
               'Impossible d''ajouter "ETUDIANT" car "CLIENT" n''existe pas.');
     end if;

end;
/

drop trigger TI_MOTO
-- Trigger d'insertion 
create trigger TI_MOTO
after insert on MOTO for each row
declare numrows INTEGER;
begin

     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de MOTO 
     -- s'il n'existe pas d'occurrence correspondante dans la table MODÉLE.

     select count(*) into numrows
     from MODÉLE
     where
          :new.CODE_MODÉLE = MODÉLE.CODE_MODÉLE;
     if 
          (
          numrows = 0 
          )
     then
          raise_application_error(
               -20002,
               'Impossible d''ajouter "MOTO" car "MODÉLE" n''existe pas.');
     end if;

end;
/

drop trigger TI_VOITURE
-- Trigger d'insertion 
create trigger TI_VOITURE
after insert on VOITURE for each row
declare numrows INTEGER;
begin

     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de VOITURE 
     -- s'il n'existe pas d'occurrence correspondante dans la table MODÉLE.

     select count(*) into numrows
     from MODÉLE
     where
          :new.CODE_MODÉLE = MODÉLE.CODE_MODÉLE;
     if 
          (
          numrows = 0 
          )
     then
          raise_application_error(
               -20002,
               'Impossible d''ajouter "VOITURE" car "MODÉLE" n''existe pas.');
     end if;

end;
/



drop trigger TI_SALARIÉ;

-- Trigger d'insertion 
create trigger TI_SALARIÉ
after insert on SALARIÉ for each row
declare numrows INTEGER;
begin

     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de SALARIÉ 
     -- s'il n'existe pas d'occurrence correspondante dans la table CLIENT.

     select count(*) into numrows
     from CLIENT
     where
          :new.N°_CLIENT = CLIENT.N°_CLIENT;
     if 
          (
          numrows = 0 
          )
     then
          raise_application_error(
               -20002,
               'Impossible d''ajouter "SALARIÉ" car "CLIENT" n''existe pas.');
     end if;

end;
/


drop trigger TI_ROULER;

-- Trigger d'insertion 
create trigger TI_ROULER
after insert on ROULER for each row
declare numrows INTEGER;
begin
 select count(*) into numrows
     from VÉHICULE
     where
          :new.N°VÉHICULE = VÉHICULE.N°VÉHICULE;
     if 
          (
          numrows = 0 
          )
     then
          raise_application_error(
               -20002,
               'Impossible d''ajouter "ROULER" car "VÉHICULE" n''existe pas.');
     end if;

end;
/


drop trigger TI_EXAM_CODE;

-- Trigger d'insertion 
create trigger TI_EXAM_CODE
after insert on EXAM_CODE for each row
declare numrows INTEGER;
begin

     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de EXAM_CODE 
     -- s'il n'existe pas d'occurrence correspondante dans la table EXAM.

     select count(*) into numrows
     from EXAM
     where
          :new.ID_EXAM = EXAM.ID_EXAM;
     if 
          (
          numrows = 0 
          )
     then
          raise_application_error(
               -20002,
               'Impossible d''ajouter "EXAM_CODE" car "EXAM" n''existe pas.');
     end if;
     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de EXAM_CODE 
     -- s'il n'existe pas d'occurrence correspondante dans la table CLIENT.

     select count(*) into numrows
     from CLIENT
     where
          :new.N°_CLIENT = CLIENT.N°_CLIENT;
     if 
          (
          numrows = 0 
          )
     then
          raise_application_error(
               -20002,
               'Impossible d''ajouter "EXAM_CODE" car "CLIENT" n''existe pas.');
     end if;

end;
/


drop trigger TI_EXAM_PERMIS;

-- Trigger d'insertion 
create trigger TI_EXAM_PERMIS
after insert on EXAM_PERMIS for each row
declare numrows INTEGER;
begin

     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de EXAM_PERMIS 
     -- s'il n'existe pas d'occurrence correspondante dans la table CLIENT.

     select count(*) into numrows
     from CLIENT
     where
          :new.N°_CLIENT = CLIENT.N°_CLIENT;
     if 
          (
          numrows = 0 
          )
     then
          raise_application_error(
               -20002,
               'Impossible d''ajouter "EXAM_PERMIS" car "CLIENT" n''existe pas.');
     end if;
     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de EXAM_PERMIS 
     -- s'il n'existe pas d'occurrence correspondante dans la table EXAM.

     select count(*) into numrows
     from EXAM
     where
          :new.ID_EXAM = EXAM.ID_EXAM;
     if 
          (
          numrows = 0 
          )
     then
          raise_application_error(
               -20002,
               'Impossible d''ajouter "EXAM_PERMIS" car "EXAM" n''existe pas.');
     end if;

end;
/

  
 
INSERT INTO admin ('Identifiant', 'Nom', 'Prenom', 'MDP') VALUES ('co', 'Terner', 'Coralie', 'mdp');

INSERT INTO admin ('Identifiant', 'Nom', 'Prenom', 'MDP') VALUES ('al', 'Azer', 'Alain', 'mdp');

INSERT INTO admin ('Identifiant','Nom', 'Prenom', 'MDP') VALUES ('ha', 'Losto', 'Harry', 'mdp');

INSERT INTO admin ('Identifiant', 'Nom', 'Prenom', 'MDP') VALUES ('jo', 'Orageux', 'Joel', 'mdp');

INSERT INTO admin ('Identifiant', 'Nom', 'Prenom', 'MDP') VALUES ('po', 'Popote', 'Hans', 'mdp');



INSERT INTO client ('Num','NOM' ,'PRENOM', 'DATE_N', 'TELEPHONE', 'DATE_INSCRIPTION','MDP','EMAIL', 'MODE_FACTURATION', 'ADRESSE', 'CODE', 'PERMIS') 
VALUES ('9','mathiousalem','mathiou','2017-06-01','787108974','2017-01-06','4552a9b58f12be4881a1efd372f713991c22c9e1','mathiousalem@gmail.com','Espece','Paris','Array','Array');

INSERT INTO client ('Num','NOM' ,'PRENOM', 'DATE_N', 'TELEPHONE', 'DATE_INSCRIPTION','MDP','EMAIL', 'MODE_FACTURATION', 'ADRESSE', 'CODE', 'PERMIS') 
VALUES ('10','Tictac','Jean','2000-06-14','0847436478','2017-06-20','f7e79ca8eb0b31ee4d5d6c181416667ffee528ed','tictac@gmail.com','Carte bancaire','Belgique','Array','Array');


INSERT INTO client ('Num','NOM' ,'PRENOM', 'DATE_N', 'TELEPHONE', 'DATE_INSCRIPTION','MDP','EMAIL', 'MODE_FACTURATION', 'ADRESSE', 'CODE', 'PERMIS') 
VALUES ('11','Balta','Bella','2017-06-22','05648465837','2017-05-10','b78b647728101ba462182b4c7e5b2ca57b9f5a99','Espece','Creteil','Array','Array');


INSERT INTO client ('Num','NOM' ,'PRENOM', 'DATE_N', 'TELEPHONE', 'DATE_INSCRIPTION','MDP','EMAIL', 'MODE_FACTURATION', 'ADRESSE', 'CODE', 'PERMIS') 
VALUES ('12','Chips','Fromage','2017-06-28','0627622757','2017-03-05','a924a6bad2bca34c9fa59916cdca897b0c9433ba','frofro@gmail.com','Carte bancaire','Champigny','Array','Array');



INSERT INTO modele ('CODE_MODELE', 'NOM_MODELE', 'CYLINDRE') VALUES ('1', 'Cliot phase 4', '4 cv'); 
INSERT INTO modele ('CODE_MODELE', 'NOM_MODELE', 'CYLINDRE') VALUES ('2', 'Clio phase 3', '4 cv');
INSERT INTO modele ('CODE_MODELE', 'NOM_MODELE', 'CYLINDRE') VALUES ('3', 'Peugeot 208', '4 cv');


INSERT INTO modele ('CODE_MODELE', 'NOM_MODELE', 'CYLINDRE') VALUES ('4', 'Suzuki ', '6');
INSERT INTO modele ('CODE_MODELE', 'NOM_MODELE', 'CYLINDRE') VALUES ('5', 'Yamaha', '6');
INSERT INTO modele ('CODE_MODELE', 'NOM_MODELE', 'CYLINDRE') VALUES ('6', 'KTM', '6');


INSERT INTO vehicule ('NumVEHICULE', 'CODE_MODELE', 'NumIMMATRICULATION', 'DATE_ACHAT', 'NB_KM_INITIAL') VALUES ('1', '1', 'AB-344-CA', '2017-04-16', '0');
INSERT INTO vehicule ('NumVEHICULE', 'CODE_MODELE', 'NumIMMATRICULATION', 'DATE_ACHAT', 'NB_KM_INITIAL') VALUES ('2', '2', 'AR-758-DE', '2016-03-06', '0');
INSERT INTO vehicule ('NumVEHICULE', 'CODE_MODELE', 'NumIMMATRICULATION', 'DATE_ACHAT', 'NB_KM_INITIAL') VALUES ('3', '3', 'FH-434-GT', '2017-06-04', '0');
INSERT INTO vehicule ('NumVEHICULE', 'CODE_MODELE', 'NumIMMATRICULATION', 'DATE_ACHAT', 'NB_KM_INITIAL') VALUES  ('4', '4', 'ZE-788-RT', '2016-02-16', '0');
INSERT INTO vehicule ('NumVEHICULE', 'CODE_MODELE', 'NumIMMATRICULATION', 'DATE_ACHAT', 'NB_KM_INITIAL') VALUES ('5', '5', 'SE-656-SZ', '2015-07-13', '0');
INSERT INTO vehicule ('NumVEHICULE', 'CODE_MODELE', 'NumIMMATRICULATION', 'DATE_ACHAT', 'NB_KM_INITIAL') VALUES ('6', '6', 'AZ-545-TR', '2017-04-02', '0');

INSERT INTO utiliser ('NumLECON', 'NumVEHICULE') VALUES ('40', '4');
INSERT INTO utiliser ('NumLECON', 'NumVEHICULE') VALUES  ('51', '5');
INSERT INTO utiliser ('NumLECON', 'NumVEHICULE') VALUES('51', '2');
INSERT INTO utiliser ('NumLECON', 'NumVEHICULE') VALUES('59', '6');

INSERT INTO voiture ('CODE_MODELE', 'Num_IMMATRICULATION', 'NOM_MODELE', 'ANNEE_MODELE' 'NB_KILOMETRE') VALUES ('1', 'AB-344-CA', 'Cliot phase 4', '2016-04-19', '40000');
INSERT INTO voiture ('CODE_MODELE', 'Num_IMMATRICULATION', 'NOM_MODELE', 'ANNEE_MODELE', 'NB_KILOMETRE') VALUES ('2', 'AR-758-DE', 'Clio phase 3', '2016-04-08', '36484'); 
INSERT INTO voiture ('CODE_MODELE', 'Num_IMMATRICULATION', 'NOM_MODELE', 'ANNEE_MODELE', 'NB_KILOMETRE') VALUES ('3', 'FH-434-GT', 'Peugeot 208', '2014-10-13', '60354');

INSERT INTO moto ('CODE_MODELE', 'CYLINDRE', 'PUISSANCE', 'NOM_MODELE', 'ANNEE_MODELE') VALUES ('3', '2', '6', 'Suzuki', '2017-06-11');
INSERT INTO moto ('CODE_MODELE', 'CYLINDRE', 'PUISSANCE', 'NOM_MODELE', 'ANNEE_MODEL') VALUES ('4', '2', '6', 'Yamaha', '2017-02-12');
INSERT INTO moto('CODE_MODELE', 'CYLINDRE', 'PUISSANCE', 'NOM_MODELE', 'ANNEE_MODELE') VALUES ('6', '2', '6', 'Ktm', '2016-09-11');


INSERT INTO mois ('NumMOIS', 'ANNEE') VALUES ('1', '2017');
INSERT INTO mois ('NumMOIS', 'ANNEE') VALUES ('2', '2017');
INSERT INTO mois ('NumMOIS', 'ANNEE') VALUES ('3', '2017');
INSERT INTO mois ('NumMOIS', 'ANNE') VALUES ('4', '2017');
INSERT INTO mois ('NumMOIS', 'ANNEE') VALUES ('5', '2017');
INSERT INTO mois ('NumMOIS', 'ANNEE') VALUES ('6', '2017');
INSERT INTO mois ('NumMOIS', 'ANNEE') VALUES ('7', '2017');
INSERT INTO mois ('NumMOIS', 'ANNEE') VALUES ('8', '2017');
INSERT INTO mois ('NumMOIS' ,'ANNEE') VALUES ('9', '2017');
INSERT INTO mois ('NumMOIS', 'ANNEE') VALUES ('10', '2017');
INSERT INTO mois ('NumMOIS', 'ANNEE') VALUES ('11', '2017');
INSERT INTO mois ('NumMOIS', 'ANNEE') VALUES ('12', '2017');

INSERT INTO rouler ('NumMOIS', 'NumVEHICULE', 'Num_KM_PARCOURRUS_DANS_LE_MOIS') VALUES ('1', '1', '435');
INSERT INTO rouler ('NumMOIS', 'NumVEHICULE', 'Num_KM_PARCOURRUS_DANS_LE_MOIS') VALUES ('3', '2', '565');
INSERT INTO rouler ('NumMOIS', 'NumVEHICULE', 'Num_KM_PARCOURRUS_DANS_LE_MOIS') VALUES ('7', '3', '4646');
INSERT INTO rouler ('NumMOIS', 'NumVEHICULE', 'Num_KM_PARCOURRUS_DANS_LE_MOIS') VALUES ('4', '4', '456');
INSERT INTO rouler ('NumMOIS', 'NumVEHICULE', 'Num_KM_PARCOURRUS_DANS_LE_MOIS') VALUES ('11', '5', '877');
INSERT INTO rouler ('NumMOIS', 'NumVEHICULE', 'Num_KM_PARCOURRUS_DANS_LE_MOIS') VALUES ('10', '6', '7878');

ALTER TABLE planning CHANGE 'DATE_HEURE_DEBUT' 'HEURE_DEBUT' TIME NULL DEFAULT NULL, CHANGE 'DATE_HEURE_FIN' 'DATE_COUR' DATE NULL DEFAULT NULL;

INSERT INTO planning ('NumLECON', 'NumC', 'NumMONITEUR', 'CODE_MODELE', 'HEURE_DEBUT', 'DATE_COUR') VALUES ('50', '9', '3', '3', '09:35:00', '2017-05-31');
INSERT INTO planning ('NumLECON', 'NumC', 'NumMONITEUR', 'CODE_MODELE', 'HEURE_DEBUT', 'DATE_COUR') VALUES ('58', '10', '5', '3', '07:01:00', '2017-05-31');

INSERT INTO exam ('ID_EXAM', 'CODE_TYPE') VALUES ('1');
INSERT INTO exam ('ID_EXAM', 'CODE_TYPE') VALUES ('2');
INSERT INTO exam ('ID_EXAM', 'CODE_TYPE') VALUES ('3');
INSERT INTO exam ('ID_EXAM', 'CODE_TYPE') VALUES ('4');


INSERT INTO exam_code ('ID_EXAM', 'NumC', 'DATE_C', 'HEURE_C', 'RESULTAT_C') VALUES ('1', '11', '2017-06-13', '09:00:00', NULL);
INSERT INTO exam_code ('ID_EXAM', 'NumC', 'DATE_C', 'HEURE_C', 'RESULTAT_C') VALUES ('2', '9', '2017-06-15', '08:00:00', NULL);

INSERT INTO exam_permis ('ID_EXAM', 'NumC', 'DATE_P','HEURE_P', 'RESULTAT_P')  VALUES ('3', '10', '2017-06-21', '13:00:00', NULL);
INSERT INTO exam_permis ('ID_EXAM', 'NumC', 'DATE_P','HEURE_P', 'RESULTAT_P')  VALUES ('4', '9', '2017-06-14', '07:00:00', NULL);

INSERT INTO etudiant ('NumC', 'Niveau_Etude') VALUES ('10', 'License');
INSERT INTO etudiant('NumC', 'Niveau_Etude') VALUES ('11', 'bts');


INSERT INTO salarie ('NumC', 'Nom_Entreprise') VALUES ('9', NULL);
INSERT INTO salarie ('NumC', 'Nom_Entreprise') VALUES ('12', 'normay');

ALTER TABLE etablissement DROP FOREIGN KEY FK_etudiant_etablissemnt; 
ALTER TABLE etablissement 
ADD CONSTRAINT FK_etudiant_etablissemnt FOREIGN KEY (NumEtudiant) REFERENCES etudiant(NumC) ON DELETE RESTRICT ON UPDATE RESTRICT;


INSERT INTO etablissement ('NumEtudiant', 'Nom_Etablissement', 'Adresse_Etablissement') VALUES ('10', 'Iris', '6-8 Impasse des 2 Cousins, 75017 Paris');
INSERT INTO etablissement ('NumEtudiant', 'Nom_Etablissement', 'Adresse_Etablissement') VALUES ('11', 'CocoloG', 'Guadeloupe');