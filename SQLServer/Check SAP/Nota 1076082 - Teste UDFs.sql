-- Scripts de teste da nota 1076082
-- https://launchpad.support.sap.com/#/notes/1076082
--
--

-- 1)    UDT is defined but does not exist:
select TableName from OUTB
where not exists (
  select 1 from sysobjects where xtype='U' and [name]='@'+TableName
)

-- 2)    UDT is not registered:
select * from sysobjects where [name] like '@%' and name not in
(select '@'+tablename from outb
union all
select '@'+logtable from outb where logtable is not null) and xtype='U'

-- 3)    UDF is defined on an unregistered UDT:
select T0.TableID from CUFD T0 where left(T0.TableID,1)='@'  and not exists (
select 1 from  OUTB T1 where '@'+T1.TableName = T0.TableID or '@'+T1.LogTable = T0.TableID
)

-- 4)   UDF is defined but does not exist:
select TableID, AliasID from CUFD where not exists (
select t0.name, t1.name
from sysobjects t0 inner join syscolumns t1
on t0.xtype='U' and t0.id=t1.id
where t0.name=TableID and t1.name='U_'+AliasID
)
and TableID not in ('BTNT', 'BTNT1', 'OIBT', 'OSRI', 'SRNT', 'SRNT1', 'ODIB', 'ODSR')

-- 5)  UDF valid values are defined for a non-existing UDF:
select TableId, FieldID from UFD1 T
where not exists (
  select 1 from CUFD where TableId=T.TableId and FieldID=T.FieldID
)

-- 6)  UDF definition does not match actuality:
select T1.UDF, T0.nvarchar_size as 'act_size', T1.nvarchar_size as 'def_size' from (
select T2.name + '.' + T3.name as 'UDF', T3.length/2 as 'nvarchar_size' from sysobjects T2 inner join syscolumns T3 on T2.id=T3.id where T2.xtype='U' and T3.xtype in
(select xtype from systypes where [name]='nvarchar')
) T0
inner join (
select tableid + '.U_' + aliasid as 'UDF', editsize as 'nvarchar_size'
from cufd where typeid='A' and editsize>1
) T1
on T0.UDF=T1.UDF
where T0.nvarchar_size>T1.nvarchar_size

--7)    UDF contains extra spaces:
--    a. UDF contains extra spaces in the TableID field in User-fields description in the CUFD table:
select * from CUFD
where  datalength(TableID)<>LEN(TableID)
and  ascii(SUBSTRING (TableID, LEN(TableID)+1, 1)) =32

--    b. UDF contains extra spaces in the AliasID field in User-fields description in the CUFD table:
select * from CUFD
where  datalength(AliasID)<>len(AliasID)
and  ascii(SUBSTRING (AliasID, LEN(AliasID)+1, 1)) =32

--   c.  UDF column  with space characters in its name was found by the SAP Business One Upgrade Wizard.
Select 'UDF column name ''' + COLUMN_NAME + ''' contains space characters in table ' + TABLE_NAME as "Resolution"
FROM INFORMATION_SCHEMA.COLUMNS t0 inner join cufd t1 on t0.TABLE_NAME = t1.TableID and t0.COLUMN_NAME = 'U_' + t1.AliasID 
where t0.[COLUMN_NAME] like 'U[_]% %'

-- d. UDT with space characters in its name was found by the SAP Business One Upgrade Wizard
Select 'UDT name ''' + TABLE_NAME + ''' contains space characters' as "Resolution"
FROM INFORMATION_SCHEMA.TABLES t0 inner join outb t1 on t0.TABLE_NAME = '@' + t1.TableName
where t0.[TABLE_NAME] like '@% %'

-- For more information on checks 7c and 7d please see note 2781726
--8) UDF exists but is not defined:
     select T1.name [Table name], T0.name [Column name] from sys.columns T0 join sys.objects T1 on T0.object_id = T1.object_id
     left join CUFD  T2 on T2.TableID = T1.name and ('U_' + T2.AliasID) = T0.name
     where T1.type = 'U' and T0.name like 'U/_%' escape '/'
     and ('U_' + T2.AliasID) is null
     and (T0.name !='U_NAME' and T1.name not in ('OUSR', 'AUSR', 'TDIB', 'TIBT', 'TDSR', 'TSRI','OEML'))

-- 9) UDT exists with the name '@'

-- *** Detect user-defined value linked to a table without a name:
SELECT * FROM CUFD WHERE TableID = '@'

-- *** Detect tables without a name in a database:
SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = '@'
