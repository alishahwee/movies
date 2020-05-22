-- write a SQL query to list the titles of the five highest rated movies (in order) that Chadwick Boseman starred in, starting with the highest rated
WITH chadwick_boseman_movies_id AS (
  SELECT movie_id FROM stars
  WHERE person_id = (SELECT id FROM people
                     WHERE name = 'Chadwick Boseman')
)

SELECT title FROM movies
JOIN ratings
  ON movies.id = ratings.movie_id
WHERE id IN chadwick_boseman_movies_id
ORDER BY rating DESC
LIMIT 5;