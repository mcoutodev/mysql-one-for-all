SELECT
  p.nome AS pessoa_usuaria,
  COUNT(h.musica_id) AS musicas_ouvidas,
  ROUND(SUM(duracao_segundos / 60), 2) AS total_minutos
FROM
  pessoa_usuaria AS p
  INNER JOIN historico AS h ON p.pessoa_usuaria_id = h.pessoa_usuaria_id
  INNER JOIN musica AS m ON m.musica_id = h.musica_id
GROUP BY
  p.nome
ORDER BY
  p.nome;