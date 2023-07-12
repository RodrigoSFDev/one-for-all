SELECT
  a.nome_artista AS artista,
  al.album AS album
FROM
  artistas AS a
  INNER JOIN albuns AS al ON a.artista_id = al.artista_id
WHERE
  a.nome_artista = 'Elis Regina'
ORDER BY
  al.album;
