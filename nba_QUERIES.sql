-- Part 1 =======================

-- Drop DB if exists
DROP DATABASE IF EXISTS nba_db;


-- Create DB nba_db
CREATE DATABASE nba_db;

-- Connect to nba_db
\c nba_db;

-- Drop table if exists
DROP TABLE IF EXISTS players;

-- Create table here
CREATE TABLE players (
 name pdVARCHAR(50) NOT NULL,
    age INTEGER NOT NULL,
    team VARCHAR(50) NOT NULL,
    games INTEGER NOT NULL,
    points INTEGER NOT NULL);


-- Insert player here
INSERT INTO players (name,age,team,games,points) values ('Anderson Varejao', 29, 'CLE', 25, 271);


-- Part 2 =======================
-- Uncomment COPY players statement and modify it with YOUR file path!


COPY players
  (name, age, team, games, points)
FROM '\Users\antho\Downloads\nba_sql-master\nba_sql-master/nba_season_2011-2012.csv'
    DELIMITER ',' CSV;


-- 1.All columns for all players from the New York Knicks (NYK).
SELECT * FROM players WHERE team = 'NYK';
-- 2.All columns for all players from the Indiana Packers (IND) who are under 26 years old.
SELECT * FROM players WHERE team = 'IND' AND age < 26;
-- 3.All columns for all players, ordered from least points scored to most points scored.
SELECT * FROM players ORDER BY points ASC;
-- 4.Name and Points per game (points/games), for the players with the top 20 points per game.
SELECT name,points FROM players ORDER BY Points DESC limit 20;
-- 5.The average age for all players.
SELECT AVG(age) FROM players;
-- 6.The average age for all players on the Oklahoma City Thunder (OKC).
SELECT AVG(age) FROM players WHERE team='OKC';
-- 7.The average age for all players who played more than 40 games.
SELECT AVG(age) FROM players WHERE games>40;
-- 8.The team and total points scored from all players on that team (team points) ordered from most team points to least.
SELECT SUM(points),team FROM players GROUP BY team ORDER BY AVG(points) DESC;
-- 9.The age and the average points per game for that age, ordered from oldest to youngest for all ages.
 SELECT AVG(points),age FROM players GROUP BY age ORDER BY AVG(points) DESC;
-- 10.The team and the the number of players who score above 12 points per game on that team, ordered from the most number of players to the least number of players.
SELECT team, COUNT( POINTS > 12) from players GROUP BY TEAM ORDER BY COUNT( POINTS > 12) DESC;