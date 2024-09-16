-- FBS - 10/06/2016
--
-- Pesquisa um campo em todas as tabelas do banco de dados
--
--
SELECT 
      T.name AS Tabela, 
      C.name AS Coluna
FROM 
      sys.sysobjects    AS T (NOLOCK) 
INNER JOIN sys.all_columns AS C (NOLOCK) ON T.id = C.object_id AND T.XTYPE = 'U' 
WHERE 
      C.NAME LIKE '%FormID%'   -- coloque aqui o nome do campo
ORDER BY 
      T.name ASC
