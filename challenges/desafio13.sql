SELECT
  CASE WHEN p.idade <= 30 THEN 'Até 30 anos' WHEN p.idade BETWEEN 30
  AND 60 THEN 'Entre 31 e 60 anos' ELSE 'Maior de 60 anos' END AS faixa_etaria,
  COUNT(DISTINCT p.pessoa_usuaria_id) AS total_pessoas_usuarias,
  COUNT(f.pessoa_usuaria_id) AS total_favoritadas
FROM
  pessoa_usuaria AS p
  LEFT JOIN musica_favorita AS f ON p.pessoa_usuaria_id = f.pessoa_usuaria_id
GROUP BY
  faixa_etaria
ORDER BY
  faixa_etaria;