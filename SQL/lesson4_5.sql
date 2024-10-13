/*在GROUP BY之後要再搜尋，用HAVING*/
SELECT *
FROM payment;

SELECT customer_id,SUM(amount) AS 總合
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 200;