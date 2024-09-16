-- Not Management Itens
-- Scripts de teste da nota 1250867
-- https://launchpad.support.sap.com/#/notes/1250867
--

if (select version from cinf) >= 880000 begin

select t0.ItemCode ItemCode, t0.ItemName ItemName from OITM t0
where
(t0.ManSerNum <> 'Y' and t0.ItemCode in (select t1.ItemCode from OSRQ t1 where t1.ItemCode = t0.ItemCode and (t1.Quantity <> 0 or t1.CommitQty <> 0))) 
or
(t0.ManBtchNum <> 'Y' and t0.ItemCode in (select t2.ItemCode from OBTQ t2 where t2.ItemCode = t0.ItemCode and (t2.Quantity <> 0 or t2.CommitQty <> 0)))

end
else

select t0.itemcode ItemCode, t0.itemname ItemName from oitm t0
where
(t0.mansernum <> 'Y' and t0.itemcode in (select t1.itemcode from osri t1 where t1.itemcode = t0.itemcode and t1.status = '0')) 
or
(t0.manbtchnum <> 'Y' and t0.itemcode in (select t2.itemcode from oibt t2 where t2.itemcode = t0.itemcode and (t2.quantity <> 0 or t2.iscommited <> 0)))
                                                                                                                                                                                                                         