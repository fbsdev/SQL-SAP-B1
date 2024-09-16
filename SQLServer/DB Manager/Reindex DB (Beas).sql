/*

SAP Note1241422 from 2016/12/4, Version 11 from 2021/02/07
Related to SAP Note , 1376447, 2258305, 1564494

Symptom
During operation, databases of SAP Business One become fragmented due to insertions, updates, and deletions of data. 
Fragmentation exists when indexes have pages in which the logical ordering, based on the key value, 
does not match the physical ordering inside the data file. Heavily fragmented indexes can degrade performance.

Solution
We recommend running the RSP task on a monthly basis to perform a database re-index on your customer's database. 
Please refer to RSP Task 1469218 for the task details. Alternatively you can run the script below from SQL Server Management Studio:
Reindex procedure. Will execute dbcc dbreindex on each table in db*/

DECLARE @tableName as sysname
DECLARE @strExec as varchar(1000)-- Cursor declaration
DECLARE tableNameCursor CURSOR READ_ONLY FAST_FORWARD FOR

-- Take all user table
SELECT [name] FROM sysobjects WHERE xtype = 'U'

OPEN tableNameCursor

FETCH NEXT FROM tableNameCursor INTO @tableName

PRINT 'Start in ' + CONVERT(VARCHAR(19), SYSDATETIME(), 120)

 WHILE @@FETCH_STATUS = 0
 BEGIN

	-- Create the statement 
	SET @strExec = 'dbcc dbreindex (''' + @tableName + ''','''',0 )'
	-- Execute the procedure
	print (@strExec)
	exec (@strExec)
	FETCH NEXT FROM tableNameCursor INTO @tableName
END
CLOSE tableNameCursor

DEALLOCATE tableNameCursor

PRINT 'Finished in ' + CONVERT(VARCHAR(19), SYSDATETIME(), 120)