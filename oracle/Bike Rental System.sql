--This is Bike Rental management system by Atish Ojha In Oracle


--Drop type and tables if they are already in database

DROP TYPE NameType FORCE;
DROP TYPE AddressType FORCE;
DROP TYPE RenterType FORCE;
DROP TYPE ClientType FORCE;
DROP TYPE BikeType FORCE;
DROP TYPE RentType FORCE;
DROP TYPE PaymentType FORCE;
DROP TYPE CardType FORCE;
DROP TYPE CashType FORCE;
DROP TYPE CheckType FORCE;
DROP TYPE MobilePay FORCE;

DROP TABLE Renter CASCADE CONSTRAINTS;
DROP TABLE Client CASCADE CONSTRAINTS;
DROP TABLE Bike CASCADE CONSTRAINTS;
DROP TABLE Rent CASCADE CONSTRAINTS;
DROP TABLE Payment CASCADE CONSTRAINTS;





--UDTs and Object Tables
--NAMETYPE
CREATE TYPE NameType AS OBJECT
(
    first_name VARCHAR2(20),
    middle_name VARCHAR2(20),
    last_name VARCHAR2(20)
) NOT FINAL;
/

DESCRIBE NAMETYPE;

--ADDRESSTYPE
CREATE TYPE AddressType AS OBJECT
(
    street VARCHAR2(30),
    town VARCHAR2(20),
    postcode VARCHAR2(8)
) NOT FINAL;
/

DESCRIBE AddressType;

--RENTERTYPE
CREATE TYPE RenterType AS OBJECT
(
    user_id NUMBER(3),
    username VARCHAR2(30),
    password VARCHAR2(30),
    name NAMETYPE,
    contact VARCHAR2(15),
    email VARCHAR2(15),
    status NUMBER(1)
) NOT FINAL;
/

DESCRIBE RenterType;

--CLIENTTYPE
CREATE TYPE ClientType AS OBJECT
(
    client_code VARCHAR2(15),
    client_name NAMETYPE,
    email VARCHAR2(20),
    contact VARCHAR2(15),
    address ADDRESSTYPE,
    document_id VARCHAR2(20)
) NOT FINAL;
/

DESCRIBE ClientType;

--BIKETYPE
CREATE TYPE BikeType AS OBJECT
(
    bike_code VARCHAR2(15),
    bike_name VARCHAR2(30),
    specs VARCHAR2(100),
    category_name VARCHAR2(30),
    renter REF RenterType
) NOT FINAL;
/

DESCRIBE BikeType;


--RENTTYPE
--here i have made methods to get total amount and day rented
CREATE TYPE RentType AS OBJECT
(
    rent_id NUMBER(3),
    rent_start_date date,
    rent_end_date date,
    payment_status NUMBER(1),
    rent_status NUMBER(1),
    remarks VARCHAR2(100),
    bike REF BikeType,
    client REF ClientType, 
    renter REF RenterType,
    MEMBER FUNCTION get_totalamount RETURN FLOAT,
    MEMBER FUNCTION day_rented RETURN NUMBER
) NOT FINAL;
/

DESCRIBE RentType;


--PAYMENTTYPE
CREATE TYPE PaymentType AS OBJECT
(
    payment_id NUMBER(11),
    rent REF RentType,
    remarks VARCHAR2(100),
    paid_by NameType,
    renter REF RenterType
) NOT FINAL;
/

DESCRIBE PaymentType;

--Creating child class of paymenttype
--CASHTYPE
CREATE TYPE CashType UNDER PAYMENTTYPE
(
    bill_no VARCHAR2(15)
);
/

DESCRIBE CashType;

--MOBILETYPE
CREATE TYPE MobilePay UNDER PAYMENTTYPE
(
    transfer_id NUMBER(15)
);
/

DESCRIBE MobilePay;


--CARDTYPE
CREATE TYPE CardType UNDER PAYMENTTYPE
(
    CARD_no VARCHAR2(30)
);
/

DESCRIBE CardType;


--CHECKTYPE
CREATE TYPE CheckType UNDER PAYMENTTYPE
(
    check_id VARCHAR2(30),
    name NAMETYPE,
    bank_id VARCHAR2(30)
);
/

DESCRIBE CheckType;



--CREATING TABLES

CREATE TABLE Renter OF RenterType (user_id PRIMARY KEY NOT NULL);

CREATE TABLE Client OF ClientType (client_code PRIMARY KEY NOT NULL);

CREATE TABLE bike OF BikeType (bike_code PRIMARY KEY NOT NULL);

CREATE TABLE rent OF RentType (rent_id PRIMARY KEY NOT NULL);

CREATE TABLE payment OF PaymentType (payment_id PRIMARY KEY NOT NULL);




-- Insert data to table

--Renter data insert
--HERE WHILE INSEARTING 
--status - the value of this column is 0 or 1, 0 means deactivated or inactive, 1 is activated or active.

INSERT INTO renter VALUES
(1, 'jash1', 'jashpas', NameType('Jash', 'Rana', 'Magar'),'985421251', 'jash@gmail.com',1);

INSERT INTO renter VALUES
(2, 'atish1', 'atish123', NameType('Atish', NULL, 'Ojha'),'98094935', 'atish@gmail.com',1);

INSERT INTO renter VALUES
(3, 'pawan1', 'mate123', NameType('Pawan', NULL, 'Khadka'),'9584512545', 'pawan@gmail.com',0);

INSERT INTO renter VALUES
(4, 'parvat1', 'launda123', NameType('Parvat', NULL, 'Banjara'),'9845125421', 'parva@gmail.com',1);

INSERT INTO renter VALUES
(5, 'sachin1', 'khatri123', NameType('Sachin', NULL, 'Khatri'),'98564517540', 'khat@gmail.com',0);


--Select data from renter
SELECT * FROM renter;

SELECT r.user_id,r.username,r.password, r.name.first_name, r.name.middle_name,r.name.last_name, r.contact, r.email, r.status FROM renter r;



--Bike Data insert
INSERT INTO bike VALUES
(5210, 'MT-15', 'Extremely tractable motor, Inverted forks have improved its handling', 'Yamaha',
    (SELECT ref(r) FROM renter r WHERE r.user_id = 1));

INSERT INTO bike VALUES
(22541, 'RTR 160', 'Great handling characteristics', 'TVS Apache',
    (SELECT ref(r) FROM renter r WHERE r.user_id = 5));
    
INSERT INTO bike VALUES
(1423, 'YZF R15 V3', 'Gets segment-leading VVA and slipper clutch, Razor-sharp handling', 'Yamaha',
    (SELECT ref(r) FROM renter r WHERE r.user_id = 2));
    
INSERT INTO bike VALUES
(4424, 'RTR 160 4V', 'One of the smoothest motors out there, Offers good ride quality', 'TVS Apache',
    (SELECT ref(r) FROM renter r WHERE r.user_id = 4));
    
INSERT INTO bike VALUES
(5555, 'Splendor Plus', 'Excellent fuel efficiency, Solid build quality, Reliable engine', 'Hero',
    (SELECT ref(r) FROM renter r WHERE r.user_id = 3));
    
INSERT INTO bike VALUES
(21542, 'Pulsar N160', 'The analogue pod houses the tachometer', 'Bajaj',
    (SELECT ref(r) FROM renter r WHERE r.user_id = 2));
    
INSERT INTO bike VALUES
(26501, 'RR 310', 'Super grippy Michelin Road 5 rubber inspires great confidence in all weather conditions', 'TVS Apache',
    (SELECT ref(r) FROM renter r WHERE r.user_id = 4));
    
INSERT INTO bike VALUES
(12012, 'RTR 180', 'Razor sharp handling makes it a hoot to ride', 'TVS Apache',
    (SELECT ref(r) FROM renter r WHERE r.user_id = 5));   
    
INSERT INTO bike VALUES
(11490, 'Xtreme 160R', 'Superb suspension that smoothens bad roads', 'Hero',
    (SELECT ref(r) FROM renter r WHERE r.user_id = 2));  

INSERT INTO bike VALUES
(140012, 'Pulsar NS200', 'Increase in performance despite BS6 norms', 'Bajaj',
    (SELECT ref(r) FROM renter r WHERE r.user_id = 2));  
    
--Select data from bike
SELECT * FROM bike;

SELECT b.bike_code,b.bike_name, b.specs, b.category_name,b.renter.user_id FROM bike b;



--Client Data insert

INSERT INTO client VALUES
('K121', NameType('Ram', 'Kumar', 'Shah'), 'ram@gmail.com', '02125421', AddressType('1 Tinkunay','Ktm','12014'), '125421');

INSERT INTO client VALUES
('M122', NameType('Sham', 'Bahadur', 'Bhatt'), 'sham@gmail.com', '98542120', AddressType('7 Aithpur','MNR','4010'), '54215112A  ');

INSERT INTO client VALUES
('D121', NameType('Mical', 'Kumar', 'Shubede'), 'mic@gmail.com', '74112421', AddressType('2 kalipul','Dhn','1400'), '145412AS');

INSERT INTO client VALUES
('P1420', NameType('Anuj', NULL, 'Chand'), 'anju@gmail.com', '88954561', AddressType('3 taal','POK','45121'), '47512452');

INSERT INTO client VALUES
('K144', NameType('Ankit', NULL, 'Ojha'), 'ankit@gmail.com', '78451201', AddressType('2 Baneshwor','Ktm','12014'), '12450120');

INSERT INTO client VALUES
('KA124', NameType('Hari', 'Dev', 'Chand'), 'hari@gmail.com', '45632014', AddressType('3 Haldukhal','KAR','1245740'), '98563214774');

INSERT INTO client VALUES
('L124', NameType('Mahesh', NULL, 'Chaudhari'), 'mahe@gmail.com', '7542145', AddressType('5 Bhaleygau','LAN','124478'), '465413514');

INSERT INTO client VALUES
('K151', NameType('Mohan', 'Kumar', 'cand'), 'moho@gmail.com', '451788954', AddressType('1 Tinkunay','Ktm','12014'), '147780023');



--Select data from client
SELECT * FROM client;

SELECT c.client_code,c.client_name.first_name,c.client_name.middle_name,c.client_name.last_name,c.email,c.contact,c.address.street,c.address.town,c.address.postcode,c.document_id FROM client c;



--RENT data
--HERE WHILE INSEARTING 
--payment_status - it stores 0 and 1 value, 0 means not paid, 1 for paid.
--rental_status - it stores 0 and 1 value, 0 means not yet returned, 1 for returned.
INSERT INTO rent VALUES
(1, '13-APR-2022', NULL, 0, 0, 'remarks',
    (SELECT ref(b) FROM bike b WHERE b.bike_code = '5210'),
    (SELECT ref(c) FROM client c WHERE c.client_code = 'K151'),
    (SELECT ref(r) FROM renter r WHERE r.user_id = 2));
    
INSERT INTO rent VALUES
(2, '15-JAN-2022', NULL, 0, 0, 'remarks',
    (SELECT ref(b) FROM bike b WHERE b.bike_code = '1423'),
    (SELECT ref(c) FROM client c WHERE c.client_code = 'P1420'),
    (SELECT ref(r) FROM renter r WHERE r.user_id = 1));
    
INSERT INTO rent VALUES
(3, '5-FEB-2022', NULL, 0, 0, 'RAM JEE',
    (SELECT ref(b) FROM bike b WHERE b.bike_code = '1423'),
    (SELECT ref(c) FROM client c WHERE c.client_code = 'K121'),
    (SELECT ref(r) FROM renter r WHERE r.user_id = 4));
    
INSERT INTO rent VALUES
(4, '20-MAR-2022', NULL, 0, 0, 'Mr. bhatt',
    (SELECT ref(b) FROM bike b WHERE b.bike_code = '1423'),
    (SELECT ref(c) FROM client c WHERE c.client_code = 'M122'),
    (SELECT ref(r) FROM renter r WHERE r.user_id = 5));
    
INSERT INTO rent VALUES
(5, '30-APR-2022', NULL, 0, 0, 'Mr. subede',
    (SELECT ref(b) FROM bike b WHERE b.bike_code = '5555'),
    (SELECT ref(c) FROM client c WHERE c.client_code = 'D121'),
    (SELECT ref(r) FROM renter r WHERE r.user_id = 2));
    
INSERT INTO rent VALUES
(6, '25-MAY-2022', NULL, 0, 0, 'Mr. Ojha',
    (SELECT ref(b) FROM bike b WHERE b.bike_code = '5555'),
    (SELECT ref(c) FROM client c WHERE c.client_code = 'K144'),
    (SELECT ref(r) FROM renter r WHERE r.user_id = 1));
    
INSERT INTO rent VALUES
(7, '2-JUN-2022', NULL, 0, 0, 'Hari sir',
    (SELECT ref(b) FROM bike b WHERE b.bike_code = '26501'),
    (SELECT ref(c) FROM client c WHERE c.client_code = 'KA124'),
    (SELECT ref(r) FROM renter r WHERE r.user_id = 3));
    
INSERT INTO rent VALUES
(8, '1-JULY-2022', NULL, 0, 0, 'Mahesh bhaii',
    (SELECT ref(b) FROM bike b WHERE b.bike_code = '140012'),
    (SELECT ref(c) FROM client c WHERE c.client_code = 'L124'),
    (SELECT ref(r) FROM renter r WHERE r.user_id = 2));


--Select data from rent
SELECT * FROM rent;

SELECT r.rent_id,r.rent_start_date,r.rent_end_date,r.payment_status,r.rent_status,r.remarks,r.bike.bike_code,r.client.client_code, r.client.client_code,r.renter.user_id FROM rent r;







--Query 1  JOINS
--Inner and fullouter join of 3 tables
SELECT     
    r.rent_id,
    r.rent_status,
    r.rent_start_date,
    r.rent_end_date,
    b.bike_code,
    b.bike_name,
    b.category_name,
    re.user_id,
    re.name.last_name
    
FROM
    rent r
    INNER JOIN bike b ON r.bike.bike_code = b.bike_code
    FULL OUTER JOIN renter re ON r.renter.user_id = re.user_id
    WHERE r.rent_status = 1
ORDER BY
    r.renter.user_id DESC,
    r.rent_start_date ASC;










--Query 2 Using Inheritance


--Payment Data insert

INSERT INTO Payment VALUES
(CashType(1,
    (SELECT ref(r) FROM rent r WHERE r.rent_id = 1),
    'LATE PAID', NameType('Kumar', null, null),
    (SELECT ref(u) FROM renter u WHERE u.user_id = 1),
    '12540'));

update rent r
set r.payment_status = 1, r.rent_status = 1, r.rent_end_date = '15-APR-2022'
where r.rent_id = 1;

SELECT * FROM rent;


INSERT INTO Payment VALUES
(CardType(2,
    (SELECT ref(r) FROM rent r WHERE r.rent_id = 2),
    'PAID', NameType('Ram', null, null),
    (SELECT ref(u) FROM renter u WHERE u.user_id = 3),
    '52142501A'));

update rent r
set r.payment_status = 1, r.rent_status = 1, r.rent_end_date = '1-FEB-2022'
where r.rent_id = 2;

SELECT * FROM rent;


INSERT INTO Payment VALUES
(CheckType(3,
    (SELECT ref(r) FROM rent r WHERE r.rent_id = 3),
    'PAID', NameType('MR BHATT', null, null),
    (SELECT ref(u) FROM renter u WHERE u.user_id = 2),
    '212101214',NameType('Ram', NULL, 'Shing'),'PAR11'));

update rent r
set r.payment_status = 1, r.rent_status = 1, r.rent_end_date = '25-FEB-2022'
where r.rent_id = 3;

SELECT * FROM rent;


INSERT INTO Payment VALUES
(MobilePay(4,
    (SELECT ref(r) FROM rent r WHERE r.rent_id = 4),
    'PAID', NameType('Mhesh', null, 'Bhatt'),
    (SELECT ref(u) FROM renter u WHERE u.user_id = 2),
    9809493195));

update rent r
set r.payment_status = 1, r.rent_status = 1, r.rent_end_date = '25-APR-2022'
where r.rent_id = 4;

SELECT * FROM rent;


INSERT INTO Payment VALUES
(CashType(5,
    (SELECT ref(r) FROM rent r WHERE r.rent_id = 5),
    'PAID', NameType('MR Subede', null, null),
    (SELECT ref(u) FROM renter u WHERE u.user_id = 3),
    '5214'));

update rent r
set r.payment_status = 1, r.rent_status = 1, r.rent_end_date = '5-MAY-2022'
where r.rent_id = 5;

SELECT * FROM rent;


INSERT INTO Payment VALUES
(MobilePay(6,
    (SELECT ref(r) FROM rent r WHERE r.rent_id = 7),
    'PAID', NameType('HARI', null, 'KHADKA'),
    (SELECT ref(u) FROM renter u WHERE u.user_id = 5),
    985642125));

update rent r
set r.payment_status = 1, r.rent_status = 1, r.rent_end_date = '5-JUL-2022'
where r.rent_id = 6;

SELECT * FROM rent;




--Select data from inheritance
SELECT * FROM payment;

SELECT p.payment_id,p.rent.rent_id,p.remarks,p.paid_by.first_name,p.renter.user_id FROM payment p;

SELECT VALUE(p) FROM Payment p;

SELECT TREAT(VALUE(p) AS CashType) FROM payment p;


--to see id and data in single type
SELECT payment_id, 
TREAT(VALUE(p) AS CashType).bill_no bill_no
FROM payment p;

SELECT payment_id, TREAT(VALUE(p) AS CashType).bill_no  bill_no
FROM payment p
WHERE VALUE(p) IS OF (CashType);

--to see how many are paid by an indivisual payment type
SELECT p.payment_id FROM payment p
WHERE VALUE(p) IS OF (ONLY CASHTYPE);


--to select every data with values
SELECT p.payment_id, p.rent.rent_id, p.remarks, p.paid_by.first_name, p.renter.user_id,
TREAT(VALUE(p) AS CashType).bill_no bill_no
FROM payment p;











--Query 3
--member function and timestamp
--CREATE IF THEIR IS NOT THE METHOD ELSE REPLACE THE METHOD

CREATE OR REPLACE TYPE BODY RentType AS
	MEMBER FUNCTION get_totalamount RETURN FLOAT IS
	BEGIN
		RETURN (rent_end_date - rent_start_date) * 100;
        -- price to rent a bike per day is 100
	END;
    MEMBER FUNCTION day_rented RETURN NUMBER IS
	BEGIN
		RETURN rent_end_date - rent_start_date;
	END;
END;
/


--GET DAYS OF RENTED FOR A BIKE
SELECT r.*, TREAT(VALUE(r) AS RentType).day_rented() day_rented
FROM rent r
WHERE r.rent_id =2;


--GET TOTAL AMOUNT THAT A CLIENT HAS TO PAY FOR THEIR RENT
SELECT r.*, TREAT(VALUE(r) AS RentType).get_totalamount() get_totalamount
FROM rent r
WHERE r.rent_id =2;







--USING TIME STAMP TO FIND OUT HOW MANY BIKE WERE RENTED IN ONE YEAR IN EACH MONTHS
SELECT to_char(r.rent_start_date, 'MONTH') AS Rent_Month,
COUNT(EXTRACT(month FROM r.rent_start_date)) Number_of_rents
From rent r
WHERE r.rent_start_date + 365 >= current_timestamp
GROUP BY to_char(r.rent_start_date, 'MONTH')
ORDER BY Number_of_rents DESC;










--QUERY 4
--partition, inclsuding sum, and, avg
--partition by bike and calculatingg avg rent day and total rent day of single bike
SELECT
    r.bike.bike_code,
    r.client.client_code,
    r.rent_end_date,
    rent_start_date,
    AVG(r.rent_end_date - r.rent_start_date) OVER(PARTITION BY r.BIKE) AS Avg_Rent_Day,
    SUM(r.rent_end_date - r.rent_start_date) OVER(PARTITION BY r.BIKE) Total_Rent_Day 
FROM rent r
WHERE r.payment_status = 1;





