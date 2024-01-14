SELECT staff.first_name, staff.last_name,(
	SELECT MAX(avg_payment_from_customer) 
	FROM (
		SELECT AVG(payment.amount) AS avg_payment_from_customer 
		FROM payment WHERE payment.staff_id = staff.staff_id
		GROUP BY payment.customer_id) AS vector 
) AS highest_avg_payment_from_customer
FROM staff
ORDER BY highest_avg_payment_from_customer ASC, last_name;

/*
Main Query:

The main query selects the first name (staff.first_name), last name (staff.last_name), and a subquery result for the highest average payment from customers for each staff member.
Subquery (Inner SELECT):

The innermost subquery calculates the average payment received from each customer (AVG(payment.amount)) for a specific staff member (payment.staff_id = staff.staff_id). It groups the results by payment.customer_id.
Subquery (Middle SELECT):

The middle subquery wraps the inner subquery and selects the maximum value of the average payment from customers among the customers served by the staff member (MAX(avg_payment_from_customer)).
Outer SELECT:

The outer select retrieves the staff's first name, last name, and the highest average payment from customers using the subquery.
ORDER BY Clause:

The result set is ordered by highest_avg_payment_from_customer in ascending order, and in case of ties, it is further ordered by the last_name.
*/