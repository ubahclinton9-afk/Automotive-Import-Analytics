-- ====================================================================
-- PROJECT: Automotive Import & Sales Analysis
-- DATABASE: MySQL
-- AUTHOR: Your Name
-- ====================================================================

-- --------------------------------------------------------------------
-- Query 1: Executive Key Performance Indicators (KPIs)
-- Purpose: Calculate overall investment, total revenue, profit, and profit margin %.
-- --------------------------------------------------------------------
SELECT 
    SUM(Total_Import_Value_USD) AS Total_Import_Cost,
    SUM(Total_Sales_Revenue_USD) AS Total_Revenue,
    SUM(Gross_Profit_USD) AS Total_Gross_Profit,
    ROUND((SUM(Gross_Profit_USD) / SUM(Total_Sales_Revenue_USD)) * 100, 2) AS Overall_Profit_Margin_Pct
FROM parts_sales;


-- --------------------------------------------------------------------
-- Query 2: Importer Ranking by Quantity Imported
-- Purpose: Identify which importer brought in the highest volume of parts.
-- --------------------------------------------------------------------
SELECT 
    Importer_Name, 
    SUM(Quantity_Imported) AS Total_Quantity_Imported
FROM parts_sales
GROUP BY Importer_Name
ORDER BY Total_Quantity_Imported DESC;


-- --------------------------------------------------------------------
-- Query 3: Importer Ranking by Total Revenue
-- Purpose: Identify top revenue generators among importers.
-- --------------------------------------------------------------------
SELECT 
    Importer_Name, 
    SUM(Total_Sales_Revenue_USD) AS Highest_Revenue,
    SUM(Gross_Profit_USD) AS Total_Profit
FROM parts_sales
GROUP BY Importer_Name
ORDER BY Highest_Revenue DESC;


-- --------------------------------------------------------------------
-- Query 4: Product Category Performance
-- Purpose: Compare sales revenue and gross profit between Assemblies vs Parts.
-- --------------------------------------------------------------------
SELECT 
    Product_Category, 
    SUM(Total_Sales_Revenue_USD) AS Total_Revenue,
    SUM(Gross_Profit_USD) AS Total_Profit
FROM parts_sales
GROUP BY Product_Category
ORDER BY Total_Revenue DESC;


-- --------------------------------------------------------------------
-- Query 5: Monthly Revenue Trend
-- Purpose: Track month-over-month sales performance to spot seasonality.
-- --------------------------------------------------------------------
SELECT 
    DATE_FORMAT(Import_Date, '%Y-%m') AS Import_Month,
    SUM(Total_Sales_Revenue_USD) AS Monthly_Revenue,
    SUM(Gross_Profit_USD) AS Monthly_Profit
FROM parts_sales
GROUP BY Import_Month
ORDER BY Import_Month ASC;