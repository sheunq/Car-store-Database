----------------------------------------------------------------------- 
--                Successful orders
-----------------------------------------------------------------------
use `car store`;

select `product code`,`product name`,`Quantity Ordered`, `sum of successful ordered product` from (
with `sucess` as ( 
select o.`order number`,  od.`Product Code`, od.`Quantity Ordered` `Quantity Ordered`, p.`customer Number`,p.amount `sum of successful ordered product`
from `order details` od
join
orders o using (`Order Number`)
join 
payments p using(`Customer Number`))
select s.*,p.`product name` `product name`  
from 
`sucess` s 
join 
products p using (`product code`) )s
;
----------------------------------------------------------------------------------
--                Total Product line
----------------------------------------------------------------------------------
select ifnull(`product line`,'Total') `Product Line`, sum(`Quantity in Stock`) `Total Quantity of stocks`, sum(price*`quantity in stock`) `Total Amount of stocks`, sum(`order value`) `Total Order Value`
from
(with `new` 
as 
(select `product line`, `Quantity in stock`, price, `order year`, `order value`
from
products
join
sales using (`product line`))
select `Product Line`, `Quantity in stock`, price,`order value`  
from
`new`) s
group by `product line` with rollup;

------------------------------------------------------------------------------------
--             Total Product line 2003
-------------------------------------------------------------------------------------

select ifnull(`product line`,'Total') `Product Line`, sum(`Quantity in Stock`) `Total Quantity of stocks`, sum(price*`quantity in stock`) `Total Amount of stocks`, sum(`order value`) `Total Order Value`
from
(with `new` 
as 
(select `product line`, `Quantity in stock`, price, `order year`, `order value`
from
products
join
sales using (`product line`)
where `Order Year`=2003)
select `Product Line`, `Quantity in stock`, price,`order value`  
from
`new`) s
group by `product line` with rollup;

------------------------------------------------------------------------------------
--             Total Product line 2004
-------------------------------------------------------------------------------------

select ifnull(`product line`,'Total') `Product Line`, sum(`Quantity in Stock`) `Total Quantity of stocks`, sum(price*`quantity in stock`) `Total Amount of stocks`, sum(`order value`) `Total Order Value`
from
(with `new` 
as 
(select `product line`, `Quantity in stock`, price, `order year`, `order value`
from
products
join
sales using (`product line`)
where `Order Year`=2004)
select `Product Line`, `Quantity in stock`, price,`order value`  
from
`new`) s
group by `product line` with rollup;


------------------------------------------------------------------------------------
--             Total Product line 2005
-------------------------------------------------------------------------------------

select ifnull(`product line`,'Total') `Product Line`, sum(`Quantity in Stock`) `Total Quantity of stocks`, sum(price*`quantity in stock`) `Total Amount of stocks`, sum(`order value`) `Total Order Value`
from
(with `new` 
as 
(select `product line`, `Quantity in stock`, price, `order year`, `order value`
from
products
join
sales using (`product line`)
where `Order Year`=2005)
select `Product Line`, `Quantity in stock`, price,`order value`  
from
`new`) s
group by `product line` with rollup;

----------------------------------------------------------------------------------  
--     Number of orders in 2003
----------------------------------------------------------------------------------
SELECT count(year(`order Date`)) `Number of orders in 2003`
FROM orders
where year(`order Date`)= 2003;
----------------------------------------------------------------------------------  
--     Number of orders in 2004
----------------------------------------------------------------------------------

SELECT count(year(`order Date`)) `Number of orders in 2004`
FROM orders
where year(`order Date`)= 2004;

----------------------------------------------------------------------------------  
--     Number of orders in 2005
----------------------------------------------------------------------------------

SELECT count(year(`order Date`)) `Number of orders in 2005`
FROM orders
where year(`order Date`)= 2005;
