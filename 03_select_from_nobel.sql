--display the Nobel prizes for 1950

SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950


--display who won the 1962 prize for Literature

SELECT winner
FROM nobel
WHERE yr = 1962 AND subject = 'Literature'


--show the year and subject that won 'Albert Einstein' his prize

SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein'


--show the name of the 'Peace' winners since the year 2000, including 2000

SELECT winner
FROM nobel
WHERE subject = 'Peace' AND yr >= 2000


-- show all details of the Literature prize winers for 1980 t0 1989 inclusive

SELECT *
FROM nobel
WHERE subject = 'Literature' AND yr >= 1980 AND yr <= 1989


--show details of presidential winners

SELECT *
FROM nobel
WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama')

--select all winners whose first name is John
SELECT winner
FROM nobel
WHERE winner LIKE 'John%'

/*
Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984
*/

SELECT yr, subject, winner
FROM nobel
WHERE (subject = 'Physics' AND yr = 1980) OR (subject = 'Chemistry' AND yr = 1984);


/*
Show the year, subject, and name of winners for 1980 excluding Chemistry and
Medicine
*/

SELECT yr, subject, winner
FROM nobel
WHERE (subject <> 'Chemistry' AND yr = 1980) AND (subject <> 'Medicine' AND yr = 1980);

/*
Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)
*/

SELECT yr, subject, winner
FROM nobel
WHERE (subject = 'Medicine' AND yr < 1910) OR (subject = 'Literature' AND yr >= 2004  )

-- find the details of the prize won by PETER GRUNBERG

SELECT *
FROM nobel
WHERE winner = 'PETER GRÜNBERG'


--find all details of the prize won by EUGENE
SELECT *
FROM nobel
WHERE winner = 'EUGENE O''NEILL'


/*
Knights in order

List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.
*/

SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY desc

/*
The expression subject IN ('Chemistry','Physics') can be used as a value - it will be 0 or 1.

Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last.
*/

SELECT winner, subject
FROM nobel
WHERE yr=1984
ORDER BY subject IN ('Physics','Chemistry'), subject, winner
