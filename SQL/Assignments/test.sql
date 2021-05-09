CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    PRIMARY KEY (ID)
);

CREATE  TABLE department 
 (
   department_id int NOT NULL,
   department_nm varchar(25) NOT NULL,
	PRIMARY KEY (department_id)
 );


CREATE  TABLE compliance 
 (  
      complianceid  int  NOT NULL,
      rlType   varchar(15)  DEFAULT (NULL),
      details   varchar(250)  DEFAULT (NULL),
      createDate  DATE   DEFAULT (NULL),
      department_id  int  DEFAULT (NULL),
	PRIMARY KEY (complianceid),  
      CONSTRAINT FK_DEPART_ID
      FOREIGN KEY (department_id)
      REFERENCES department (department_id )
 );
 
 CREATE  TABLE employee
 ( 
     empid  int NOT NULL,
     firstname  varchar(45)  DEFAULT (NULL),
     lastname varchar(45)  DEFAULT (NULL),
     dob   DATE   DEFAULT (NULL),
     email   varchar(100)  DEFAULT (NULL),
     department_id int  DEFAULT (NULL),
	 PRIMARY KEY (empid),
    CONSTRAINT FK_DEPARTMENT_ID
    FOREIGN KEY (department_id)
    REFERENCES department(department_id)
 );
 
 CREATE  TABLE login_master
  ( 
	  userid int NOT NULL,
      password varchar(30)  NOT NULL,
      role  varchar(20)  NOT NULL,
	  PRIMARY KEY (userid),
      CONSTRAINT  FK_EMPID
      FOREIGN KEY (userid)
      REFERENCES  employee(empid)
 );
 
 CREATE  TABLE status_report
  ( 
     complianceid  int NOT NULL ,
      statusrptid   int NOT NULL,
      empid   int NOT NULL,
      comments   varchar(15)  DEFAULT (NULL),
      createDate  DATE   DEFAULT (NULL),
      department_id int DEFAULT (NULL),
	  PRIMARY KEY (statusrptid),
      CONSTRAINT  statusreport_ibfk_1
      FOREIGN KEY (department_id)
      REFERENCES  department (department_id),
      CONSTRAINT  statusreport_ibfk_2
      FOREIGN KEY (empid)
      REFERENCES  employee(empid),
      CONSTRAINT  statusreport_ibfk_3
      FOREIGN KEY (complianceid)
     REFERENCES  compliance (complianceid)
 );