with cte as(
SELECT a.owner_id, concat(b.first_name," ",b.last_name)name,
 count(case when c.is_regular_savings=1 then 1 end) as savings_count,
count(case when c.is_a_fund = 1 then 1 end) as investment_count,sum(a.confirmed_amount)total_deposits
FROM adashi_staging.savings_savingsaccount a
JOIN adashi_staging.users_customuser b ON a.owner_id = b.id
JOIN adashi_staging.plans_plan c ON a.plan_id = c.id
group by a.owner_id,concat(b.first_name," ",b.last_name)
)
SELECT owner_id, name, savings_count, investment_count,total_deposits
FROM cte
where savings_count >0 and investment_count>0