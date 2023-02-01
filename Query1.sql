select  
	sales.customers.customer_id,sales.customers.first_name,sales.customers.last_name,sales.customers.street,
    sales.customers.city,sales.customers.state,sales.customers.zip_code,
    sales.orders.order_id,sales.orders.order_date,sales.orders.order_status,sales.orders.required_date,sales.orders.shipped_date,sales.orders.staff_id,
    sales.order_items.item_id,sales.order_items.list_price,sales.order_items.quantity,sales.order_items.discount,
    production.products.product_id,production.products.product_name,
	sales.order_items.list_price*sales.order_items.quantity as total_before_disc,
    (sales.order_items.list_price*sales.order_items.quantity)-(sales.order_items.list_price*sales.order_items.quantity*sales.order_items.discount) as total_after_disc
from sales.customers
right join sales.orders on sales.customers.customer_id=sales.orders.customer_id
right join sales.order_items on sales.orders.order_id=sales.order_items.order_id
right join production.products on sales.order_items.product_id=production.products.product_id;
