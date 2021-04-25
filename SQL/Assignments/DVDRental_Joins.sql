SELECT * FROM payment
INNER JOIN
customer
ON payment.customer_id = customer.customer_id;

SELECT payment.customer_id,first_name,last_name,amount FROM payment
INNER JOIN
customer
ON payment.customer_id = customer.customer_id;

/*Find customers who have each transaction greater than 1 dollars and the
total payments done by them each of greater than 1 dollars which
should be greater than 25
*/
SELECT payment.customer_id,COUNT(*) AS Total_No_Of_Payments FROM payment
INNER JOIN
customer
ON payment.customer_id = customer.customer_id
WHERE amount>2
GROUP BY payment.customer_id
HAVING COUNT(*)>25
ORDER BY payment.customer_id;


SELECT * FROM customer
FULL OUTER JOIN payment
ON payment.customer_id = customer.customer_id;

SELECT * FROM customer
FULL OUTER JOIN payment
ON payment.customer_id = customer.customer_id;

SELECT * FROM film_actor;

/* Keep one table as a base reference here film_actor*/
SELECT a.actor_id,first_name,last_name,fa.film_id FROM film_actor fa
RIGHT JOIN film f
ON fa.film_id=f.film_id
RIGHT JOIN actor a
ON a.actor_id=fa.actor_id
WHERE rental_rate>3;

SELECT film.film_id,title,inventory_id,store_id
FROM film
LEFT JOIN inventory ON
inventory.film_id =  film.film_id;

SELECT * FROM actor;

SELECT * FROM language;

SELECT f.last_update,r.rental_date FROM film f
RIGHT JOIN rental r
ON r.rental_date=f.last_update;

SELECT * FROM city;

/*California sales tax laws have changed and we need to alert our 
customers to this through email.
What are the email id's of the customers who live in california.?
*/

SELECT first_name,last_name,email,a.district
FROM customer c
INNER JOIN address a
ON a.address_id=c.address_id
WHERE a.district LIKE 'Cali%';


SELECT customer.customer_id,customer.first_name, customer.last_name,customer.email,
SUM(amount) AS total_money_spent_when_spending_above_5 FROM payment
LEFT OUTER JOIN customer
ON customer.customer_id = payment.customer_id
WHERE amount > 5 
GROUP BY customer.customer_id
HAVING COUNT(payment.payment_id) > 5;

SELECT * FROM film;
/*A customer walks in and is a huge fan of the actor "Nick Wahlberg" and
wants to know which movies he is in.
Get a list of all the movies "Nick Wahlberg" has been in.
*/


SELECT title,description, a.first_name,a.last_name FROM film_actor fa
INNER JOIN film f
ON fa.film_id=f.film_id
INNER JOIN actor a
ON a.actor_id=fa.actor_id
WHERE a.first_name ='Nick' AND a.last_name='Wahlberg';
---comments
SELECT * FROM customer;
SELECT * FROM film_actor;
SELECT * FROM actor;


SELECT * FROM film;

select concat(first_name , ' ', last_name) as actor_name , public.film_actor.film_id  from public.actor
inner join public.film_actor
on public.actor.actor_id = public.film_actor.actor_id
where  first_name  ilike 'Nick' and last_name ilike 'Wahlberg' 
--- i could only get the film id
