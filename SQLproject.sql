select *
from portfolioprojectmoin..coviddeaths

select * 
from portfolioprojectmoin..covidvaccination




select * from portfolioprojectmoin..coviddeaths
select location,date,total_cases,new_cases,total_deaths,population 
from portfolioprojectmoin..coviddeaths
order by 1,2


select location,date,total_cases,new_cases,total_deaths, (total_deaths/total_cases)*100 as deathpercentage
from portfolioproject..coviddeath$
where location like '%state%'
order by 1,2

select location,date,total_cases,population, (total_cases/population)*100 as deathpercentage
from portfolioproject..coviddeath$
where location like '%state%' 
order by 1,2



select location,date,total_cases,population, (total_cases/population)*100 as deathpercentage
from portfolioproject..coviddeath$
--where location like '%state%' 
order by 1,2


select location,MAX(total_cases) as highestinfectioncount,population,MAX(total_cases/population)*100 as percentagepopulationinfected
from portfolioproject..coviddeath$
 
group by location,population
order by percentagepopulationinfected desc




select location,MAX(total_deaths) as totaldeathcount
from portfolioproject..coviddeath$
 
group by location
order by totaldeathcount desc


select location,MAX(cast(total_deaths as int)) as totaldeathcount
from portfolioproject..coviddeath$
where continent is not null
 
group by location
order by totaldeathcount desc


select continent,MAX(cast(total_deaths as int)) as totaldeathcount
from portfolioproject..coviddeath$
where continent is not null
 
group by continent
order by totaldeathcount desc


select location,MAX(cast(total_deaths as int)) as totaldeathcount
from portfolioproject..coviddeath$
where continent is null
 
group by location
order by totaldeathcount desc



select date,SUM(new_cases) as totalcases,SUM(cast(new_deaths as int)) as totaldeath,
SUM(cast(new_deaths as int))/SUM(new_cases)*100 as deathpercentage
From portfolioproject..coviddeath$
--where location like '%state%' 
where continent is not null
group by date
order by 1,2