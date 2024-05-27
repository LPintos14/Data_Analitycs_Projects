
-- Deaths Percentage  
select location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 as Death_Percentage
from data 
where location not like 'Africa'and location not like 'asia' and location not like "europe" and location not like "%income%"
and location not like "%european" and location not like "%world" and location not like "%america%" 
and total_cases is not NULL  order by 1,2;
 
-- Total deaths per continent
select continent , max(total_deaths) as total_deaths 
from data 
where location not like 'Africa'and location not like 'asia' and location not like "europe" and location not like "%income%"
and location not like "%european" and location not like "%world" and location not like "%america%"
group by continent 
order by 1;

-- Infected Population per date
select location,population, date, max(total_cases) as Max_cases, MAX((total_cases/population*100)) as InfectedPopulation_Percentage
from data
where location not like 'Africa'and location not like 'asia' and location not like "europe" and location not like "%income%"
and location not like "%european%" and location not like "%world%" and location not like "%america%"and total_cases is not NULL 
group by location,population,`date` 
order by 4 desc;


-- Infected Population
select location,population, max(total_cases) as Max_cases, MAX((total_cases/population*100)) as InfectedPopulation_Percentage
from data
where location not like 'Africa'and location not like 'asia' and location not like "europe" and location not like "%income%"
and location not like "%european%" and location not like "%world%" and location not like "%america%"and total_cases is not NULL 
group by location,population,`date` 
order by 4 desc;
