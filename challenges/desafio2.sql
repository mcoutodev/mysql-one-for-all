SELECT
  COUNT(DISTINCT mus.musica_id) AS cancoes,
  COUNT(DISTINCT art.artista_id) AS artistas,
  COUNT(DISTINCT alb.album_id) AS albuns
FROM
  musica AS mus,
  artista AS art,
  album AS alb;