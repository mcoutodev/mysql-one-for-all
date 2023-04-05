SELECT
  FORMAT(MIN(pl.valor), 2) AS faturamento_minimo,
  FORMAT(MAX(pl.valor), 2) AS faturamento_maximo,
  FORMAT(AVG(pl.valor), 2) AS faturamento_medio,
  FORMAT(SUM(pl.valor), 2) AS faturamento_total
FROM
  pessoa_usuaria AS pu
  INNER JOIN plano AS pl ON pu.plano_id = pl.plano_id;