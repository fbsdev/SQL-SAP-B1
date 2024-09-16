SELECT T0."CatName" as "Category Name",                       
       T1."QName" as "Query Name",                         
       T1."IntrnalKey",
       T1."QString" as "Query",                       
       T2."Refresh" as "Auto refresh",                       
       T2."FrceRfrsh" as "Refresh regularly",                     
       T2."ByField" as "If refreshed by header field",                       
       T2."FormID",                        
       T2."ItemID" as "Area/header field where FMS is assigned",                        
       T2."ColID" as "Column field where FMS is assigned",
       T2."FieldID" as "Auto refresh Field"                          
FROM   OQCN T0                           
       INNER JOIN OUQR T1                
         ON T0."CategoryId" = T1."QCategory"
       INNER JOIN CSHS T2                
         ON T1."IntrnalKey" = T2."QueryId"   
WHERE  T0."CategoryId" != -2 AND FormID = '142'
Order by T0.CatName