DROP DATABASE IF EXISTS krautundrueben;
CREATE DATABASE IF NOT EXISTS krautundrueben;
USE krautundrueben;

CREATE TABLE Ort(
    ort_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    plz INT,
    ort_name varchar(85)
);

CREATE TABLE Adresse(
    adresse_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    hausnummer VARCHAR(50),
    strasse VARCHAR(50),
    ort_id INT,
    FOREIGN KEY (ort_id) REFERENCES Ort(ort_id)
);

CREATE TABLE Kunde (
    kunden_nr INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    vorname varchar(50) NOT NULL,
    nachname varchar(50) NOT NULL,
    email varchar(50) NOT NULL,
    telefon varchar(13), 
    adresse_id INT,
    FOREIGN KEY (adresse_id) REFERENCES Adresse(adresse_id)
);

CREATE TABLE Lieferant (
    lieferanten_nr INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    telefon VARCHAR(13),
    email VARCHAR(50),
    lieferantenname VARCHAR(50),
);

CREATE TABLE Bestellung (
    bestellnummer INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    kunden_nr INT,
    lieferanten_nr INT,
    rezept_id INT,
    FOREIGN KEY (rezept_id) REFERENCES Rezepte(rezept_id),
    FOREIGN KEY (lieferanten_nr) REFERENCES Lieferant(lieferanten_nr),
    FOREIGN KEY (kunden_nr) REFERENCES Kunde(kunden_nr),
    bestelldatum DATE NOT NULL,
    rechnungsbetrag DECIMAL(10,2) NOT NULL
);

CREATE TABLE Rezepte(
    rezept_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    rezept_name VARCHAR(50),
    portiongroesse VARCHAR(50),
    zutaten_nr INT,
    FOREIGN KEY (zutaten_nr) REFERENCES Zutaten(zutaten_nr)
);

CREATE TABLE Ernährungskategorie(
    ernährungs_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ernährungsart VARCHAR(50)
);
CREATE TABLE RezepteZutaten (
rezept_id INT,
zutaten_nr INT, 
FOREIGN KEY rezept_id REFERENCES Rezepte(rezept_id),
FOREIGN KEY zutaten_nr REFERENCES Zutaten(zutaten_nr)
)

CREATE TABLE Allergien (
    allergie_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    allergiename VARCHAR(50)
);

CREATE TABLE Zutaten(
    PRIMARY KEY zutaten_nr INT(50) NOT NULL,
    menge VARCHAR(50),
    bezeichnung VARCHAR(50),
    bestand INT,
    nettopreis DECIMAL(10,2),
    lieferant VARCHAR(50),
    protein INT,
    kalorien INT,
    kohlenhydrate INT,
    einheit VARCHAR(50),
    ernährungs_id INT,
    FOREIGN KEY(ernährungs_id) REFERENCES Ernährungskategorie(ernährungs_id),
    allergie_id INT, 
    FOREIGN KEY (allergie_id) REFERENCES Allergien(allergie_id)
);