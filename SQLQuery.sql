
-- Use database [E_commerce_sales]
use [E_commerce_sales];

SELECT * FROM List_of_orders;

SELECT * FROM Order_details;

SELECT * FROM Sales_target;
-- Bigginer level questions
/*1. What are all the columns in the List-of-Orders table?

*/
SELECT *  FROM List_of_orders;

-- 2. How many orders are there in total?
SELECT COUNT(*) Orders
FROM List_of_orders WHERE Order_ID IS NOT NULL;

-- 3. Show the first 5 orders from the List-of-Orders table.
SELECT TOP 5 * 
FROM List_of_orders;

-- 4. What is the total quantity sold across all orders?
SELECT SUM(Quantity)
  FROM Order_details;

-- 5.List all the unique categories from the Order-Details table.
SELECT DISTINCT Category
 FROM Order_details;

-- 6. Show orders where the profit is positive.
SELECT *
FROM Order_details
WHERE Profit > 0;

-- 7. List customers from the city 'Pune'.
SELECT CustomerName
FROM List_of_orders
WHERE City = 'Pune';

-- 8. What is the maximum amount for a single order detail?
SELECT MAX(Amount) Maximum_Amount 
FROM Order_details;

-- 9. What is the average quantity per order detail?
SELECT AVG(Quantity) Average_quantity
FROM Order_details;

-- 10. Count how many orders were placed in April 2018.
SELECT COUNT(*)
FROM List_of_orders
WHERE Order_date LIKE '04-2018%';


