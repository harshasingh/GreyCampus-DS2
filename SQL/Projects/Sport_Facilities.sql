SELECT * FROM cd.facilities;

SELECT name,membercost FROM cd.facilities;

SELECT * FROM cd.facilities
WHERE membercost!=0;

SELECT facid,name,membercost,monthlymaintenance FROM cd.facilities
WHERE membercost!=0 AND membercost<((1.0/50.0)* monthlymaintenance);

SELECT * FROM cd.facilities
WHERE name LIKE '%Tennis%';

--Id is 1 or 5, Without OR operator usage
SELECT * FROM cd.facilities
WHERE facid IN (1,5);

SELECT memid,surname,firstname,joindate FROM cd.members
WHERE joindate > '2012-09-01';

SELECT DISTINCT surname FROM cd.members
ORDER BY surname
LIMIT 10;

SELECT MAX(joindate) AS Last_Member_SignUp_Date FROM cd.members;


SELECT COUNT(*) AS Num_Of_Guests_Cost_Greater_Than_10 FROM cd.facilities
WHERE guestcost>=10;

SELECT f.facid,SUM(b.slots) AS "Total Slots"
FROM cd.facilities AS f
INNER JOIN cd.bookings b
ON f.facid=b.facid
WHERE b.starttime >= '2012-09-01' AND b.starttime<'2012-10-01'
GROUP BY f.facid
ORDER BY "Total Slots";


SELECT b.facid,SUM(b.slots) AS "Total Slots"
FROM cd.bookings b
WHERE b.starttime >= '2012-09-01'
GROUP BY b.facid
ORDER BY "Total Slots";


SELECT b.facid,SUM(b.slots) AS "Total Slots"
FROM cd.bookings b
GROUP BY b.facid
HAVING SUM(b.slots)>1000
ORDER BY b.facid;

SELECT b.starttime,f.name
FROM cd.facilities AS f
INNER JOIN cd.bookings b
ON f.facid=b.facid
WHERE b.starttime::date = date '2012-09-21' AND f.name LIKE '%Tennis Court%'
ORDER BY b.starttime;


SELECT b.starttime
FROM cd.bookings AS b
INNER JOIN cd.facilities AS f
ON f.facid=b.facid
INNER JOIN cd.members AS m
ON m.memid=b.memid
WHERE m.firstname||' '||m.surname='David Farrell';

SELECT * FROM cd.members f
WHERE f.firstname||' '||f.surname='David Farrell';
