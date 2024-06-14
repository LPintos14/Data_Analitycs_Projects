use proyecto_hotel;
show tables;

#profit by state and city

SELECT  state,City,sum(Profit) as Profit
from orders_superstore
GROUP BY city,state
order by state asc;

#kpi

select sum(Sales) as Sales,sum(profit) as profit, sum(quantity) as quantity,
(sum(profit)/sum(sales))as Profit_Rate, (sum(profit)/count(product_id)) as Rate_per_Product,(sum(sales)/count(customer_name)) as Sale_per_Client
from orders_superstore
;

#sale per category

SELECT category, sum(sales) as Sales, sum(profit) as Profit
from orders_superstore
group by category
order by category;

#sales per segment

select segment,sum(sales) as Sales, sum(Profit) as Profit
from orders_superstore
group by segment
order by segment asc;


#view sale per category

create view Sale_per_category as
SELECT category, sum(sales) as Sales, sum(profit) as Profit
from orders_superstore
group by category
order by category;

#view sale per segment

create view Sales_per_Segment as 
select segment,sum(sales) as Sales, sum(Profit) as Profit
from orders_superstore
group by segment
order by segment asc;

#view kpi

create view KPI as 
select sum(Sales) as Sales,sum(profit) as profit, sum(quantity) as quantity,
(sum(profit)/sum(sales))as Profit_Rate, (sum(profit)/count(product_id)) as Rate_per_Product,(sum(sales)/count(customer_name)) as Sale_per_Client
from orders_superstore
;

#Procedure to see State sales

delimiter $$
create procedure PA_State_info(in p_state varchar(30))
begin
    select state,count(order_id) as Order_Quantity, sum(Sales) as Sales
    from orders_superstore
    where state=p_state
    group by state;
end $$
delimiter ;



