use cryptopunk;
 show tables;
  select * from cryptopunkdata;
  
  -- 1)How many sales occurred during this time period? 

SELECT COUNT(*) AS total_sales
FROM cryptopunkdata;

-- 2)Return the top 5 most expensive transactions (by USD price) for this data set. Return the name, ETH price, and USD price, as well as the date.

SELECT name, ETH_price, USD_price, day
FROM cryptopunkdata
ORDER BY USD_price DESC
LIMIT 5;

-- 3)Return a table with a row for each transaction with an event column, a USD price column, and a moving average of USD price that averages the last 50 transactions.
use cryptopunk;
SELECT
  day as event,
  USD_price,
  AVG(USD_price) OVER (ORDER BY day ROWS BETWEEN 49 PRECEDING AND CURRENT ROW) AS moving_average
FROM cryptopunkdata;
select * from cryptopunkdata;

-- 4)Return all the NFT names and their average sale price in USD. Sort descending. Name the average column as average_price.

SELECT name, AVG(USD_price) AS average_price
FROM Cryptopunkdata
GROUP BY name
ORDER BY average_price DESC;

-- 5)Return each day of the week and the number of sales that occurred on that day of the week, as well as the average price in ETH. Order by the count of transactions in ascending order.

select * from cryptopunkdata;
SELECT DAYOFWEEK(day) AS day_of_week, COUNT(*) AS sales_count, AVG(ETH_price) AS avg_eth_price
FROM Cryptopunkdata
GROUP BY day_of_week
ORDER BY sales_count ASC;

-- 6) Construct a column that describes each sale and is called summary. The sentence should include who sold the NFT name, who bought the NFT, who sold the NFT, the date, and what price it was sold for in USD rounded to the nearest thousandth.

SELECT CONCAT(name, ' was sold for $', ROUND(USD_price), ' to ', ï»¿buyer_address, ' from ', seller_address, ' on ', day) AS summary
FROM Cryptopunkdata;

-- 7) Create a view called “1919_purchases” and contains any sales where “0x1919db36ca2fa2e15f9000fd9cdc2edcf863e685” was the buyer.
CREATE VIEW 1919_purchases AS
SELECT *
FROM Cryptopunkdata
WHERE ï»¿buyer_address = '0x1919db36ca2fa2e15f9000fd9cdc2edcf863e685';

select * from 1919_purchases;
-- 8) Create a histogram of ETH price ranges. Round to the nearest hundred value. 
use cryptopunk;
SELECT ROUND(ETH_price, 2) AS eth_price_range, COUNT(*) AS frequency,
RPAD('', COUNT(*), '*') AS bar
FROM Cryptopunkdata
GROUP BY eth_price_range
ORDER BY eth_price_range;

-- 9) Return a unioned query that contains the highest price each NFT was bought for and a new column called status saying “highest” with a query that has the lowest price each NFT was bought for and the status column saying “lowest”. The table should have a name column, a price column called price, and a status column. Order the result set by the name of the NFT, and the status, in ascending order. 

SELECT name, MAX(USD_price) AS price, 'highest' AS status
FROM Cryptopunkdata
GROUP BY name
UNION
SELECT name, MIN(USD_price) AS price, 'lowest' AS status
FROM Cryptopunkdata
GROUP BY name
ORDER BY name, status ASC;

-- 10) What NFT sold the most each month / year combination? Also, what was the name and the price in USD? Order in chronological format. 

SELECT YEAR(day) AS year, MONTH(day) AS month, name, MAX(USD_price) AS max_price
FROM Cryptopunkdata
GROUP BY year, month, name
ORDER BY year, month;

-- 11) Return the total volume (sum of all sales), round to the nearest hundred on a monthly basis (month/year).

SELECT YEAR(day) AS year, MONTH(day) AS month, ROUND(SUM(USD_price), 2) AS total_volume
FROM Cryptopunkdata
GROUP BY year, month;

-- 12) Count how many transactions the wallet "0x1919db36ca2fa2e15f9000fd9cdc2edcf863e685"had over this time period.

SELECT COUNT(*) AS transaction_count
FROM Cryptopunkdata
WHERE ï»¿buyer_address = '0x1919db36ca2fa2e15f9000fd9cdc2edcf863e685';
select * from cryptopunkdata;

-- 13) Create an “estimated average value calculator” that has a representative price of the collection every day based off of these criteria:
 -- Exclude all daily outlier sales where the purchase price is below 10% of the daily average price
 -- Take the daily average of remaining transactions
 
--  a) First create a query that will be used as a subquery. Select the event date, the USD price, and the average USD price for each day using a window function. Save it as a temporary table.
 CREATE TEMPORARY TABLE temp_daily_avg AS
SELECT day, USD_price, AVG(USD_price) OVER (PARTITION BY day) AS daily_avg
FROM Cryptopunkdata;
 
-- b) Use the table you created in Part A to filter out rows where the USD prices is below 10% of the daily average and return a new estimated value which is just the daily average of the filtered data
SELECT day, ROUND(AVG(USD_price), 2) AS estimated_value
FROM temp_daily_avg
WHERE USD_price >= 0.1 * daily_avg
GROUP BY day;

-- 14) Give a complete list ordered by wallet profitability (whether people have made or lost money)

SELECT buyer_address, ROUND(SUM(USD_price), 2) AS total_spent
FROM Cryptopunkdata
GROUP BY ï»¿buyer_address
ORDER BY total_spent DESC;






