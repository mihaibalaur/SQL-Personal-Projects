CREATE DATABASE products_data_record;

USE products_data_record;

CREATE TABLE product(
id_product            INT PRIMARY KEY AUTO_INCREMENT,
code_product          INT NOT NULL UNIQUE,
name_product          VARCHAR(100) NOT NULL,
colour_product        VARCHAR(20),
price_product_ron     DOUBLE(6,2) NOT NULL,
availability_product  VARCHAR(20) NOT NULL,
id_category           INT NOT NULL,
id_supplier           INT NOT NULL
);

CREATE TABLE category(
id_category    INT PRIMARY KEY,
name_category  VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE clients(
id_client           INT PRIMARY KEY ,
last_name_client    VARCHAR(20) NOT NULL,
first_name_client   VARCHAR(20) NOT NULL,
adress_client       VARCHAR(80) UNIQUE,
adress_client_city  VARCHAR(20) NOT NULL,
phone_number        VARCHAR(11) UNIQUE, 
email_adress        VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE supplier(
id_supplier      INT PRIMARY KEY,
name_supplier    VARCHAR(30) NOT NULL UNIQUE,
country_supplier VARCHAR(30) NOT NULL
);

CREATE TABLE invoice(
id_invoice    INT PRIMARY KEY AUTO_INCREMENT,
type_invoice  VARCHAR(15) 
);

CREATE TABLE purchase_order(
id_purchase_order    INT PRIMARY KEY AUTO_INCREMENT,
name_purchase_order  VARCHAR(30) NOT NULL, 
purchase_order_date  DATE NOT NULL,
code_product         INT NOT NULL,
id_invoice           INT NOT NULL,
id_client            INT NOT NULL
); 

-- 1. ASSIGNING THE FOREIGN KEYS 

ALTER TABLE product ADD FOREIGN KEY (id_supplier)
REFERENCES supplier(id_supplier);

ALTER TABLE product ADD FOREIGN KEY (id_category)
REFERENCES category(id_category);

ALTER TABLE purchase_order ADD FOREIGN KEY (code_product)
REFERENCES product(code_product);

ALTER TABLE purchase_order ADD FOREIGN KEY (id_invoice)
REFERENCES invoice(id_invoice);

ALTER TABLE purchase_order ADD FOREIGN KEY (id_client)
REFERENCES clients(id_client);
ON DELETE CASCADE

-- A) 5 DDL COMMANDS TO MODIFY THE STRUCTURE OF THE TABLES, RIGHT AFTER THEY HAVE ALREADY BEEN CREATED.
1.
ALTER TABLE product RENAME TO shop_products;

2.
RENAME TABLE shop_products TO product;

3.
ALTER TABLE product ADD size_product INT NOT NULL;

4.
ALTER TABLE product DROP size_product;

5.
ALTER TABLE invoice MODIFY type_invoice VARCHAR(15); 

6. 
ALTER TABLE product MODIFY colour_product VARCHAR(20) NOT NULL;

SELECT * FROM product;
SELECT * FROM clients;
SELECT * FROM purchase_order; 
SELECT * FROM supplier;
SELECT * FROM category;
SELECT * FROM invoice;

-- B) USING LMD COMMANDS, INSERT DATA IN THE TABLES OF THE DATABASE.

-- B.1) 'CLIENTS' TABLE MUST CONTAIN AT LEAST 10 RECORDS.

INSERT INTO clients VALUES
(1,  'Stan',    'Gabriela',         'Strada Sperantei 4B',                                   'Brasov',      '0736643987', 'stan.mihai99@gmail.com'),
(2,  'Popa',    'Mircea',           'Aleea Zorilor, Nr.9, Bloc 32, Sc. C, Ap.45 ',           'Bucuresti',   '0756889059', 'popa_mircea2000@gmail.com'),
(3,  'Ionescu', 'George-Mihai',     'Strada Ion Luca Caragiale 121',                         'Cluj-Napoca', '0732567893', 'george-mihai78@gmail.com'),
(4,  'Stoian',  'Cosmin-Marian',    'Strada Stefan cel Mare 99',                             'Bucuresti',   '0756298634', 'cosmin_marianstoian1209@yahoo.com'),
(5,  'Pascu',   'Alexandru-Ioan',   'Bulevardul Traian, Nr.55, Bloc 67, Sc. D, Ap.17',       'Brasov',      '0733908665', 'pascu.ioan1998@yahoo.com'),
(6,  'Achim',   'Diana',            'Strada Mihai Eminescu, Nr. 4, Bloc 120, Sc. A, Ap. 32', 'Constanta',   '0745889876', 'dianaachim17@gmail.com'),
(7,  'Mirica',  'Andrei-Stefan',    'Strada Muncii 66',                                      'Timisoara',   '0755744389', 'andrei_stefan_mirica89@yahoo.com'),
(8,  'Stan',    'Andreea-Catalina', 'Strada Primaverii 72C',                                 'Bucuresti',   '0776888470', 'catalinastan@gmail.com'),
(9,  'Alexe',   'Raul',             'Bulevardul Tomis 107A',                                 'Constanta',   '0728199545', 'raul.alexe08@yahoo.com'),
(10, 'Stoica',  'Anca-Ioana',       'Strada Magnoliei 78B',                                  'Bucuresti',   '0734199765', 'stoica_anca23@gmail.com');

INSERT INTO supplier VALUES
(1,  'NIKE',                  'USA'),
(2,  'ADIDAS',                'Germany'),
(3,  'TIMBERLAND',            'Portugal'),
(4,  'COLUMBIA',              'USA' ),
(5,  'JORDAN',                'Netherlands'),
(6,  'PUMA',                  'Germany'),
(7,  'VERSACE JEANS COUTURE', 'Italy'),
(8,  'VANS',                  'USA'),
(9,  'LEVIS',                 'Spain' ),
(10, 'CALVIN KLEIN',          'Spain'),
(11, 'CHAMPION',              'France'),
(12, 'HORSEFEATHERS',         'France'),
(13, 'NEW BALANCE',           'USA'),
(14, 'REEBOK',                'Norway'),
(15, 'CONVERSE',              'USA');

INSERT INTO category VALUES
(1, 'Shoes'),
(2, 'Pants'),
(3, 'Accessories');

-- B.2) 'INVOICE' TABLE MUST CONTAIN AT LEAST 10 RECORDS.

INSERT INTO invoice VALUES
(NULL, 'Physical'),
(NULL, 'Digital'),
(NULL, 'Digital'),
(NULL, 'Physical'),
(NULL, 'Physical'),
(NULL, 'Digital'),
(NULL, 'Digital'),
(NULL, 'Digital'),
(NULL, 'Physical'),
(NULL, 'Physical');

-- B.3) 'PRODUCT' TABLE MUST CONTAIN AT LEAST 10 RECORDS.

INSERT INTO product VALUES 
(NULL,5401, 'SNEAKER LOW AIR HUARACHE',                  'White',   471.92, 'Available',   1,  2),
(NULL,5402, 'SNEAKER LOW OZWEEGO',                       'Black',   489.99, 'Available',   1,  2),
(NULL,5403, 'SNEAKER LOW OZELIA',                        'Black',   431.92, 'Available',   1,  2),
(NULL,5404, 'TIMBERLAND PREMIUM 6 IN WATERPROOF BOOT W', 'Brown',   976.78, 'Available',   1,  3),
(NULL,5405, 'NIKE AIR FORCE 1 07',                       'Black',   607.46, 'Unavailable', 1,  1),
(NULL,5406, 'ADIDAS ADILETTE LITE',                      'Grey',    651.52, 'Available',   1,  2),
(NULL,5407, 'JORDAN W DELTA 2',                          'Red',     666.74, 'Unavailable', 1,  5),
(NULL,5408, 'NEW BALANCE 574',                           'Blue',    483.94, 'Available',   1, 13),
(NULL,5409, 'PUMA MIRAGE SPORT HACKED',                  'Black',   582.75, 'Available',   1,  6),
(NULL,5410, 'PUMA WILD RIDER BLK NJR',                   'Black',   786.44, 'Available',   1,  6),
(NULL,5411, 'COLUMBIA MONTRAIL TRINITY AG',              'Orange',  870.78, 'Available',   1,  4),
(NULL,5412, 'LEVIS LS1 HIGH',                            'Grey',    469.28, 'Unavailable', 1,  9),
(NULL,5413, 'NIKE AIR FORCE 1 BOOT',                     'Brown',   751.25, 'Available',   1,  1),
(NULL,5414, 'REEBOK ZIG KINETICA 2.5',                   'White',   543.91, 'Unavailable', 1, 14),
(NULL,5415, 'RUN STAR HIKE PLATFORM',                    'Black',   876.34, 'Available',   1, 15),
(NULL,5416, 'VANS SK8-HI GORE-TEX MTE-3',                'Black',   954.56, 'Unavailable', 1,  8),
(NULL,5417, 'VERSACE JEANS COUTURE SCARPA SNEAKERS',     'White',   840.77, 'Available',   1,  7),
(NULL,5418, 'VERSACE JEANS COUTURE POOL SLIDE',          'Yellow',  336.16, 'Unavailable', 1,  7),
(NULL,5419, 'COLUMBIA FLOW BOROUGH LOW',                 'Red',     608.25, 'Available',   1,  4),
(NULL,5420, 'VANS SK8-HI TAPERED MODULAR',               'Black',   559.08, 'Unavailable', 1,  8);

INSERT INTO product(id_product, code_product, name_product, colour_product, price_product_ron, availability_product, id_category, id_supplier) VALUES 
(NULL,5421, 'CHAMPION ROCHESTER BEACHSHORTS',        'Red',    130.99, 'Unavailable', 2, 11),
(NULL,5422, 'ADIDAS TRACK PANTS',                    'Black',  321.53, 'Available',   2,  2),
(NULL,5423, 'CHAMPION RIB CUFF PANTS',               'Green',  237.19, 'Available',   2, 11),
(NULL,5424, 'CHAMPION CUSTOM FIT PANTS',             'White',  286.66, 'Unavailable', 2, 11),
(NULL,5425, 'JORDAN FLIGHT SUIT PANTS',              'Red',    444.95, 'Unavailable', 2,  5),
(NULL,5426, 'PUMA X AMI W WIDE PANTS',               'Red',    657.64, 'Available',   2,  6),
(NULL,5427, 'HORSEFEATHERS MACKS PANTS',             'Grey',   336.12, 'Available',   2, 12),
(NULL,5428, 'ADIDAS WIDE LEG PANTS',                 'Black',  346.26, 'Unavailable', 2,  2),
(NULL,5429, 'CALVIN KLEIN JOGGER PANTS',             'Blue',   173.53, 'Available',   2, 10),
(NULL,5430, 'CALVIN KLEIN JEANS MILANO SPLIT PANTS', 'Black',  411.86, 'Unavailable', 2, 10);

INSERT INTO product VALUES 
(NULL,5431, 'HORSEFEATHERS SCORPIO PHOTOCHROMIC GLASSES', 'Black',  395.53, 'Unavailable', 3, 12),
(NULL,5432, 'ADIDAS SOLID CREW SOCK 3-PACK',              'Black',  59.37,  'Available',   3,  2),
(NULL,5433, 'NIKELAB U NRG BUCKET HAT',                   'Grey',   177.85, 'Unavailable', 3,  1),
(NULL,5434, 'JORDAN BUCKET JM WASHED CAP',                'White',  167.87, 'Unavailable', 3,  5),
(NULL,5435, 'JORDAN JAN AIR CROSSBODY',                   'Black',  158.06, 'Available',   3,  5),
(NULL,5436, 'NIKE H86 ESSENTIAL SWOOSH CAP',              'Blue',   113.54, 'Available',   3,  1),
(NULL,5437, 'VANS OLD SKOOL DROP V BAG',                  'Green',  142.78, 'Available',   3,  8),
(NULL,5438, 'HORSEFEATHERS NOMAD SUNGLASSES',             'Grey',   346.05, 'Available',   3, 12),
(NULL,5439, 'LEVIS BATWING TRIFOLD WALLET',               'Black',  128.38, 'Unavailable', 3,  9),
(NULL,5440, 'COLUMBIA PLUSH SCARF',                       'Green',  106.76, 'Unavailable', 3,  4);

-- B.4) 'PURCHASE_ORDER' TABLE MUST CONTAIN AT LEAST 10 RECORDS.

INSERT INTO purchase_order VALUES
(NULL, 'purchase_order 098022', '2022-02-11', 5423, 2, 10),
(NULL, 'purchase_order 082566', '2022-06-09', 5440, 4,  8),
(NULL, 'purchase_order 054223', '2022-04-23', 5402, 10, 5),
(NULL, 'purchase_order 033442', '2022-05-16', 5408, 8,  3),
(NULL, 'purchase_order 077562', '2022-06-02', 5427, 1,  6),
(NULL, 'purchase_order 064454', '2022-06-11', 5412, 5,  2),
(NULL, 'purchase_order 055425', '2022-04-29', 5419, 9,  9),
(NULL, 'purchase_order 088756', '2022-06-11', 5407, 3,  7),
(NULL, 'purchase_order 089926', '2022-03-08', 5431, 7,  4),
(NULL, 'purchase_order 089666', '2022-06-01', 5436, 6,  1);


-- C) 2 COMMANDS TO MODIFY THE DATA RECORDS FROM 2 DIFFERENT TABLES.
1.
UPDATE clients SET adress_client = 'Strada Garii, Nr.34, Bloc 16, Sc.A, Ap.45'
WHERE last_name_client = 'Mirica' AND first_name_client = 'Andrei-Stefan';

2.
UPDATE product SET price_product_ron = 1.1 * price_product_ron
WHERE id_category = 3;


-- D) 2 COMMANDS TO DELETE THE DATA RECORDS FROM 2 DIFFERENT TABLES.
1.
DELETE FROM product 
WHERE price_product_ron > '800';

2.
DELETE FROM purchase_order
WHERE MOD(id_invoice, 2) = 0;


-- E) 5 SIMPLE QUERIES
1.
SELECT * FROM clients 
WHERE adress_client_city = 'Bucuresti'
ORDER BY last_name_client;

2.
SELECT * FROM purchase_order
WHERE MONTH(purchase_order_date) >= '04'
ORDER BY name_purchase_order;

3.
SELECT name_product, MAX(price_product_ron) from product;

4.
SELECT SUM(price_product_ron) FROM product
WHERE id_category = 3; 

5.
SELECT * FROM clients
WHERE adress_client NOT LIKE '%Bloc%';


-- F) 5 QUERIES, USING FUNCTIONS/OPERATORS
1.
SELECT ROUND(price_product_ron) FROM product
WHERE LENGTH(name_product) >= 25;

2.
SELECT AVG(price_product_ron) FROM product
WHERE availability_product = 'Available';

3.
SELECT CONCAT_WS(' ', last_name_client, first_name_client) FROM clients;

4.
SELECT CHAR_LENGTH(name_supplier) FROM supplier
WHERE country_supplier!= 'France';

5.
SELECT LOWER(name_product) FROM product
WHERE colour_product = 'White';


-- G) 5 COMPLEX QUERIES, USING JOINS/UNIONS

SELECT clients.last_name_client, clients.first_name_client, purchase_order.name_purchase_order 
FROM clients 
JOIN purchase_order
ON clients.id_client = purchase_order.id_client;

2.
SELECT product.name_product, product.colour_product, supplier.name_supplier
FROM product
LEFT JOIN supplier 
ON product.id_supplier = supplier.id_supplier;

3.
SELECT purchase_order.purchase_order_date, purchase_order.name_purchase_order, product.price_product_ron
FROM purchase_order
JOIN product
WHERE product.code_product = purchase_order.code_product
GROUP BY product.price_product_ron;

4.
SELECT invoice.type_invoice, clients.email_adress
FROM invoice
JOIN purchase_order
USING (id_invoice) 
JOIN clients
USING (id_client);

5.
SELECT clients.adress_client, clients.adress_client_city, clients.id_client, purchase_order.code_product
FROM clients 
RIGHT JOIN purchase_order 
ON clients.id_client = purchase_order.id_client
WHERE adress_client_city = 'Constanta'
UNION ALL
SELECT clients.adress_client, clients.adress_client_city, clients.id_client, purchase_order.code_product
FROM clients 
LEFT JOIN purchase_order 
ON clients.id_client = purchase_order.id_client
WHERE adress_client_city = 'Bucuresti';


-- H) 3 SUBQUERIES
1.
SELECT * FROM product WHERE price_product_ron <
(SELECT AVG(price_product_ron) FROM product);

2. 
SELECT * FROM purchase_order WHERE purchase_order_date < CURRENT_DATE() - INTERVAL 3 MONTH;

3. 
SELECT * FROM product WHERE colour_product ='Black' AND price_product_ron >
(SELECT MAX(price_product_ron) FROM product WHERE id_category IN 
(SELECT id_category FROM category WHERE name_category IN ('Accessories', 'Pants')));


-- I) 3 VIEWS BASED UPON DIFFERENT QUERIES 
1.
CREATE VIEW clients_gmail_account AS 
SELECT last_name_client, first_name_client, phone_number FROM clients
WHERE email_adress LIKE '%@gmail.com';

SELECT * FROM clients_gmail_account;

2.
CREATE VIEW products_USA AS
SELECT product.name_product, supplier.name_supplier, supplier.country_supplier
FROM product
LEFT JOIN supplier
USING (id_supplier)
WHERE country_supplier = 'USA';

SELECT * FROM products_USA;

3.
CREATE VIEW clients_apartment_block AS 
SELECT * FROM clients
WHERE adress_client LIKE '%Bloc%';

SELECT * FROM clients_apartment_block;


-- J) INSERT DATA INTO VIEWS & UPDATE THE DATA RECORDS FROM A TABLE BASED UPON WHICH A VIEW WAS CREATED. 

1.
INSERT INTO clients_apartment_block VALUES
(11, 'Georgescu', 'Octavian',        'Aleea Cocorilor, Nr.44, Bloc 56, Sc.D, Ap.3',         'Oradea', '0733447892', 'o.georgescu@gmail.com'),
(12, 'Mirea',     'Roxana-Andreea',  'Strada Muresenilor, Nr.12, Bloc 2, Sc.A, Ap.15',      'Oradea', '0768905665', 'mirea_andreea2398@yahoo.com'),
(13, 'Barbu',     'Stefan-Cristian', 'Strada Vasile Alecsandri, Nr.4, Bloc 50, Sc.A, Ap.1', 'Iasi',   '0789777453', 'barbu_cristi@gmail.com');

2.
UPDATE clients SET email_adress = 'pascu.ioan@gmail.com'
WHERE last_name_client = 'Pascu'  AND first_name_client = 'Alexandru-Ioan';


-- K) 2 SIMPLE INDEXES + 1 UNIQUE INDEX
1.
ALTER TABLE product ADD INDEX(name_product)

2. 
CREATE INDEX code_products
ON product (code_product);

3.
CREATE UNIQUE INDEX name_purchase_order
ON purchase_order(name_purchase_order);

SELECT * FROM product;
SELECT * FROM clients;
SELECT * FROM purchase_order; 
SELECT * FROM supplier;
SELECT * FROM category;
SELECT * FROM invoice;
