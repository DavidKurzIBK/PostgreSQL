--select * from customer 
--select * from payment
--select * from staff
--select * from  

SELECT customer.first_name || ' ' || customer.last_name AS customer_name, staff.first_name || ' ' || staff.last_name AS staff_name, SUM(amount) AS total_amount
-- || ' ' || concats first and last name for customer_name and staff_name output with SUM of amount of payment aliased as total_amount
FROM payment                        -- pull all info from this table
JOIN customer USING(customer_id) -- ON customer.customer_id=amount.customer_id  
-- connect payment with customer over id
JOIN staff USING(staff_id) -- ON staff.staff_id=amount.staff_id        
-- connect payment with staff over id   
GROUP BY customer_id, staff_id      -- groupy the id by its unique number
ORDER BY total_amount DESC FETCH FIRST 1 ROWS ONLY; -- then order result descending and show only frist row 

/* 
INNER JOIN = normal join: combine rows from two or more tables based related column between them. result includes only rows where a match in specified columns from both tables.
If no match, row excluded from result.
*/ 