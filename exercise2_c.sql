--select * from customer 
--select * from address
--select * from city
--select * from country 

SELECT concat(first_name, ' ', last_name) AS name    -- concatenate first_name and last_name columns from customer table and alias the result as name for output
FROM customer                                        -- pull info out of customer table for joining with address, city and country on id 
INNER JOIN address ON customer.address_id = address.address_id
INNER JOIN city ON address.city_id = city.city_id
INNER JOIN country ON city.country_id = country.country_id WHERE country.country LIKE '%land';   -- filter out the country name as string ending with "%=placeholder..land"


/* 
INNER JOIN = normal join: combine rows from two or more tables based related column between them. result includes only rows where a match in specified columns from both tables.
If no match, row excluded from result.
*/ 