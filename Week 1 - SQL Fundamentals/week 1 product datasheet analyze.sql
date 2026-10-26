select
  COUNT(*) as product_count
from
  products;

select
  *
from
  products
limit
  10;

select distinct
  category
from
  products;

select
  product_name,
  category,
  retail_price
from
  products
order by
  retail_price desc
limit
  10;

select
  product_name,
  category,
  retail_price
from
  products
order by
  retail_price asc
limit
  10;

select
  *
from
  products
where
  category = 'jalanõusid'
order by
  retail_price desc;

select
  COUNT(*) - COUNT(retail_price) as missing_prices
from
  products;

select
  COUNT(*) - COUNT(category) as missing_categories
from
  products;

(
  select
    product_name,
    category,
    retail_price
  from
    products
  order by
    retail_price asc
  limit
    1
)
union all
(
  select
    product_name,
    category,
    retail_price
  from
    products
  order by
    retail_price desc
  limit
    1
);

select
  category,
  COUNT(*) as product_count
from
  products
group by
  category
order by
  product_count desc;

select
  category,
  COUNT(*) as product_count,
  MIN(retail_price) as min_price,
  MAX(retail_price) as max_price
from
  products
group by
  category
order by
  max_price desc;