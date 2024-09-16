-- Nota fiscal de saída
SELECT 
  T0.DocEntry,
  CASE WHEN ISNULL(T0.U_chaveacesso,'') <> '' then
	T0.U_chaveacesso
  ELSE 
    T1.U_ChaveAcesso
  END
  AS U_ChaveAcesso
FROM OINV T0
INNER JOIN [@SKL25NFE] T1 ON T1.U_DocEntry = T0.DocEntry AND T1.U_tipoDocumento = 'NS' and T1.U_ProtAut is not null AND T1.U_cdErro = 100

UNION ALL 

-- Dev. Nota Fiscal de Entrada
SELECT 
  T0.DocEntry,
  T1.U_ChaveAcesso
FROM ORPC T0
INNER JOIN [@SKL25NFE] T1 ON T1.U_DocEntry = T0.DocEntry AND T1.U_tipoDocumento = 'DE' and T1.U_ProtAut is not null AND T1.U_cdErro = 100

UNION ALL 

-- Dev. Mercadoria
SELECT 
  T0.DocEntry,
  T1.U_ChaveAcesso
FROM ORPD T0
INNER JOIN [@SKL25NFE] T1 ON T1.U_DocEntry = T0.DocEntry AND T1.U_tipoDocumento = 'DM' and T1.U_ProtAut is not null AND T1.U_cdErro = 100

UNION ALL

-- Dev. Nota Fiscal de Saída
SELECT 
  T0.DocEntry,
  T1.U_ChaveAcesso
FROM ORIN T0
INNER JOIN [@SKL25NFE] T1 ON T1.U_DocEntry = T0.DocEntry AND T1.U_tipoDocumento = 'DN' and T1.U_ProtAut is not null AND T1.U_cdErro = 100

UNION ALL

-- Entrega de mercadoria
SELECT 
  T0.DocEntry,
  T1.U_ChaveAcesso
FROM ODLN T0
INNER JOIN [@SKL25NFE] T1 ON T1.U_DocEntry = T0.DocEntry AND T1.U_tipoDocumento = 'EM' and T1.U_ProtAut is not null AND T1.U_cdErro = 100

UNION ALL

-- Nota Fiscal de Entrada
SELECT 
  T0.DocEntry,
  T1.U_ChaveAcesso
FROM OPCH T0
INNER JOIN [@SKL25NFE] T1 ON T1.U_DocEntry = T0.DocEntry AND T1.U_tipoDocumento = 'NE' and T1.U_ProtAut is not null AND T1.U_cdErro = 100