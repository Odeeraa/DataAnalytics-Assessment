/*Task: Calculate the average number of transactions per customer per month and categorize them:
"High Frequency" (≥10 transactions/month)
"Medium Frequency" (3-9 transactions/month)
"Low Frequency" (≤2 transactions/month)
*/

with cte as(
SELECT COUNT(1)tran_cnt, a.owner_id, DATE_FORMAT(transaction_date, '%Y-%m')trandate 
FROM adashi_staging.savings_savingsaccount a
group by 2,3
)
,cte2 as(
select avg(tran_cnt)avg_cnt,owner_id
from cte
group by 2
)
select case when round(avg_cnt)>= 10 then 'High Frequency'
            when round(avg_cnt) <= 9 and avg_cnt >2 then 'Medium Frequency'
            when round(avg_cnt)<= 2 then 'Low Frequency' end frequency_category
,count(owner_id)customer_cnt, avg_cnt as avg_transactions_per_month
from cte2
group by case when round(avg_cnt)>= 10 then 'High Frequency'
            when  round(avg_cnt) <= 9 and avg_cnt > 2  then 'Medium Frequency'
            when round(avg_cnt)<= 2 then 'Low Frequency' end,avg_cnt

