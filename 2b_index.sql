
/* wenn 1.000.000 Zeilen von folgender Abfrage selectiert:
SELECT customer_id, last_name, first_name FROM customer
ORDER BY last_name ASC;*/


/*"covering index" designed to improve performance of queries: filtering, sorting, searching 
are more effective later
involving columns: last_name, first_name and customer_id 
in customer table. 
CREATE INDEX: creates index on table*/

CREATE INDEX idx_customer_lastname_firstname_id      -- name of index beeing created
ON customer(last_name, first_name, customer_id);     -- with these rows the indexis beeing created.


