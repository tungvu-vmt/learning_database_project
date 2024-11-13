/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T4-pf-mods.sql

--Student ID: 30531438
--Student Name: Manh Tung Vu


/* Comments for your marker:




*/

/*(a)*/
-- PF would like to determine the total number of times each service was provided in a visit
-- where the charge made was lower or higher than the standard cost (i.e., not charged at
-- the standard cost). Add a new attribute that will record this requirement. The default
-- value for this new attribute is 0.
-- Based on the data currently stored in the system, this attribute must be initialised to the
-- number of times each service was provided in a visit and not charged at its standard
-- cost.
-- As part of your solution, provide appropriate select and desc statements to show the
-- changes you have made. Select to show any data changes that have occurred, and desc
-- tablename, e.g., desc customer, to show any table structural changes.

ALTER TABLE service ADD service_non_std_cnt NUMBER(5) DEFAULT 0;

UPDATE service s
SET service_non_std_cnt = (
    SELECT COUNT(*)
    FROM visit_service vs
    WHERE vs.service_code = s.service_code
    AND vs.VISIT_SERVICE_LINECOST != s.service_std_cost
);

DESC service;

SELECT service_code, service_desc, service_std_cost, service_non_std_cnt
FROM service;

--TODO: Add a test case here

/*(b)*/
DROP SEQUENCE visit_payment_id_seq;

CREATE SEQUENCE visit_payment_id_seq START WITH 100 INCREMENT BY 10;


--Create a new visit_payment table
DROP TABLE visit_payment CASCADE CONSTRAINT PURGE;

CREATE TABLE visit_payment (
    visit_payment_id NUMBER(10) PRIMARY KEY,
    visit_id NUMBER(5) NOT NULL,
    visit_payment_date DATE NOT NULL,
    visit_payment_amount NUMBER(8, 2) NOT NULL,
    payment_method_id NUMBER(2) NOT NULL,
    CONSTRAINT visit_payment_visit_fk FOREIGN KEY (visit_id) REFERENCES visit (visit_id)
);

--Add a lookup table for visit_payment_method
DROP TABLE payment_method CASCADE CONSTRAINT PURGE;

CREATE TABLE payment_method (
    payment_method_id NUMBER(2) PRIMARY KEY,
    payment_method_desc VARCHAR2(20) NOT NULL UNIQUE
);

--Insert payment method into payment_method lookup table
INSERT INTO payment_method (payment_method_id, payment_method_desc)
VALUES (1, 'Card');

INSERT INTO payment_method (payment_method_id, payment_method_desc)
VALUES (2, 'Cash');

INSERT INTO payment_method (payment_method_id, payment_method_desc)
VALUES (3, 'Historical');

--Add foreign key constraint for visit_payment table
ALTER TABLE visit_payment
ADD CONSTRAINT visit_payment_payment_method_fk
FOREIGN KEY (payment_method_id) REFERENCES payment_method (payment_method_id);

--Add a column to keep track of payment in visit
ALTER TABLE VISIT
ADD visit_total_paid NUMBER(8, 2) DEFAULT 0;

--Update existing visits to mark them as fully paid on their visit Date
--with payment method 'Historical'

--Update completed visit
UPDATE VISIT
SET visit_total_paid = VISIT_TOTAL_COST
WHERE visit_total_cost IS NOT NULL;

--Insert data into visit_payment 
INSERT INTO visit_payment (visit_payment_id, visit_id, visit_payment_date, visit_payment_amount, payment_method_id)
SELECT visit_payment_id_seq.NEXTVAL, visit_id, visit_date_time, visit_total_cost, 3
FROM visit
WHERE visit_total_cost IS NOT NULL;

DESC visit;

DESC visit_payment;

SELECT visit_id, visit_total_cost, visit_total_paid
FROM visit
WHERE visit_total_cost IS NOT NULL;

SELECT visit_id, visit_payment_date, visit_payment_amount, payment_method_id
FROM visit_payment;
