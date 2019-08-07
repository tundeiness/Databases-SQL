--Using a WHERE clause to show the population of 'France'.

SELECT population FROM world
  WHERE name = 'Germany'


 /* Checking a list using IN whiich permits us to check if an item is in a list.
 The code below show the name and the population for 'Sweden', 'Norway' and
 'Denmark'.
 */

SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');


/* Using BETWEEN keyword to range (range specified is inclusive of boundary
  values). The code below shows the country and the area for countries with
  an area between 200,000 and 250,000.
*/


  SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000


--Show the population density of China, Australia, Nigeria and France

SELECT name, area/population
FROM world
WHERE name IN ('China','Nigeria','France', 'Australia')


/* Show countries with an area larger than 50000 and a population
  smaller than 10000000 */

SELECT name, area, population
FROM world
WHERE area > 50000 AND population < 10000000

/*Show the name of the country and the result of it's area * 2
  where population is 64000*/

SELECT name, area*2
FROM world
WHERE population = 64000


/* Select name using the length of name string as a criteria, where
    the length of name is 5 and region is Europe.
*/
SELECT name, length(name)
FROM world
WHERE length(name)=5 and region='Europe'


--Select the name of the countries whose name ends in A or L

SELECT name
FROM world
WHERE name LIKE '%a' OR name LIKE '%l'


--Select the name of the countries whose name starts with Al..
SELECT name, population
FROM world
WHERE name LIKE 'Al%'


/* Using BETWEEN keyword to range (range specified is inclusive of boundary
  values). The code below shows the country and the area for countries with
  an area between 1000000 and 1250000.
*/
SELECT name, population
FROM world
WHERE population BETWEEN 1000000 AND 1250000
