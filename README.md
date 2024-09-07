**These projects leverages SQLite within SQL Workbench to analyze various datasets derived from CSV files, focusing on extracting actionable business insights and guiding strategic decision-making. By employing SQL queries and data manipulation techniques, the analysis aims to uncover key trends, patterns, and performance metrics that inform business strategies.**


# **1-E Commerce Business Data Analysis**  

**Project Overview:**

This project focuses on creating and managing an E-commerce Orders database using SQL to analyze customer orders, products, categories, and sales revenue. 

**Database Schema:**

The database consists of a single table named ORDERS, with the following columns:

- ORDER_ID: Unique identifier for each order (Primary Key, Auto Increment).

- CUSTOMER_NAME: Name of the customer.

- EMAIL: Customer email address.
  
- PRODUCT: Name of the ordered product.

- CATEGORY: Product category (e.g., Electronics, Kitchen).

- QUANTITY: Number of items ordered.

- PRICE: Price of the product.

- ORDER_DATE: Date when the order was placed.

- REVENUE: Calculated as the product of price and quantity.

**Key Analysis:**

- Sales by Category: Queries retrieve total sales and product demand by category, with a focus on high-revenue categories like Electronics.

- Top Customers: Ranking customers by total spending and identifying high-value customers.

- Product Popularity: Identifying products ordered more than 5 times.

- Revenue Analysis: Calculating the total sales revenue and creating a column to classify orders by price range (High, Medium, Low).

- Customer Behavior: Analyzing repeat customers and their order frequency.

**Tools & Techniques:**

- SQL Joins: To manipulate and retrieve data from multiple columns.

- Aggregate Functions: SUM, COUNT, AVG for calculating total sales, product frequency, and average pricing.

- Conditional Logic: Used IF statements to categorize products based on price.

- Data Manipulation: Inserting rows, updating tables, and altering table structures.



----


# **2-Books Data Analysis Project**

**Project Overview:**

I conducted a series of SQL queries on a book dataset to extract valuable information.

**Key Operations:**

- Data Retrieval: I displayed all columns from the books_data table to get a comprehensive view.

- Language Filtering: I identified the unique languages available in the dataset.

- Price Filtering: I found books with a real price greater than 900.

- English Books: I filtered books available in English.

- Data Ordering: I ordered authors alphabetically and books by product rating in descending order.

- Top-Priced Books: I listed the top 5 highest-priced books.

**Results:**

These queries provided insights into the book dataset, such as:

- Language Diversity: Understanding the range of languages represented in the data.

- Price Distribution: Identifying high-priced books and potential target markets.

  

----

# **3-Resturant Data Danny's Diner Case Study Data Analysis**

**Objective:**

This SQL-based project focuses on analyzing sales, membership, and menu data for Danny's Diner.
The goal is to derive actionable insights into customer behavior, product popularity,
and the effectiveness of the membership program.


**Schema Design:**

The project involves creating and populating three primary tables:

- SALES: Records customer orders, linking to the menu items purchased and the order dates.

- MENU: Stores the list of menu items along with their corresponding prices.

- MEMBERS: Tracks membership data, including the date customers joined the membership program.



**Key Analysis:**

- Customer Spending: Total amount spent by each customer at the diner.

- Customer Visit Patterns: Number of unique days each customer visited the restaurant.

- Purchase Trends: Identification of the first item purchased by each customer and the most popular item across all customers.

- Membership Influence: Analyzing customer purchase behavior before and after joining the membership program, including identifying the first purchase after membership and items purchased before membership.

- Loyalty Program Impact: Calculation of loyalty points for each customer, with special conditions for items like sushi (2x points multiplier) and enhanced points for purchases within the first week of membership.


**Tools & Techniques:**

- SQL Joins (INNER, LEFT)

- Window Functions (ROW_NUMBER)

- Aggregation Functions (SUM, COUNT)

- Conditional Logic in SQL (CASE)

- Constraints (Primary and Foreign Keys)

- Date manipulation and comparison for time-sensitive queries
  
- Product Popularity: Identifying top-rated books and customer preferences.



----

# **4-Case Study Resturant Data Analysis**

**Objective:**

This SQL-based case study is designed to analyze various facets of restaurant operations, including customer activity, food pricing, restaurant performance, and sales trends. The primary goal is to gain insights into customer behavior, restaurant popularity, and sales performance.


**Schema Overview:**

The analysis utilizes the following tables:

- Users: Contains user information including IDs, names, emails, and passwords.

- Restaurants: Details about restaurants, including IDs, names, and cuisine types.

- Food: Information about food items with their IDs, names, and types.

- Menu: Connects food items to restaurants along with pricing.

- Orders: Records of customer orders including order IDs, user IDs, restaurant IDs, amounts, dates, and ratings.

- Delivery_Partners: Details of delivery partners.

- Order_Details: Information on food items included in each order.


**Key Analysis:**

- Customers Who Have Never Ordered:

- Average Price per Dish:

- Top Restaurant by Number of Orders for a Given Month:

- Restaurants with Monthly Sales Greater Than X:

- Orders and Details for a Specific Customer in a Date Range:

- Restaurants with Maximum Repeated Customers:

- Month-over-Month Revenue Growth:

- Customer Favorite Food:

- Most Loyal Customers for All Restaurants:

- Month-over-Month Revenue Growth of a Specific Restaurant:


**Tools & Techniques:**

- SQL Joins: INNER and LEFT joins to combine data from multiple tables.

- Aggregation Functions: SUM, COUNT, and AVG for summarizing data.

- Date Functions: DATE_FORMAT and BETWEEN for handling and comparing date values.

- Ordering and Limiting Results: ORDER BY and LIMIT for sorting and filtering results.

- Grouping Data: GROUP BY for aggregating data based on specified criteria.


----
