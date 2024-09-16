DECLARE  @search_string  VARCHAR(100);
  
SET @search_string = 'U_gestor' -- coloque aqui o texto que deverá ser pesquisado

-- Procura dentro das views e procedures
SELECT type_desc, obj.name AS SP_NAME,  sqlmod.definition AS SP_DEFINITION
FROM sys.sql_modules AS sqlmod
INNER JOIN sys.objects AS obj ON sqlmod.object_id = obj.object_id
WHERE sqlmod.definition LIKE '%' + @search_string + '%'
ORDER BY type_desc

-- Procura nas queries salvas no sistema.
SELECT 
T1.IntrnalKey,
T0.CatName,
T1.QName,
T1.QString
FROM OQCN T0
INNER JOIN OUQR T1 ON T0.CategoryId = T1.QCategory
WHERE T1.QString LIKE '%' + @search_string + '%'