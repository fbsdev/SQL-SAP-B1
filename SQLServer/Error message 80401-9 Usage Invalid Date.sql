--  
--  http://scn.sap.com/thread/3934563
--
--

SELECT CASE WHEN T4.TcdType = 'MI' THEN 'Item de Material'
            WHEN T4.TcdType = 'SI' THEN 'Item de servi�o'
            WHEN T4.TcdType = 'SD' THEN 'Documento de Servi�o'
            WHEN T4.TcdType = 'WT' THEN 'Imposto Retido na fonte' END AS 'Tipo de determina��o',
            t3.Priority as 'Prioridade',
       CASE WHEN T3.KeyFld_1 = 1 THEN 'Parceiros de Neg�cios'
            WHEN T3.KeyFld_1 = 2 THEN 'Item'
            WHEN T3.KeyFld_1 = 3 THEN 'Grupo de materiais'
            WHEN T3.KeyFld_1 = 5 THEN 'C�digo NCM'
            WHEN T3.KeyFld_1 = 6 THEN 'Estado'
            WHEN T3.KeyFld_1 = 9 THEN 'Grupo de Itens'
            WHEN T3.KeyFld_1 = 11 THEN 'Grupo cliente'
            WHEN T3.KeyFld_1 = 12 THEN 'Grupo de fornecedor'
            ELSE '' END AS 'Campos-chave 1',
        CASE WHEN T3.KeyFld_2 = 1 THEN 'Parceiros de Neg�cios'
            WHEN T3.KeyFld_2 = 2 THEN 'Item'
            WHEN T3.KeyFld_2 = 3 THEN 'Grupo de materiais'
            WHEN T3.KeyFld_2 = 5 THEN 'C�digo NCM'
            WHEN T3.KeyFld_2 = 6 THEN 'Estado'
            WHEN T3.KeyFld_2 = 9 THEN 'Grupo de Itens'
            WHEN T3.KeyFld_2 = 11 THEN 'Grupo cliente'
            WHEN T3.KeyFld_2 = 12 THEN 'Grupo de fornecedor'
            ELSE '' END AS 'Campos-chave 2',
        CASE WHEN T3.KeyFld_3 = 1 THEN 'Parceiros de Neg�cios'
            WHEN T3.KeyFld_3 = 2 THEN 'Item'
            WHEN T3.KeyFld_3 = 3 THEN 'Grupo de materiais'
            WHEN T3.KeyFld_3 = 5 THEN 'C�digo NCM'
            WHEN T3.KeyFld_3 = 6 THEN 'Estado'
            WHEN T3.KeyFld_3 = 9 THEN 'Grupo de Itens'
            WHEN T3.KeyFld_3 = 11 THEN 'Grupo cliente'
            WHEN T3.KeyFld_3 = 12 THEN 'Grupo de fornecedor'
        ELSE '' END AS 'Campos-chave 3',
            t3.Descr as 'Descri��o',
            t2.DispOrder as 'Linha - Valor Compras-chave',
            --t1.EfctFrom as 'Per�odo V�lido - Efetivo desde',
            --t1.EfctTo as 'Per�odo V�lido - Efetivo at�',
            t5.Usage as 'Utiliza��o',
            t0.TaxCode as 'C�digo de Imposto',
            (select COUNT(ID) from OUSG where ID<= t0.UsageCode) as 'Linha - Utiliza��o',
            CASE when isnull(T0.TaxCode,'') = '' then 'C�digo Exclu�do' else 'C�digo Inativo' end as 'Situa��o' 
FROM TCD5 T0 LEFT JOIN TCD3 T1 ON T1.AbsId = T0.Tcd3Id 
          LEFT JOIN TCD2 T2 ON T2.AbsId = T1.Tcd2Id
          LEFT JOIN TCD1 T3 ON t3.AbsId = T2.Tcd1Id
          LEFT JOIN OTCD T4 ON T4.AbsId = T3.TcdId
          INNER JOIN OUSG T5 on t5.ID = t0.UsageCode
          LEFT JOIN OSTC T6 on t6.Code = t0.TaxCode
WHERE T0.TaxCode not in (select T00.Code from OSTC T00 where Lock = 'N')