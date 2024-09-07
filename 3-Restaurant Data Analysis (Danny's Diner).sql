## CREATING SCHEMA & ADDING TABLES

CREATE SCHEMA DANNYS_DINER;
USE DANNYS_DINER;

CREATE TABLE 
SALES
(
CUSTOMER_ID VARCHAR(10), 
ORDER_DATE DATE, 
PRODUCT_ID INTEGER
);


INSERT INTO 
SALES
(CUSTOMER_ID, ORDER_DATE, PRODUCT_ID)
VALUES
  ('A', '2021-01-01', '1'),
  ('A', '2021-01-01', '2'),
  ('A', '2021-01-07', '2'),
  ('A', '2021-01-10', '3'),
  ('A', '2021-01-11', '3'),
  ('A', '2021-01-11', '3'),
  ('B', '2021-01-01', '2'),
  ('B', '2021-01-02', '2'),
  ('B', '2021-01-04', '1'),
  ('B', '2021-01-11', '1'),
  ('B', '2021-01-16', '3'),
  ('B', '2021-02-01', '3'),
  ('C', '2021-01-01', '3'),
  ('C', '2021-01-01', '3'),
  ('C', '2021-01-07', '3');
 
 SELECT * FROM DANNYS_DINER.SALES;
 
 CREATE TABLE 
 MENU 
 (
 PRODUCT_ID INTEGER,
 PRODUCT_NAME VARCHAR(15),
 PRICE INTEGER
 );
 
 INSERT INTO 
MENU
( PRODUCT_ID, PRODUCT_NAME, PRICE )
VALUES 
  ('1', 'sushi', '10'),
  ('2', 'curry', '15'),
  ('3', 'ramen', '12');
  
  SELECT * FROM MENU ;
  
  CREATE TABLE 
  MEMBERS
(COSTUMER_ID INTEGER , JOIN_DATE DATE);

ALTER TABLE MEMBERS
MODIFY COLUMN COSTUMER_ID VARCHAR(10);

INSERT INTO 
MEMBERS
(CUSTOMER_ID , JOIN_DATE)
VALUES
('A', '2021-01-07'),
('B', '2021-01-09');

INSERT INTO 
MEMBERS
(CUSTOMER_ID , JOIN_DATE)
VALUES
('c', '2021-01-08');

## adding primary key 
alter table menu add primary key (product_id);
alter table members add primary key (costumer_id);
 
#renaming column
 alter table members rename column costumer_id to customer_id;

## Adding foreign Key 

 alter table sales 
 add constraint fk_customer_id
 foreign key (customer_id)
 references members(customer_id);
  
alter table sales 
add constraint fk_product_id
foreign key (product_id)
references menu(product_id);
 




SELECT * FROM MENU;
SELECT * FROM SALES;
SELECT * FROM MEMBERS;




 
 
 /* --------------------
   Case Study Questions
   --------------------*/

-- 1. What is the total amount each customer spent at the restaurant?

SELECT s.CUSTOMER_ID, SUM(m.PRICE) AS TOTAL_AMOUNT_SPENT
FROM SALES s
JOIN MENU m ON s.PRODUCT_ID = m.PRODUCT_ID
GROUP BY s.CUSTOMER_ID;


-- 2. How many days has each customer visited the restaurant?

SELECT CUSTOMER_ID, COUNT(DISTINCT ORDER_DATE) AS NO_OF_DAYS_VISITED
FROM SALES
GROUP BY CUSTOMER_ID;

-- 3. What was the first item from the menu purchased by each customer?

SELECT s.CUSTOMER_ID, s.PRODUCT_ID, s.ORDER_DATE, M.PRODUCT_NAME
FROM SALES s 
INNER JOIN (
    SELECT CUSTOMER_ID, MIN(ORDER_DATE) AS FIRST_ORDER_DATE
    FROM SALES
    GROUP BY CUSTOMER_ID
) AS first_orders
ON s.CUSTOMER_ID = first_orders.CUSTOMER_ID AND s.ORDER_DATE = first_orders.FIRST_ORDER_DATE
INNER JOIN MENU m ON s.PRODUCT_ID = m.PRODUCT_ID;



-- 4. What is the most purchased item on the menu and how many times was it purchased by all customers?

SELECT PRODUCT_ID, COUNT(*) AS PURCHASE_COUNT
FROM SALES
GROUP BY PRODUCT_ID
ORDER BY PURCHASE_COUNT DESC LIMIT 1 ;


-- 5. Which item was the most popular for each customer?

WITH 
CUSTOMER_FAV_PRODUCT AS 
(
    SELECT CUSTOMER_ID, PRODUCT_ID, COUNT(*) AS PURCHASE_COUNT
    FROM SALES
    GROUP BY CUSTOMER_ID, PRODUCT_ID
) ,
Ranked_Items AS 
(
    SELECT CUSTOMER_ID, PRODUCT_ID, PURCHASE_COUNT,
           ROW_NUMBER() OVER (PARTITION BY CUSTOMER_ID ORDER BY PURCHASE_COUNT DESC) AS RANK_OF_PRODUCT FROM CUSTOMER_FAV_PRODUCT
)
SELECT s.CUSTOMER_ID,s.PRODUCT_ID,M.PRODUCT_NAME, s.PURCHASE_COUNT
FROM RANKED_ITEMS s
INNER JOIN MENU m ON s.PRODUCT_ID = m.PRODUCT_ID
WHERE s.RANK_OF_PRODUCT = 1;



-- 6. Which item was purchased first by the customer after they became a member?

WITH First_Purchase_After_Membership AS
(
    SELECT s.CUSTOMER_ID, s.PRODUCT_ID, MENU.PRODUCT_NAME, s.ORDER_DATE, M.JOIN_DATE, 
       ROW_NUMBER() OVER (PARTITION BY s.CUSTOMER_ID ORDER BY s.ORDER_DATE) AS purchase_rank
FROM SALES s
JOIN MEMBERS m ON s.CUSTOMER_ID = m.CUSTOMER_ID
JOIN MENU  ON s.PRODUCT_ID = MENU.PRODUCT_ID
WHERE s.ORDER_DATE > m.JOIN_DATE
)
SELECT CUSTOMER_ID, PRODUCT_ID,PRODUCT_NAME, ORDER_DATE , JOIN_DATE  
FROM First_Purchase_After_Membership
WHERE purchase_rank = 1;

    
    
-- 7. Which item was purchased just before the customer became a member?

WITH First_Purchase_After_Membership AS
(
    SELECT s.CUSTOMER_ID, s.PRODUCT_ID, MENU.PRODUCT_NAME, s.ORDER_DATE, M.JOIN_DATE, 
       ROW_NUMBER() OVER (PARTITION BY s.CUSTOMER_ID ORDER BY s.ORDER_DATE DESC) AS purchase_rank
FROM SALES s
JOIN MEMBERS m ON s.CUSTOMER_ID = m.CUSTOMER_ID
JOIN MENU  ON s.PRODUCT_ID = MENU.PRODUCT_ID
WHERE s.ORDER_DATE < m.JOIN_DATE
)
SELECT CUSTOMER_ID, PRODUCT_ID,PRODUCT_NAME, ORDER_DATE , JOIN_DATE  
FROM First_Purchase_After_Membership
WHERE purchase_rank = 1 ;


-- 8. What is the total items and amount spent for each member before they became a member?

SELECT
    m.Customer_ID,
    COUNT(s.Product_ID) AS Total_Items,
    SUM(mn.Price) AS Amount_Spent
FROM
    MEMBERS m
LEFT JOIN
    SALES s ON m.Customer_ID = s.Customer_ID
LEFT JOIN
    MENU mn ON s.Product_ID = mn.Product_ID
WHERE
    s.Order_Date < m.Join_Date
GROUP BY
    m.Customer_ID
ORDER BY
    m.Customer_ID;

-- 9.  If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?

SELECT
    s.Customer_ID,
    SUM(
        CASE
            WHEN mn.Product_Name = 'sushi' THEN 20 
            ELSE 10 
        END
    ) AS Total_Points
FROM
    SALES s
LEFT JOIN
    MENU mn ON s.Product_ID = mn.Product_ID
GROUP BY
    s.Customer_ID
ORDER BY
    s.Customer_ID;

-- 10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items,
-- not just sushi - how many points do customer A and B have at the end of January?

SELECT
    m.Customer_ID,
    SUM(
        CASE
            WHEN s.Order_Date <= DATE_ADD(m.Join_Date, INTERVAL 7 DAY) THEN 20
            ELSE 10  
        END
    ) AS Total_Points
FROM
    MEMBERS m
LEFT JOIN
    SALES s ON m.Customer_ID = s.Customer_ID
LEFT JOIN
    MENU mn ON s.Product_ID = mn.Product_ID
WHERE
    s.Order_Date <= '2024-01-31'  
GROUP BY
    m.Customer_ID
ORDER BY
    m.Customer_ID;
