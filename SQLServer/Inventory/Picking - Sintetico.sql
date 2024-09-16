SELECT 
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
	CASE T1.[PickStatus] 
	   WHEN 'Y' THEN (sum(T1.[PickQtty]))
	   ELSE  sum(T1.[RelQtty])
	END as RelQtty,
	
	CASE T1.[PickStatus]
	   WHEN 'Y' THEN sum((T5.[SWeight1] * T1.[PickQtty]))
	   ELSE sum((T5.[SWeight1] * T1.[RelQtty]))
	END as PesoTotal
	
FROM OPKL T0  
INNER JOIN PKL1 T1 ON T0.AbsEntry = T1.AbsEntry
INNER JOIN RDR1 T2 ON (T2.DocEntry = T1.OrderEntry and T2.LineNum = T1.OrderLine) 
INNER JOIN ORDR T3 ON (T2.DocEntry = T3.DocEntry)
INNER JOIN RDR12 T4 ON (T2.DocEntry = T4.DocEntry)
INNER JOIN OITM T5 ON (T5.ItemCode = T2.ItemCode)
WHERE T1.[PickStatus] = 'R' or T1.[PickStatus] = 'Y'
GROUP BY 
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
	T4.[TaxID0]