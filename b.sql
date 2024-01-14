SELECT film.title, COALESCE(total_payment, 0) AS total_payment
FROM film 
LEFT JOIN (
	SELECT film.film_id AS filmid, SUM(payment.amount) AS total_payment
	FROM film 
	INNER JOIN inventory ON film.film_id = inventory.film_id
	INNER JOIN rental ON rental.inventory_id = inventory.inventory_id
	INNER JOIN payment ON payment.rental_id = rental.rental_id
	GROUP BY film.film_id)
ON film.film_id = filmid
ORDER BY total_payment ASC, film.title; -- NULLS first


/*
Subquery (Inner SELECT):calculates the total payment (SUM(payment.amount)) for each film by joining the film, inventory, rental, and payment tables. It groups the results by film.film_id.
LEFT JOIN: to combine the film table with the results obtained from the subquery. The join condition is film.film_id = filmid.
SELECT:film title and the total payment from the joined tables. The total_payment is derived from the subquery.
ORDER BY: total_payment in ascending order and then by film.title. films with lower total payments will appear first, films with same total payment, sorted alphabetically by title.

INNER JOIN includes only the matched rows; 
LEFT (OUTER) JOIN includes all rows from left table and matching rows from the right table, filling with NULLs for columns right table when no match. */
