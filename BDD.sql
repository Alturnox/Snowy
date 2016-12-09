#mysql -u hvicaire -h serveurmysql -p2506 BDD_hvicaire
DROP TABLE  IF EXISTS paniers,commandes, produits, users, typeProduits, etats;

-- --------------------------------------------------------
-- Structure de la table typeproduits
--
CREATE TABLE IF NOT EXISTS typeProduits (
  id int(10) NOT NULL,
  libelle varchar(50) DEFAULT NULL,
  PRIMARY KEY (id)
)  DEFAULT CHARSET=utf8;

-- Contenu de la table typeproduits
INSERT INTO typeProduits (id, libelle) VALUES
(1, 'Ski'),
(2, 'Chaussure de Ski'),
(3, 'Snowboard'),
(4, 'Boots de Snowboard'),
(5, 'Veste'),
(6, 'Pantalon'),
(7, 'Casque'),
(8, 'Gants'),
(9, 'Accessoires');


-- --------------------------------------------------------
-- Structure de la table etats

CREATE TABLE IF NOT EXISTS etats (
  id int(11) NOT NULL AUTO_INCREMENT,
  libelle varchar(20) NOT NULL,
  PRIMARY KEY (id)
) DEFAULT CHARSET=utf8 ;

-- Contenu de la table etats
INSERT INTO etats (id, libelle) VALUES
(1, 'A préparer'),
(2, 'Expédié');

-- --------------------------------------------------------
-- Structure de la table produits

CREATE TABLE IF NOT EXISTS produits (
  id int(10) NOT NULL AUTO_INCREMENT,
  typeProduit_id int(10) DEFAULT NULL,
  nom varchar(50) DEFAULT NULL,
  prix float(6,2) DEFAULT NULL,
  photo varchar(50) DEFAULT NULL,
  dispo tinyint(4) NOT NULL,
  stock int(11) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_produits_typeProduits FOREIGN KEY (typeProduit_id) REFERENCES typeProduits (id)
) DEFAULT CHARSET=utf8 ;

-- Contenu de la table produits
INSERT INTO produits (id,typeProduit_id,nom,prix,photo,dispo,stock) VALUES
(NULL ,1, 'Rossignol Soul7','450','Ski_Soul7.jpeg',1,5),
(NULL ,1, 'Rossignol Hero LT','799.99','Ski_HeroLT.jpeg',1,4),
(NULL ,1, 'Dynastar Cham107', '359.99','Ski_DynastarCham107.jpg',1,5),
(NULL ,1, 'Faction Prodigy', '359.99','Ski_FactionProdigy.jpg',1,5),
(NULL ,1, 'K2 Marksman', '459.99','Ski_K2Marksman.jpg',1,5),
(NULL ,1, 'Line Blend', '289.99','Ski_LineBlend.jpg',1,5),
(NULL ,1, 'Line Chronic', '229.99','Ski_LineChronic.jpg',1,5),
(NULL ,1, 'Line Pandora', '419.99','Ski_LinePandora.jpg',1,5),
(NULL ,1, 'Rossignol Experience84', '629.99','Ski_RossignolExp84.jpg',1,5),
(NULL ,2, 'Dalbello Pantera 120', '399.99','Chaussure_DalbelloPanterra120.jpeg',1,5),
(NULL ,2, 'K2 BFC 100', '263.50','Chaussure_K2BFC100.jpg',1,5),
(NULL ,2, 'K2 Pinnacle 130', '569.95','Chaussure_K2Pinnacle130.jpg',1,5),
(NULL ,2, 'Lange LBE 130', '650.90','Chaussure_LangeLBE130.jpg',1,5),
(NULL ,2, 'Lange RX 100', '229.99','Chaussure_LangeRX100.jpg',1,5),
(NULL ,2, 'Lange XT 130', '548.99','Chaussure_LangeXT130.jpg',1,5),
(NULL ,2, 'Rossignol heroWorld Cup', '629.99','Chaussure_RossignolHeroWorldCup.jpg',1,5),
(NULL ,2, 'Rossignol Sensor 70', '199.99','Chaussure_RossignolSensor70.jpg',1,5),
(NULL ,3, 'Burton Family Tree','620','Snow_BurtonFamilyTree.jpeg',1,10),
(NULL ,3, 'Burton Descendant','265.40','Snow_BurtonDescendant.jpg',1,10),
(NULL ,3, 'Salomon Sight','340','Snow_SalomonSight.jpeg',0,0),
(NULL ,3, 'K2 BottleRocket','565','Snow_K2BottleRocket.jpg',0,0),
(NULL ,3, 'K2 Panoramic','949','Snow_K2Panoramic.jpg',0,0),
(NULL ,3, 'K2 Raygun','379','Snow_K2Raygun.jpg',0,0),
(NULL ,4, 'Burton WebSlinger','189','Boots_BurtonWebSlinger.jpg',0,0),
(NULL ,4, 'DC DarkShadow','146.50','Boots_DCDarkShadow.jpg',0,0),
(NULL ,4, 'Burton Invader','159.99','Boots_BurtonInvader.jpg',0,0),
(NULL ,4, 'Decade SL','259.90','Boots_DecadeSL.jpg',0,0),
(NULL ,4, 'Northwave Legend','189','Boots_NorthwaveLegend.jpg',0,0),
(NULL ,7, 'Picture Organic Creative Blue','95.99','Casque_PictureCreativeBlue.jpeg',1,23);



-- --------------------------------------------------------
-- Structure de la table user
-- valide permet de rendre actif le compte (exemple controle par email )

CREATE TABLE IF NOT EXISTS users (
  id int(11) NOT NULL AUTO_INCREMENT,
  email varchar(255) NOT NULL,
  password varchar(255) NOT NULL,
  login varchar(255) NOT NULL,
  nom varchar(255) NOT NULL,
  code_postal varchar(255) NOT NULL,
  ville varchar(255) NOT NULL,
  adresse varchar(255) NOT NULL,
  valide tinyint NOT NULL,
  droit varchar(255) NOT NULL,
  PRIMARY KEY (id)
) DEFAULT CHARSET=utf8;

-- Contenu de la table users
INSERT INTO users (id,login,password,email,valide,droit) VALUES
(1, 'admin', 'admin', 'admin@gmail.com',1,'DROITadmin'),
(2, 'vendeur', 'vendeur', 'vendeur@gmail.com',1,'DROITadmin'),
(3, 'client', 'client', 'client@gmail.com',1,'DROITclient'),
(4, 'client2', 'client2', 'client2@gmail.com',1,'DROITclient'),
(5, 'client3', 'client3', 'client3@gmail.com',1,'DROITclient');



-- --------------------------------------------------------
-- Structure de la table commandes
CREATE TABLE IF NOT EXISTS commandes (
  id int(11) NOT NULL AUTO_INCREMENT,
  user_id int(11) NOT NULL,
  prix float(6,2) NOT NULL,
  date_achat date NOT NULL,
  etat_id int(11) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_commandes_users FOREIGN KEY (user_id) REFERENCES users (id),
  CONSTRAINT fk_commandes_etats FOREIGN KEY (etat_id) REFERENCES etats (id)
) DEFAULT CHARSET=utf8 ;

-- Contenu de la table commandes
insert into commandes values(null,1,30,'02-12-1997',1);


-- --------------------------------------------------------
-- Structure de la table paniers
CREATE TABLE IF NOT EXISTS paniers (
  id int(11) NOT NULL AUTO_INCREMENT,
  quantite int(11) NOT NULL,
  prix float(6,2) NOT NULL,
  dateAjoutPanier timestamp default CURRENT_TIMESTAMP,
  user_id int(11) NOT NULL,
  produit_id int(11) NOT NULL,
  commande_id int(11) DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_paniers_users FOREIGN KEY (user_id) REFERENCES users (id),
  CONSTRAINT fk_paniers_produits FOREIGN KEY (produit_id) REFERENCES produits (id),
  CONSTRAINT fk_paniers_commandes FOREIGN KEY (commande_id) REFERENCES commandes (id)
) DEFAULT CHARSET=utf8 ;

-- Contenu de la table paniers
insert into paniers(id,quantite,prix,dateAjoutPanier,user_id,produit_id,commande_id) values (1,2,30,null,1,1,1);