SELECT first_name,last_name FROM actor;

SELECT DISTINCT(first_name,last_name) FROM actor;

SELECT first_name,last_name,count(*) AS occurences FROM actor
GROUP BY first_name,last_name
HAVING count(*)>1;


SELECT customer_id,SUM(amount) AS spent_amount
FROM payment
WHERE staff_id='2'
GROUP BY customer_id
HAVING SUM(amount)>=110
ORDER BY customer_id;

SELECT COUNT(title) FROM film
WHERE title LIKE 'J%';

SELECT customer_id,first_name,last_name,email,address_id FROM customer
WHERE customer_id =(SELECT MAX(customer_id) FROM customer
					WHERE first_name LIKE 'E%' AND address_id<500)
;

SELECT COUNT(title) AS Truman_Title_Count FROM film
WHERE title ILIKE '%Truman%';

SELECT SUM(amount) FROM payment;

SELECT customer_id,SUM(amount) FROM payment
GROUP BY customer_id
ORDER BY customer_id;

SELECT customer_id,SUM(amount) AS Total_Amount_Paid FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 1;

SELECT count(*) FROM customer
WHERE activebool='0';

SELECT c.customer_id,first_name,last_name FROM customer c
WHERE c.customer_id NOT IN 
			(SELECT DISTINCT r.customer_id 
			 FROM payment r);


SELECT count(payment_id) AS FiveDollar_Plus_Payments FROM payment
WHERE amount>5.0;