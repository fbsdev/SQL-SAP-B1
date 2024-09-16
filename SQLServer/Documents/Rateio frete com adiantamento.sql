DECLARE @DATAINI DATETIME
DECLARE @DATAFIM DATETIME

SET @DATAINI = '11/05/2015'
SET @DATAFIM = '11/05/2015'

SELECT
T4.FatherNum as FatherNum0,
T4.AcctName as FatherName0,
T3.FatherNum as FatherNum1,
T3.AcctName as FatherName1,
T1.AcctCode,
T2.AcctName, 
T2.ExportCode as GrupoCodigo,
T5.Name as GrupoOrdem,
T5.U_Descricao as GrupoDescricao,
T2.CfwRlvnt,
T2.Budget,
T0.DocEntry,
T1.LineNum,
T0.DocDate,
T0.CardCode,
T0.CardName,
( (SELECT TOP 1 A1.NfmName from ONFM A1 WHERE A1.AbsEntry = T0.Model) + ' / ' + T0.SeriesStr + ' / ' + CAST(T0.Serial AS VARCHAR) ) as 'Documento',
SUM(T1.[TotalSumSy]) + -- Total Produto
SUM(T1.[VatSum]) +     -- Soma Impostos (IPI, ST)
(SELECT ISNULL(SUM(B0.VatSum),0) FROM dbo.PCH13 B0 WHERE B0.DocEntry = T0.DocEntry and B0.LineNum = T1.LineNum) + -- Soma Impostos distribuidos (IPI, ST)
SUM(T1.DistribSum) -   -- Soma Frete, Seguro, Outros
ISNULL(((SUM(T1.[TotalSumSy]) / (max(T0.DocTotal) + max(T0.DpmAmnt) + max(T0.DiscSum))) * max(T0.DiscSum)),0) - -- Subtrai desconto (rateio por item)
ISNULL(((SUM(T1.[TotalSumSy]) / (max(T0.DocTotal) + max(T0.DpmAmnt) + max(T0.WTSum))) * max(T0.WTSum)),0) -- Subtrai impostos retidos (rateio por item)
as ValorTotal,
(SELECT SUM(TA0.DrawnSum) FROM PCH9 TA0 WHERE TA0.DocEntry = T0.DocEntry) as ValorAdiantado1,
max(T0.DpmAmnt) as ValorAdiantado3, 

-- Teste Adiantamento
round(

(max(T1.LineTotal) / (select sum(B0.LineTotal) from PCH1 B0 WHERE B0.DocEntry = T0.DocEntry) ) * max(T0.DpmAmnt)

,2) as ValorAdiantado,

-- Leitura se a nota foi devolvida
ISNULL((SELECT TOP 1 B0.DocTotal from ORPC B0
INNER JOIN RPC1 B1 ON B1.DocEntry = B0.DocEntry
WHERE B0.DocTotal <> 0 
and B1.BaseEntry = T0.DocEntry
and B0.SeqCode <> 1 -- Nao entra cancelamento
and B0.CANCELED = 'N' -- Não entra documento cancelado (Somente SAP 9.0)
and B1.BaseType = 18  -- Somente se existir origem
),0) as ValorDevolucao

FROM OPCH T0
INNER JOIN PCH1 T1 ON T1.DocEntry = T0.DocEntry AND T1.OpenSum > 0
INNER JOIN OACT T2 ON T2.AcctCode = T1.AcctCode
INNER JOIN OACT T3 ON T3.AcctCode = T2.FatherNum
INNER JOIN OACT T4 ON T4.AcctCode = T3.FatherNum
LEFT JOIN [@SIP_GRUPOC] T5 ON T5.Code = T2.ExportCode
WHERE 
(T0.DocTotal + T0.DpmAmnt) <>  0
and (T0.DocDate BETWEEN @DATAINI AND @DATAFIM )
and T0.DocEntry NOT IN (SELECT B1.BaseEntry FROM ORPC B0 INNER JOIN RPC1 B1 ON B1.DocEntry = B0.DocEntry WHERE B1.BaseEntry IS NOT NULL and B1.BaseType = 18 and B0.CANCELED = 'N' AND B0.SeqCode = 1) -- Nao entra nota cancelada ou devolvida
and T0.CANCELED = 'N' -- Não entra documento cancelado (Somente SAP 9.0)
GROUP BY
T4.FatherNum,
T4.AcctName,
T3.FatherNum,
T3.AcctName,
T1.AcctCode,
T2.AcctName, 
T2.ExportCode,
T5.Name,
T5.U_Descricao,
T2.CfwRlvnt,
T2.Budget,
T0.DocEntry,
T0.DocDate,
T0.CardCode,
T0.CardName,
T0.Model,
T0.SeriesStr,
T0.Serial,
T1.LineNum