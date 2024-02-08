/*Haupt-datenbank-tabelle "film_actor"; 
Relation: actor & film over id; 
Aim: count films in which actor plays, with a defined film length.
INNER JOIN: only rows which both tables have in common!!
IN-Statement: to specify multiple-values in a WHERE-clause!! 
NOT-EXISTS: TRUE value if subquery returns one or more records which fit 
LEFT JOIN: all records from left table plus matching ones from right (Null's added to no match on the right table)
*/


SELECT first_name, last_name, count(film_actor) ----- count(film_actor.film_id)
FROM film_actor INNER JOIN actor ON actor.actor_id = film_actor.actor_id
WHERE film_id != ALL(SELECT film_id FROM film WHERE length < 120) 

-- 4 Möglichkeiten: 
-- WHERE film_id != ALL(SELECT film_id FROM film WHERE length < 120) -- sehr ineffizient
--- WHERE film_id NOT IN (SELECT film_id FROM film WHERE length < 120)
---- WHERE NOT EXISTS (SELECT film_id FROM film WHERE length < 120 AND film.film_id = film_actor.film_id)
----- LEFT JOIN film ON film_actor.film_id = film.film_id AND length < 120
----- WHERE film.film_id IS NULL 
GROUP BY first_name, last_name  -- Anzahl  Filme für  Schauspieler separat gezählt.
ORDER BY first_name, last_name -- automatisch ASC order!!









