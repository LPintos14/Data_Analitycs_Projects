create database Proyecto_bikeSales;
use proyecto_bikeSales;



#Revenues and Costs per Countries
select country, SUM(revenue) as Revenues, sum(cost) as Costs
from Sales
group by country
order by revenues DESC ;

#Revenues per Year
select year, SUM(revenue) as Revenues
from Sales
group by `Year` 
order by year ASC ;

#Total Products
select product as Product, count(product) as Quantity
from Sales s 
group by Product
order by quantity DESC ;

#Gender distribution per Countries
select country, customer_gender,count(*) as Total
from Sales s 
group by Country, customer_gender
order by Country ;


#PA Revenues and Costs per Countries

delimiter //
create procedure Revenues_Costs())
begin
    select country, 
    SUM(revenue) as Revenues, 
    sum(cost) as Costs 
    from Sales 
    group by country 
    order by Revenues DESC ;
end//
DELIMITER ;

call Revenues_costs() ;

#PA Gender distribution per country

delimiter //
create procedure gender_coutry(in p_country varchar(20))
begin
	SELECT country,customer_gender,count(*) as Total
	from Proyecto_bikeSales.sales
	where country=p_country
	group by Country, customer_gender
	order by country;
end //
delimiter ;

call Gender_perCountry("Germany") 

#PA Total Products by Age Group

delimiter $$
CREATE procedure Proyecto_bikeSales.Products_by_AgeGroup()
begin
	select age_group, count(*) as Totals
	from Proyecto_bikeSales.sales
	group by age_group
	order by age_group;
end $$
delimiter ;

call Products_by_AGE();

