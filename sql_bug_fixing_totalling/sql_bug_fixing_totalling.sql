--SELECT 
--  s.transaction_date as day,
--  d.name,
--  COUNT(s.id)
--  FROM department d
--    JOIN sale s on d.id = s.id
--  group by day, d.name
--  order by name desc

SELECT transaction_date::DATE AS day, 
  d.name::TEXT AS department, 
  COUNT(s.id) AS sale_count
FROM sale AS s
  LEFT JOIN department AS d ON d.id = s.department_id
GROUP BY d.name, transaction_date::DATE
ORDER BY transaction_date::DATE ASC;