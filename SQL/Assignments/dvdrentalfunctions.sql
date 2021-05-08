/*find movie with max rating and least length, to conclude length has nothing to do with quality
*/
SELECT title,rating FROM film
WHERE rating = (SELECT max(rating)FROM film)
AND
length =(SELECT min(length)FROM film) ;

/*Grab film titles that have been returned between "2005-05-29 to "2005-05-30". */
SELECT f.title,i.inventory_id,f.film_id,r.return_date FROM inventory i
INNER JOIN film f
ON
f.film_id=i.film_id
INNER JOIN rental r
ON r.inventory_id=i.inventory_id
WHERE r.return_date BETWEEN '2005-05-29' AND '2005-05-30'
ORDER BY f.title,i.inventory_id;

SELECT f.title,f.film_id FROM inventory i
INNER JOIN film f
ON
f.film_id=i.film_id
INNER JOIN rental r
ON r.inventory_id=i.inventory_id
WHERE r.return_date BETWEEN '2005-05-29' AND '2005-05-30'
EXCEPT
select title,film_id from film 
where film_id in ( select inventory.film_id from rental
inner join inventory
on rental.inventory_id = inventory.inventory_id
where return_date between '2005-05-29' and '2005-05-30');

/*During which months did payments occur?  
Format the answer to return back the full month name
*/
SELECT payment_id,customer_id,TO_CHAR(payment_date,'Month') FROM payment;
/*How many payments occured on a monday?
*/

SELECT COUNT(payment_id) AS Day_payment FROM payment
WHERE TO_CHAR(payment_date,'Day') ILIKE 'MONDAY%';


SELECT COUNT(*) AS Count_Monday_Pmts FROM payment
WHERE EXTRACT(DOW FROM payment_date) = 1;

/* Day of the month*/
SELECT COUNT(*) AS FirstDay_payment FROM payment
WHERE EXTRACT(DAY FROM payment_date) = 1;