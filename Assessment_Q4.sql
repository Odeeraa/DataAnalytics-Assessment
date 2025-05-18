with cte as (
SELECT a.owner_id as customer_id ,concat(b.first_name," ",b.last_name)name,TIMESTAMPDIFF(MONTH, date_joined, curdate())tenure_months
, count(1)total_transactions, a.confirmed_amount*0.1  as profit_per_transaction 
FROM adashi_staging.savings_savingsaccount a
JOIN adashi_staging.users_customuser b on a.owner_id = b.id
group by 1,2,3,5
)
SELECT customer_id ,name,tenure_months,total_transactions
,((total_transactions / tenure_months) * 12 * avg(profit_per_transaction)) as estimated_clv
from cte
group by 1,2,3,4
order by 5 desc;