DROP DATABASE IF EXISTS level2ex1;
CREATE DATABASE level2ex1;
USE level2ex1;

CREATE TABLE usuaris(
id_usuari INT AUTO_INCREMENT PRIMARY KEY,
clau_access VARCHAR(255),
nom_usuari VARCHAR(30),
data_naixament DATE,
sexe ENUM('Home','Dona','No binari'),
pais VARCHAR(40),
codi_postal VARCHAR(7)
);

CREATE TABLE videos(
id_video INT AUTO_INCREMENT PRIMARY KEY,
titol VARCHAR(100) NOT NULL,
descripcio TEXT,
grandaria VARCHAR(20),
nom_arxiu VARCHAR(255),
thumbnail VARCHAR(255),
num_reproduccions INT,
num_likes INT,
num_dislike INT,
estat ENUM('public','ocult','privat'),
id_usuari INT,
FOREIGN KEY (id_usuari) REFERENCES usuaris (id_usuari)
);

CREATE TABLE etiquetes (
id_etiqueta INT AUTO_INCREMENT PRIMARY KEY,
nom_etiqueta VARCHAR(50) NOT NULL
);

CREATE TABLE canals (
id_canal INT AUTO_INCREMENT PRIMARY KEY,
nom_canal VARCHAR(100) NOT NULL,
descripcio TEXT,
data_creacio DATETIME,
id_usuari INT,
FOREIGN KEY (id_usuari) REFERENCES usuaris (id_usuari)
);

CREATE TABLE playlists (
id_playlist INT AUTO_INCREMENT PRIMARY KEY,
nom_playlist VARCHAR(100) NOT NULL,
data_creacio DATETIME,
estat ENUM('publica','privada'),
id_usuari INT,
FOREIGN KEY (id_usuari) REFERENCES usuaris (id_usuari)
);

CREATE TABLE comentaris (
id_comentari INT AUTO_INCREMENT PRIMARY KEY,
text_comentari TEXT NOT NULL,
data_creacio DATETIME,
id_usuari INT,
id_video INT,
FOREIGN KEY (id_usuari) REFERENCES usuaris (id_usuari),
FOREIGN KEY (id_video) REFERENCES videos (id_video)
);

CREATE TABLE video_etiqueta(
id_video INT,
id_etiqueta INT,
PRIMARY KEY (id_video, id_etiqueta),
FOREIGN KEY (id_video) REFERENCES videos(id_video),
FOREIGN KEY (id_etiqueta) REFERENCES etiquetes(id_etiqueta)
);

CREATE TABLE suscripcions (
id_usuari INT,
id_canal INT,
PRIMARY KEY (id_usuari, id_canal),
FOREIGN KEY (id_usuari) REFERENCES usuaris(id_usuari),
FOREIGN KEY (id_canal) REFERENCES canals (id_canal)
);

CREATE TABLE reaccio_video(
id_usuari INT,
id_video INT,
PRIMARY KEY (id_usuari, id_video),
FOREIGN KEY (id_usuari) REFERENCES usuaris(id_usuari),
FOREIGN KEY (id_video) REFERENCES videos(id_video)
);

CREATE TABLE playlist_video(
id_playlist INT,
id_video INT,
PRIMARY KEY(id_playlist, id_video),
FOREIGN KEY(id_playlist) REFERENCES playlists(id_playlist), 
FOREIGN KEY (id_video) REFERENCES videos(id_video)
);

CREATE TABLE reaccio_comentari(
id_comentari INT,
id_usuari INT,
tipus ENUM ('like','dislike'),
dataihora DATETIME,
PRIMARY KEY (id_usuari, id_comentari),
FOREIGN KEY (id_usuari) REFERENCES usuaris(id_usuari),
FOREIGN KEY (id_comentari) REFERENCES comentaris(id_comentari)
);
