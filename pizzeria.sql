DROP DATABASE IF EXISTS level1ex2;
CREATE DATABASE level1ex2;
USE level1ex2;

CREATE TABLE categories (
id_categoria INT AUTO_INCREMENT PRIMARY KEY,
nom_categoria VARCHAR(50)
);

INSERT INTO categories (nom_categoria) VALUES
('Margarita'),
('Pepperoni'),
('Quatre Formatges'),
('Hawaiana'),
('Vegetariana'),
('Barbacoa'),
('Marinera');

CREATE TABLE provincies (
id_provincia INT AUTO_INCREMENT PRIMARY KEY,
provincia VARCHAR(20)
);

INSERT INTO provincies (provincia) VALUES
('Barcelona'),
('Madrid'),
('València'),
('Sevilla'),
('Málaga'),
('Girona');

CREATE TABLE localitats (
id_localitat INT AUTO_INCREMENT PRIMARY KEY, 
localitat VARCHAR(30),
id_provincia INT,
FOREIGN KEY (id_provincia) REFERENCES provincies(id_provincia)
);

INSERT INTO localitats (localitat, id_provincia) VALUES
('Barcelona', 1),
('Hospitalet de Llobregat', 1),
('Madrid', 2),
('València', 3),
('Sevilla', 4),
('Málaga', 5),
('Girona', 6);

CREATE TABLE botiga  (
id_botiga INT AUTO_INCREMENT PRIMARY KEY,
adreça VARCHAR(100),
id_localitat INT,
FOREIGN KEY (id_localitat) REFERENCES localitats(id_localitat)
);

CREATE TABLE cuiners (
id_cuiner INT AUTO_INCREMENT PRIMARY KEY,
nom VARCHAR(25),
cognoms VARCHAR(25),
nif VARCHAR(10),
telefon VARCHAR(10),
id_botiga INT,
FOREIGN KEY (id_botiga) REFERENCES botiga (id_botiga)
);

CREATE TABLE repartidors (
id_repartidor INT AUTO_INCREMENT PRIMARY KEY,
nom VARCHAR(25),
cognoms VARCHAR(25),
nif VARCHAR(10),
telefon VARCHAR(10),
id_botiga INT,
FOREIGN KEY (id_botiga) REFERENCES botiga (id_botiga)
);

CREATE TABLE clients (
id_clients INT AUTO_INCREMENT PRIMARY KEY, 
nom VARCHAR(25),
cognoms VARCHAR (25),
adreça VARCHAR(100),
codi_postal VARCHAR(5),
telefon VARCHAR(10),
id_localitat INT,
FOREIGN KEY (id_localitat) REFERENCES localitats(id_localitat)
);

CREATE TABLE producte (
id_producte INT AUTO_INCREMENT PRIMARY KEY,
nom_producte VARCHAR(25) NOT NULL,
descripcio VARCHAR(255),
imatge VARCHAR(100),
preu DECIMAL(6,2)
);

CREATE TABLE pizzes (
id_pizza INT AUTO_INCREMENT PRIMARY KEY,
nom_pizza VARCHAR(50) NOT NULL,
descripcio VARCHAR(255),
imatge VARCHAR(100),
preu DECIMAL(6,2),
id_categoria INT,
FOREIGN KEY (id_categoria) REFERENCES categories (id_categoria)
);

CREATE TABLE comandes (
id_comanda INT AUTO_INCREMENT PRIMARY KEY,
dataihora DATETIME NOT NULL,
tipus_comanda VARCHAR(10),
preu_total DECIMAL(6,2),
id_clients INT,
id_botiga INT NOT NULL,
id_repartidor INT,
FOREIGN KEY (id_clients) REFERENCES clients (id_clients),
FOREIGN KEY (id_botiga) REFERENCES botiga (id_botiga),
FOREIGN KEY (id_repartidor) REFERENCES repartidors (id_repartidor)
);

CREATE TABLE comanda_producte (
id_comanda_producte INT AUTO_INCREMENT PRIMARY KEY,
id_comanda INT,
id_producte INT NULL,
id_pizza INT NULL,
quantitat INT,
FOREIGN KEY (id_comanda) REFERENCES comandes(id_comanda),
FOREIGN KEY (id_producte) REFERENCES producte (id_producte),
FOREIGN KEY (id_pizza) REFERENCES pizzes (id_pizza)
);

SELECT l.id_localitat, l.localitat, p.provincia
FROM localitats l
JOIN provincies p ON l.id_provincia = p.id_provincia;





