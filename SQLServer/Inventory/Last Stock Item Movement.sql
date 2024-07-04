-- 
-- Ultimo Movimento de Estoque
-- Last Stock Movement
-- 
DECLARE @DocDate DATETIME;

-- Data limite de movimentação (Movement deadline)
SET @DocDate = '2021-02-27';

SELECT 
G0.*
FROM (
	SELECT 
	DENSE_RANK() OVER (PARTITION BY T0.Itemcode ORDER BY T0.DocDate desc, T0.DocTime desc) as IndexDateTime,
	T0.*
	FROM OINM T0
	WHERE T0.DocDate <= @DocDate
) G0
WHERE G0.IndexDateTime = 1