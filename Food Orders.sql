#List the top 5 restaurants with the most 5 star ratings
SELECT restaurant_name, COUNT(rating) as num_of_ratings
FROM food_order
WHERE rating = 5
GROUP BY restaurant_name
ORDER BY COUNT(rating) DESC
LIMIT 5;

# Do most customers order Shake Shack on the weekends or the weekdays
SELECT restaurant_name, day_of_the_week,  COUNT(day_of_the_week)
FROM food_order
WHERE restaurant_name = 'Shake Shack'
GROUP BY restaurant_name, day_of_the_week
ORDER BY COUNT(day_of_the_week) DESC;

#List the top 5 restaurants with the lowest average delivery time. 
SELECT restaurant_name, ROUND(AVG(delivery_time)) as avg_delivery_time
FROM food_order
GROUP BY restaurant_name
ORDER BY avg_delivery_time
LIMIT 5;

#List the top 3 cuisines ordered by customers
SELECT cuisine_type, COUNT(cuisine_type)
FROM food_order
GROUP BY cuisine_type
ORDER BY COUNT(cuisine_type) DESC
LIMIT 3;

#List the top 3 American restaurants that customers order from
SELECT restaurant_name, COUNT(cuisine_type)
FROM food_order
WHERE cuisine_type = 'American'
GROUP BY restaurant_name
ORDER BY COUNT(cuisine_type) DESC
LIMIT 3;

#List the top 10 customers who order the most
SELECT customer_id, COUNT(order_id) as num_of_orders
FROM food_order
GROUP BY customer_id
ORDER BY num_of_orders DESC
LIMIT 10;

# List the top 10 restaurants where customers order from
SELECT restaurant_name, COUNT(order_id) as num_of_orders
FROM food_order
GROUP BY restaurant_name
ORDER BY num_of_orders DESC
LIMIT 10;


#Which Japanese restaurants have 10 or more 5 star ratings
SELECT restaurant_name, COUNT(rating) as ratings
FROM food_order
WHERE cuisine_type = 'Japanese'
AND rating = 5
GROUP BY restaurant_name
HAVING COUNT(rating) >= 10
ORDER BY COUNT(rating) DESC;

#List the 10 restaurants with lowest average food preparation time
SELECT restaurant_name, AVG(food_preparation_time) as average_food_preparation_time
FROM food_order
GROUP BY restaurant_name
ORDER BY average_food_preparation_time
LIMIT 10;

#List the 10 Itlian restaurants with the most 5 star ratings and the average cost of these restaurants
SELECT restaurant_name, COUNT(rating) as num_of_ratings, ROUND(AVG(cost_of_the_order), 2) as average_cost
FROM food_order
WHERE rating = 5
AND cuisine_type = 'Italian'
GROUP BY restaurant_name
ORDER BY num_of_ratings DESC, average_cost
LIMIT 10;
 













