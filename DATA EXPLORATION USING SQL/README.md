# COVID-19 Data Analysis and Vaccination Tracking

## Project Overview
This project analyzes **COVID-19 death and vaccination data** from global sources, using SQL queries to explore and track trends in the pandemic. The analysis is based on two datasets: **CovidDeaths** and **CovidVaccinations**, and performed using **Microsoft SQL Server**.

Key tasks include:

- **COVID-19 Data Analysis**:
  - Calculated **death percentages** and **infection rates** for countries, such as India.
  - Identified countries with the highest number of cases and deaths.
  - Analyzed global COVID-19 cases and death rates over time.

- **Vaccination Data Tracking**:
  - Merged **COVID-19 deaths** data with **vaccination** data for a complete analysis.
  - Calculated rolling sums of vaccinated populations for each country.
  - Analyzed **vaccination progress** as a percentage of total population.

- **Key SQL Operations**:
  - Used **aggregate functions** to compute totals and percentages (e.g., death percentage, population infection rate).
  - Applied **window functions** to compute rolling totals for vaccination data.
  - Utilized **CTEs (Common Table Expressions)** for efficient data aggregation.
  - Created **temporary tables** and **views** to store aggregated data for visualization.

## Technologies Used
- **Microsoft SQL Server** for data manipulation and analysis.

## Key Analysis Queries
- **Total Cases vs Deaths**: Calculation of death percentage based on total cases for countries like India.
- **Global and Country-Specific Trends**: Identified countries and continents with the highest number of cases and deaths.
- **Vaccination Analysis**: Merged vaccination data with COVID-19 data and tracked vaccination progress as a percentage of the population.
- **Rolling Total Vaccinations**: Computed cumulative vaccinated populations over time.
- **SQL Operations**: Used aggregation, window functions, and partitioning for more detailed analysis.


## Conclusion
This project provides insights into the pandemic’s progression, highlighting both COVID-19 cases and the vaccination efforts globally. The use of advanced SQL techniques makes this project valuable for data-driven decision-making and analysis.

