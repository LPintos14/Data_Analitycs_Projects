/*
Covid 19 Data Exploration 

Skills used: Aggregate Functions, Creating Views

*/

select*from Project_Covid.data order by 3,4;

-- Projects view

-- Likelihood of dying if you contract covid in your country
select *from DeathPercentage_Argentina

-- Percentage of population infected with Covid in my country
select*from infectedpopulation_percentage;

-- Countries with Highest Infection Rate compared to Population
select*from max_InfectedPopulation_Percentage;

-- Countries with Highest Death Count per Population
SELECT *from totaldeaths_countries;

-- Showing contintents with the highest death count per population
select*from continent_totaldeaths;

-- Global numbers
select*from global_numbers;

--Select data that we are going to use
select continent, location, date, population,total_cases,new_cases,total_deaths,new_deaths,
from data;

--Total Cases vs Total Deaths
-- Shows likelihood of dying if you contract covid in your country
select continent,location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 as Death_Percentage
from data where location like "%argentina%" 
and total_cases is not NULL  order by 2;

-- view
create view DeathPercentage_Argentina as
select location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 as Death_Percentage
from data where location like "%argentina%" 
and total_cases is not NULL  order by 2;

 --Total Cases vs Population
-- Shows what percentage of population infected with Covid in my country
select location, date, population, total_cases, (total_cases/population)*100 as InfectedPopulation_Percentage
from data 
where total_cases is not NULL and 
location like "%argentina%"
order by 2;

-- view
create view InfectedPopulation_Percentage as 
select location, date, population, total_cases, (total_cases/population)*100 as InfectedPopulation_Percentage
from data 
where total_cases is not NULL and 
location like "%argentina%"
order by 2;


-- Countries with Highest Infection Rate compared to Population
select location,population, max(total_cases) as Max_cases, MAX((total_cases/population*100)) as InfectedPopulation_Percentage
from data
where location not like 'Africa'and location not like 'asia' and location not like "europe" and location not like "%income%"
and location not like "%european" and location not like "%world" and location not like "%america%"
group by location,population 
order by 1,2;

-- view
create view max_InfectedPopulation_Percentage as
select location,population, max(total_cases) as Max_cases, MAX((total_cases/population*100)) as InfectedPopulation_Percentage
from data 
where location not like 'Africa'and location not like 'asia' and location not like "europe" and location not like "%income%"
and location not like "%european" and location not like "%world" and location not like "%america%"
group by location,population 
order by 1,2;

-- Countries with Highest Death Count per Population
select location, max(total_deaths)as Total_Deaths
from data 
where location not like 'Africa'and location not like 'asia' and location not like "europe" and location not like "%income%"
and location not like "%european" and location not like "%world" and location not like "%america%"
group by location 
order by 1;

-- view
create view TotalDeaths_Countries as 
select location, max(total_deaths)as Total_Deaths
from data 
where location not like 'Africa'and location not like 'asia' and location not like "europe" and location not like "%income%"
and location not like "%european" and location not like "%world" and location not like "%america%"
group by location 
order by 1;

-- Breaking down by continents
-- Showing contintents with the highest death count per population
select continent, max(total_deaths) as total_deaths 
from data 
group by continent 
order by 1;

-- view
create view Continent_TotalDeaths as 
select continent, max(total_deaths) as total_deaths 
from data 
group by continent 
order by 1;

-- GLOBAL NUMBERS

select sum(new_cases) as total_cases, sum(new_deaths) as total_deaths, (sum(new_deaths)/SUM(new_cases)*100) as Death_Percentage 
from data 
order by 1,2;
-- view
create view Global_numbers as 
select sum(new_cases) as total_cases, sum(new_deaths) as total_deaths, (sum(new_deaths)/SUM(new_cases)*100) as Death_Percentage 
from data 
order by 1,2;



