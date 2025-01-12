This repository contains two major SQL projects:  
1. **[COVID-19 Data Analysis](https://github.com/ankita1408/SQL_PROJECTS/tree/master/DATA%20EXPLORATION%20USING%20SQL)**  
2. **[Data Cleaning of Nashville Housing Dataset](https://github.com/ankita1408/SQL_PROJECTS/tree/master/DATA%20CLEANING%20USING%20SQL)**


# Data Cleaning and Exploratory Data Analysis of Layoff Dataset

## Project Overview

This project focuses on performing **Data Cleaning** and **Exploratory Data Analysis (EDA)** on a layoff dataset. The goal is to ensure data integrity and extract meaningful insights to identify trends and patterns regarding layoffs across different companies, industries, locations, and time periods.

## Key Steps and Techniques

1. **Data Cleaning**  
   - **Remove Duplicates**: Duplicates in the dataset were identified and removed based on key columns such as company, location, industry, total layoffs, percentage of layoffs, and date.
   - **Standardize Data**: Cleaned and standardized data entries by trimming spaces and correcting inconsistencies in company names, industry types, country names, and date formats.
   - **Handle Null and Blank Values**: Null and blank values in essential fields (e.g., industry, total layoffs, percentage of layoffs) were addressed by filling or deleting records with missing data.

2. **Exploratory Data Analysis (EDA)**  
   - **Layoff Trends Analysis**: The total number of layoffs was analyzed across different companies, industries, locations, and time periods. Trends were identified by aggregating the data yearly and monthly.
   - **Identify Top Affected Companies and Industries**: By grouping data based on companies and industries, the analysis highlights which sectors were most impacted by layoffs.
   - **Time-Based Analysis**: The dataset was aggregated by year and month to observe fluctuations in layoffs over time. Rolling totals were computed to track cumulative layoffs.
   - **Rank Companies by Yearly Layoffs**: A ranking was performed to identify the top 5 companies with the highest number of layoffs each year, helping to spot trends in business cycles.

## Key Findings

- Companies and industries with the highest layoffs were identified, along with the regions and stages of businesses most affected.
- Time-based trends revealed fluctuations in layoffs over the years and months, offering insights into when layoffs were more prevalent.
- Ranking companies by yearly layoffs provided insights into which organizations had the largest impact on their workforce in each year.

## Technologies Used

- SQL (for data cleaning and transformation)
- Data manipulation techniques using window functions, aggregation, and joining operations
- Standardization methods for handling inconsistencies in the dataset

## Project Structure

```plaintext
cleaned_data.sql   -- SQL script for cleaning and standardizing the dataset
EDA.sql            -- SQL script for performing exploratory data analysis
README.md          -- Project overview and explanation
```

## Conclusion

This project demonstrates essential data cleaning and exploratory data analysis techniques to prepare and analyze a layoff dataset. The insights gained from this project can guide decision-making processes for companies and analysts interested in understanding layoff trends and patterns.
