DECLARE @contador int
DECLARE @grupo varchar(max)
DECLARE @campo varchar(max)


SET @grupo = ''
SET @contador = 0

WHILE @contador < 64 BEGIN
  
   SET @contador = @contador + 1
   SET @campo = 'T0.QryGroup' + ltrim(str(@contador))
   
   SET @grupo = @grupo + ', ' + @campo + 
		', CASE WHEN ' + @campo + ' = ''Y''' + ' THEN (SELECT T1.GroupName FROM OCQG T1 WHERE T1.GroupCode = ' + ltrim(str(@contador)) + ') END AS NomeGrupo' +  ltrim(str(@contador))
END

EXEC 
(
'SELECT 
 T0.CardCode, 
 T0.CardName' + @grupo + 
 ' FROM OCRD T0'
)

