SELECT
  art.nome AS artista,
  alb.nome AS album,
  COUNT(seg.pessoa_usuaria_id) AS pessoas_seguidoras
FROM
  artista AS art
  INNER JOIN album AS alb ON art.artista_id = alb.album_id
  INNER JOIN seguindo_artista AS seg ON seg.artista_id = art.artista_id
GROUP BY
  artista,
  album
ORDER BY
  pessoas_seguidoras DESC,
  artista,
  album;