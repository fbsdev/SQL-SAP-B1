declare @query nvarchar(max)

set @query = 
'
SELECT
	cast(ROW_NUMBER() OVER(ORDER BY Name asc)as nvarchar(20)) ID,
    DB_Name(Database_ID) As Banco, 
	Name As ArquivoLogico,
    Physical_Name As ArquivoFisico, (Size * 8) / 1024.00 As TamanhoMB
FROM sys.master_files
'


----------------------
create table #Bases
(ID nvarchar(max),Banco nvarchar(max),ArquivoLogico nvarchar(max),ArquivoFisico nvarchar(max),TamanhoMB nvarchar(max),Status nvarchar(max))

insert into #Bases (ID,Banco,ArquivoLogico,ArquivoFisico,TamanhoMB)
exec (@query)

delete from #Bases where Banco in ('tempdb','master','Model','msdb')
----------------------Variaveis
declare @ID nvarchar(max)
declare @BASE nvarchar(max)
Declare @Arqlogico nvarchar(max)
declare @MBfinal nvarchar(20)

while (select max(cast(id as int)) from #Bases Where Status is null) is not null

Begin
set @ID = (select max(cast(id as int)) from #Bases Where Status is null)
set @BASE = (select Banco from #Bases Where id = @id)
set @Arqlogico = (select ArquivoLogico from #Bases Where id = @id)

declare @query2 nvarchar(max)

set @query2 = 

'
USE ['+@base+'];
ALTER DATABASE ['+@base+'] SET RECOVERY SIMPLE;
DBCC SHRINKFILE (N'''+@Arqlogico+''');
'

exec (@query2)
--print (@query2)

set @MBfinal = (SELECT max((Size * 8) / 1024.00)  FROM sys.master_files where DB_Name(Database_ID) = @BASE and name = @Arqlogico)

update #Bases set Status = @MBfinal where Banco = @BASE and ArquivoLogico = @Arqlogico

end

select *,(cast(TamanhoMB as numeric(19,6))-cast(Status as numeric(19,6)))'Diferenca' from #bases order by 7 desc

drop table #Bases