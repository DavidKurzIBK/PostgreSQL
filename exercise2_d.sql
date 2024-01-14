--select * from customer 
--select * from rental
--select * from staff

SELECT customer.last_name, rental.return_date 
FROM customer   -- pull customer table info for join with rental and staff on the id's, last_name and return_date are selected for output
INNER JOIN rental ON customer.customer_id = rental.customer_id
INNER JOIN staff ON rental.staff_id = staff.staff_id WHERE staff.last_name = 'Stephens' AND DATE(rental.rental_date) = '2005-05-24';  -- filter after some specific strings in last_name and rental_date;


/* 
INNER JOIN = normal join: combine rows from two or more tables based related column between them. result includes only rows where a match in specified columns from both tables.
If no match, row excluded from result.
*/ 