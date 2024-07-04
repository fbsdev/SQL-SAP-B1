--
-- List queries name and queries (Query Manager)
--

select 
b."CatName",
a."QName",REPLACE(replace(CONVERT(NVARCHAR(MAX),a.QString), char(13),''),char(10),'')[QStringClean],
a.QString
from ouqr a inner join oqcn b on b."CategoryId" = a."QCategory"
where a."QCategory" not in ('-2','-1') 
and b."CatName" not like '%SAP_DASHBOARD%' 
and b."CatName" not like '%KPI_MOBILE%'
order by b.CatName, a.QName