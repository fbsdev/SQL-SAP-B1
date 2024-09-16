SELECT 
	T0.[AbsEntry],
	T3.[DocEntry],
	T3.[NumAtCard],	
	T0.[PickDate], 
	T1.[PickStatus],	
	T2.[unitMsr], 
	T3.[CardCode], 
	T3.[CardName], 
	T2.[ItemCode], 
	T2.[Dscription], 
	T2.[SubCatNum], 
	T4.[CityS], 
	T4.[StateS], 
	T4.[TaxID0],
	T2.[ShipDate],
	( SELECT TOP 1 (ISNULL((SELECT TOP 1 T4.NfmName from ONFM T4 WHERE T4.AbsEntry = T7.Model),'') + ' / ' + T7.SeriesStr + ' / ' + CAST(T7.SERIAL AS VARCHAR) ) as 'Documento' from INV1 T6 INNER JOIN OINV T7 ON (T7.DocEntry = T6.DocEntry) WHERE T6.PickIdNo = T0.AbsEntry  ) as NumeroNF,	
	CASE T1.[PickStatus] 
	   WHEN 'Y' THEN (sum(T1.[PickQtty]))
	   WHEN 'C' THEN (sum(T1.[PickQtty]))
	   ELSE  sum(T1.[RelQtty])
	END as RelQtty,
	
	CASE T1.[PickStatus]
	   WHEN 'Y' THEN sum((T5.[SWeight1] * T1.[PickQtty]))
                   WHEN 'C' THEN sum((T5.[SWeight1] * T1.[PickQtty]))
	   ELSE sum((T5.[SWeight1] * T1.[RelQtty]))
	END as PesoTotal

FROM OPKL T0  
INNER JOIN PKL1 T1 ON T0.AbsEntry = T1.AbsEntry
INNER JOIN RDR1 T2 ON (T2.DocEntry = T1.OrderEntry and T2.LineNum = T1.OrderLine) 
INNER JOIN ORDR T3 ON (T2.DocEntry = T3.DocEntry)
INNER JOIN RDR12 T4 ON (T2.DocEntry = T4.DocEntry)
INNER JOIN OITM T5 ON (T5.ItemCode = T2.ItemCode)
GROUP BY 
	T0.[AbsEntry],
	T3.[DocEntry],
	T3.[NumAtCard],	
	T0.[PickDate], 
	T1.[PickStatus],
	T2.[unitMsr], 
	T3.[CardCode], 
	T3.[CardName], 
	T2.[ItemCode], 
	T2.[Dscription], 
	T2.[SubCatNum], 
	T4.[CityS], 
	T4.[StateS], 
	T4.[TaxID0],
	T2.[ShipDate]