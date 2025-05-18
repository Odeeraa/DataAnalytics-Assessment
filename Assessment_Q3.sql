
with cte as(
SELECT plan_id,a.owner_id,case when is_regular_savings=1 then "savings" 
                               when is_a_fund=1 then "investment" end type
		, max(transaction_date)last_transaction_date
FROM adashi_staging.savings_savingsaccount a
JOIN adashi_staging.plans_plan c ON a.plan_id = c.id
where is_regular_savings=1
or is_a_fund = 1
group by 1,2,3
)
,cte2 AS(
select plan_id,owner_id,type,last_transaction_date,
datediff(CURDATE(),last_transaction_date )as inactivity_days
from cte
)
select plan_id,owner_id,type,last_transaction_date, inactivity_days
from cte2
where inactivity_days <=365
;