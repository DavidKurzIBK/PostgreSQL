--select * from rental
 
SELECT COUNT(*) AS renturned_friday_13                 -- specifies to count the number of rows of result (COUNT(*)) and give as alias renturned_friday_13
FROM rental                                            -- all info of rental table is pulled
WHERE EXTRACT(ISODOW FROM rental.return_date) = 5      -- filters result by checking if day of the week of the return date is Friday (ISO day of the week: Monday = 1, Sunday = 7). 
AND EXTRACT(DAY FROM rental.return_date) = 13;         -- filters result by checking if the day of the month of the return date from selection above is the 13th.