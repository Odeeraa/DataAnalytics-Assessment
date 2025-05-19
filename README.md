# DataAnalytics-Assessment
1. High-Value Customers with Multiple Products
Task: Write a query to find customers with at least one funded savings plan AND one funded investment plan, sorted by total deposits.
Approach: First select the customers under savings or investment plan. Next select only the customers who are under both savings and fund plan, ensuring they're ordered.

 2. Transaction Frequency Analysis
Task: Calculate the average number of transactions per customer per month and categorize them:
"High Frequency" (≥10 transactions/month)
"Medium Frequency" (3-9 transactions/month)
"Low Frequency" (≤2 transactions/month)
Approach: First find the number of transaction per customer for each day they transacted, calculate the average with the avearge transaction go further to classify the average using the case statement.

3. Account Inactivity Alert
Task: Find all active accounts (savings or investments) with no transactions in the last 1 year (365 days) .
Approach: first find all the accounts under the savings or investments plan, find their last transaction date. calculate the difference between today and last tran date. WIth the difference in days find accounts with last tran date of 365 days and less

4. Customer Lifetime Value (CLV) Estimation
Task: For each customer, assuming the profit_per_transaction is 0.1% of the transaction value, calculate
Approach: Calculate profit_per_transaction, tenure_months and total transaction. Using the value calculated, calculate the estimated_clv

