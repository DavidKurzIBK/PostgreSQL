--select * from customer 
--select * from address
--select * from city
--select * from rental
--select * from staff 

SELECT DISTINCT customer.email                                    -- Retrieves distinct email addresses from the customer table, DISTINCT ensures that only unique email addresses are returned in result
FROM customer                                                     -- pull info out of customer table
INNER JOIN address ON customer.address_id = address.address_id    -- all inner join clauses connect customer with address, city, rental, staff, staff_city and staff_address over its id's
INNER JOIN city ON address.city_id = city.city_id
INNER JOIN rental ON customer.customer_id = rental.customer_id
INNER JOIN staff ON rental.staff_id = staff.staff_id
INNER JOIN address as staff_address ON staff.address_id = staff_address.address_id
INNER JOIN city as staff_city ON staff_address.city_id = staff_city.city_id WHERE city.country_id = staff_city.country_id; 
-- last inner join filters email address on associated countries;

/* 
INNER JOIN = normal join: combine rows from two or more tables based related column between them. result includes only rows where a match in specified columns from both tables.
If no match, row excluded from result.
*/ 