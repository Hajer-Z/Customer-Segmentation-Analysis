--take a look on our customers total invoices 
select  DISTINCT INVOICE, customer_id, Sum(QUANTITY*PRICE) over(partition by INVOICE ) as total_invoice from tableretail;

--apply agg. Functions

select avg(total_invoice) from (select DISTINCT INVOICE, Sum(QUANTITY*PRICE) over(partition by INVOICE ) as total_invoice from tableretail);
select max(total_invoice) from (select DISTINCT INVOICE, Sum(QUANTITY*PRICE) over(partition by INVOICE ) as total_invoice from tableretail);
select min(total_invoice) from (select DISTINCT INVOICE, Sum(QUANTITY*PRICE) over(partition by INVOICE ) as total_invoice from tableretail);

--take a look on the number of transactions of each customer
select distinct customer_id, count(invoice) over(partition by customer_id) as customer_transaction_count from tableretail;

--apply agg. functions

select avg(customer_transaction_count) from (select distinct customer_id, count(invoice) over(partition by customer_id) as customer_transaction_count from tableretail);
select max(customer_transaction_count) from (select distinct customer_id, count(invoice) over(partition by customer_id) as customer_transaction_count from tableretail);
select min(customer_transaction_count) from (select distinct customer_id, count(invoice) over(partition by customer_id) as customer_transaction_count from tableretail);


--we can look for customers with a certain range of transactions
select count(customer_transaction_count) from (select distinct customer_id, count(invoice) over(partition by customer_id) as customer_transaction_count from tableretail)
where customer_transaction_count between 0 and 50;

--now we want to find total sales of each customer:
select distinct customer_id,sum(total_invoice) over(partition by customer_id) as customer_total_sales
from(select DISTINCT INVOICE, customer_id, Sum(QUANTITY*PRICE) over(partition by INVOICE ) as total_invoice from tableretail);

--apply agg. functions

select avg(customer_total_sales) from (select distinct customer_id, sum(total_invoice) over(partition by customer_id) as customer_total_sales
from(select DISTINCT INVOICE, customer_id, Sum(QUANTITY*PRICE) over(partition by INVOICE ) as total_invoice from tableretail));

select max(customer_total_sales) from (select distinct customer_id, sum(total_invoice) over(partition by customer_id) as customer_total_sales
from(select DISTINCT INVOICE, customer_id, Sum(QUANTITY*PRICE) over(partition by INVOICE ) as total_invoice from tableretail));

select min(customer_total_sales) from (select distinct customer_id, sum(total_invoice) over(partition by customer_id) as customer_total_sales
from(select DISTINCT INVOICE, customer_id, Sum(QUANTITY*PRICE) over(partition by INVOICE ) as total_invoice from tableretail));
