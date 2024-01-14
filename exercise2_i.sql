
--select * from language
--select * from film

SELECT language.name                                        -- this is printed in txt (name of language which is not associated with a film);
FROM language                                               -- all info pulled out of language table
LEFT JOIN film ON language.language_id = film.language_id   -- combine data records of language and film with same id
WHERE film.film_id IS NULL                                  -- filters results only where no match is found in film table id
ORDER BY language.name;                                     -- sorts set alphabetically in a column name

/*
LEFT JOIN: returns all rows from left table and matched rows from right table. 
If no match in right table, NULL values returned for columns from right table.
*/