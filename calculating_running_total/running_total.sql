SELECT created_at::date AS date,
  COUNT(*) AS count,
  SUM(COUNT(*)::int) OVER (ORDER BY created_at::date) AS total 
FROM posts
GROUP BY created_at::date
ORDER BY created_at::date;

-- Cast the created_at column as date to return only the part needed.
-- Group by the newly created date column to return a count for a given day.
-- Used window function to create a running total down the table.