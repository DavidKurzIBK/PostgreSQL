--select * from film
--select * from actor

SELECT film.title, film.length   -- select output columns
FROM film                        -- pull info out of film to join it over ids with film_actor and actor                          
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE actor.first_name = 'AUDREY';                 -- then filter the result by a name as string

/* 
INNER JOIN = normal join: combine rows from two or more tables based related column between them. result includes only rows where a match in specified columns from both tables.
If no match, row excluded from result.
*/ 

/*
SELECT DISTINCT title, length
FROM actor
INNER JOIN film_actor
ON actor.actor_id = film_actor.actor_id
INNER JOIN film
ON flim_actor.film_id = film.film_id
WHERE actor.first_name = 'AUDREY';*/

