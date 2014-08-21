SELECT 
	t1.*,
	CAST('<xml>'+camposTabla2.x+'</xml>' AS VARCHAR(max)) AS camposTabla2,
FROM tabla1
OUTER APPLY(
	SELECT 
		*
	FROM tabla2 AS t2
	WHERE t1.id = t2.id
	FOR XML RAW
) AS camposTabla2(x)