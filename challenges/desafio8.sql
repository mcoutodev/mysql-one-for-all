SELECT
  art.nome AS artista,
  alb.nome AS album
FROM
  artista AS art
  INNER JOIN album AS alb ON alb.artista_id = art.artista_id
WHERE
  art.nome = 'Elis Regina';