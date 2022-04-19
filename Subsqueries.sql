---------- Successfull order

use `new`;

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

----- Number of orders in 2003
SELECT count(year(`order Date`)) `Number of orders in 2003`
FROM orders
where year(`order Date`)= 2003;

----- Number of orders in 2004
SELECT count(year(`order Date`)) `Number of orders in 2004`
FROM orders
where year(`order Date`)= 2004;

----- Number of orders in 2005
SELECT count(year(`order Date`)) `Number of orders in 2005`
FROM orders
where year(`order Date`)= 2005;