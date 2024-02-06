
select customer_name as Customer, PRINTF("$%.2f",sum(price_per_month * subscription_length)) as "Amount Due"
from customers
join orders, subscriptions
on customers.customer_id = orders.customer_id
and orders.subscription_id =  subscriptions.subscription_id 
and subscriptions.description = 'Fashion Magazine'
where orders.order_status='unpaid'
Group by customers.customer_name
having
((select count(orders.order_status='unpaid') as unpaid_count
from orders)
> 1)

