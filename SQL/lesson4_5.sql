/*HAVING用法*/
/*在GROUP BY之後要再搜尋，用HAVING*/
SELECT *
FROM payment;


SELECT customer_id,SUM(amount) AS 總合
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 200;  /*用法*/


SELECT store_id ,COUNT(customer_id) AS 數量
FROM customer
GROUP BY store_id
HAVING COUNT(customer_id) >300;