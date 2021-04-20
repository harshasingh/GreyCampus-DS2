SELECT email from customer
where first_name = 'Nancy' AND last_name = 'Thomas';

SELECT description FROM film
WHERE title='Outlaw Hanky';

SELECT phone FROM address
WHERE address='259 Ipoh Drive' OR address2='259 Ipoh Drive';

SELECT * FROM film
ORDER BY length DESC
LIMIT 10;

SELECT customer_id FROM payment
ORDER BY payment_date
LIMIT 10;

SELECT title,length FROM film
ORDER BY length
LIMIT 5;

SELECT DISTINCT rental_id,rental_date FROM rental
WHERE rental_date BETWEEN '2005-07-14' AND '2005-08-20'
ORDER BY rental_date
LIMIT 11;

SELECT amount FROM payment
WHERE amount NOT IN (0.99,1.98,1.99) LIMIT 10;

SELECT email FROM customer
where first_name IN ('Nancy','Julie','John');

SELECT r.inventory_id FROM rental r
where r.inventory_id IN (SELECT i.inventory_id FROM inventory i);


SELECT title,special_features FROM film
WHERE special_features IN ('{Deleted Scenes}');


SELECT c.country,ci.city_id,ci.country_id FROM city ci,country c
WHERE c.country ILIKE '_a%' AND ci.country_id=c.country_id
ORDER BY c.country;


SELECT postal_code from address
where postal_code LIKE '3%5';

SELECT count(rental_id) FROM payment
WHERE amount > 5;


SELECT count(actor_id) from actor
where first_name LIKE 'P%';

SELECT DISTINCT district FROM address


SELECT count(DISTINCT(district)) AS countD,district FROM address
GROUP BY district;
/*
How many actors have a first name that starts with the letter P?

How many unique districts are our customers from?

How many films have a rating of R and a replacement cost between $5 and $15?

*/

SELECT count(title) FROM film
WHERE rating='R' AND replacement_cost BETWEEN 5 AND 15;

SELECT TRUNC(AVG(replacement_cost),2),MAX(LENGTH),MIN(rental_duration) AS MIN_RENTALDURATION FROM film
WHERE special_features IN ('{Deleted Scenes}');

SELECT length FROM  film where rating ='R'
GROUP BY length;

SELECT rating FROM film;

/* 2 staff members with id 1 and 2, give bonus to staff with most payments (count), 
and how many payments each staff transfers and who gets most
*/

SELECT staff_id,count(payment_id) AS cp FROM payment
GROUP BY staff_id; 

SELECT customer_id,sum(amount) AS cp FROM payment
GROUP BY customer_id
HAVING sum(amount)>29
ORDER BY customer_id; 

SELECT count(film_id),title,TRUNC(avg(rental_duration),2) FROM film
GROUP BY film_id
HAVING avg(rental_duration) < max(rental_duration);


/*
We are launching a platinum service for our most loyal customers.
We will assign platinum status to customers that have had 40 or more transaction payments. 
What customer_id are eligible for platinum status?
*/

SELECT customer_id,count(payment_id) FROM payment
GROUP BY customer_id
HAVING count(payment_id)>=40;

SELECT name, MAX(last_update) AS recentupdate FROM language
GROUP BY name
HAVING MAX(last_update) >='2006-02-15';
