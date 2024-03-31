# What was the most popular genre in North America FROM 2015 to  2020
SELECT genre, SUM(na_sales) as sum_of_sales
FROM video_games_sales
WHERE year BETWEEN 2015 AND 2020
GROUP BY genre
ORDER BY sum_of_sales DESC
LIMIT 1;


# List the top two publishers that published the most Sports games FROM 2010 to 2020
SELECT publisher, COUNT(genre) AS num_of_sports_games
FROM video_games_sales
WHERE  genre = 'Sports'
AND year BETWEEN 2010 AND 2020
GROUP BY publisher
ORDER BY COUNT(genre) DESC
LIMIT 2;

# What was Nintendo's most popular game globaly.
SELECT name, global_sales
FROM video_games_sales
WHERE publisher = 'Nintendo'
ORDER BY global_sales DESC
LIMIT 1;

#Which year were the most racing games published
SELECT year, COUNT(genre) AS num_of_racing_games
FROM video_games_sales
WHERE genre = 'Racing'
GROUP BY year
ORDER BY num_of_racing_games DESC
LIMIT 1;

#Rank the action games based on sales in Japan 
SELECT
name,
jp_sales,
DENSE_RANK() OVER(PARTITION BY genre ORDER BY jp_sales DESC) as ranking
FROM video_games_sales
WHERE genre = 'Action';


#List the top  5 most popular fighting games in North America.
SELECT name, na_sales
FROM video_games_sales
WHERE genre = 'Fighting'
ORDER BY na_sales DESC
LIMIT 5;


# Based on global sales, rank games by platform from 2016 to 2020.
SELECT
name,
platform,
year,
global_sales,
DENSE_RANK() OVER(PARTITION BY platform ORDER BY global_sales DESC) AS ranking
FROM video_games_sales
WHERE year BETWEEN 2016 AND 2020;


# How many simulation games were published from 2015 and 2020
SELECT COUNT(*) as num_of_simulation_games
FROM  video_games_sales
WHERE genre = 'Simulation'
AND year BETWEEN 2015 AND 2020;

# List the Role Playing games that were released on either the PS3, Wii, or Xbox 360
SELECT name, platform
FROM video_games_sales
WHERE genre = 'Role-Playing'
AND platform IN ('PS3', 'Wii', 'X360');


  # Compare the sum of the total global_sales between Nintendo and Take-Two-Interactive from 2015 to 2020
SELECT
publisher,
global_sales,
SUM(global_sales) OVER(PARTITION BY publisher ORDER BY global_sales) AS Rolling_Total
FROM video_games_sales
WHERE publisher IN ('Nintendo', 'Take-Two Interactive')
AND year BETWEEN 2015 and 2020;
















