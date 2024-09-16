-- Scripts de teste da nota 1250867
-- https://launchpad.support.sap.com/#/notes/1250867
--
--
--

if (select version from CINF) >= 880000 begin

select t0.ItemCode ItemCode, t1.ItemName ItemName, t0.WhsCode Warehouse, t0.OnHand OnHand, 
(select coalesce(sum (Quantity),0) from OSRQ where ItemCode = t0.ItemCode and WhsCode = T0.WhsCode) OnSerial,
((select coalesce(SUM(ABS(t2.StockQty)),0)-coalesce(SUM(ABS(t2.DefinedQty)),0) from OITL t2
where t2.DocQty > 0 and t2.StockEff = 1 and t2.ItemCode = t0.ItemCode and t2.LocCode = t0.WhsCode)
+ ABS((select coalesce(SUM(ABS(t2.StockQty)),0)-coalesce(SUM(ABS(t2.DefinedQty)),0) from OITL t2
where t2.DocQty > 0 and t2.StockEff = 1 and t2.ItemCode = t0.ItemCode and t2.LocCode = t0.WhsCode))) / 2 ForComplete,
t0.OnHand - (select coalesce(sum (Quantity),0) from OSRQ where ItemCode = t0.ItemCode and WhsCode = T0.WhsCode) -
(((select coalesce(SUM(ABS(t2.StockQty)),0)-coalesce(SUM(ABS(t2.DefinedQty)),0) from OITL t2
where t2.DocQty > 0 and t2.StockEff = 1 and t2.ItemCode = t0.ItemCode and t2.LocCode = t0.WhsCode)
+ ABS((select coalesce(SUM(ABS(t2.StockQty)),0)-coalesce(SUM(ABS(t2.DefinedQty)),0) from OITL t2
where t2.DocQty > 0 and t2.StockEff = 1 and t2.ItemCode = t0.ItemCode and t2.LocCode = t0.WhsCode))) / 2) Difference
, CASE when t1.EvalSystem = 'B' then '***Actual Costing***' else t1.EvalSystem end as 'Valuation Method'
from OITW T0 inner join OITM T1 on T1.ItemCode = T0.ItemCode and T1.ManSerNum = 'Y'
  inner join OWHS t3 on t0.WhsCode = t3.WhsCode and t3.DropShip <> 'Y' 
  left join (select ItemCode, WhsCode, sum(Quantity) Qty from OSRQ group by ItemCode, WhsCode) tblCalc1 on tblCalc1.ItemCode = t0.ItemCode and tblCalc1.WhsCode  = t0.WhsCode
  left join (select ItemCode, LocCode, Coalesce(SUM(ABS(StockQty)), 0) - Coalesce(SUM(ABS(DefinedQty)), 0) Qty
             from OITL where DocQty > 0 and StockEff = 1
			 and LogEntry not in (
				select a.LogEntry from OITL a inner join OITL b on a.ApplyType = b.BaseType and a.ApplyEntry = b.BaseEntry 
				where a.ManagedBy = '10000045' and a.StockEff = 1 and a.ApplyType not in (17,163,165))
             group by ItemCode, LocCode
            ) tblCalc2 on tblCalc2.ItemCode = t0.ItemCode and tblCalc2.LocCode  = t0.WhsCode
where T0.OnHand - Coalesce(tblCalc1.Qty, 0) - Coalesce((tblCalc2.Qty + Abs(tblCalc2.Qty)) / 2, 0) <> 0 or T0.OnHand < 0
order by t0.ItemCode, t0.WhsCode

end
else

select t0.itemcode ItemCode, t1.itemname ItemName, t0.whscode Warehouse, t0.onhand OnHand, 
(select count(status) from osri where itemcode = t0.itemcode and WhsCode = T0.WhsCode and status = 0) OnSerial,
(select coalesce(sum(docopenqty),0) from osrd where itemcode = t0.itemcode and WhsCode = T0.WhsCode and direction = '0' and docopenqty > 0) ForComplete,
t0.onhand - (select count(status) from osri where itemcode = t0.itemcode and WhsCode = T0.WhsCode and status = 0) -
(select coalesce(sum(docopenqty),0) from osrd where itemcode = t0.itemcode and WhsCode = T0.WhsCode and direction = '0' and docopenqty > 0) Difference
,case (select count (1) from AITM T5 where T5.ItemCode = T0.ItemCode and T5.ManSerNum <> 'Y')
  when 0 then 'N'
  else 'Y'
end 'StatusChanged'
,T1.MngMethod
from oitw t0 inner join oitm t1 on T0.ItemCode = T1.ItemCode where t1.mansernum = 'Y'
and t0.onhand - (select count(status) from osri where itemcode = t0.itemcode and WhsCode = T0.WhsCode and status = 0) -
(select coalesce(sum(docopenqty),0) from osrd where itemcode = t0.itemcode and WhsCode = T0.WhsCode and direction = '0' and docopenqty > 0) <> 0
order by t0.itemcode, t0.whscode