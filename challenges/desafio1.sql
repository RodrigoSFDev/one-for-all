DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

CREATE TABLE planos 
(
    id_plano INT PRIMARY KEY AUTO_INCREMENT,
    nome_do_plano VARCHAR(512),
    valor VARCHAR(512)
);

INSERT INTO planos (id_plano, nome_do_plano, valor) VALUES 
('1', 'gratuito', '0'),
('2', 'familiar', '7,99'),
('3', 'universitário', '5,99'),
('4', 'pessoal', '6,99');

CREATE TABLE pessoa_usuaria 
(
    pessoa_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_pessoa_usuaria VARCHAR(512),
    idade INT,
    id_plano INT,
    data_assinatura VARCHAR(512),
    FOREIGN KEY (id_plano) REFERENCES planos (id_plano)
);

INSERT INTO pessoa_usuaria (nome_pessoa_usuaria, idade, data_assinatura, id_plano) VALUES
('Barbara Liskov', 82, '2019-10-20', 1),
('Robert Cecil Martin', 58, '2017-01-06', 1),
('Ada Lovelace', 37, '2017-12-30', 2),
('Martin Fowler', 46, '2017-01-17', 2),
('Sandi Metz', 58, '2018-04-29', 2),
('Paulo Freire', 19, '2018-02-14', 3),
('Bell Hooks', 26, '2018-01-05', 3),
('Christopher Alexander', 85, '2019-06-05', 4),
('Judith Butler', 45, '2020-05-13', 4),
('Jorge Amado', 58, '2017-02-17', 4);


CREATE TABLE artistas 
(
    artista_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_artista VARCHAR(512)
);

INSERT INTO artistas (artista_id, nome_artista) VALUES 
('1', 'Beyoncé'),
('2', 'Queen'),
('3', 'Elis Regina'),
('4', 'Baco Exu do Blues'),
('5', 'Blind Guardian'),
('6', 'Nina Simone');

CREATE TABLE albuns 
(
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    album VARCHAR(512),
    artista_id INT,
    ano_lancamento INT,
    FOREIGN KEY (artista_id) REFERENCES artistas (artista_id)
);

INSERT INTO albuns (album_id, album, artista_id, ano_lancamento) VALUES 
('1', 'Renaissance', '1', '2022'),
('2', 'Jazz', '2', '1978'),
('3', 'Hot Space', '2', '1982'),
('4', 'Falso Brilhante', '3', '1998'),
('5', 'Vento de Maio', '3', '2001'),
('6', 'QVVJFA?', '4', '2003'),
('7', 'Somewhere Far Beyond', '5', '2007'),
('8', 'I Put A Spell On You', '6', '2012');

CREATE TABLE cancoes 
(
    cancao_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_cancao VARCHAR(512),
    artista_id INT,
    album_id INT,
    duracao_segundos INT,
    FOREIGN KEY (artista_id) REFERENCES artistas (artista_id),
    FOREIGN KEY (album_id) REFERENCES albuns (album_id)
);

INSERT INTO cancoes (cancao_id, nome_cancao, artista_id, album_id, duracao_segundos) VALUES 
('1', "BREAK MY SOUL", '1', '1', '279'),
('2', "VIRGO'S GROOVE", '1', '1', '369'),
('3', "ALIEN SUPERSTAR", '1', '1', '116'),
('4', "Don't Stop Me Now", '2', '2', '203'),
('5', "Under Pressure", '2', '3', '152'),
('6', "Como Nossos Pais", '3', '4', '105'),
('7', "O Medo de Amar é o Medo de Ser Livre", '3', '5', '207'),
('8', "Samba em Paris", '4', '6', '267'),
('9', "The Bard's Song", '5', '7', '244'),
('10', 'Feeling Good', '6', '8', '100');

CREATE TABLE historico
(
    pessoa_id INT,
    cancao_id INT,
    data_reproducao DATETIME,
    PRIMARY KEY (pessoa_id, cancao_id),
    FOREIGN KEY (pessoa_id) REFERENCES pessoa_usuaria (pessoa_id),
    FOREIGN KEY (cancao_id) REFERENCES cancoes (cancao_id)
);

INSERT INTO historico (pessoa_id, cancao_id, data_reproducao) VALUES 
('1', '8', '2022-02-28 10:45:55'),
('1', '2', '2020-05-02 05:30:35'),
('1', '10', '2020-03-06 11:22:33'),
('2', '10', '2022-08-05 08:05:17'),
('2', '7', '2020-01-02 07:40:33'),
('3', '10', '2020-11-13 16:55:13'),
('3', '2', '2020-12-05 18:38:30'),
('4', '8', '2021-08-15 17:10:10'),
('5', '8', '2022-01-09 01:44:33'),
('5', '5', '2020-08-06 15:23:43'),
('6', '7', '2017-01-24 00:31:17'),
('6', '1', '2017-10-12 12:35:20'),
('7', '4', '2011-12-15 22:30:49'),
('8', '4', '2012-03-17 14:56:41'),
('9', '9', '2022-02-24 21:14:22'),
('10', '3', '2015-12-13 08:30:22');

CREATE TABLE seguindo (
    pessoa_id INT,
    artista_id INT,
    PRIMARY KEY (pessoa_id, artista_id),
    FOREIGN KEY (pessoa_id) REFERENCES pessoa_usuaria (pessoa_id),
    FOREIGN KEY (artista_id) REFERENCES artistas (artista_id)
);


INSERT INTO seguindo (pessoa_id, artista_id) VALUES 
('1', '1'),
('1', '2'),
('1', '3'),
('2', '1'),
('2', '3'),
('3', '2'),
('4', '4'),
('5', '5'),
('5', '6'),
('6', '6'),
('6', '1'),
('7', '6'),
('9', '3'),
('10', '2');
