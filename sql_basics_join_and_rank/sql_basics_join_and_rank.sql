SELECT people.id, name, COUNT(*) AS sale_count, 
  RANK() OVER(ORDER BY COUNT(*) DESC) AS sale_rank
FROM people
  LEFT JOIN sales ON people.id = sales.people_id
GROUP BY people.id;