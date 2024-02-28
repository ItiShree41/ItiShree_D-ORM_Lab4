select cus_gender,count(cus_gender) as count
from customer
where cus_id = any (
	select cus_id
	from orders
	where ord_amount>=3000
	group by cus_id
)
group by cus_gender;
