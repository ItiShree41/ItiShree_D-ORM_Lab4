select p.pro_name,o.*
from orders as o,
supplier_pricing as s,
product as p
where o.cus_id=2 and o.pricing_id=s.pricing_id and s.pro_id=p.pro_id;

/*or*/

select pro_id,pro_name
from product
where pro_id = any(
	select pro_id
	from supplier_pricing
	where pricing_id = any(
		select pricing_id
		from orders
		where cus_id=2
	)
);
