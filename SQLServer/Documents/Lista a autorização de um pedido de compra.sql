-- Lista a autorização de um pedido de compra
-- 
-- Criação: 31/10/2024 - FBS
--

SELECT
T0.DocEntry,
T0.DocDate,
T0.CardCode,
T0.CardName,
T2.U_NAME AS 'Autor',
T3.Name AS 'Modelo',
T5.Name AS 'Etapa',
T6.U_NAME AS 'Autorizador',
CASE T4.Status 
	WHEN 'N' THEN 'Rejeitado'
	WHEN 'W' THEN 'Pendente'
	WHEN 'Y' THEN 'Aprovado'
END AS 'Resposta',
T4.UpdateDate,
T4.UpdateTime
FROM OPOR T0 -- Pedido de Compra
-- Cabeçalho da autorização
LEFT JOIN OWDD T1 ON T1.DocEntry = T0.DocEntry AND T0.ObjType = T0.ObjType AND T1.IsDraft = 'N'
LEFT JOIN OUSR T2 ON T2.USERID = T1.OwnerID
LEFT JOIN OWTM T3 ON T3.WtmCode = T1.WtmCode
-- Detalhes da autorização
LEFT JOIN WDD1 T4 ON T4.WddCode = T1.WddCode
LEFT JOIN OWST T5 ON T5.WstCode = T4.StepCode
LEFT JOIN OUSR T6 ON T6.USERID = T4.UserID
WHERE T0.DocEntry = 29986  -- <= Coloque aqui o pedido de compra por exemplo
ORDER BY T0.DocEntry, T4.SortId