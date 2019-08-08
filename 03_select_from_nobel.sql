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


--More Quizes
--shows the name of winner's names beginning with C and ending in n

SELECT name
FROM nobel
WHERE winner LIKE 'C%' AND winner LIKE '%n'


--shows how many Chemistry awards were given between 1950 and 1960

SELECT COUNT(subject)
FROM nobel
WHERE subject = 'Chemistry' AND yr BETWEEN 1950 and 1960


--shows the amount of years where no Medicine awards were given

SELECT COUNT(DISTINCT yr)
FROM nobel
WHERE yr NOT IN (SELECT DISTINCT yr
                  FROM nobel
                  WHERE subject = "Medicine"
                  )


--shows the winners whose names starts with "Sir" and year of award starting 196

SELECT subject, winner
FROM nobel
WHERE winner LIKE 'Sir%' AND yr LIKE '196%'


--show the year when neither a Physics or Chemistry award was given

SELECT yr
FROM nobel
WHERE yr NOT IN (SELECT yr
                  FROM nobel
                  WHERE subject IN ('Chemistry', 'Physics')
                  )


  --shows the years when a Medicine award was given but no Peace or Literature award was

SELECT DISTINCT yr
FROM nobel
WHERE subject = "Medicine" AND yr NOT IN (SELECT yr
                                          FROM nobel
                                          WHERE subject = 'Literature')
                           AND yr NOT IN (SELECT yr
                                          FROM nobel
                                          WHERE subject = 'Peace')

--count subject and group by subject

SELECT subject, COUNT(subject)
FROM nobel
WHERE yr ='1960'
GROUP BY subject
