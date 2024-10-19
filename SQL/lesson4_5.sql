/*HAVING用法*/
/*對GROUP BY之後結果再進行篩選時，用HAVING*/
SELECT *
FROM payment;


SELECT customer_id,SUM(amount) AS 總合
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 200;



SELECT store_id ,COUNT(customer_id) AS 數量
FROM customer
GROUP BY store_id
HAVING COUNT(customer_id) > 300;


/*subquery 巢狀*/
SELECT *
FROM country;

SELECT country_id
FROM country
WHERE country='Taiwan';

SELECT city
FROM city
WHERE country_id = 92;

SELECT city
FROM city
WHERE country_id = (    /*subquery巢狀用法 主查詢(  值查詢)*/
	SELECT country_id
	FROM country
	WHERE country='Taiwan'
);

SELECT city
FROM city JOIN country ON city.country_id = country.country_id
WHERE country = 'Taiwan';