SELECT
  p.nome_pessoa_usuaria AS pessoa_usuaria,
  COUNT(h.cancao_id) AS musicas_ouvidas,
  ROUND(SUM(c.duracao_segundos / 60), 2) AS total_minutos
FROM
  pessoa_usuaria p
  INNER JOIN historico h ON p.pessoa_id = h.pessoa_id
  INNER JOIN cancoes c ON h.cancao_id = c.cancao_id
GROUP BY
  p.nome_pessoa_usuaria
ORDER BY
  p.nome_pessoa_usuaria ASC;
