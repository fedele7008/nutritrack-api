-- Prod template
SELECT food_item.name, calories, fat, carb, fiber, protein
FROM food_item 
WHERE EXISTS (
    SELECT 1 
    FROM restaurant 
    WHERE food_item.restaurant_id = restaurant.id 
    AND restaurant.name = <Restaurant Name>
); 

SELECT name, calories, fat, carb, fiber, protein
FROM food_item 
WHERE name = <foodName>;

-- Prod query example
SELECT food_item.name, calories, fat, carb, fiber, protein
FROM food_item 
WHERE EXISTS (
    SELECT 1 
    FROM restaurant 
    WHERE food_item.restaurant_id = restaurant.id 
    AND restaurant.name = 'McDonalds'
); 