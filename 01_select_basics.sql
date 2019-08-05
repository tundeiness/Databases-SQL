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
