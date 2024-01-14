-- SELECT * FROM film
-- SELECT * FROM actor
-- SELECT * FROM film_actor

SELECT actor.first_name, actor.last_name
FROM actor WHERE actor_id IN (
	SELECT actor_id 
	FROM film_actor
	INNER JOIN film ON film_actor.film_id = film.film_id
	WHERE film.title ='LUKE MUMMY'
)
ORDER BY last_name DESC;



/*
Subquery (Inner SELECT):selects actor_id from film_actor table getting info out of film table film_id.
filters results to only include records where the film title is 'LUKE MUMMY.'

Main Query (Outer SELECT):selects first_name and last_name columns from actor table whose actor_id is obtained from the subquery.
WHERE: filters the actors based on actor_id obtained from the subquery. This effectively limits the result to actors who have participated in the film with the title 'LUKE MUMMY.'
ORDER BY last_name in descending order. actors listed in alphabetical order of their last names, starting from the highest (Z) to the lowest (A).

*/ 
