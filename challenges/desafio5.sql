SELECT
  m.nome AS cancao,
  COUNT(h.musica_id) AS reproducoes
FROM
  musica AS m
  INNER JOIN historico AS h ON m.musica_id = h.musica_id
GROUP BY
  cancao
ORDER BY
  reproducoes DESC,
  cancao ASC
LIMIT
  2;