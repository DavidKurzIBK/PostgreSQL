SELECT      category.name AS category_name,
            COUNT(*) FILTER (WHERE EXTRACT(ISODOW FROM rental.rental_date) = 1) AS mon,
            COUNT(*) FILTER (WHERE EXTRACT(ISODOW FROM rental.rental_date) = 2) AS tue,
            COUNT(*) FILTER (WHERE EXTRACT(ISODOW FROM rental.rental_date) = 3) AS wed,
            COUNT(*) FILTER (WHERE EXTRACT(ISODOW FROM rental.rental_date) = 4) AS thu,
            COUNT(*) FILTER (WHERE EXTRACT(ISODOW FROM rental.rental_date) = 5) AS fri,
            COUNT(*) FILTER (WHERE EXTRACT(ISODOW FROM rental.rental_date) = 6) AS sat,
            COUNT(*) FILTER (WHERE EXTRACT(ISODOW FROM rental.rental_date) = 7) AS sun,
            COUNT(*) AS total
FROM        rental
INNER JOIN  inventory
ON          rental.inventory_id = inventory.inventory_id
INNER JOIN  film_category
ON          inventory.film_id = film_category.film_id
INNER JOIN  category
ON          film_category.category_id = category.category_id
WHERE       rental.rental_date::date between '2005-06-01' and '2005-06-30' 
GROUP BY    category.name
ORDER BY    category.name;