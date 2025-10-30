DROP DATABASE IF EXISTS youtube;
CREATE DATABASE youtube;
USE youtube;

CREATE TABLE youtube_user(
id_youtube_user INT AUTO_INCREMENT PRIMARY KEY,
pass_word VARCHAR (255) NOT NULL,
name_user VARCHAR(30) NOT NULL,
birth_date DATE,
sex ENUM('Home','Dona','No binari'),
country VARCHAR(40),
postal_code VARCHAR(7)
);

CREATE TABLE video(
id_video INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(100) NOT NULL,
description TEXT,
file_size VARCHAR(20),
file_name VARCHAR(255),
thumbnail VARCHAR(255),
num_repro INT,
num_likes INT,
num_dislike INT,
state ENUM('public','ocult','privat'),
id_youtube_user INT,
FOREIGN KEY (id_youtube_user) REFERENCES youtube_user (id_youtube_user)
);

CREATE TABLE label (
id_label INT AUTO_INCREMENT PRIMARY KEY,
label_name VARCHAR(50) NOT NULL
);

CREATE TABLE youtube_channel (
id_youtube_channel INT AUTO_INCREMENT PRIMARY KEY,
youtube_channel_name VARCHAR(100) NOT NULL,
description TEXT,
creation_date DATETIME,
id_youtube_user INT,
FOREIGN KEY (id_youtube_user) REFERENCES youtube_user (id_youtube_user)
);

CREATE TABLE playlist (
id_playlist INT AUTO_INCREMENT PRIMARY KEY,
playlist_name VARCHAR(100) NOT NULL,
creation_date DATETIME,
state ENUM('publica','privada'),
id_youtube_user INT,
FOREIGN KEY (id_youtube_user) REFERENCES youtube_user (id_youtube_user)
);

CREATE TABLE youtube_comment (
id_youtube_comment INT AUTO_INCREMENT PRIMARY KEY,
text_youtube_comment VARCHAR(1000),
creation_date DATETIME,
id_youtube_user INT,
id_video INT,
FOREIGN KEY (id_youtube_user) REFERENCES youtube_user (id_youtube_user),
FOREIGN KEY (id_video) REFERENCES video (id_video)
);

CREATE TABLE video_label(
id_video INT,
id_label INT,
PRIMARY KEY (id_video, id_label),
FOREIGN KEY (id_video) REFERENCES video(id_video),
FOREIGN KEY (id_label) REFERENCES label(id_label)
);

CREATE TABLE suscription (
id_youtube_user INT,
id_youtube_channel INT,
PRIMARY KEY (id_youtube_user, id_youtube_channel),
FOREIGN KEY (id_youtube_user) REFERENCES youtube_user(id_youtube_user),
FOREIGN KEY (id_youtube_channel) REFERENCES youtube_channel (id_youtube_channel)
);

CREATE TABLE video_reaction(
id_youtube_user INT,
id_video INT,
likedislike ENUM('Like','Dislike'),
publication_date DATETIME,
PRIMARY KEY (id_youtube_user, id_video),
FOREIGN KEY (id_youtube_user) REFERENCES youtube_user(id_youtube_user),
FOREIGN KEY (id_video) REFERENCES video(id_video)
);

CREATE TABLE playlist_video(
id_playlist INT,
id_video INT,
PRIMARY KEY(id_playlist, id_video),
FOREIGN KEY(id_playlist) REFERENCES playlist(id_playlist), 
FOREIGN KEY (id_video) REFERENCES video(id_video)
);

CREATE TABLE comment_reaction(
id_youtube_comment INT,
id_youtube_user INT,
tipus ENUM ('like','dislike'),
dataihora DATETIME,
PRIMARY KEY (id_user, id_youtube_comment),
FOREIGN KEY (id_youtube_user) REFERENCES youtube_user(id_youtube_user),
FOREIGN KEY (id_youtube_comment) REFERENCES youtube_comment(id_youtube_comment)
);
