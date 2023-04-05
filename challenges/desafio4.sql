SELECT
  p.nome AS pessoa_usuaria,
  IF(
    MAX(h.data_reproducao) > '2021-01-01 00:00:00',
    'Ativa',
    'Inativa'
  ) AS status_pessoa_usuaria
FROM
  pessoa_usuaria AS p
  INNER JOIN historico AS h ON p.pessoa_usuaria_id = h.pessoa_usuaria_id
GROUP BY
  pessoa_usuaria
ORDER BY
  pessoa_usuaria;