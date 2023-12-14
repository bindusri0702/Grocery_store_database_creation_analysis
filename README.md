# Grocery store database creation and analysis

## Database Design Overview

### About the Database

This database project focuses on managing grocery store transactions, capturing details such as customer information, items purchased, prices, and transaction dates. It aims to provide a structured and normalized approach to store and retrieve data efficiently.

The data provided [here](https://d3c33hcgiwev3.cloudfront.net/JTszB4u0TxKOrB0UpjciNw_c12372f001bf4b7fa855abedaebefef1_GreenspotDataset.csv?Expires=1702684800&Signature=B~G8ky4th9Fa-qhF1AmcDtR0dUJ1zsDbkK9Bt5V2toasmThdP9nyiDVllhwT~d957yHpW~agqB6tRlVAEBbvXDBndL2FARNeaB54PY50ixUdU69xi9iOiPowXpEZX~1rrxZCHWzlFmM7FOc8qhzciWcZyhYYkYooM7opY8y5CM8_&Key-Pair-Id=APKAJLTNE6QMUY6HBC5A) to create database is being cleaned and modified to correct date format, remove duplicates, dela with noisy data and missing values. 

### Tables

1. **customer_details:**
   - `cust_id` (Primary Key)
   - `name`

2. **items:**
   - `item_num` (Primary Key)
   - `description`
   - `vendor`
   - `item_type`
   - `unit`
   - `location`

3. **purchase:**
   - `purchase_id` (Primary Key)
   - `item_num` (Foreign Key referencing `items`)
   - `purchase_date`
   - `cost`

4. **orders:**
   - `order_id` (Primary Key)
   - `cust_id` (Foreign Key referencing `customers`)
   - `date_sold` 

5. **order_items**
   - `order_item`
   - `order_id` (Foreign Key referencing `orders`)
   - `item_num` (Foreign Key referencing `items`)
   - `price`
   - `quantity`

6. **stock**
   - `stock_id`
   - `item_num` (Foreign Key referencing `items`)
   - `in_stock`
   - `date`
     
### Database Testing Queries
    - Who are our top customers based on the cost of purchases?
    - What is the total cost of purchases made by a specific customer?
    - What items are currently in stock?
    - What is the total cost of all purchases?
    - Which item had the highest purchase cost?
    - How many orders were placed by a specific customer?
    - What is the total revenue generated from orders?
    - How many units of a particular item were sold in total?
    - What is the current stock level of a specific item?

## Insights and Conclusions

  - Maintaining all data in a single table disregards the principles of ACID properties and normalization, resulting in complexity when understanding and retrieving information. Introduced additional fields as needed to separate distinct entities within the database, to address issues stated.

- Maintaining seperate entities reduces redundancy and deals with storage problems when scaling.

- Databse modeling through EER diagram offers flexibility of adding tables and modifying fields whenever necessary with the business requirements.

