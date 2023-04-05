SELECT
  COUNT(musica_id) AS musicas_no_historico
FROM
  historico
WHERE
  pessoa_usuaria_id = 1;