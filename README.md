# Customer Segmentation Analysis

## Project Overview
This project performs **Customer Segmentation** based on the **RFM (Recency, Frequency, Monetary)** model using SQL queries. The goal is to classify customers into different segments, such as 'Champions', 'Loyal Customers', and 'At Risk', which can help businesses understand customer behavior and tailor marketing strategies accordingly.

## Objective
The project aims to:
- Analyze customer transactions.
- Calculate **Recency**, **Frequency**, and **Monetary** (RFM) scores for each customer.
- Categorize customers into segments based on their RFM scores.

## SQL Queries
The project consists of the following SQL files:

### 1. `OnlineRetaill_data.sql`
- The retail transaction dataset used for analysis.

### 2. `invoice_analysis.sql`
- Analyzes the total invoices and sales for each customer and provides insights into customer transaction behavior.

### 3. `RFM_customer_segmentation.sql`
- This script calculates **RFM scores** and segments customers into different groups based on their behavior:
  - Champions
  - Loyal Customers
  - Potential Loyalists
  - Recent Customers
  - At Risk
  - Promising Customers
  - Needing Attention
  - Can't Lose Them
  - Hibernating
  - Lost
