DROP TABLE if EXISTS Places_disponibles;
DROP TABLE if EXISTS Est_de_couleur;
DROP TABLE if EXISTS Voyage;
DROP TABLE if EXISTS Appartient;
DROP TABLE if EXISTS Propose;
DROP TABLE if EXISTS Ville;
DROP TABLE if EXISTS Voiture;
DROP TABLE if EXISTS Marque;
DROP TABLE if EXISTS CouleurVoiture;
DROP TABLE if EXISTS Trajet;
DROP TABLE if EXISTS Habitant;

CREATE TABLE Habitant(
   Id_Habitant INT AUTO_INCREMENT,
   Nom VARCHAR(50),
   Prenom VARCHAR(50),
   Age INT,
   PRIMARY KEY(Id_Habitant)
);

CREATE TABLE Trajet(
   Id_Trajet INT AUTO_INCREMENT,
   HeureDepart TIME,
   HeureArrivee TIME,
   PRIMARY KEY(Id_Trajet)
);

CREATE TABLE CouleurVoiture(
   Id_Couleur INT AUTO_INCREMENT,
   LibelleCouleur VARCHAR(50),
   PRIMARY KEY(Id_Couleur)
);

CREATE TABLE Marque(
   Id_Marque INT AUTO_INCREMENT,
   LibelleMarque VARCHAR(50),
   PRIMARY KEY(Id_Marque)
);

CREATE TABLE Voiture(
   Id_Voiture INT AUTO_INCREMENT,
   NombrePlaces INT,
   Id_Marque INT NOT NULL,
   PRIMARY KEY(Id_Voiture),
   FOREIGN KEY(Id_Marque) REFERENCES Marque(Id_Marque)
);

CREATE TABLE Ville(
   Id_Ville INT AUTO_INCREMENT,
   VilleDepart VARCHAR(50),
   VilleArrivee VARCHAR(50),
   Id_Voiture INT NOT NULL,
   PRIMARY KEY(Id_Ville),
   FOREIGN KEY(Id_Voiture) REFERENCES Voiture(Id_Voiture)
);

CREATE TABLE Propose(
   Id_Ville INT,
   Id_Habitant INT,
   PRIMARY KEY(Id_Ville, Id_Habitant),
   FOREIGN KEY(Id_Ville) REFERENCES Ville(Id_Ville),
   FOREIGN KEY(Id_Habitant) REFERENCES Habitant(Id_Habitant)
);

CREATE TABLE Appartient(
   Id_Habitant INT,
   Id_Voiture INT,
   PRIMARY KEY(Id_Habitant, Id_Voiture),
   FOREIGN KEY(Id_Habitant) REFERENCES Habitant(Id_Habitant),
   FOREIGN KEY(Id_Voiture) REFERENCES Voiture(Id_Voiture)
);

CREATE TABLE Voyage(
   Id_Ville INT,
   Id_Arrivee INT,
   PRIMARY KEY(Id_Ville, Id_Arrivee),
   FOREIGN KEY(Id_Ville) REFERENCES Ville(Id_Ville),
   FOREIGN KEY(Id_Arrivee) REFERENCES Trajet(Id_Trajet)
);

CREATE TABLE Est_de_couleur(
   Id_Voiture INT,
   Id_Couleur INT,
   PRIMARY KEY(Id_Voiture, Id_Couleur),
   FOREIGN KEY(Id_Voiture) REFERENCES Voiture(Id_Voiture),
   FOREIGN KEY(Id_Couleur) REFERENCES CouleurVoiture(Id_Couleur)
);

CREATE TABLE Places_disponibles(
   Id_Voiture INT,
   Id_Arrivee INT,
   PRIMARY KEY(Id_Voiture, Id_Arrivee),
   FOREIGN KEY(Id_Voiture) REFERENCES Voiture(Id_Voiture),
   FOREIGN KEY(Id_Arrivee) REFERENCES Trajet(Id_Trajet)
);

INSERT INTO Habitant(Id_Habitant, Nom, Prenom, Age) VALUES
(1, 'BERNARD', 'Malcolm', 39),
(2, 'CHAVEAUX', 'Emma', 21),
(3, 'PRETTOT', 'Mael', 67),
(4, 'BOISSENIN', 'Nicolas', 35),
(5, 'PEQUIGNOT', 'Guillaume', 24),
(6, 'ZILLIOX', 'Elina', 19),
(7, 'MONNIER', 'Robin', 44),
(8, 'BRISCHOUX', 'Gabriel', 52),
(9, 'DUVAL', 'Noemie', 28);

INSERT INTO Trajet(Id_Trajet, HeureDepart, HeureArrivee) VALUES
(1, '17:35', '18:20'),
(2, '13:40', '15:30'),
(3, '07:15', '08:00'),
(4, '08:20', '09:40'),
(5, '11:20', '12:40'),
(6, '13:20', '14:20'),
(7, '14:40', '15:00'),
(8, '18:00', '18:45'),
(9, '13:55', '14:05');

INSERT INTO CouleurVoiture(Id_Couleur, LibelleCouleur) VALUES
(1, 'Blanche'),
(2, 'Grise'),
(3, 'Bleu'),
(4, 'Rouge'),
(5, 'Noire'),
(6, 'Kaki'),
(7, 'Jaune moutarde'),
(8, 'Pastèle'),
(9, 'Rose-Rouge');

INSERT INTO Marque(Id_Marque, LibelleMarque) VALUES
(1, 'Fiat Multiplat'),
(2, 'VolksWagen Golf'),
(3, 'Peugeot 208'),
(4, 'Toyota Yaris'),
(5, 'Citroen DS3'),
(6, 'Skoda Octavia'),
(7, 'Ford Fiesta'),
(8, 'BMW Classe A'),
(9, 'Peugeot 5008');

INSERT INTO Voiture(Id_Voiture, NombrePlaces, Id_Marque) VALUES
(1, 3, 1),
(2, 3, 2),
(3, 2, 3),
(4, 3, 4),
(5, 2, 5),
(6, 4, 6),
(7, 3, 7),
(8, 3, 8),
(9, 6, 9);

INSERT INTO Ville(Id_Ville, VilleDepart, VilleArrivee, Id_Voiture) VALUES
(1, 'Belfort', 'Ballon Alsace', 1),
(2, 'Belfort', 'Strasbourg', 2),
(3, 'Vesoul', 'Belfort', 3),
(4, 'Belfort', 'Besançon', 4),
(5, 'Epinal', 'Belfort', 5),
(6, 'Belfort', 'Colmar', 6),
(7, 'Montbéliard', 'Belfort', 7),
(8, 'Mulhouse', 'Belfort', 8),
(9, 'Belfort', 'Andelnans', 9);

INSERT INTO Appartient(Id_Habitant, Id_Voiture) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9);

INSERT INTO Voyage(Id_Ville, Id_Arrivee) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9);

INSERT INTO Est_de_couleur(Id_Voiture, Id_Couleur) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9);

INSERT INTO Places_disponibles(Id_Voiture, Id_Arrivee) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9);

#SELECT * FROM Habitant;
#SELECT * FROM Trajet;
#SELECT * FROM CouleurVoiture;
#SELECT * FROM Marque;
#SELECT * FROM Voiture;
#SELECT * FROM Ville;
#SELECT * FROM Propose;
#SELECT * FROM Appartient;
#SELECT * FROM Voyage;
#SELECT * FROM Est_de_couleur;
#SELECT * FROM Places_disponibles;

SELECT Age FROM Habitant
WHERE Age <= '40'
ORDER BY Age ASC;

SELECT Nom, Prenom FROM Habitant