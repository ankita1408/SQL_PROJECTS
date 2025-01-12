-- Exploratory Data Analysis

select * from layoffs_staging2;

select max(total_laid_off),max(percentage_laid_off) from layoffs_staging2;

select * from layoffs_staging2 where percentage_laid_off=1 order by total_laid_off desc;

select * from layoffs_staging2 where percentage_laid_off=1 order by funds_raised_millions desc;

select company, sum(total_laid_off) from layoffs_staging2 group by company order by 2 desc;


select company, sum(total_laid_off),location from layoffs_staging2 group by company order by 2 desc;

select min(`date`),max(`date`) from layoffs_staging2;

select industry, sum(total_laid_off),location from layoffs_staging2 group by industry order by 2 desc;

select industry, sum(total_laid_off),country from layoffs_staging2 group by industry order by 2 desc;


select year(`date`), sum(total_laid_off),country from layoffs_staging2 group by year(`date`) order by 1 desc;


select stage,company, sum(total_laid_off),country from layoffs_staging2 group by stage order by 3 desc;


select company, sum(total_laid_off),country from layoffs_staging2 group by stage order by 3 desc;

select substring(`date`,1,7) as 'month',sum(total_laid_off) from layoffs_staging2 where substring(`date`,1,7) is not null group by substring(`date`,1,7) order by 1;

with rolling_total as
( select substring(`date`,1,7)as m ,sum(total_laid_off)as total_off
from layoffs_staging2
 where substring(`date`,1,7) is not null 
 group by substring(`date`,1,7) order by 1
) select m,total_off,sum(total_off) over (order by m) as rolling_total
from rolling_total;

select * from layoffs_staging2;

select company ,`date`as d,sum(total_laid_off) from layoffs_staging2 group by company,d
order by 3 desc;

select company ,year(`date`)as Y ,sum(total_laid_off),country 
from layoffs_staging2
group by company,Y,country
order by 3 desc;

with company_year(company,Y,total_laid_off )as
(
select company ,year(`date`)as Y ,sum(total_laid_off)
from layoffs_staging2
group by company,Y
),
company_year_rank as(select * ,dense_rank() over(partition by  Y order by total_laid_off desc) as ranking
 from company_year where Y is not null)
 select * from company_year_rank where ranking<=5;
 
 

