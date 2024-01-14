SELECT category.name AS category_name,
COUNT(*) FILTER (WHERE EXTRACT(ISODOW FROM rental.rental_date) = 1) AS mon,
COUNT(*) FILTER (WHERE EXTRACT(ISODOW FROM rental.rental_date) = 2) AS tue,
COUNT(*) FILTER (WHERE EXTRACT(ISODOW FROM rental.rental_date) = 3) AS wed,
COUNT(*) FILTER (WHERE EXTRACT(ISODOW FROM rental.rental_date) = 4) AS thu,
COUNT(*) FILTER (WHERE EXTRACT(ISODOW FROM rental.rental_date) = 5) AS fri,
COUNT(*) FILTER (WHERE EXTRACT(ISODOW FROM rental.rental_date) = 6) AS sat,
COUNT(*) FILTER (WHERE EXTRACT(ISODOW FROM rental.rental_date) = 7) AS sun,
COUNT(*) AS total
FROM rental
INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id
INNER JOIN film_category ON inventory.film_id = film_category.film_id
INNER JOIN category ON film_category.category_id = category.category_id 
WHERE EXTRACT(MONTH FROM rental.rental_date) = 8 AND EXTRACT(YEAR FROM rental.rental_date) = 2005
GROUP BY category.name 
ORDER BY category.name;


/*
FROM:query starts by selecting data from the rental table.
INNER JOINs: multiple with inventory, film_category, and category tables to connect rentals to film categories.
WHERE: filters rentals that occurred in June 2005 (EXTRACT(MONTH FROM rental.rental_date) = 6 AND EXTRACT(YEAR FROM rental.rental_date) = 2005).
GROUP BY: category.name, subsequent calculations for each unique category name.
SELECT with Aggregation and Filtering: SELECt uses the FILTER to count rentals based the day of the week (EXTRACT(ISODOW FROM rental.rental_date)). 
Counts are provided for each day of the week (Monday to Sunday) as well as the total count for each category.
ORDER BY: category.name in ascending order.
*/