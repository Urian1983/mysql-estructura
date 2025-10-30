DROP DATABASE IF EXISTS optica;
CREATE DATABASE optica;
USE optica;

CREATE TABLE adreça (
    id_adreça INT AUTO_INCREMENT PRIMARY KEY,
    carrer VARCHAR(50) NOT NULL,
    numero VARCHAR(3) NOT NULL,
    porta VARCHAR(1),
    pis DECIMAL(2,1),
    poblacio VARCHAR(50),
    codi_postal VARCHAR(10) NOT NULL,
    pais VARCHAR(50)
);

INSERT INTO adreça (carrer, numero, porta, pis, poblacio, codi_postal, pais)
VALUES
('Carrer Major', '12', 'A', 1.0, 'Madrid', '08001', 'Espanya'),
('Carrer Sant Jordi', '5', 'B', 2.0, 'Malaga', '08002', 'Espanya'),
('Carrer Pau Claris', '20', NULL, 0.0, 'Barcelona', '08003', 'Espanya');

CREATE TABLE proveidor (
    id_proveidor INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
	nif VARCHAR(9) NOT NULL,
    telefon VARCHAR(9) NOT NULL,
    fax VARCHAR(9),
	id_adreça INT,
    FOREIGN KEY (id_adreça) REFERENCES adreça(id_adreça)
);

INSERT INTO proveidor (nom, nif, telefon, fax, id_adreça)
VALUES
('OpticPro', 'B12345678', '933123456', '933123457', 1),
('VisionCorp', 'B23456789', '933223456', '933223457', 2),
('Lentillas S.A.', 'B34567890', '933323456', '933323457', 3);

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

-- Consultes

SELECT c.nom AS client, COUNT(u.id_ulleres) AS total_factures
FROM clients c
JOIN ulleres u ON u.id_empleat = c.id_empleats
WHERE c.id_clients = 1  -- 🔹 Canvia pel client que vols
  AND c.registre BETWEEN '2025-01-01' AND '2025-12-31'
GROUP BY c.id_clients;

SELECT DISTINCT u.marca, u.model
FROM ulleres u
JOIN empleats e ON u.id_empleat = e.id_empleats
WHERE e.id_empleats = 1
  AND YEAR(u.id_ulleres) = 2025;

SELECT DISTINCT p.nom AS proveidor
FROM ulleres u
JOIN proveidor p ON u.id_proveidor = p.id_proveidor;

