select * from df_orders;

-- 10 produtos que mais vendem para cada região

with cte as (
select region , product_id,sum(sale_prices) as sales
from df_orders	
group by region, product_id)
select * from (
select *, ROW_NUMBER() over(partition by region order by sales desc) as rn from cte) A
where rn <= 5;

-- Calculando quantidade de vendas e lucro de cada estado


select 
	state,
	sum(sale_prices * quantity) AS total_sales, 
	sum(profit * quantity) AS total_profit
from
	df_orders
group by 
	state
order by
	total_sales DESC;


-- Calculando quantidade de vendas e lucro de cada segmento

SELECT 
  segment,
  SUM(sale_prices * quantity) AS total_sales,
  SUM(profit * quantity) AS total_profit
FROM 
  df_orders
GROUP BY 
  segment
ORDER BY 
  total_sales DESC;

-- Identificando as cidades com mais lucro para cada região

WITH region_city_profit AS (
  SELECT 
    region,
    city,
    SUM(profit * quantity) AS total_profit,
    RANK() OVER (PARTITION BY region ORDER BY SUM(profit * quantity) DESC) AS rank
  FROM 
    df_orders
  GROUP BY 
    region, city
)
SELECT 
  region,
  city,
  total_profit
FROM 
  region_city_profit
WHERE 
  rank = 1
ORDER BY 
  region, total_profit DESC;