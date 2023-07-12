SELECT
  COUNT(*) AS musicas_no_historico
FROM
  historico AS h
  INNER JOIN pessoa_usuaria AS pu ON h.pessoa_id = pu.pessoa_id
WHERE
  pu.nome_pessoa_usuaria = 'Barbara Liskov';
