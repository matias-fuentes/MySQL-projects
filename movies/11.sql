SELECT title FROM movies INNER JOIN ratings ON ratings.movie_id = movies.id INNER JOIN stars ON stars.movie_id = movies.id INNER JOIN people ON people.id = stars.person_id WHERE name = "Chadwick Boseman" ORDER BY rating DESC LIMIT 5;