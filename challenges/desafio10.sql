USE SpotifyClone;

CREATE TABLE musica_favorita (
  pessoa_usuaria_id INT,
  musica_id INT,
  CONSTRAINT PRIMARY KEY (pessoa_usuaria_id, musica_id),
  FOREIGN KEY (pessoa_usuaria_id) REFERENCES pessoa_usuaria (pessoa_usuaria_id),
  FOREIGN KEY (musica_id) REFERENCES musica (musica_id)
) ENGINE = InnoDB;

INSERT INTO
  musica_favorita (pessoa_usuaria_id, musica_id)
VALUES
  (1, 1),
  (1, 10),
  (1, 4),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 5),
  (4, 3),
  (5, 4),
  (5, 9),
  (8, 3),
  (9, 5),
  (10, 1);