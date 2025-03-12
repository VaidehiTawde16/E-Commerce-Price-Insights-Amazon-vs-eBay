CREATE DATABASE PriceComparison;

USE PriceComparison;

CREATE TABLE AmazonData(
	id INT auto_increment PRIMARY KEY,
    product_title VARCHAR(255),
    price DECIMAL(10,2),
    product_link TEXT
);

CREATE TABLE EbayData(
	id INT auto_increment PRIMARY KEY,
    product_title VARCHAR(255),
    price DECIMAL(10,2),
    product_link TEXT
);

SELECT * FROM AmazonData;
SELECT * FROM EbayData;

#Find the Average Price on Amazon vs. eBay
SELECT 'Amazon' AS Platform, AVG(price) AS Average_Price FROM AmazonData
UNION ALL
SELECT 'Ebay' AS Platform, AVG(price) AS Average_Price FROM EbayData;

#Find the Most Expensive Products
(SELECT 'Amazon' AS Platform, product_title, price FROM AmazonData ORDER BY price DESC LIMIT 1)
UNION ALL
(SELECT 'Ebay' AS Platform, product_title, price FROM EbayData ORDER BY price DESC LIMIT 1);

#Find the Most Cheapest Products
(SELECT 'Amazon' AS Platform, product_title, price FROM AmazonData ORDER BY price ASC LIMIT 1)
UNION ALL
(SELECT 'Ebay' AS Platform, product_title, price FROM EbayData ORDER BY price ASC LIMIT 1);

# Identify Products That Are Cheaper on eBay
SELECT a.product_title, a.price AS Amazon_Price, e.price AS Ebay_Price
FROM AmazonData a
JOIN EbayData e ON a.product_title = e.product_title
WHERE e.price < a.price;

#Identify Products That Are More Expensive on eBay
SELECT a.product_title, a.price AS Amazon_Price, e.price AS Ebay_Price
FROM AmazonData a
JOIN EbayData e ON a.product_title = e.product_title
WHERE e.price > a.price;

#Find Price Difference Between Amazon & eBay
SELECT a.product_title, 
       a.price AS Amazon_Price, 
       e.price AS Ebay_Price, 
       (a.price - e.price) AS Price_Difference
FROM AmazonData a
JOIN EbayData e ON a.product_title = e.product_title;

SELECT id, price, product_title, product_link, 'Amazon' AS platform FROM AmazonData;
SELECT id, price, product_title, product_link, 'eBay' AS platform FROM EbayData;