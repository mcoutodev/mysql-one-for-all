SELECT
  art.nome AS artista,
  CASE WHEN COUNT(mfa.musica_id) >= 5 THEN 'A' WHEN COUNT(mfa.musica_id) BETWEEN 3
  AND 5 THEN 'B' WHEN COUNT(mfa.musica_id) BETWEEN 1
  AND 3 THEN 'C' ELSE '-' END AS ranking
FROM
  artista AS art
  INNER JOIN album AS alb ON art.artista_id = alb.artista_id
  INNER JOIN musica AS mus ON alb.album_id = mus.album_id
  LEFT JOIN musica_favorita AS mfa ON mus.musica_id = mfa.musica_id
GROUP BY
  art.nome
ORDER BY
  COUNT(mfa.musica_id) DESC,
  art.nome;