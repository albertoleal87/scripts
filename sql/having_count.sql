SELECT 
	campoTabla1,
	COUNT(campoTabla1) AS cuantos
FROM tabla1
GROUP BY campoTabla1 
HAVING COUNT(campoTabla1) > 1