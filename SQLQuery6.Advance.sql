
-- Use database [E_commerce_sales]
use [E_commerce_sales];

SELECT * FROM List_of_orders;

SELECT * FROM Order_details;

SELECT * FROM Sales_target;


-- 1. What are the total sales (Amount) for each category?
-- Calculates total sales for Furniture, Clothing, and Electronics.
 SELECT Category, SUM(Amount) Total_sales
FROM Order_details
GROUP BY Category;

-- 2. Which city had the highest total sales?
-- Returns city with maximum sales;
SELECT City, SUM(Amount) Total_sales
FROM List_of_orders l
INNER JOIN Order_details o
ON l.Order_ID = o.Order_ID
GROUP BY City 
ORDER BY Total_sales DESC;

--3. What is the average profit per order?
SELECT AVG(Profit) Average_profit  
 FROM Order_details;

 -- 4. How many unique customers placed orders?
 SELECT COUNt (DISTINCT CustomerName)  Unique_customers
 FROM List_of_orders;

 -- 5.Which product sub-category generated the highest profit?
 SELECT Sub_Category, SUM(Profit) Total_profit
 FROM Order_details
 GROUP BY Sub_Category
 ORDER BY Total_profit DESC;

 -- 6. . What was the sales target for Clothing in Jul-18?
 SELECT Target 
 FROM Sales_target
 WHERE Category ='Clothing' AND Month_of_Order_Date='Jul-18';

 -- 7. List all orders from 'Gujarat' state.
 SELECT * FROM List_of_orders
 WHERE State='Gujarat';

 --8. Which month had the highest sales for Electronics?
 SELECT t.[Month_of_Order_Date],SUM(d.Amount) AS Total
  FROM  Order_details d
  JOIN  List_of_orders o
  ON d.Order_ID = o.Order_ID 
  JOIN Sales_target t
  ON d.Category = t.Category 
  WHERE t.Category = 'Electronics' AND FORMAT(o.Order_Date,'MMM-YY')= t.Month_of_Order_Date
  GROUP BY t.Month_of_Order_Date
  ORDER BY Total DESC;

-- 9. Which state saw the most profitable orders?
SELECT o.State, SUM(d.Profit) Most_Profitable
 FROM List_of_orders o
INNER JOIN [Order_details] d
ON o.Order_ID = d.Order_ID
GROUP BY o.State
ORDER BY Most_Profitable DESC;

-- 10. Top 5 customers by sales amount
SELECT TOP 5 o.CustomerName, SUM(d.Amount)  Total_sales
 FROM List_of_orders o
INNER JOIN [Order_details] d
ON o.Order_ID = d.Order_ID
GROUP BY o.CustomerName
ORDER BY Total_sales DESC;

-- Subquery
---1. 1. Which customers placed orders with an order amount greater than the average order amount?
SELECT DISTINCT o.CustomerName
FROM List_of_orders o
JOIN [Order_details] d
ON o.Order_ID = d.Order_ID
WHERE d.Amount>(SELECT AVG(Amount) 
                 FROM [Order_details]);

-- 2. Which orders included at least one Electronics item?
SELECT o.[Order_ID], o.CustomerName
FROM [List_of_orders] o
WHERE o.[Order_ID] IN (
  SELECT [Order_ID]
  FROM [Order_details]
  WHERE Category = 'Electronics'
);

-- 4. Which product sub-categories had sales (sum of Amount) above the average sales for all sub-categories?
SELECT [Sub_Category], SUM(Amount) AS Total_Sales
FROM [Order_details]
GROUP BY [Sub_Category]
HAVING SUM(Amount) > (
  SELECT AVG(sub_total) FROM (
    SELECT SUM(Amount) as sub_total
    FROM [Order_details]
    GROUP BY [Sub_Category]
  ) averages
);

-- 5. Find customers who have only placed orders in one city.
SELECT CustomerName
FROM [List_of_orders]
GROUP BY CustomerName
HAVING COUNT(DISTINCT City) = 1;


