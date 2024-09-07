     -- 1. Creating a database named EcommerceOrders.

create database Ecommerce_Orders ;



     -- 2. Using the database.

use ecommerce_orders;



     -- 3. Creating a table named Orders with the following columns:
	-- OrderID (Primary Key, Auto Increment)
	-- CustomerName
	-- Email
	-- Product
	-- Category
	-- Quantity
	-- Price
	-- OrderDate

CREATE TABLE ORDERS (
  ORDER_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  CUSTOMER_NAME VARCHAR(100) NOT NULL,
  EMAIL VARCHAR(80) NOT NULL,
  PRODUCT TEXT,  
  CATEGORY VARCHAR(90),
  QUANTITY INT NOT NULL,
  PRICE DECIMAL(10,2) NOT NULL, 
  ORDER_DATE DATE NOT NULL
);




     -- 4. Inserting the given rows into table
    
    INSERT INTO ORDERS 
( 
  CUSTOMER_NAME,
  EMAIL,
  PRODUCT,  
  CATEGORY,
  QUANTITY,
  PRICE,  
  ORDER_DATE
)
  VALUES 
  ('Ali Khan', 'ali.khan@example.com', 'Laptop', 'Electronics', 1, 1200, '2023-01-15'),
	('Fatima Ahmed', 'fatima.ahmed@example.com', 'Smartphone', 'Electronics', 2, 800, '2023-01-17'),
	('Bilal Shah', 'bilal.shah@example.com', 'Office Chair', 'Furniture', 3, 150, '2023-01-20'),
	('Ayesha Malik', 'ayesha.malik@example.com', 'Desk Lamp', 'Furniture', 5, 25, '2023-01-22'),
    ('Omar Farooq', 'omar.farooq@example.com', 'Mixer', 'Kitchen', 1, 60, '2023-02-01'),
	('Mehreen Akhtar', 'mehreen.akhtar@example.com', 'Air Conditioner', 'Home Appliances', 1, 1000, '2023-02-03'),
	('Asad Mirza', 'asad.mirza@example.com', 'Toaster', 'Kitchen', 1, 25, '2023-02-07'),
	('Usman Sheikh', 'usman.sheikh@example.com', 'Coffee Maker', 'Kitchen', 1, 80, '2023-01-25'),
	('Sara Yousaf', 'sara.yousaf@example.com', 'Blender', 'Kitchen', 1, 50, '2023-01-28'),
	('Hassan Iqbal', 'hassan.iqbal@example.com', 'Book', 'Books', 10, 15, '2023-01-30'),
	('Rabia Karim', 'rabia.karim@example.com', 'Microwave', 'Kitchen', 1, 100, '2023-02-01'),
    ('Mehreen Akhtar', 'mehreen.akhtar@example.com', 'Coffee Maker', 'Kitchen', 1, 80, '2023-02-08'),
	('Arif Ali', 'arif.ali@example.com', 'Headphones', 'Electronics', 2, 200, '2023-02-03'),
	('Nida Khan', 'nida.khan@example.com', 'Monitor', 'Electronics', 1, 300, '2023-02-05'),
	('Zainab Javed', 'zainab.javed@example.com', 'Tablet', 'Electronics', 1, 150, '2023-02-07'),
	('Omar Farooq', 'omar.farooq@example.com', 'Vacuum Cleaner', 'Home Appliances', 1, 250, '2023-02-10'),
	('Mehreen Akhtar', 'mehreen.akhtar@example.com', 'Washing Machine', 'Home Appliances', 1, 500, '2023-02-12'),
	('Asad Mirza', 'asad.mirza@example.com', 'Refrigerator', 'Home Appliances', 1, 800, '2023-02-14'),
	('Sana Tariq', 'sana.tariq@example.com', 'Air Conditioner', 'Home Appliances', 1, 1000, '2023-02-16'),
	('Ahmad Raza', 'ahmad.raza@example.com', 'Electric Kettle', 'Kitchen', 1, 30, '2023-02-18'),
	('Hiba Anwar', 'hiba.anwar@example.com', 'Toaster', 'Kitchen', 1, 25, '2023-02-20'),
	('Faisal Nawaz', 'faisal.nawaz@example.com', 'Blender', 'Kitchen', 1, 40, '2023-02-22'),
	('Mariam Saeed', 'mariam.saeed@example.com', 'Cooker', 'Kitchen', 1, 70, '2023-02-24'),
	('Imran Siddiqui', 'imran.siddiqui@example.com', 'Mixer', 'Kitchen', 1, 60, '2023-02-26'),
    ('Omar Farooq', 'omar.farooq@example.com', 'Mixer', 'Kitchen', 1, 60, '2023-02-27'),
	('Mehreen Akhtar', 'mehreen.akhtar@example.com', 'Air Conditioner', 'Home Appliances', 1, 1000, '2023-02-21'),
	('Asad Mirza', 'asad.mirza@example.com', 'Toaster', 'Kitchen', 1, 25, '2023-02-17'),
	('Sana Tariq', 'sana.tariq@example.com', 'Cooker', 'Kitchen', 1, 70,  '2023-02-20')
    ;



       -- 4. Retrieve all records from the table.
    
SELECT * from ORDERS; 


    
    -- 5. Retrieve orders where the category is 'Electronics'.
    
SELECT * FROM ORDERS WHERE CATEGORY = 'ELECTRONICS';



    -- 6. Retrieve orders where the price is above 100.
    
    
SELECT * FROM ORDERS WHERE PRICE > 100 ;



    -- 7. Add the Sales/Revenue Column to the Table: (choose one name. either sales or revenue)
    
    
ALTER TABLE ORDERS ADD REVENUE INT;
    
ALTER TABLE ORDERS
MODIFY COLUMN REVENUE DECIMAL(20,2);



    -- 8. Update the Sales/Revenue Column with price * Quantity.
    
SET SQL_SAFE_UPDATES=0;
    
UPDATE ORDERS
SET REVENUE = PRICE*QUANTITY;



-- 9. Find the total sales generated from the 'Electronics' category.

SELECT * FROM ORDERS WHERE CATEGORY = 'ELECTRONICS' ;

SELECT SUM(PRICE*QUANTITY) AS TotalSales
FROM ORDERS
WHERE CATEGORY = 'Electronics';



-- 10. List the top 5 customers by the total amount spent.

SELECT * FROM ORDERS
ORDER BY PRICE*QUANTITY DESC LIMIT 5;



-- 11. Find the average price of products in each category.

SELECT CATEGORY, AVG(PRICE) AS AveragePrice
FROM ORDERS
GROUP BY CATEGORY;



-- 12. List all products that have been ordered more than 5 times.

SELECT PRODUCT, SUM(QUANTITY) AS TIMES_ORDERED FROM ORDERS
GROUP BY PRODUCT HAVING SUM(QUANTITY)>5;




-- 13. Calculate the total number of products sold in the 'Kitchen' category.

SELECT SUM(QUANTITY) AS Total_Products_Sold
FROM ORDERS
WHERE CATEGORY = 'Kitchen';




-- 14. Use the IF  statement to create a temporary new column PriceCategory where:
	-- Orders with a price above 200 are 'High'
	-- Orders with a price between 100 and 200 are 'Medium'
	-- Orders with a price below 100 are 'Low'


SELECT *,
  IF(PRICE > 200, 'High',
    IF(PRICE >= 100 AND PRICE <= 200, 'Medium', 'Low')) AS PriceCategory
FROM ORDERS;



-- 15. Identify customers who have placed 2 or more orders.


SELECT CUSTOMER_NAME , COUNT(*) AS NumberOfOrders FROM ORDERS
GROUP BY CUSTOMER_NAME
HAVING COUNT(*) >= 2;
