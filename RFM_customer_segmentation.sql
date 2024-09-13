with RFM
 as (SELECT distinct (customer_id),
           NTILE (5) over (order by  recency desc) as r_score,
          ((NTILE (5) over (order by frequency asc)+(NTILE (5) over (order by(monetary) asc)))/2) AS fm_score,
          recency,frequency,monetary
FROM (select ta.customer_id, (select max(to_date(invoicedate, 'mm/dd/yyyy hh24:mi')) from tableRetail) - (max(to_date(invoicedate, 'mm/dd/yyyy hh24:mi'))) as recency,
           count(distinct (ta.invoice)) as frequency,
           sum(ta.price*ta.quantity) as monetary
    FROM tableretail ta
    group by ta.CUSTOMER_ID))
select c.*, (case when  r_score in(4,5) and  fm_score in (4,5) then 'Champions'
                         when (r_score = 5 and fm_score = 3) or (r_score = 4 and fm_score = 4) 
                or (r_score = 3 and fm_score = 5) or (r_score = 3 and fm_score = 4) then 'Loyal Customers'
                         when (r_score = 5 and fm_score = 2) or (r_score = 4 and fm_score = 2) 
                or (r_score = 3 and fm_score = 3) or (r_score = 4 and fm_score = 3) then 'Potential Loyalists'
                         when r_score = 5 and fm_score = 1 then 'Recent Customers'
                         when r_score in(3,4) and fm_score = 1 then 'Promising'
                         when (r_score = 3 and fm_score = 2) or (r_score = 2 and fm_score = 3) 
                or (r_score = 2 and fm_score = 2) then 'Customers Needing Attention'
                         when (r_score = 2 and fm_score = 5) or (r_score = 2 and fm_score = 4) 
                or (r_score = 1 and fm_score = 3) then 'At Risk'
                         when r_score = 1 and fm_score in (4,5) then 'Cant Lose Them'
                         when r_score = 1 and fm_score = 2 then 'Hibernating'
                         when r_score = 1 and fm_score = 1 then 'Lost'
         else 'others'
         end) 
         as cust_segment 
         


from RFM c join tableretail ta on c.customer_id=ta.customer_id;
