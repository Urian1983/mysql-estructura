DROP DATABASE IF EXISTS level1Ex1;
CREATE DATABASE level1Ex1;
USE level1Ex1;

CREATE TABLE adreça (
    id_adreça INT AUTO_INCREMENT PRIMARY KEY,
    carrer VARCHAR(50) NOT NULL,
    numero VARCHAR(3) NOT NULL,
    porta VARCHAR(1),
    pis DECIMAL(2,1),
    poblacio VARCHAR(50),
    codi_postal VARCHAR(10) NOT NULL,
    pais VARCHAR(50),
    telefon VARCHAR(9) NOT NULL,
    fax VARCHAR(9),
    nif VARCHAR(9) NOT NULL
);

INSERT INTO adreça (carrer, numero, porta, pis, poblacio, codi_postal, pais, telefon, fax, nif)
VALUES
('Carrer Major', '12', 'A', 1.0, 'Madrid', '08001', 'Espanya', '933123456', '933123457', 'B12345678'),
('Carrer Sant Jordi', '5', 'B', 2.0, 'Malaga', '08002', 'Espanya', '933223456', '933223457', 'B23456789'),
('Carrer Pau Claris', '20', NULL, 0.0, 'Barcelona', '08003', 'Espanya', '933323456', '933323457', 'B34567890');

CREATE TABLE proveidor (
    id_proveidor INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    id_adreça INT,
    FOREIGN KEY (id_adreça) REFERENCES adreça(id_adreça)
);

INSERT INTO proveidor (nom, id_adreça)
VALUES
('OpticPro', 1),
('VisionCorp', 2),
('Lentillas S.A.', 3);

CREATE TABLE empleats (
    id_empleats INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    id_adreça INT,
    FOREIGN KEY (id_adreça) REFERENCES adreça(id_adreça)
);

INSERT INTO empleats (nom, email, id_adreça)
VALUES
('Anna López', 'anna.lopez@email.com', 1),
('Jordi Martínez', 'jordi.martinez@email.com', 2),
('Laura Puig', 'laura.puig@email.com', 3);

CREATE TABLE clients (
    id_clients INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    id_adreça INT,
    email VARCHAR(50) NOT NULL,
    registre DATETIME,
    id_empleats INT,
    id_recomenat INT,
    FOREIGN KEY (id_adreça) REFERENCES adreça(id_adreça),
    FOREIGN KEY (id_empleats) REFERENCES empleats(id_empleats),
    FOREIGN KEY (id_recomenat) REFERENCES clients(id_clients)
);

INSERT INTO clients (nom, id_adreça, email, registre, id_empleats)
VALUES
('Marc Soler', 1, 'marc.soler@email.com', '2025-01-15 10:30:00', 1);

INSERT INTO clients (nom, id_adreça, email, registre, id_empleats, id_recomenat)
VALUES
('Clara Ruiz', 2, 'clara.ruiz@email.com', '2025-02-20 14:45:00', 2, 1),
('Pere Font', 3, 'pere.font@email.com', '2025-03-05 09:15:00', 3, 1);

CREATE TABLE ulleres (
    id_ulleres INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(20) NOT NULL,
    model VARCHAR(20) NOT NULL,
    graduacio_esquerra DECIMAL(5,2),
    graduacio_dreta DECIMAL(5,2),
    tipus_muntura VARCHAR(20),
    color_muntura VARCHAR(15),
    color_vidre VARCHAR(15),
    preu INT,
    id_proveidor INT,
    id_empleat INT NOT NULL,
    FOREIGN KEY (id_proveidor) REFERENCES proveidor(id_proveidor),
    FOREIGN KEY (id_empleat) REFERENCES empleats(id_empleats)
);

INSERT INTO ulleres (marca, model, graduacio_esquerra, graduacio_dreta, tipus_muntura, color_muntura, color_vidre, preu, id_proveidor, id_empleat)
VALUES
('Ray-Ban', 'RB123', 1.25, 1.50, 'pasta', 'negre', 'transparent', 120, 1, 1),
('Oakley', 'O456', 2.00, 2.25, 'metàl·lica', 'platejat', 'blau', 150, 2, 2),
('Prada', 'P789', 0.75, 0.75, 'flotant', 'd’or', 'verd', 200, 3, 3),
('Versace', 'V321', 1.50, 1.50, 'pasta', 'vermell', 'transparent', 180, 1, 1),
('Gucci', 'G654', 2.25, 2.00, 'metàl·lica', 'negre', 'groc', 220, 2, 2);







