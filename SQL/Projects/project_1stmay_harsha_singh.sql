---1
SELECT s.first_name AS manager_firstname,s.last_name AS manager_last_name,
a.address,a.district,c.city,c1.country
FROM staff s
INNER JOIN store st ON
s.store_id=st.store_id
INNER JOIN address a
ON st.address_id=a.address_id
INNER JOIN city c
ON a.city_id=c.city_id
INNER JOIN country c1
ON c1.country_id = c.country_id;

---2
SELECT st.store_id,i.inventory_id,f.title,f.rating,f.rental_rate,f.replacement_cost
FROM inventory i
INNER JOIN store st
ON st.store_id=i.store_id
INNER JOIN film f
ON
f.film_id=i.film_id;

--3
SELECT st.store_id,f.rating,COUNT(*) AS inventory_items
FROM inventory i
INNER JOIN store st
ON st.store_id=i.store_id
INNER JOIN film f
ON
f.film_id=i.film_id
GROUP BY st.store_id,f.rating
ORDER BY f.rating ASC,st.store_id ASC,inventory_items DESC;


--4
SELECT st.store_id,ctg.name AS category,COUNT(f.film_id) AS films,
AVG(f.replacement_cost) AS AVG_replacement_cost,
SUM(replacement_cost) AS total_replacement_cost
FROM inventory i
INNER JOIN store st
ON st.store_id=i.store_id
INNER JOIN film f
ON
f.film_id=i.film_id
INNER JOIN film_category fc
ON f.film_id=fc.film_id
INNER JOIN category ctg
ON ctg.category_id=fc.category_id
GROUP BY st.store_id,ctg.name
ORDER BY total_replacement_cost DESC;




SELECT c.first_name,c.last_name,c.store_id,c.active,a.address,ci.city,c1.country FROM customer c
INNER JOIN address a
ON a.address_id = c.address_id
INNER JOIN city ci
ON a.city_id=ci.city_id
INNER JOIN country c1
ON c1.country_id = ci.country_id;


SELECT DISTINCT c.first_name, c.last_name,COUNT(r.*) AS total_rentals,SUM(amount) AS total_payment_cost
FROM customer c
INNER JOIN payment p
ON c.customer_id=p.customer_id
INNER JOIN rental r
ON c.customer_id=r.customer_id 
GROUP BY r.rental_id,c.first_name,c.last_name
ORDER BY total_payment_cost DESC;

