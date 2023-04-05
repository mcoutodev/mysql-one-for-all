DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

use SpotifyClone;

CREATE TABLE artista (
  artista_id INT PRIMARY KEY auto_increment,
  nome VARCHAR(50) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE plano (
  plano_id INT PRIMARY KEY auto_increment,
  nome VARCHAR(50) NOT NULL,
  valor DOUBLE NOT NULL
) ENGINE = InnoDB;

CREATE TABLE album (
  album_id INT PRIMARY KEY auto_increment,
  nome VARCHAR(50),
  artista_id INT,
  ano_lancamento YEAR NOT NULL,
  FOREIGN KEY (artista_id) REFERENCES artista (artista_id)
) ENGINE = InnoDB;

CREATE TABLE musica (
  musica_id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  artista_id INT,
  album_id INT,
  duracao_segundos INT NOT NULL,
  FOREIGN KEY (artista_id) REFERENCES artista (artista_id),
  FOREIGN KEY (album_id) REFERENCES album (album_id)
) ENGINE = InnoDB;

CREATE TABLE pessoa_usuaria (
  pessoa_usuaria_id INT PRIMARY KEY auto_increment,
  nome VARCHAR(50) NOT NULL,
  idade INT NOT NULL,
  plano_id INT NOT NULL,
  data_assinatura DATE NOT NULL,
  FOREIGN KEY (plano_id) REFERENCES plano (plano_id)
) ENGINE = InnoDB;

CREATE TABLE historico (
  musica_id INT,
  pessoa_usuaria_id INT,
  data_reproducao datetime NOT NULL,
  CONSTRAINT PRIMARY KEY(musica_id, pessoa_usuaria_id),
  FOREIGN KEY (musica_id) REFERENCES musica (musica_id),
  FOREIGN KEY (pessoa_usuaria_id) REFERENCES pessoa_usuaria (pessoa_usuaria_id)
) ENGINE = InnoDB;

CREATE TABLE seguindo_artista (
  pessoa_usuaria_id INT,
  artista_id INT,
  CONSTRAINT PRIMARY KEY (pessoa_usuaria_id, artista_id),
  FOREIGN KEY (pessoa_usuaria_id) REFERENCES pessoa_usuaria (pessoa_usuaria_id),
  FOREIGN KEY (artista_id) REFERENCES artista (artista_id)
) ENGINE = InnoDB;

INSERT INTO
  artista (nome)
VALUES
  ('Baco Exu do Blues'),
  ('Beyoncé'),
  ('Blind Guardian'),
  ('Elis Regina'),
  ('Nina Simone'),
  ('Queen');

INSERT INTO
  plano (nome, valor)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99),
  ('pessoal', 6.99);

INSERT INTO
  album (nome, artista_id, ano_lancamento)
VALUES
  ('Renaissance', 2, '2022'),
  ('Jazz', 6, '1978'),
  ('Hot Space', 6, '1982'),
  ('Falso Brilhante', 4, '1998'),
  ('Vento de Maio', 4, '2001'),
  ('QVVJFA?', 1, '2003'),
  ('Somewhere Far Beyond', 3, '2007'),
  ('I Put A Spell On You', 5, '2012');

INSERT INTO
  musica (nome, artista_id, album_id, duracao_segundos)
VALUES
  ('ALIEN SUPERSTAR', 2, 1, 116),
  ('BREAK MY SOUL', 2, 1, 279),
  ('Don’t Stop Me Now', 6, 2, 203),
  ('Feeling Good', 5, 8, 100),
  (
    'O Medo de Amar é o Medo de Ser Livre',
    4,
    5,
    207
  ),
  ('Samba em Paris', 1, 6, 267),
  ('The Bard’s Song', 3, 7, 244),
  ('Under Pressure', 6, 3, 152),
  ('VIRGO’S GROOVE', 2, 1, 369),
  ('Como Nossos Pais', 4, 4, 105);

INSERT INTO
  pessoa_usuaria (nome, idade, plano_id, data_assinatura)
VALUES
  ('Barbara Liskov', 82, 1, '2019-10-20'),
  ('Robert Cecil Martin', 58, 1, '2017-01-06'),
  ('Ada Lovelace', 37, 2, '2017-12-30'),
  ('Martin Fowler', 46, 2, '2017-01-17'),
  ('Sandi Metz', 58, 2, '2018-04-29'),
  ('Paulo Freire', 19, 3, '2018-02-14'),
  ('Bell Hooks', 26, 3, '2018-01-05'),
  ('Christopher Alexander', 85, 4, '2019-06-05'),
  ('Judith Butler', 45, 4, '2020-05-13'),
  ('Jorge Amado', 58, 4, '2017-02-17');

INSERT INTO
  historico (musica_id, pessoa_usuaria_id, data_reproducao)
VALUES
  (3, 7, '2011-12-15 22:30:49'),
  (3, 8, '2012-03-17 14:56:41'),
  (1, 10, '2015-12-13 08:30:22'),
  (5, 6, '2017-01-24 00:31:17'),
  (2, 6, '2017-10-12 12:35:20'),
  (5, 2, '2020-01-02 07:40:33'),
  (4, 1, '2020-03-06 11:22:33'),
  (9, 1, '2020-05-02 05:30:35'),
  (8, 5, '2020-08-06 15:23:43'),
  (4, 3, '2020-11-13 16:55:13'),
  (9, 3, '2020-12-05 18:38:30'),
  (6, 4, '2021-08-15 17:10:10'),
  (6, 5, '2022-01-09 01:44:33'),
  (7, 9, '2022-02-24 21:14:22'),
  (6, 1, '2022-02-28 10:45:55'),
  (4, 2, '2022-08-05 08:05:17');

INSERT INTO
  seguindo_artista (pessoa_usuaria_id, artista_id)
VALUES
  (1, 2),
  (1, 6),
  (1, 4),
  (2, 2),
  (2, 4),
  (3, 6),
  (4, 1),
  (5, 3),
  (5, 5),
  (6, 5),
  (6, 2),
  (7, 5),
  (9, 4),
  (10, 6);