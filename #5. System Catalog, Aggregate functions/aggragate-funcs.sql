--Right way for selecting avg sum for products
SELECT ProductId,
       MIN(Price) MIN_Price,
       MAX(Price) MAX_Price,
       SUM(Price*Qty)/SUM(Qty) AVG_Price
FROM Orders
GROUP BY ProductId