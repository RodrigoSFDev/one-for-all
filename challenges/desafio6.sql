SELECT
  ROUND(MIN(p.valor), 2) AS faturamento_minimo,
  ROUND(MAX(p.valor), 2) AS faturamento_maximo,
  ROUND(AVG(p.valor), 2) AS faturamento_medio,
  ROUND(SUM(p.valor), 2) AS faturamento_total
FROM
  pessoa_usuaria AS pu
  INNER JOIN planos AS p ON pu.id_plano = p.id_plano;
