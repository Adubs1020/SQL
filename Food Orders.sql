#List the top 5 restaurants with the most 5 star ratings
SELECT restaurant_name, COUNT(rating) as num_of_ratings
FROM food_order
WHERE rating = 5
GROUP BY restaurant_name
ORDER BY COUNT(rating) DESC
LIMIT 5;

#result: The top restaurants with the most  5 star ratings are Shake Shack, The Meatball Shop, Blue Ribbon Sushi, Blue Ribbon Fried Chicken, RedFarm Broadway.   

# Do most customers order Shake Shack on the weekends or the weekdays
SELECT restaurant_name, day_of_the_week,  COUNT(day_of_the_week)
FROM food_order
WHERE restaurant_name = 'Shake Shack'
GROUP BY restaurant_name, day_of_the_week
ORDER BY COUNT(day_of_the_week) DESC;

#result: Most people order Shake Shack on the weekend. 


#List the top 5 restaurants with the lowest average delivery time. 
SELECT restaurant_name, ROUND(AVG(delivery_time)) as avg_delivery_time
FROM food_order
GROUP BY restaurant_name
ORDER BY avg_delivery_time
LIMIT 5;

#result:  The top 5 restaurants with the lowest average delivery time are Gaia Italian Cafe, Paul & Jimmy's, Hibino, The MasalaWala, Wo Hop Restaurant.


#List the top 3 cuisines ordered by customers
SELECT cuisine_type, COUNT(cuisine_type)
FROM food_order
GROUP BY cuisine_type
ORDER BY COUNT(cuisine_type) DESC
LIMIT 3;

 #result: The top 3 cuisines ordered by customers are American, Japanese, and Italian.

#List the top 3 American restaurants that customers order from
SELECT restaurant_name, COUNT(cuisine_type)
FROM food_order
WHERE cuisine_type = 'American'
GROUP BY restaurant_name
ORDER BY COUNT(cuisine_type) DESC
LIMIT 3;

#result:  Shake Shack, Blue Ribbon Fried Chicken, Five Guys Burgers and Fries are the top 3 American restaurants that customers order from

#List the top 10 customers who order the most
SELECT customer_id, COUNT(order_id) as num_of_orders
FROM food_order
GROUP BY customer_id
ORDER BY num_of_orders DESC
LIMIT 10;

 #result: These are top ten customer_ids that had the most orders: 52832, 47440, 83287, 250494, 65009, 82041, 259341, 276192, 60052, 275689. 

# List the top 10 restaurants where customers order from
SELECT restaurant_name, COUNT(order_id) as num_of_orders
FROM food_order
GROUP BY restaurant_name
ORDER BY num_of_orders DESC
LIMIT 10;

 #result: The top ten restaurants that customers ordered from are Shake Shack, The Meatball Shop, Blue Ribbon Sushi, Blue Ribbon Fried Chicken, Parm, RedFarm Broadway, RedFarm Hudson, TAO, Han Dynasty,  Blue Ribbon Sushi Bar & Grill


#Which Japanese restaurants have 10 or more 5 star ratings
SELECT restaurant_name, COUNT(rating) as ratings
FROM food_order
WHERE cuisine_type = 'Japanese'
AND rating = 5
GROUP BY restaurant_name
HAVING COUNT(rating) >= 10
ORDER BY COUNT(rating) DESC;

 #result:  The Japanese restaurants that have 10 or more 5 stars are Blue Ribbon Sushi, Blue Ribbon Sushi Bar & Grill, TAO,  Nobu Next Door, Blue Ribbon Sushi Izakaya.

#List the top 3 restaurants with lowest average food preparation time
SELECT restaurant_name, AVG(food_preparation_time) as average_food_preparation_time
FROM food_order
GROUP BY restaurant_name
ORDER BY average_food_preparation_time
LIMIT 3;

 #result: These are the top 3 restaurants that have the lowest average preparation time: Frank Restaurant, 67 Burger, Haru Gramercy Park.

#List the 5 Itlian restaurants with the most 5 star ratings and the average cost of these restaurants
SELECT restaurant_name, COUNT(rating) as num_of_ratings, ROUND(AVG(cost_of_the_order), 2) as average_cost
FROM food_order
WHERE rating = 5
AND cuisine_type = 'Italian'
GROUP BY restaurant_name
ORDER BY num_of_ratings DESC, average_cost
LIMIT 10;

#result: These are the top 5 Italian restaurants with the most 5 star ratings and the average cost of these restaurants:  The Meatball Shop  $18.05 , Parm  $19.45, Rubirosa  $21.52, Otto Enoteca Pizzeria $16.4, Tony's Di Napoli $10.82   

 
 













