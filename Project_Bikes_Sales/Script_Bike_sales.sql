create database Proyecto_bikeSales;
use proyecto_bikeSales;


#revenues and cost per countries

select country, SUM(revenue) as Revenues, sum(cost) as Costs
from Sales
group by country
order by revenues DESC ;

#revenues per year

select year, SUM(revenue) as Revenues
from Sales
group by `Year` 
order by year ASC ;

#total de productos

select product as Product, count(product) as Quantity
from Sales s 
group by Product
order by quantity DESC ;

#distribucion de genero por pais

select country, customer_gender,count(*) as Total
from Sales s 
group by Country, customer_gender
order by Country ;



