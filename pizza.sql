CREATE DATABASE Pizza;
USE Pizza;
SELECT * FROM pizza_sales;

-- Q1.TOtal Revenue
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;

-- Q2.Average Order value
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_Order_Value FROM pizza_sales;

-- Q3.Total Pizzas Sold
SELECT SUM(QUANTITY) AS Total_Pizza_Sold FROM pizza_sales;

-- Q4.Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales;

-- Q5.Avg Pizzas Per Order
SELECT CAST(SUM(QUANTITY) AS DECIMAL(10,2)) /
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2))  AS Avg_pizzas_Per_Order FROM pizza_sales;

-- Q6.Daily Trend For Total Orders
SELECT
	DAYNAME(order_date) AS order_day,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DAYNAME(order_date)
ORDER BY total_orders ASC;

-- Q7.Monthly Trend For Total Orders
SELECT MONTHNAME(order_date) AS Month_Name,
COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY MONTHNAME(order_date)
ORDER BY Total_Orders ASC;

-- Q8.Percentage of Sales by Pizza Category
SELECT pizza_category, SUM(total_price) * 100 /(SELECT SUM(total_price) FROM pizza_sales) AS PCT
FROM pizza_sales
GROUP BY pizza_category;

-- Q9.Percentage of Sales By Pizza Size
SELECT pizza_size, SUM(total_price) * 100 /(SELECT SUM(total_price) FROM pizza_sales) AS PCT
FROM pizza_sales
GROUP BY pizza_size;

-- Q10.Total Pizza Sold by Pizza Category
SELECT 
	pizza_category,
    SUM(quantity) AS total_pizza_sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY total_pizza_sold DESC;
    
-- Q11. Top 5 Best Sellers by Revenue, Total Quantity and total Orders
SELECT 
	pizza_name,
	SUM(total_price) AS total_revenue,
    SUM(quantity) AS total_quantity_sold,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY pizza_name 
ORDER BY total_revenue DESC
LIMIT 5;

-- Q12.Bottom 5 Best sellers  by Revenue, Total Quantity and total Orders
SELECT 
	pizza_name,
	SUM(total_price) AS total_revenue,
    SUM(quantity) AS total_quantity_sold,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY pizza_name 
ORDER BY total_revenue ASC
LIMIT 5;