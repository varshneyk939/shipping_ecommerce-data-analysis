# shipping_ecommerce-data-analysis

Overview

This project involves analyzing an E-commerce sales dataset using MySQL to gain insights into shipments, discounts, warehouses, and customer ratings. The analysis focuses on filtering, aggregating, joining, and optimizing queries for better performance.

Dataset

Source: E-commerce shipping dataset (CSV imported into MySQL)

Key Columns:

Order_ID

Customer_ID

Warehouse_block

Mode_of_Shipment

Discount_offered

Weight_in_gms

Customer_rating

Prior_purchases

Tasks Performed

Basic Querying:

Selected all records with SELECT * FROM shipping_ecommerce;

Filtered orders with discounts > 20 and sorted by weight

Aggregation & Grouping:

Calculated total orders and average customer ratings per warehouse using GROUP BY

Created summary statistics with aggregate functions: SUM, AVG, MAX, MIN

Joins:

Created a helper table warehouse_info with warehouse cities

Performed INNER JOIN to match orders with warehouse cities

Used LEFT JOIN and RIGHT JOIN to include all warehouses from either table

Subqueries:

Filtered orders heavier than the overall average weight using a subquery

Views & Indexing:

Created a view shipment_summary to summarize total orders and average discount per shipment mode

Created an index on Discount_offered to improve query performance

Tools Used

Database: MySQL

SQL Concepts: SELECT, WHERE, ORDER BY, GROUP BY, JOINs, Subqueries, Views, Indexes

Outcome

Identified top warehouses by order count and average ratings

Determined shipment modes with the highest orders and discounts

Improved query performance through indexing

Prepared summary data for future reporting and analysis
