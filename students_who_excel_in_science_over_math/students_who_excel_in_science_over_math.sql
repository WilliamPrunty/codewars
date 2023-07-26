WITH science AS (SELECT student_id, score AS science_score
                FROM courses
                WHERE course_name = 'Science'),

        math AS (select student_id, score AS math_score
                FROM courses
                WHERE course_name = 'Math')


SELECT student_id, name, science_score - math_score AS score_difference 
FROM science
  LEFT JOIN math USING (student_id)
  LEFT JOIN students ON students.id = science.student_id
WHERE science_score > math_score
ORDER BY score_difference DESC, student_id ASC;