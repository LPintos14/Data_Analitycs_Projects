#Dropping nulls

SELECT * from listing where bedrooms is null;


SELECT * from listing where bedrooms=0;
delete from listing where bedrooms=0;


select * from listing where price IS NULL;
delete from listing where price IS NULL;



#Average price per room type

select room_type, avg(price) as Average_Price
from listing
group by room_type
order by room_type asc;

#Averge Price per Neighbourhood

select Neighbourhood, avg(price) as Average_Price
from listing
group by Neighbourhood
order by Neighbourhood asc;

#Total revenues per month

select DATE_FORMAT(STR_TO_DATE(date, '%d/%m/%y'), '%m-%Y') AS Month_Year, SUM(price) AS Total
from calendar
group by Month_Year
order by Month_Year

  
#recount of rooms

select distinct bedrooms,  count(bedrooms) as Total_Bedrooms
from listing

group by bedrooms
order by bedrooms;

#avergae price per room

select distinct bedrooms, avg(price) as Average_Price
from listing
group by bedrooms
order by bedrooms;
