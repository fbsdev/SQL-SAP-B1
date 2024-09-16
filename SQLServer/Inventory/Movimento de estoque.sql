--select * from OIVL where itemcode = '370020207' order by docdate desc
--select * from ign1 where itemcode = '370020207' -- entrada
--select * from ige1 where itemcode = '370020207' -- saida

select
  T0.Itemcode,
  T1.ItemName,
  T0.DocDate,
  T0.TransType,
  T0.LocCode,
  T0.CreatedBy as NumeroInternoDoc,
  CASE 
    WHEN T0.TransType = '67' THEN (CASE WHEN T0.InQty <> 0 THEN 'Entrada Estoque' ELSE 'Saída Estoque' END)
	WHEN T0.TransType = '14' THEN (CASE WHEN T0.InQty <> 0 THEN 'Entrada Estoque' ELSE 'Saída Estoque' END)
	WHEN T0.TransType = '59' THEN 'Entrada Estoque'
	WHEN T0.TransType = '18' THEN 'Entrada Estoque'
	WHEN T0.TransType = '60' THEN 'Saída Estoque'
	WHEN T0.TransType = '13' THEN 'Saída Estoque'
	WHEN T0.TransType = '10000071' THEN (CASE WHEN T0.InQty <> 0 THEN 'Entrada Estoque' ELSE 'Saída Estoque' END)
  END AS TIPO,
  CASE 
	WHEN T0.TransType = '67' THEN 'TRF-Transferência'
	WHEN T0.TransType = '13' THEN 'NFS-Saída'
	WHEN T0.TransType = '14' THEN 'NFE-Entrada (Dev.Saída)'
	WHEN T0.TransType = '18' THEN 'NFE-Entrada'
	WHEN T0.TransType = '59' THEN (SELECT UPPER(T10.Ref2) FROM OIGN T10 WHERE T10.DocEntry = T0.CreatedBy)
	WHEN T0.TransType = '60' THEN (SELECT UPPER(T10.Ref2) FROM OIGE T10 WHERE T10.DocEntry = T0.CreatedBy)
	WHEN T0.TransType = '10000071' THEN 'AJU-Ajuste Inventário'
  END AS TipoReq,
  T0.InQty as QtdeEntrada,
  T0.OutQty as QtdeSaida
FROM
   OIVL T0
INNER JOIN OITM T1 ON T1.Itemcode = T0.Itemcode
where T0.DocDate >= '01/12/2013' -- T0.itemcode = '370020207' 
order by T0.docdate desc