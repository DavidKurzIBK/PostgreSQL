WITH t AS(
	SELECT film.film_id AS film_id, 
	category.category_id AS category_id, 
	film.title AS film_title,
	payment.amount AS payment_amount,
	category.name AS category_name 
	FROM category
	INNER JOIN film_category ON film_category.category_id = category.category_id
	INNER JOIN film ON film.film_id = film_category.film_id
	INNER JOIN inventory ON film.film_id = inventory.film_id
	INNER JOIN rental ON rental.inventory_id = inventory.inventory_id 
	INNER JOIN payment ON payment.rental_id = rental.rental_id)
	SELECT * FROM (
		SELECT t.film_title AS title,
		t.category_name AS category_name,
		SUM(t.payment_amount) AS total_earnings,
		AVG(t.payment_amount) AS average_payment
		FROM t GROUP BY t.film_id,
		t.film_title, 
		t.category_name
		UNION ALL 
		SELECT 'Category Pricings' AS title,
		t.category_name AS category_name,
		SUM(t.payment_amount) AS total_earnings,
		AVG(t.payment_amount) AS average_payment
		FROM t 
		GROUP BY t.category_id, category_name) vector
		ORDER BY total_earnings DESC, title, category_name;


/*
Common Table Expression (WITH Clause):

The query starts by creating a Common Table Expression (CTE) named t. This CTE selects relevant information about films, categories, payments, and more.
Main Query (OUTER SELECT):

The outer query selects data from the CTE (t) and combines it with a summary row for each category using the UNION ALL operator.
Inner SELECTs:

The first inner SELECT calculates total earnings and average payments for each individual film, grouping by film_id, film_title, and category_name.
The second inner SELECT calculates the same metrics for each category, using the title 'Category Pricings' for the summary row and grouping by category_id and category_name.
ORDER BY Clause:

The result set is ordered by total_earnings in descending order, followed by title and category_name.
*/