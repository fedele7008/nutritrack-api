-- Most popular foods
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
WITH foods_in_date AS
(
	SELECT  fitem.id
	       ,name
	FROM food_log AS flog
	JOIN food_item AS fitem
	ON flog.food_item_id = fitem.id
	WHERE DATE(flog.created_at) BETWEEN <start_date> AND <end_date>
)
SELECT  id
       ,name
       ,COUNT(*) AS purchase_count
FROM foods_in_date
GROUP BY  id
HAVING purchase_count > <min_count>
ORDER BY purchase_count <choice>;

-- Most popular restaurants
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
WITH foods_and_restaurants_in_date AS
(
	SELECT  restaurant.id
	       ,restaurant.name
	FROM food_log AS flog
	JOIN food_item AS fitem
	ON flog.food_item_id = fitem.id
	JOIN restaurant
	ON fitem.restaurant_id = restaurant.id
	WHERE DATE(flog.created_at) BETWEEN <start_date> AND <end_date>
)
SELECT  id
       ,name
       ,COUNT(*) AS purchase_count
FROM foods_and_restaurants_in_date
GROUP BY  id;
HAVING purchase_count > <min_count>
ORDER BY purchase_count <choice>;

-- Most popular foods at a restaurant
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
WITH foods_at_restaurant_in_date AS
(
	SELECT  fitem.id
	       ,fitem.name
	FROM food_log AS flog
	JOIN food_item AS fitem
	ON flog.food_item_id = fitem.id
	JOIN restaurant
	ON fitem.restaurant_id = restaurant.id
	WHERE DATE(flog.created_at) BETWEEN <start_date> AND <end_date>
	AND restaurant.id = <id> 
)
SELECT  id
       ,name
       ,COUNT(*) AS purchase_count
FROM foods_in_date
GROUP BY  id;
HAVING purchase_count > <min_count>
ORDER BY purchase_count <choice>;
