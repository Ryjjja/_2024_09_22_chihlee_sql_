/* 1006作業 */

/* first_name為Jamie */
SELECT first_name
FROM customer
WHERE first_name = 'Jamie';

/* first_name是Jamie,同時last_name是Rice */
SELECT first_name,last_name
FROM customer
WHERE first_name = 'Jamie' AND last_name = 'Rice';

/* last_name是Rodriquez 或者 first_name是Adam */
SELECT last_name,first_name
FROM customer
WHERE last_name ='Rodriquez' OR first_name = 'Adam';

/* 取出first_name是Ann,Anne,Annie */
SELECT first_name
FROM customer
WHERE first_name = 'Ann' OR first_name ='Anne' OR first_name ='Annie';

/* 取出字串開頭是Ann的first_name */
SELECT first_name
FROM customer
WHERE first_name like 'Ann%';

/* 取出first_name第1個字元是A,同時first_name的字元長度是3到5的資料 */
SELECT first_name
FROM customer
WHERE first_name like 'A%' AND LENGTH(first_name) BETWEEN 3 AND 5;


/* 取出first_name,前3字為Bra,但last_name不是Motley */
SELECT first_name,last_name
FROM customer
WHERE first_name like 'Bra%' AND last_name <> 'Motley';

