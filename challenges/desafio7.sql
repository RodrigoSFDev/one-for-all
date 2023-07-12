SELECT
  a.nome_artista AS artista,
  al.album AS album,
  COUNT(s.artista_id) AS pessoas_seguidoras
FROM
  artistas AS a
  INNER JOIN albuns AS al ON a.artista_id = al.artista_id
  LEFT JOIN seguindo AS s ON a.artista_id = s.artista_id
GROUP BY
  a.artista_id, al.album
ORDER BY
  COUNT(s.artista_id) DESC, a.nome_artista, al.album;
