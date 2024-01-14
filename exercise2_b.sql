--select * from film
--select * from category



SELECT title, category.name AS category    -- select columns for output and rename it
FROM film                                  -- pull info out of film table to conect it over inner join with film_category, category over their ids
INNER JOIN film_category ON film.film_id = film_category.film_id
INNER JOIN category ON film_category.category_id = category.category_id
WHERE category.name IN ('Documentary', 'Comedy') AND film.replacement_cost < 10.00;   -- filter category names by "Documentary" and "Comedy" and replacement cost smaLler than 10.00 

-- WHERE (category.name = 'Documentary' or category.name = 'Comedy')

/* 
INNER JOIN = normal join: combine rows from two or more tables based related column between them. result includes only rows where a match in specified columns from both tables.
If no match, row excluded from result.
*/ 

