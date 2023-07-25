with results as (SELECT store_id, 
                  category.name AS category, 
                  COUNT(rental_id) AS num_rentals,
                  ROW_NUMBER() OVER (PARTITION BY store_id 
                                     ORDER BY COUNT(rental_id) DESC, category.name) AS row_num 
                FROM rental --Joining all tables necessary for the given problem
                  LEFT JOIN inventory USING(inventory_id)
                  LEFT JOIN film_category USING(film_id)
                  LEFT JOIN category USING(category_id)
                GROUP BY store_id, category.name) 
                
SELECT store_id, category, num_rentals
FROM results
WHERE row_num <=5
;

-- To solve this problem I first joined the necessary tables using appropriate keys from each table. 
-- I chose a left join on the rental table to preserve all rows from the rental table. 
-- Following, I grouped by the store_id and category.name columns, selected a count of rental_id's to get a total number 
  -- of rentals for each category within each store.
-- Using the partition function, I assigned a number to each row of of a stores results, sorted by num_rentals and category.name 
-- per the questions guidelines.
-- I wrapped this result set in a common table expression (cte) and queried searching only for results where the row_num is
  -- greater than or equal to 5, effectively giving me the top 5 categories by number of rentals for each store.