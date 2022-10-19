SELECT
*
FROM
['List-of-best-selling-videogames$']

-- add new columns for year dates
ALTER TABLE ['List-of-best-selling-videogames$']
ADD year_release int

-- add new columns for moth & day dates
ALTER TABLE ['List-of-best-selling-videogames$']
ADD month_release int, day_release int

-- add data into year new columns
UPDATE ['List-of-best-selling-videogames$']
set year_release = YEAR([Release date])

-- add data into month new columns
UPDATE ['List-of-best-selling-videogames$']
set month_release = MONTH([Release date])

-- add data into month new columns
UPDATE ['List-of-best-selling-videogames$']
set day_release = DAY([Release date])

--Replace comma with space for publisher
UPDATE ['List-of-best-selling-videogames$']
set Publisher = REPLACE(Publisher,',',' ')

--Replace comma with space for Developer
UPDATE ['List-of-best-selling-videogames$']
set Developer = REPLACE(Developer,',','/')

--Replace comma with space for game
UPDATE ['List-of-best-selling-videogames$']
set Game = REPLACE(Game,',',' ')

--Replace comma with space for genre
UPDATE ['List-of-best-selling-videogames$']
set Genre = REPLACE(Genre,',',' ')


-- Delete bad columns
ALTER TABLE ['List-of-best-selling-videogames$']
DROP COLUMN year, month, day, release_year, release_month, release_day

-- Find null values in the table
SELECT
*
FROM
['List-of-best-selling-videogames$']
WHERE
Genre IS NULL

-- Add a N/A for null genere
UPDATE ['List-of-best-selling-videogames$']
set Genre = 'N/A'
WHERE
Genre IS NULL

-- Find N/A in Genere
SELECT
Game,
Genre
FROM
['List-of-best-selling-videogames$']
WHERE
Genre = 'N/A'

--Find each publisher
SELECT 
DISTINCT Publisher
FROM
['List-of-best-selling-videogames$']

--Find each Genre
SELECT 
DISTINCT Genre
FROM
['List-of-best-selling-videogames$']

SELECT
*
FROM
['List-of-best-selling-videogames$']
WHERE
Developer  LIKE '%Capcom%'

--Find the sum of sales based on Publisher
SELECT
Publisher, 
SUM(sales) as sum_sales
FROM
['List-of-best-selling-videogames$']
GROUP BY 
Publisher

--Find the sum of sales based on Platform
SELECT
Platform, 
SUM(sales) as sum_sales
FROM
['List-of-best-selling-videogames$']
GROUP BY 
Platform
ORDER BY
sum_sales ASC

--Find the sum of sales based on Develoepr
SELECT
Developer, 
SUM(sales) as sum_sales
FROM
['List-of-best-selling-videogames$']
GROUP BY 
Developer

--Find the sum of sales based on Genre
SELECT
Genre, 
SUM(sales) as sum_sales
FROM
['List-of-best-selling-videogames$']
GROUP BY
Genre
ORDER BY
sum_sales DESC

-- Sum of sales per year 
SELECT
year_release,
SUM(sales) as sum_sales
FROM
['List-of-best-selling-videogames$']
GROUP BY
year_release