CREATE TABLE account(
	user_id SERIAL PRIMARY KEY,
	username varchar(50) UNIQUE NOT NULL,
	password varchar(50) NOT NULL,
	email varchar(50) UNIQUE NOT NULL,
	created_on timestamp NOT NULL,
	last_login timestamp
);

SELECT * FROM account;

CREATE TABLE job(
	job_id SERIAL PRIMARY KEY,
	job_name varchar(50) UNIQUE NOT NULL
);

SELECT * FROM job;

CREATE TABLE account_job(
	user_id integer REFERENCES account(user_id),
	job_id integer REFERENCES job(job_id),
	hired_date timestamp
);

SELECT * FROM account_job;

INSERT INTO account(username,password,email,created_on)
VALUES
('Harsha Singh','123456','harshasingh@happy.com',CURRENT_DATE);
--2
 INSERT INTO account(username,password,email,created_on)
VALUES
('MS Dhoni','770777','msdsingh@happy.com',CURRENT_TIMESTAMP);

INSERT INTO account(username,password,email,created_on)
VALUES
('Einstein','emc2pwd','einstein@iq.com',CURRENT_TIMESTAMP);


 INSERT INTO job(job_name)
 VALUES
 ('Data Scientist');
  INSERT INTO job(job_name)
 VALUES
 ('Data Analyst');
  INSERT INTO job(job_name)
 VALUES
 ('Data Engineer');
INSERT INTO job(job_name)
 VALUES
 ('Scientist');
 INSERT INTO job(job_name)
 VALUES
 ('Software Engineer');
 INSERT INTO job(job_name)
 VALUES
 ('Software Tester');
 SELECT * FROM job;

 INSERT INTO account_job(user_id,job_id,hired_date)
 VALUES
 (1,1,CURRENT_TIMESTAMP);
 
  INSERT INTO account_job(user_id,job_id,hired_date)
 VALUES
 (2,1,CURRENT_TIMESTAMP);
 INSERT INTO account_job(user_id,job_id,hired_date)
 VALUES
 (2,2,CURRENT_TIMESTAMP);
 INSERT INTO account_job(user_id,job_id,hired_date)
 VALUES
 (3,1,CURRENT_TIMESTAMP);
   INSERT INTO account_job(user_id,job_id,hired_date)
 VALUES
 (3,3,CURRENT_TIMESTAMP);



UPDATE account set last_login=created_on;
,username='CV Raman'
WHERE user_id=5

SELECT * FROM account;

UPDATE account_job
SET hired_date=account.created_on
FROM account
WHERE
account_job.user_id=account.user_id;

SELECT account.username,email FROM account_job,account
WHERE account.user_id = account_job.user_id;

SELECT * FROM account_job;

DELETE FROM account_job
WHERE user_id=3 AND job_id=1
RETURNING user_id,job_id;

DELETE FROM account_job
WHERE user_id=2 AND job_id=2
RETURNING user_id,job_id;

CREATE TABLE information(
	info_id SERIAL PRIMARY KEY,
	title varchar(500) NOT NULL,
	person varchar(100) UNIQUE NOT NULL
);

--RENAME TABLE NAME
ALTER TABLE information
RENAME TO DB_Info;

SELECT * FROM DB_Info;

ALTER TABLE DB_Info
RENAME COLUMN person TO people;

--add column
ALTER TABLE DB_Info ADD COLUMN address varchar(30);

--changing datatypes using alter

drop table tablename;

ALTER TABLE DB_Info
DROP COLUMN IF EXISTS address;

SELECT TIMEOFDAY();

SELECT NOW();

SHOW TIMEZONE;

SELECT CURRENT_TIME;

SELECT CURRENT_DATE;
