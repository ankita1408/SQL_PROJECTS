--select * from project..CovidDeaths
--order by 3,4;

select Location, date, total_cases, 
new_cases,total_deaths
from project..CovidDeaths
where continent is not null
order by 1,2;

--total cases vs total deaths in india
select Location, date, total_cases,
total_deaths,(total_deaths/total_cases)*100 as death_percentage
from project..CovidDeaths
where location like '%india%' and continent is not null
order by 1,2;

--total cases vs population in india
select Location, date, total_cases,
population,(total_cases/population)*100 as PercentPopulatonInfect
from project..CovidDeaths
where location like '%india%' and continent is not null
order by 1,2;


-- country with hightest cases in country
select Location,population,max(total_cases) as highstinfect
,max((total_cases/population)*100) as PercentPopulatonInfect
from project..CovidDeaths 
where continent is not null
group by location,population
order by PercentPopulatonInfect desc;



--countries with highest death count 
select Location,max(cast(total_deaths as int)) as highestDeath
from project..CovidDeaths
where continent is not null
group by Location
order by highestDeath desc;

--continent with highest death count 
select continent,max(cast(total_deaths as int)) as highestDeath
from project..CovidDeaths
where continent is not null
group by continent
order by highestDeath desc;

--global numbers
select location ,date ,total_cases, total_deaths,
(total_deaths/total_cases)*100 as Deathpercentage
from project..CovidDeaths
--where location like '%india%'
where continent is not null
order by 1,2;


-- GLOBAL NUMBERS

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From project..CovidDeaths
--Where location like '%india%'
where continent is not null 
--Group By date
order by 1,2


--total new cases and deaths global

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, 
SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From project..CovidDeaths
--Where location like '%india%'
where continent is not null 
--Group By date
order by 1,2


--
select * from project..CovidDeaths d
join project..CovidVaccinations v
on d.location=v.location and
d.date=v.date;

--total population vs total vaccination
Select dea.continent, dea.location, dea.date, 
dea.population, vac.new_vaccinations
From project..CovidDeaths dea
Join project..CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 
order by 2,3;




--percentage
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER 
(Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From project..CovidDeaths dea
Join project..CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 
order by 2,3;


--CTE 
With PopvsVac (Continent, Location, Date, Population, New_Vaccinations, RollingPeopleVaccinated)
as
(Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER 
(Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From project..CovidDeaths dea
Join project..CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
)
select * from PopvsVac
;

---- Using CTE to perform Calculation on Partition By 
With PopvsVac (Continent, Location, Date, Population, New_Vaccinations, RollingPeopleVaccinated)
as
(Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER 
(Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From project..CovidDeaths dea
Join project..CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
)
select * ,(RollingPeopleVaccinated/population)*100 from PopvsVac;


--temp table
DROP Table if exists #PercentPopulationVaccinated
Create Table #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)

Insert into #PercentPopulationVaccinated
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From project..CovidDeaths dea
Join project..CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
--where dea.continent is not null 
--order by 2,3

Select *, (RollingPeopleVaccinated/Population)*100
From #PercentPopulationVaccinated

-- Creating View to store data for later visualizations

Create View PercentPopulationVaccinated as
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From project..CovidDeaths dea
Join project..CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 




