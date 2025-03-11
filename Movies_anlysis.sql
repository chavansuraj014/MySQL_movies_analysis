-- Retrieve all actors' names and their birth years(Basic)

SELECT 
    Name, birth_year
FROM
    actors;
    
-- -------------------------------------------------------------------------------------------------------------------------------------------

-- Fetch all movie titles and their release years.

SELECT 
    Title, Release_year
FROM
    Movies;
    
-- -------------------------------------------------------------------------------------------------------------------------------------------

-- Count the total number of movies in the database.(Basic)

SELECT 
    COUNT(title) AS Total_movies
FROM
    movies;
    
-- -------------------------------------------------------------------------------------------------------------------------------------------

-- List all unique languages available in the database.(Basic)

SELECT 
    Name AS language_name
FROM
    languages;

-- -------------------------------------------------------------------------------------------------------------------------------------------

-- Find all movies released after 2010 with an IMDb rating higher than 7.5.(Intermediate)

SELECT 
    Title, Release_year, Imdb_rating
FROM
    movies
WHERE
    release_year > 2010
        AND imdb_rating > 7.5
ORDER BY Release_year;

-- -----------------------------------------------------------------------------------------------------------------------------------------------------

-- Display all movies along with their financial details (budget, revenue, currency).(Intermediate)

select Title,Budget,Revenue,Currency from movies as m
join  financials as f
on m.movie_id=f.movie_id;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------

-- Retrieve the names of actors who have acted in a specific movie (e.g., 'Inception').(Intermediate)

SELECT 
    Name, Title
FROM
    actors AS a
        JOIN
    movie_actor AS m ON a.actor_id = m.actor_id
        JOIN
    movies AS v ON m.movie_id = v.movie_id;
    
-- ------------------------------------------------------------------------------------------------------------------------------------------------------

-- Show all movies that belong to the 'Hollywood' industry and have a budget greater than $10 million.(Intermediate)

SELECT 
    Title, Industry, Currency, Unit, Budget
FROM
    movies AS m
        JOIN
    financials AS f ON m.movie_id = f.movie_id
WHERE
    currency = 'USD' AND budget > 10;
    
-- -------------------------------------------------------------------------------------------------------------------------------------------------------

-- Find the top 3 industries that have produced the most movies.(Advanced)

 SELECT 
    Industry, COUNT(title) AS Total_movies
FROM
    movies AS m
        JOIN
    financials AS f ON m.movie_id = f.movie_id
GROUP BY industry
;

-- -------------------------------------------------------------------------------------------------------------------------------------------------------

 -- List actors who have acted in more than 3 movies.(Advanced)
 
 SELECT 
    Name AS Actor_name, COUNT(movie_id) AS Total_movies
FROM
    movie_actor AS m
        JOIN
    actors AS t ON m.actor_id = t.actor_id
GROUP BY Actor_name
HAVING Total_movies > 3
ORDER BY Total_movies DESC;

-- -------------------------------------------------------------------------------------------------------------------------------------------------------

-- Identify the industry with the highest average IMDb rating.(Advanced)

SELECT 
    Industry, SUM(Imdb_rating) / COUNT(Title) AS avg_imdb_rating
FROM
    movies
GROUP BY industry;

-- -------------------------------------------------------------------------------------------------------------------------------------------------------

-- Find the actor who has worked with the most unique studios. Display the actor’s name and the number of different studios they have worked with. 
-- If multiple actors have the same highest count, list all of them.(Advanced)

SELECT 
    Name AS Actor_name,
    COUNT(DISTINCT studio) AS highest_count_studios
FROM
    movie_actor AS m
        JOIN
    actors AS a ON m.actor_id = a.actor_id
        JOIN
    movies AS v ON m.movie_id = v.movie_id
GROUP BY Actor_name
ORDER BY highest_count_studios DESC;