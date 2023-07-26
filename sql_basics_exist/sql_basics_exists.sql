SELECT *
FROM departments
WHERE EXISTS
  (SELECT sales.department_id
  FROM sales
  WHERE sales.department_id = departments.id AND sales.price > 98.00);