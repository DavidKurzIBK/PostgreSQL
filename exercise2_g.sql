-- select * from film

SELECT COUNT(DISTINCT film.rating) AS differen_ratings      -- count the number of distinct film ratings. The result of this count is given the alias differen_ratings
FROM film                                                   -- pull all info out of film table
WHERE 'Deleted Scenes' = ANY(special_features);             -- filters result where ANY operator checks if 'Deleted Scenes' is present in the list of special features for each film.