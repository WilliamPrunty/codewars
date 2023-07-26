# Time difference between consecutive transactions for a specific customer

## link: https://www.codewars.com/kata/644f780d5017ed1da1cf6b7f/train/sql

Given a table rental in the DVD rental database, write a SQL query to calculate the time since the previous rental for each rental transaction made by customers with IDs 1 and 2. The result should include the rental ID, customer ID, rental date, and time since the previous rental in days, hours, and minutes.

Notes:
for the sample tests, static dump of DVD Rental Sample Database is used, for the final solution - random tests.
The final result should be sorted by customer ID and rental date in ascending order.
you should not bother about the formatting of time_since_previous_rental - simple subtracting of the dates will provide the correct output
rental_date should be desplayed as a text in the ISO 8601 format (for example 2005-02-26 19:42:04)
Good luck!

Schema
(not all columns - only part of the domain required to solve this kata)

customer table:
Column       | Type     | Modifiers
------------ +----------+----------
customer_id  | integer  | not null
first_name   | varchar  | not null
last_name    | varchar  | not null

rental table:
Column       | Type      | Modifiers
-------------+-----------+----------
rental_id    | integer   | not null
customer_id  | integer   | not null
rental_date  | timestamp | not null

Desired Output
The desired output should look like this:

rental_id    | customer_id  | rental_date          | time_since_previous_rental
-------------+--------------+----------------------+----------------------------------------------
   5851      | 1            | 2005-02-26 19:42:04  |  <null>
   8399      | 1            | 2005-03-19 04:20:14  |  20 days 08:38:10
...