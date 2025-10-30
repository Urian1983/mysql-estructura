DROP DATABASE IF EXISTS Pizzeria;
CREATE DATABASE Pizzeria;
USE Pizzeria;

CREATE TABLE category (
id_category INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
name_category VARCHAR(50)
);

INSERT INTO category (name_category) VALUES
('Margarita'),
('Pepperoni'),
('Quatre Formatges'),
('Hawaiana'),
('Vegetariana'),
('Barbacoa'),
('Marinera');

CREATE TABLE province (
id_province INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
province_name VARCHAR(20) NOT NULL
);

INSERT INTO province (province_name) VALUES
('Barcelona'),
('Madrid'),
('València'),
('Sevilla'),
('Málaga'),
('Girona');

CREATE TABLE town (
id_town INT AUTO_INCREMENT PRIMARY KEY NOT NULL, 
town_name VARCHAR(30) NOT NULL,
postal_code VARCHAR(5) NOT NULL,
id_province INT NOT NULL,
FOREIGN KEY (id_province) REFERENCES province(id_province)
);

INSERT INTO town (town_name, postal_code, id_province) VALUES
('Barcelona', '08001', 1),
('Hospitalet de Llobregat', '08901', 1),
('Mataró', '08301', 1),
('Madrid', '28001', 2),
('Getafe', '28901', 2),
('València', '46001', 3),
('Torrent', '46900', 3),
('Sevilla', '41001', 4),
('Málaga', '29001', 5),
('Girona', '17001', 6);

CREATE TABLE shop  (
id_shop INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
address VARCHAR(100),
id_town INT,
FOREIGN KEY (id_town) REFERENCES town(id_town)
);

INSERT INTO shop (address, id_town) VALUES
('Carrer de la Pau 12', 1),
('Avinguda Diagonal 320', 1),
('Carrer Major 8', 2),
('Plaça de Cuba 22', 3),
('Calle Gran Vía 45', 4),
('Calle Toledo 88', 5),
('Avinguda del Port 14', 6),
('Carrer Sant Roc 55', 7),
('Avenida de la Constitución 120', 8),
('Calle Larios 25', 9);

CREATE TABLE worker (
id_worker INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
worker_name VARCHAR(25) NOT NULL,
worker_job ENUM('Repartidor','Cuiner'),
worker_surname VARCHAR(25),
nif VARCHAR(10),
telefon VARCHAR(10),
id_shop INT,
FOREIGN KEY (id_shop) REFERENCES shop (id_shop)
);

INSERT INTO worker (worker_name, worker_surname, worker_job, id_shop) VALUES
('Joan', 'Martínez', 'Repartidor', 1),
('Anna', 'Soler', 'Cuiner', 1),
('Marta', 'López', 'Repartidor', 2),
('Carles', 'Pérez', 'Cuiner', 2),
('David', 'Gil', 'Repartidor', 3),
('Laura', 'Hernández', 'Cuiner', 3),
('Pere', 'González', 'Repartidor', 4),
('Clara', 'López', 'Cuiner', 4),
('Víctor', 'Cano', 'Repartidor', 5),
('Isabel', 'Morales', 'Cuiner', 5),
('Raúl', 'Ortega', 'Repartidor', 6),
('Nerea', 'Gil', 'Cuiner', 6),
('Sandra', 'Domínguez', 'Repartidor', 7),
('Jordi', 'Ribas', 'Cuiner', 7),
('Teresa', 'Romero', 'Repartidor', 8),
('Antonio', 'Ruiz', 'Cuiner', 8),
('Patricia', 'Reyes', 'Repartidor', 9),
('Manuel', 'Navarro', 'Cuiner', 9),
('Xavi', 'Soler', 'Repartidor', 10),
('Carla', 'Puig', 'Cuiner', 10);

CREATE TABLE clients (
id_clients INT AUTO_INCREMENT PRIMARY KEY NOT NULL, 
name_client VARCHAR(25),
surname_client VARCHAR (25),
address VARCHAR(100),
postal_code VARCHAR(5),
telefon VARCHAR(10),
id_town INT,
FOREIGN KEY (id_town) REFERENCES town(id_town)
);

INSERT INTO clients (name_client, surname_client, address, postal_code, telefon, id_town) VALUES
('Laura', 'Martínez', 'Carrer de Sants 15', '08028', '600123456', 1),
('Pere', 'González', 'Carrer de Balmes 87', '08007', '600123457', 1),
('Clara', 'López', 'Carrer de Provença 321', '08025', '600123458', 1),
('David', 'Serrano', 'Carrer del Sol 18', '08901', '600123459', 2),
('María', 'Hernández', 'Calle Toledo 99', '28005', '600123460', 4),
('Jorge', 'Ramírez', 'Calle Serrano 144', '28006', '600123461', 4),
('Ana', 'Jiménez', 'Avenida del Oeste 34', '46001', '600123462', 6),
('Josep', 'Ferrer', 'Carrer de Colón 21', '46004', '600123463', 6),
('Lucía', 'Torres', 'Calle Betis 3', '41010', '600123464', 8),
('Antonio', 'Ruiz', 'Calle Feria 20', '41003', '600123465', 8),
('Isabel', 'Morales', 'Calle Granada 12', '29001', '600123466', 9),
('Manuel', 'Navarro', 'Paseo del Parque 30', '29016', '600123467', 9),
('Carla', 'Puig', 'Carrer de l''Argenteria 9', '17001', '600123468', 10),
('Jordi', 'Ribas', 'Carrer del Carme 45', '17002', '600123469', 10),
('Nerea', 'Gil', 'Calle Velázquez 200', '28006', '600123470', 4),
('Raúl', 'Ortega', 'Calle Princesa 78', '28008', '600123471', 4),
('Sandra', 'Domínguez', 'Carrer del Mar 56', '08003', '600123472', 1),
('Víctor', 'Cano', 'Carrer Urgell 33', '08011', '600123473', 1),
('Teresa', 'Romero', 'Avenida Andalucía 123', '41007', '600123474', 8),
('Pablo', 'Pérez', 'Calle Sevilla 88', '29004', '600123475', 9),
('Marta', 'Benítez', 'Calle Madrid 12', '46007', '600123476', 6),
('Óscar', 'Castro', 'Carrer d''Aragó 200', '08011', '600123477', 1),
('Beatriz', 'Santos', 'Calle Mayor 54', '28013', '600123478', 4),
('Daniel', 'Flores', 'Carrer Montjuïc 5', '08902', '600123479', 2),
('Sílvia', 'Pons', 'Carrer de Sant Pere 17', '17003', '600123480', 10),
('Ignasi', 'Alonso', 'Carrer Verdaguer 8', '17004', '600123481', 10),
('Patricia', 'Reyes', 'Calle del Carmen 33', '41002', '600123482', 8),
('Xavi', 'Soler', 'Carrer Casanova 88', '08011', '600123483', 1),
('Helena', 'Vidal', 'Carrer Pau Claris 110', '08010', '600123484', 1),
('Ricard', 'Font', 'Carrer de Girona 60', '08009', '600123485', 1);

CREATE TABLE product (
id_product INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
name_product VARCHAR(50) NOT NULL,
type_product ENUM ('Pizza','Burger','Drink'),
description VARCHAR(255),
image VARCHAR(100),
price DECIMAL(6,2),
id_category INT,
FOREIGN KEY (id_category) REFERENCES category (id_category)
);

INSERT INTO product (name_product, type_product, description, image, price, id_category) VALUES
('Pizza Margarita', 'Pizza', 'Pizza clásica con tomate, mozzarella y albahaca fresca', 'margarita.jpg', 8.50, 1),
('Pizza Pepperoni', 'Pizza', 'Tomate, mozzarella y pepperoni italiano', 'pepperoni.jpg', 9.50, 2),
('Pizza Quatre Formatges', 'Pizza', 'Mozzarella, gorgonzola, parmesano y emmental', '4formatges.jpg', 10.00, 3),
('Pizza Hawaiana', 'Pizza', 'Mozzarella, jamón cocido y piña natural', 'hawaiana.jpg', 9.00, 4),
('Pizza Vegetariana', 'Pizza', 'Tomate, mozzarella, pimientos, cebolla, champiñones y aceitunas', 'vegetariana.jpg', 9.20, 5),
('Pizza Barbacoa', 'Pizza', 'Carne picada, pollo, bacon, salsa barbacoa y mozzarella', 'barbacoa.jpg', 10.50, 6),
('Pizza Marinera', 'Pizza', 'Tomate, mozzarella, atún, gambas y mejillones', 'marinera.jpg', 10.80, 7),
('Burger Clásica', 'Burger', 'Ternera 180g, lechuga, tomate, queso cheddar y pan brioche', 'burger_classic.jpg', 7.90, NULL),
('Burger Barbacoa', 'Burger', 'Ternera, bacon, cheddar, cebolla caramelizada y salsa barbacoa', 'burger_bbq.jpg', 8.50, NULL),
('Burger Vegetariana', 'Burger', 'Hamburguesa vegetal con aguacate, tomate y cebolla morada', 'burger_veggie.jpg', 8.20, NULL),
('Burger Doble Queso', 'Burger', 'Doble carne, doble cheddar, pepinillos y mostaza', 'burger_double.jpg', 9.30, NULL),
('Burger Picante', 'Burger', 'Carne, jalapeños, cheddar y salsa chipotle', 'burger_spicy.jpg', 8.70, NULL),
('Refresco Cola', 'Drink', 'Bebida gaseosa sabor cola (33cl)', 'cola.jpg', 2.00, NULL),
('Refresco Limón', 'Drink', 'Bebida gaseosa sabor limón (33cl)', 'lemon.jpg', 2.00, NULL),
('Agua Mineral', 'Drink', 'Agua mineral natural sin gas (50cl)', 'agua.jpg', 1.50, NULL),
('Cerveza', 'Drink', 'Cerveza lager (33cl)', 'beer.jpg', 2.50, NULL),
('Cerveza sin alcohol', 'Drink', 'Cerveza sin alcohol (33cl)', 'beer_sin.jpg', 2.30, NULL),
('Vino Tinto', 'Drink', 'Copa de vino tinto de la casa', 'vino_tinto.jpg', 3.50, NULL),
('Vino Blanco', 'Drink', 'Copa de vino blanco afrutado', 'vino_blanco.jpg', 3.50, NULL),
('Refresco Naranja', 'Drink', 'Bebida gaseosa sabor naranja (33cl)', 'naranja.jpg', 2.00, NULL);

CREATE TABLE client_order (
id_client_order INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
dataihora DATETIME NOT NULL,
type_order ENUM('Delivery','Take Away'),
price_total DECIMAL(6,2),
id_clients INT NOT NULL,
id_shop INT NOT NULL,
id_worker INT NOT NUll,
FOREIGN KEY (id_clients) REFERENCES clients (id_clients),
FOREIGN KEY (id_shop) REFERENCES shop (id_shop),
FOREIGN KEY (id_worker) REFERENCES worker(id_worker)
);

CREATE TABLE order_product (
id_order_product INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
id_client_order INT NOT NULL,
id_product INT NULL,
amount INT,
price_product DECIMAL(6,2),
FOREIGN KEY (id_client_order) REFERENCES client_order(id_client_order),
FOREIGN KEY (id_product) REFERENCES product (id_product)
);

INSERT INTO client_order (dataihora, type_order, price_total, id_clients, id_shop, id_worker) VALUES
('2025-10-30 10:00:00', 'Delivery', 15.50, 1, 1, 1),
('2025-10-30 10:30:00', 'Take Away', 18.00, 2, 1, 2),
('2025-10-30 11:00:00', 'Delivery', 12.00, 3, 2, 3),
('2025-10-30 11:30:00', 'Take Away', 14.50, 4, 2, 4),
('2025-10-30 12:00:00', 'Delivery', 20.00, 5, 3, 5),
('2025-10-30 12:30:00', 'Take Away', 16.50, 6, 3, 6),
('2025-10-30 13:00:00', 'Delivery', 19.00, 7, 4, 7),
('2025-10-30 13:30:00', 'Take Away', 21.00, 8, 4, 8),
('2025-10-30 14:00:00', 'Delivery', 22.50, 9, 5, 9),
('2025-10-30 14:30:00', 'Take Away', 17.80, 10, 5, 10),
('2025-10-30 15:00:00', 'Delivery', 14.50, 11, 6, 11),
('2025-10-30 15:30:00', 'Take Away', 15.00, 12, 6, 12),
('2025-10-30 16:00:00', 'Delivery', 18.30, 13, 7, 13),
('2025-10-30 16:30:00', 'Take Away', 16.70, 14, 7, 14),
('2025-10-30 17:00:00', 'Delivery', 20.00, 15, 8, 15),
('2025-10-30 17:30:00', 'Take Away', 19.50, 16, 8, 16),
('2025-10-30 18:00:00', 'Delivery', 17.80, 17, 9, 17),
('2025-10-30 18:30:00', 'Take Away', 18.60, 18, 9, 18),
('2025-10-30 19:00:00', 'Delivery', 21.00, 19, 10, 19),
('2025-10-30 19:30:00', 'Take Away', 22.50, 20, 10, 20);

-- Consultes
SELECT COUNT(*) AS total_begudes
FROM order_product op
JOIN product p ON op.id_product = p.id_product
JOIN client_order co ON op.id_client_order = co.id_client_order
JOIN clients c ON co.id_clients = c.id_clients
WHERE p.type_product = 'drink'
  AND c.id_town = 1;  

SELECT w.worker_name, w.worker_surname, COUNT(co.id_client_order) AS total_comandes
FROM worker w
LEFT JOIN client_order co ON w.id_worker = co.id_worker
WHERE w.worker_name = 'Joan' AND w.worker_surname = 'Martínez'
GROUP BY w.id_worker;

