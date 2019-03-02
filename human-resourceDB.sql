CREATE DATABASE hresource;

USE hresource;

CREATE TABLE regions (
    region_id INT IDENTITY,
    region_name VARCHAR(25) NOT NULL,
    CONSTRAINT pk_regions PRIMARY KEY (region_id),
    CONSTRAINT uq_regions UNIQUE (region_name)
);

CREATE TABLE countries (
    country_id VARCHAR(2),
    country_name VARCHAR(40) NOT NULL,
    region INT NOT NULL,
    CONSTRAINT pk_countries PRIMARY KEY (country_id),
    CONSTRAINT fk_regions FOREIGN key (region)
    REFERENCES regions (region_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT ck_reiongs CHECK (region > 0),
    CONSTRAINT uq_countries UNIQUE (country_name)
);

CREATE TABLE locations (
    location_id INT,
    street_address VARCHAR(40) NOT NULL,
    postal_code  VARCHAR(12) NOT NULL,
    city VARCHAR(40) NOT NULL,
    state_province VARCHAR(30) NOT NULL,
    country VARCHAR(2) NOT NULL,
    CONSTRAINT pk_locations PRIMARY KEY (location_id),
    CONSTRAINT fk_countries FOREIGN KEY (country)
    REFERENCES countries (country_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE locations;
DROP TABLE jobs;
DROP TABLE departments;
DROP TABLE employees;
DROP TABLE dependents;

CREATE TABLE jobs (
    job_id INT IDENTITY,
    job_title VARCHAR(35) NOT NULL,
    max_salary DECIMAL (10,2) NOT NULL,
    min_salary DECIMAL (10,2) NOT NULL,
    CONSTRAINT pk_jobs PRIMARY KEY (job_id),
    CONSTRAINT ck_maxSalary CHECK (max_salary > 0),
    CONSTRAINT ck_minSalary CHECK (min_salary > 0)
);

CREATE TABLE departments (
    department_id INT IDENTITY,
    department_name VARCHAR(30) NOT NULL,
    location INT NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (department_id),
    CONSTRAINT fk_locations FOREIGN KEY (location)
    REFERENCES locations (location_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE employees (
    employee_id INT,
    first_name VARCHAR(35) NOT NULL,
    last_name VARCHAR(35) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20) NULL,
    hire_date DATE NOT NULL,
    salary DECIMAL (10,2) NOT NULL,
    job INT NOT NULL,
    manager_id INT NULL,
    department INT NOT NULL,
    CONSTRAINT pk_employees PRIMARY KEY (employee_id),
    CONSTRAINT fk_jobs FOREIGN KEY (job)
    REFERENCES jobs (job_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_departments FOREIGN KEY (department)
    REFERENCES departments (department_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_managers FOREIGN KEY (manager_id) REFERENCES employeeS (employee_id),
    CONSTRAINT uq_email UNIQUE (email),
    CONSTRAINT uq_phone UNIQUE (phone_number),
    CONSTRAINT ck_salary CHECK (salary > 0)
);

DROP TABLE employees

CREATE TABLE dependents (
    dependent_id INT IDENTITY,
    first_name VARCHAR(35) NOT NULL,
    last_name VARCHAR(35) NOT NULL,
    relationship VARCHAR(25) NOT NULL,
    employee_id INT NOT NULL,
    CONSTRAINT pk_dependents PRIMARY KEY (dependent_id),
    CONSTRAINT fk_employee FOREIGN KEY (employee_id)
    REFERENCES employees (employee_id)
    ON DELETE CASCADE ON UPDATE CASCADE
)


-- DATA INSERTION

/*Data for the table regions */
USE hresource

INSERT INTO regions(region_name) VALUES ('Europe');
INSERT INTO regions(region_name) VALUES ('Americas');
INSERT INTO regions(region_name) VALUES ('Asia');
INSERT INTO regions(region_name) VALUES ('Middle East & Africa');

SELECT * FROM regions ORDER BY region_id;

/*Data for the table countries */
INSERT INTO countries(country_id,country_name,region) VALUES ('AR','Argentina',2);
INSERT INTO countries(country_id,country_name,region) VALUES ('AU','Australia',3);
INSERT INTO countries(country_id,country_name,region) VALUES ('BE','Belgium',1);
INSERT INTO countries(country_id,country_name,region) VALUES ('BR','Brazil',2);
INSERT INTO countries(country_id,country_name,region) VALUES ('CA','Canada',2);
INSERT INTO countries(country_id,country_name,region) VALUES ('CH','Switzerland',1);
INSERT INTO countries(country_id,country_name,region) VALUES ('CN','China',3);
INSERT INTO countries(country_id,country_name,region) VALUES ('DE','Germany',1);
INSERT INTO countries(country_id,country_name,region) VALUES ('DK','Denmark',1);
INSERT INTO countries(country_id,country_name,region) VALUES ('EG','Egypt',4);
INSERT INTO countries(country_id,country_name,region) VALUES ('FR','France',1);
INSERT INTO countries(country_id,country_name,region) VALUES ('HK','HongKong',3);
INSERT INTO countries(country_id,country_name,region) VALUES ('IL','Israel',4);
INSERT INTO countries(country_id,country_name,region) VALUES ('IN','India',3);
INSERT INTO countries(country_id,country_name,region) VALUES ('IT','Italy',1);
INSERT INTO countries(country_id,country_name,region) VALUES ('JP','Japan',3);
INSERT INTO countries(country_id,country_name,region) VALUES ('KW','Kuwait',4);
INSERT INTO countries(country_id,country_name,region) VALUES ('MX','Mexico',2);
INSERT INTO countries(country_id,country_name,region) VALUES ('NG','Nigeria',4);
INSERT INTO countries(country_id,country_name,region) VALUES ('NL','Netherlands',1);
INSERT INTO countries(country_id,country_name,region) VALUES ('SG','Singapore',3);
INSERT INTO countries(country_id,country_name,region) VALUES ('UK','United Kingdom',1);
INSERT INTO countries(country_id,country_name,region) VALUES ('US','United States of America',2);
INSERT INTO countries(country_id,country_name,region) VALUES ('ZM','Zambia',4);
INSERT INTO countries(country_id,country_name,region) VALUES ('ZW','Zimbabwe',4);

SELECT * FROM countries;
 
/*Data for the table locations */
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country) VALUES (1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country) VALUES (1500,'2011 Interiors Blvd','99236','South San Francisco','California','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country) VALUES (1700,'2004 Charade Rd','98199','Seattle','Washington','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country) VALUES (1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country) VALUES (2400,'8204 Arthur St','84987','London','England','UK');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country) VALUES (2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country) VALUES (2700,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE');
 
SELECT * FROM locations;
 
/*Data for the table jobs */
 
INSERT INTO jobs(job_title,min_salary,max_salary) VALUES ('Public Accountant',4200.00,9000.00);
INSERT INTO jobs(job_title,min_salary,max_salary) VALUES ('Accounting Manager',8200.00,16000.00);
INSERT INTO jobs(job_title,min_salary,max_salary) VALUES ('Administration Assistant',3000.00,6000.00);
INSERT INTO jobs(job_title,min_salary,max_salary) VALUES ('President',20000.00,40000.00);
INSERT INTO jobs(job_title,min_salary,max_salary) VALUES ('Administration Vice President',15000.00,30000.00);
INSERT INTO jobs(job_title,min_salary,max_salary) VALUES ('Accountant',4200.00,9000.00);
INSERT INTO jobs(job_title,min_salary,max_salary) VALUES ('Finance Manager',8200.00,16000.00);
INSERT INTO jobs(job_title,min_salary,max_salary) VALUES ('Human Resources Representative',4000.00,9000.00);
INSERT INTO jobs(job_title,min_salary,max_salary) VALUES ('Programmer',4000.00,10000.00);
INSERT INTO jobs(job_title,min_salary,max_salary) VALUES ('Marketing Manager',9000.00,15000.00);
INSERT INTO jobs(job_title,min_salary,max_salary) VALUES ('Marketing Representative',4000.00,9000.00);
INSERT INTO jobs(job_title,min_salary,max_salary) VALUES ('Public Relations Representative',4500.00,10500.00);
INSERT INTO jobs(job_title,min_salary,max_salary) VALUES ('Purchasing Clerk',2500.00,5500.00);
INSERT INTO jobs(job_title,min_salary,max_salary) VALUES ('Purchasing Manager',8000.00,15000.00);
INSERT INTO jobs(job_title,min_salary,max_salary) VALUES ('Sales Manager',10000.00,20000.00);
INSERT INTO jobs(job_title,min_salary,max_salary) VALUES ('Sales Representative',6000.00,12000.00);
INSERT INTO jobs(job_title,min_salary,max_salary) VALUES ('Shipping Clerk',2500.00,5500.00);
INSERT INTO jobs(job_title,min_salary,max_salary) VALUES ('Stock Clerk',2000.00,5000.00);
INSERT INTO jobs(job_title,min_salary,max_salary) VALUES ('Stock Manager',5500.00,8500.00);
 
SELECT * FROM jobs;
 
/*Data for the table departments */
 
INSERT INTO departments(department_name,location) VALUES ('Administration',1700);
INSERT INTO departments(department_name,location) VALUES ('Marketing',1800);
INSERT INTO departments(department_name,location) VALUES ('Purchasing',1700);
INSERT INTO departments(department_name,location) VALUES ('Human Resources',2400);
INSERT INTO departments(department_name,location) VALUES ('Shipping',1500);
INSERT INTO departments(department_name,location) VALUES ('IT',1400);
INSERT INTO departments(department_name,location) VALUES ('Public Relations',2700);
INSERT INTO departments(department_name,location) VALUES ('Sales',2500);
INSERT INTO departments(department_name,location) VALUES ('Executive',1700);
INSERT INTO departments(department_name,location) VALUES ('Finance',1700);
INSERT INTO departments(department_name,location) VALUES ('Accounting',1700);

SELECT * FROM departments;

/*Data for the table employees */
 
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job,salary,manager_id,department) VALUES (100,'Steven','King','steven.king@azulweb.net','515.123.4567','1987-06-17',4,24000.00,NULL,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job,salary,manager_id,department) VALUES (101,'Neena','Kochhar','neena.kochhar@azulweb.net','515.123.4568','1989-09-21',5,17000.00,100,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job,salary,manager_id,department) VALUES (102,'Lex','De Haan','lex.de haan@azulweb.net','515.123.4569','1993-01-13',5,17000.00,100,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job,salary,manager_id,department) VALUES (103,'Alexander','Hunold','alexander.hunold@azulweb.net','590.423.4567','1990-01-03',9,9000.00,102,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job,salary,manager_id,department) VALUES (104,'Bruce','Ernst','bruce.ernst@azulweb.net','590.423.4568','1991-05-21',9,6000.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job,salary,manager_id,department) VALUES (105,'David','Austin','david.austin@azulweb.net','590.423.4569','1997-06-25',9,4800.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job,salary,manager_id,department) VALUES (106,'Valli','Pataballa','valli.pataballa@azulweb.net','590.423.4560','1998-02-05',9,4800.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job,salary,manager_id,department) VALUES (107,'Diana','Lorentz','diana.lorentz@azulweb.net','590.423.5567','1999-02-07',9,4200.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job,salary,manager_id,department) VALUES (108,'Nancy','Greenberg','nancy.greenberg@azulweb.net','515.124.4569','1994-08-17',7,12000.00,101,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job,salary,manager_id,department) VALUES (109,'Daniel','Faviet','daniel.faviet@azulweb.net','515.124.4169','1994-08-16',6,9000.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job,salary,manager_id,department) VALUES (110,'John','Chen','john.chen@azulweb.net','515.124.4269','1997-09-28',6,8200.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job,salary,manager_id,department) VALUES (111,'Ismael','Sciarra','ismael.sciarra@azulweb.net','515.124.4369','1997-09-30',6,7700.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job,salary,manager_id,department) VALUES (112,'Jose Manuel','Urman','jose manuel.urman@azulweb.net','515.124.4469','1998-03-07',6,7800.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job,salary,manager_id,department) VALUES (113,'Luis','Popp','luis.popp@azulweb.net','515.124.4567','1999-12-07',6,6900.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job,salary,manager_id,department) VALUES (114,'Den','Raphaely','den.raphaely@azulweb.net','515.127.4561','1994-12-07',14,11000.00,100,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job,salary,manager_id,department) VALUES (115,'Alexander','Khoo','alexander.khoo@azulweb.net','515.127.4562','1995-05-18',13,3100.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job,salary,manager_id,department) VALUES (116,'Shelli','Baida','shelli.baida@azulweb.net','515.127.4563','1997-12-24',13,2900.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job,salary,manager_id,department) VALUES (117,'Sigal','Tobias','sigal.tobias@azulweb.net','515.127.4564','1997-07-24',13,2800.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job,salary,manager_id,department) VALUES (118,'Guy','Himuro','guy.himuro@azulweb.net','515.127.4565','1998-11-15',13,2600.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job,salary,manager_id,department) VALUES (119,'Karen','Colmenares','karen.colmenares@azulweb.net','515.127.4566','1999-08-10',13,2500.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job,salary,manager_id,department) VALUES (120,'Matthew','Weiss','matthew.weiss@azulweb.net','650.123.1234','1996-07-18',19,8000.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job,salary,manager_id,department) VALUES (121,'Adam','Fripp','adam.fripp@azulweb.net','650.123.2234','1997-04-10',19,8200.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job,salary,manager_id,department) VALUES (122,'Payam','Kaufling','payam.kaufling@azulweb.net','650.123.3234','1995-05-01',19,7900.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job,salary,manager_id,department) VALUES (123,'Shanta','Vollman','shanta.vollman@azulweb.net','650.123.4234','1997-10-10',19,6500.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job,salary,manager_id,department) VALUES (126,'Irene','Mikkilineni','irene.mikkilineni@azulweb.net','650.124.1224','1998-09-28',18,2700.00,120,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job,salary,manager_id,department) VALUES (145,'John','Russell','john.russell@azulweb.net',NULL,'1996-10-01',15,14000.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job,salary,manager_id,department) VALUES (146,'Karen','Partners','karen.partners@azulweb.net',NULL,'1997-01-05',15,13500.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job,salary,manager_id,department) VALUES (176,'Jonathon','Taylor','jonathon.taylor@azulweb.net',NULL,'1998-03-24',16,8600.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job,salary,manager_id,department) VALUES (177,'Jack','Livingston','jack.livingston@azulweb.net',NULL,'1998-04-23',16,8400.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job,salary,manager_id,department) VALUES (178,'Kimberely','Grant','kimberely.grant@azulweb.net',NULL,'1999-05-24',16,7000.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job,salary,manager_id,department) VALUES (179,'Charles','Johnson','charles.johnson@azulweb.net',NULL,'2000-01-04',16,6200.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job,salary,manager_id,department) VALUES (192,'Sarah','Bell','sarah.bell@azulweb.net','650.501.1876','1996-02-04',17,4000.00,123,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job,salary,manager_id,department) VALUES (193,'Britney','Everett','britney.everett@azulweb.net','650.501.2876','1997-03-03',17,3900.00,123,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job,salary,manager_id,department) VALUES (200,'Jennifer','Whalen','jennifer.whalen@azulweb.net','515.123.4444','1987-09-17',3,4400.00,101,1);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job,salary,manager_id,department) VALUES (201,'Michael','Hartstein','michael.hartstein@azulweb.net','515.123.5555','1996-02-17',10,13000.00,100,2);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job,salary,manager_id,department) VALUES (202,'Pat','Fay','pat.fay@azulweb.net','603.123.6666','1997-08-17',11,6000.00,201,2);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job,salary,manager_id,department) VALUES (203,'Susan','Mavris','susan.mavris@azulweb.net','515.123.7777','1994-06-07',8,6500.00,101,4);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job,salary,manager_id,department) VALUES (204,'Hermann','Baer','hermann.baer@azulweb.net','515.123.8888','1994-06-07',12,10000.00,101,7);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job,salary,manager_id,department) VALUES (205,'Shelley','Higgins','shelley.higgins@azulweb.net','515.123.8080','1994-06-07',2,12000.00,101,11);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job,salary,manager_id,department) VALUES (206,'William','Gietz','william.gietz@azulweb.net','515.123.8181','1994-06-07',1,8300.00,205,11);
 
 
/*Data for the table dependents */
 
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Penelope','Gietz','Child',206);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Nick','Higgins','Child',205);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Ed','Whalen','Child',200);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Jennifer','King','Child',100);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Johnny','Kochhar','Child',101);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Bette','De Haan','Child',102);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Grace','Faviet','Child',109);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Matthew','Chen','Child',110);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Joe','Sciarra','Child',111);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Christian','Urman','Child',112);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Zero','Popp','Child',113);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Karl','Greenberg','Child',108);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Uma','Mavris','Child',203);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Vivien','Hunold','Child',103);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Cuba','Ernst','Child',104);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Fred','Austin','Child',105);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Helen','Pataballa','Child',106);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Dan','Lorentz','Child',107);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Bob','Hartstein','Child',201);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Lucille','Fay','Child',202);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Kirsten','Baer','Child',204);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Elvis','Khoo','Child',115);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Sandra','Baida','Child',116);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Cameron','Tobias','Child',117);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Kevin','Himuro','Child',118);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Rip','Colmenares','Child',119);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Julia','Raphaely','Child',114);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Woody','Russell','Child',145);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Alec','Partners','Child',146);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Sandra','Taylor','Child',176);