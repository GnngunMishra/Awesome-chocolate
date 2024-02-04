-------Qusetion1---------

select * from sales
where Amount  > 2000 and Boxes < 100

-------Qusetion2----------

SELECT people.salesperson, COUNT(*) AS shipments_count
from sales
JOIN people ON sales.SPID = people.SPID
WHERE sales.SaleDate BETWEEN '2022-01-01' AND '2022-01-31'
GROUP BY people.salesperson;

-------Qusetion3----------

Select products.product ,sum(Boxes) as total_Boxes
from sales
join products on sales.PID = products.PID
where product in ('Milk Bars','Eclairs')
group by products.product
order by(total_Boxes) desc;

-------Qusetion4----------

select products.product ,sum(Boxes) as total_Boxes
from sales
join products on sales.PID = products.PID
where product in ('Milk Bars','Eclairs') and 
SaleDate between '2022-02-01' and '2022-02-07'
group by products.product
order by(total_Boxes) desc;

-------Qusetion5----------

select * from sales 
where customers<100 and Boxes<100;
select*,
 case whan weekday(SaleDate) = 2 than 'wednesday shipment'
 else
 end as 'w shipment'
 from sales 
 where customers<100 and Boxes<100;
 
  ------Qusetion6----------
 
 select distinct salesperson
 from sales
 join people on sales.SPID = people.SPID
 where SaleDate between '2022-01-01' and '2022-01-07'
 
  -------Qusetion7----------
 
select people.salesperson
from people 
where SPID not in 
(select distinct SPID from sales where SaleDate between '2022-01-01' and '2022-01-07');

-------Qusetion8----------
select year(SaleDate)'Year', month(SaleDate)'MONTH', count(*)'Time we shipped 1k boxes'
from sales
where Boxes>1000
group by year(SaleDate) , month(SaleDate)
order by year(SaleDate) , month(SaleDate);
-------Qusetion9----------
SET @product_name = 'After Nines';
SET @country_name = 'New Zealand';

SELECT YEAR(s.SaleDate) AS 'Year', MONTH(s.SaleDate) AS 'Month',
       IF(SUM(s.boxes) > 1, 'Yes', 'No') AS 'Status'
FROM sales s
JOIN products pr ON pr.PID = s.PID
JOIN geo g ON g.GeoID = s.GeoID
WHERE pr.Product = @product_name AND g.Geo = @country_name
GROUP BY YEAR(s.SaleDate), MONTH(s.SaleDate)
ORDER BY YEAR(s.SaleDate), MONTH(s.SaleDate);

-------Qusetion10----------

SELECT YEAR(s.SaleDate) AS 'Year', MONTH(s.SaleDate) AS 'Month',
       SUM(CASE WHEN geo.Geo = 'India' THEN Boxes ELSE 0 END) AS 'Indian Boxes',
       SUM(CASE WHEN geo.Geo = 'Australia' THEN Boxes ELSE 0 END) AS 'Australia Boxes'
FROM sales s
JOIN geo ON geo.GeoID = s.GeoID
GROUP BY YEAR(s.SaleDate), MONTH(s.SaleDate)
ORDER BY YEAR(s.SaleDate), MONTH(s.SaleDate);
