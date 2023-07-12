SELECT
  c.nome_cancao AS cancao,
  COUNT(h.pessoa_id) AS reproducoes
FROM
  cancoes c
  INNER JOIN historico h ON c.cancao_id = h.cancao_id
GROUP BY
  c.cancao_id
ORDER BY
  reproducoes DESC, cancao ASC
LIMIT 2;
