/*
show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'
*/

SELECT matchid, player
FROM goal
WHERE teamid = 'GER'


--Show id, stadium, team1, team2 for just game 1012
SELECT id,stadium,team1,team2
FROM game
WHERE id = 1012

/*
You can combine the two steps into a single query with a JOIN.

SELECT *
  FROM game JOIN goal ON (id=matchid)

The FROM clause says to merge data from the goal table with that from the game table. The ON says how to figure out which rows in game go with which rows in goal - the matchid from goal must match id from game. (If we wanted to be more clear/specific we could say
ON (game.id=goal.matchid)

The code below show the player, teamid, stadium and mdate for every German goal.
*/

SELECT player,teamid, stadium, mdate
FROM game JOIN goal ON (game.id=goal.matchid)
WHERE teamid = 'GER'


/*
Using JOIN as in the above question.
Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
*/

SELECT team1, team2, player
FROM game JOIN goal ON (game.id = goal.matchid)
WHERE player LIKE 'Mario%'


/*
The table eteam gives details of every national team including the coach.
JOIN goal to eteam using the phrase goal JOIN eteam on teamid=id
Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
*/


SELECT player, teamid, coach, gtime
FROM goal JOIN eteam ON (goal.teamid = eteam.id) --joining two table together.
WHERE gtime <= 10


/*
JOIN game table with the eteam table using either
game JOIN eteam ON (team1=eteam.id) or game JOIN eteam ON (team2=eteam.id)

Notice that because id is a column name in both game and eteam you must specify eteam.id instead of just id

List the the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.

*/


SELECT mdate, teamname  -- teamname is from the eteam table while mdate is from game table
FROM game JOIN eteam ON (game.team1 = eteam.id)
WHERE coach = 'Fernando Santos'


--List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'

SELECT player
FROM game JOIN goal ON (game.id = goal.matchid)
WHERE stadium = 'National Stadium, Warsaw'




--show the name of all players who scored a goal against Germany.

SELECT DISTINCT player
FROM game JOIN goal ON (game.id = goal.matchid)
WHERE (team1='GER' OR team2='GER') AND teamid != 'GER';



--Show teamname and the total number of goals scored.
SELECT teamname, COUNT(teamid)
FROM eteam JOIN goal ON (eteam.id = goal.teamid)
GROUP BY teamname


--Show the stadium and the number of goals scored in each stadium.

SELECT stadium, COUNT(stadium)
FROM game JOIN goal ON (game.id = goal.matchid)
GROUP BY stadium


--For every match involving 'POL', show the matchid, date and the number of
--goals scored.

SELECT matchid, mdate, COUNT(matchid)
FROM game JOIN goal ON (game.id = goal.matchid )
WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid, mdate

/*
For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
*/

SELECT matchid, mdate, COUNT(matchid)
FROM game JOIN goal ON (game.id = goal.matchid )
WHERE teamid = 'GER'
GROUP BY mdate, matchid




--List every match with the goals scored by each team as shown.

SELECT game.mdate, game.team1,
SUM(CASE WHEN goal.teamid = game.team1 THEN 1 ELSE 0 END) AS score1,
game.team2,
SUM(CASE WHEN goal.teamid = game.team2 THEN 1 ELSE 0 END) AS score2
FROM game LEFT JOIN goal ON matchid = id
GROUP BY game.id,game.mdate, game.team1, game.team2
ORDER BY mdate,matchid,team1,team2
