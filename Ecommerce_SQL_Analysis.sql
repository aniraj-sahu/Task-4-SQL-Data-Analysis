use practice;

#DATA UNDERSTANDING

SELECT *
FROM ecommerce_dataset
LIMIT 10;

#count records
SELECT COUNT(*) AS Total_Records
FROM ecommerce_dataset;

#table structure
DESCRIBE ecommerce_dataset;

#DATA QUALITY CHECK

#missing values
SELECT
COUNT(*) AS TotalRows,
COUNT(ProductCategory) AS ProductCategory_NotNull,
COUNT(Brand) AS Brand_NotNull,
COUNT(Country) AS Country_NotNull
FROM ecommerce_dataset;

#duplicate records
SELECT ProductID,
COUNT(*)
FROM ecommerce_dataset
GROUP BY ProductID
HAVING COUNT(*) > 1;



SELECT DISTINCT ProductCategory
FROM ecommerce_dataset;

SELECT COUNT(DISTINCT Brand) AS Total_Brands
FROM ecommerce_dataset;

SELECT DISTINCT Country
FROM ecommerce_dataset;

#sales performance
SELECT ProductCategory,
       round(SUM(MonthlySales) ,2) AS Total_Sales
FROM ecommerce_dataset
GROUP BY ProductCategory
ORDER BY Total_Sales DESC;

#brand performance
SELECT Brand,
       round(SUM(MonthlySales),2) AS Total_Sales
FROM ecommerce_dataset
GROUP BY Brand
ORDER BY Total_Sales DESC
LIMIT 10;

#country performance
SELECT Country,
       round(SUM(MonthlySales),2) AS Total_Sales
FROM ecommerce_dataset
GROUP BY Country
ORDER BY Total_Sales DESC;

#profitability
SELECT ProductCategory,
       ROUND(AVG(ProfitMargin),2) AS Avg_Profit_Margin
FROM ecommerce
GROUP BY ProductCategory
ORDER BY Avg_Profit_Margin DESC;

#customer satisfaction
SELECT Brand,
       ROUND(AVG(Rating),2) AS Avg_Rating
FROM ecommerce_dataset
GROUP BY Brand
ORDER BY Avg_Rating DESC;

#discount analysis
SELECT ProductCategory,
       ROUND(AVG(Discount),2) AS Avg_Discount
FROM ecommerce
GROUP BY ProductCategory
ORDER BY Avg_Discount DESC;

#inventory analysis
SELECT ProductCategory,
       Brand,
       round(Inventory,2)
FROM ecommerce_dataset
ORDER BY Inventory ASC
LIMIT 10;

#reviews
SELECT Brand,
       round(SUM(Reviews),2) AS Total_Reviews
FROM ecommerce_dataset
GROUP BY Brand
ORDER BY Total_Reviews DESC;

#promotions
SELECT Promotion,
       ROUND(AVG(MonthlySales),2) AS Avg_Sales
FROM ecommerce
GROUP BY Promotion;

#premium products
SELECT ProductCategory,
       Brand,
       round(Price,2)
FROM ecommerce_dataset
ORDER BY Price DESC
LIMIT 10;

