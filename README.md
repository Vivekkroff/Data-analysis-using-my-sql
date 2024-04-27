Project Data Analysis using SQL - Capstone Project


Overview

This project focuses on analyzing real-world sales data of Cryptopunks, one of the most renowned NFT projects, spanning from January 1st, 2018, to December 31st, 2021. The dataset comprises various columns including buyer and seller addresses, ETH and USD prices, transaction details, and NFT names. The objective is to derive insights and perform diverse analyses on this dataset, shedding light on sales trends, pricing dynamics, and buyer-seller interactions within the Cryptopunks NFT marketplace.

Queries Implemented

Total Sales Count: Determining the total number of sales during the specified timeframe.
Top 5 Expensive Transactions: Retrieving the top 5 transactions with the highest USD prices, along with their details.
Moving Average of USD Price: Calculating a moving average of USD prices for each transaction based on the last 50 transactions.
Average Sale Price per NFT Name: Listing all NFT names along with their average sale prices in USD, sorted in descending order.
Sales Count and Average ETH Price by Day of the Week: Analyzing the number of sales and average ETH price for each day of the week, ordered by transaction count.
Sales Summary: Constructing a summary for each sale, containing relevant details such as NFT name, buyer, seller, date, and price.
View Creation: Creating a view named "1919_purchases" containing sales where a specific buyer address is involved.
ETH Price Histogram: Generating a histogram of ETH price ranges rounded to the nearest hundred.
Highest and Lowest Price per NFT: Returning the highest and lowest purchase prices for each NFT, along with a status column indicating the respective extremes.
Most Sold NFT Each Month/Year: Identifying the NFT that sold the most in each month/year combination, along with its name and price in USD.
Monthly Total Sales Volume: Calculating the total sales volume on a monthly basis, rounded to the nearest hundred.
Transaction Count by Wallet: Counting the number of transactions associated with a specific wallet address.
Estimated Average Value Calculator: Estimating the daily average value of the collection, excluding outliers below 10% of the daily average price.

Instructions for Use

Data Requirements: Ensure that the dataset containing Cryptopunks sales data from January 1st, 2018, to December 31st, 2021, is available.
SQL Environment: Utilize a SQL database management system (DBMS) such as MySQL, PostgreSQL, or SQLite.
Execute Queries: Run the provided SQL queries in the specified order to perform various analyses on the Cryptopunks sales data.
Interpret Results: Review the output of each query to gain insights into sales trends, pricing dynamics, and other relevant metrics within the Cryptopunks NFT marketplace.
