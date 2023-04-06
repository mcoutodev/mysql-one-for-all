SELECT
  a.nome AS album,
  COUNT(f.musica_id) AS favoritadas
FROM
  album AS a
  INNER JOIN musica AS m ON a.album_id = m.album_id
  INNER JOIN musica_favorita AS f ON m.musica_id = f.musica_id
GROUP BY
  a.nome
ORDER BY
  favoritadas DESC,
  album
LIMIT
  3;