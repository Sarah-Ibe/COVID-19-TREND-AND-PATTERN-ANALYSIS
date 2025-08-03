SELECT * FROM who_covid.covid_data

where Cumulative_deaths<0;


-- This dataset can be used for:

-- Tracking the spread and trends of COVID-19 globally and by country
-- Modeling and forecasting pandemic progression
-- Comparative analysis of the pandemic’s impact across countries and regions
-- Visualization and reporting

-- a. . Global Trends Over Time

SELECT Date_reported,
       SUM(New_cases) AS total_new_cases,
       SUM(New_deaths) AS total_new_deaths
FROM covid_data

where New_cases>= 0 and New_deaths>=0
GROUP BY Date_reported
ORDER BY Date_reported desc;



-- b. Top 10 Countries by Total Cases

SELECT 
   country, max(Cumulative_cases) total_cases
FROM
    covid_data
WHERE
    New_cases >= 0 AND New_deaths >= 0 
    
group by country
order by total_cases desc
limit 10
;

-- c.Daily Trends by Country

SELECT 
  Date_reported, country, max(Cumulative_cases) total_cases
FROM
    covid_data
WHERE
    New_cases >= 0 AND New_deaths >= 0 
    
group by Date_reported, country
order by total_cases desc
limit 10
;

-- Modeling and forecasting pandemic progression

-- daily new cases
SELECT Date_reported, Country, new_cases
FROM covid_data
WHERE Country = 'Nigeria'
ORDER BY Date_reported;


Select * from covid_data;

-- Filtering null values

SELECT * FROM covid_data
WHERE New_cases IS NULL;

-- Updating null values with 0
SET SQL_SAFE_UPDATES = 0;

UPDATE covid_data
SET New_cases = 0
WHERE New_cases IS NULL;

UPDATE covid_data
SET New_deaths = 0
WHERE New_deaths IS NULL;
