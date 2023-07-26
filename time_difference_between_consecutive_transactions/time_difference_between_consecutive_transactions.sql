SELECT rental_id, customer_id, rental_date::TEXT,
  rental_date - LEAD(rental_date) 
    OVER (PARTITION BY customer_id ORDER BY rental_date DESC) AS time_since_previous_rental
FROM rental AS r
WHERE customer_id IN (1, 2)
ORDER BY customer_id, rental_date;