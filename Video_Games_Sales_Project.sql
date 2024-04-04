# What was the most popular genre in North America FROM 2015 to  2020
SELECT genre, SUM(na_sales) as sum_of_sales
FROM video_games_sales
WHERE year BETWEEN 2015 AND 2020
GROUP BY genre
ORDER BY sum_of_sales DESC
LIMIT 1;

# results: Shooters was the most popular genre from 2015 to 2020


# List the top two publishers that published the most Sports games FROM 2010 to 2020
SELECT publisher, COUNT(genre) AS num_of_sports_games
FROM video_games_sales
WHERE  genre = 'Sports'
AND year BETWEEN 2010 AND 2020
GROUP BY publisher
ORDER BY COUNT(genre) DESC
LIMIT 2;

# results: Electronic Arts and Konnami Digital Entertainment published the most Sports games from 2010 to 2020

# What was Nintendo's most popular game globaly.
SELECT name, global_sales
FROM video_games_sales
WHERE publisher = 'Nintendo'
ORDER BY global_sales DESC
LIMIT 1;

#results: Wii Sports was the most popular game globally

#Which year were the most racing games published
SELECT year, COUNT(genre) AS num_of_racing_games
FROM video_games_sales
WHERE genre = 'Racing'
GROUP BY year
ORDER BY num_of_racing_games DESC
LIMIT 1;

#results: Most of the racing games were published in 2003

#Rank the action games based on sales in Japan 
SELECT
name,
jp_sales,
DENSE_RANK() OVER(PARTITION BY genre ORDER BY jp_sales DESC) as ranking
FROM video_games_sales
WHERE genre = 'Action';

#result: The top 5 action games based on sales in Japan are Pokemon HeartGold/Pokemon SoulSilver, Monster Hunter X, Yokai Watch Busters, Resident Evil 2, and The Legend of Zelda.


#List the top  5 most popular fighting games in North America.
SELECT name, na_sales
FROM video_games_sales
WHERE genre = 'Fighting'
ORDER BY na_sales DESC
LIMIT 3;

#result: The top 3 most popular figthing games in North America are Super Smash Bros. Brawl, Super Smash Bros. Melee, Tekken 3.


# Based on global sales, rank games by platform from 2016 to 2020.
SELECT
name,
platform,
year,
global_sales,
DENSE_RANK() OVER(PARTITION BY platform ORDER BY global_sales DESC) AS ranking
FROM video_games_sales
WHERE year BETWEEN 2016 AND 2020;

#result:  Top ranked games by plaform based on global sales
# 3DS: Yokai Watch 3
# PC:  Overwatch
# PS3: FIFA 17
# PS4: FIFA 17
# PSV: Dragon Quest Builders: Revive Alefgard
# WiiU: The Legend of Zelda: Twilight Princess HD
# Xbox360: LEGO Marvel's Avengers
# XOne:  Tom Clancy's The Division


# How many simulation games were published from 2015 and 2020
SELECT COUNT(*) as num_of_simulation_games
FROM  video_games_sales
WHERE genre = 'Simulation'
AND year BETWEEN 2015 AND 2020;

#result: 25 stimulation games were published from 2015 to 2020

# How many Role Playing games that were released on either the PS3, Wii, or Xbox 360
SELECT COUNT(*)
FROM video_games_sales
WHERE genre = 'Role-Playing'
AND platform IN ('PS3', 'Wii', 'X360');

#result: 228 role playing games were released on either the PS3, Wii, or Xbox 360


# Compare the sum of the total global_sales for all of the publishers from 2015 to 2020
SELECT
publisher,
global_sales,
SUM(global_sales) OVER(PARTITION BY publisher ORDER BY global_sales) AS Rolling_Total
FROM video_games_sales
WHERE year BETWEEN 2015 and 2020;

#result: Electronic Arts had the highest global sales, 57.7 million, from 2015 to 2020
















