#List the highest number of previous purchases
SELECT MAX(`Previous Purchases`) as highest_previous_purchases
FROM shopping_behavior_updated;

#result: The highest number of previous purchases was 50

#How many customers purchased 50 items.
SELECT  COUNT(`Customer ID`)
FROM shopping_behavior_updated
WHERE `Previous Purchases` = 50;

#result: 77 customers previously purchased 50 items

# Out of the customers who purchased 50 items, what is their preferred method of payment
SELECT COUNT(sb.`Customer ID`) as num_of_customers, st.`Preferred Payment Method`
FROM shopping_behavior_updated sb
INNER JOIN shopping_trends st 
ON sb.`Customer ID` = st.`Customer ID`
WHERE sb.`Previous Purchases` = 50
GROUP BY st.`Preferred Payment Method`
ORDER BY num_of_customers DESC;

#result: Most of these customers prefer to pay with venmo

#List the customers whose preferred payment method is Venmo, who frequently purchased items weekly and have 50 prior transactions. 
SELECT *
FROM shopping_behavior_updated
WHERE `Customer ID` in 
       (SELECT `Customer ID`
        FROM shopping_trends
        WHERE `Preferred Payment Method` = 'Venmo'
        AND `Frequency of Purchases` = 'Weekly'
        AND `Previous Purchases` = 50);

#result: Customer ID 890  and Customer ID 3620
        
        
# In which season did most of the customers purchase their items. 
SELECT `Season`, COUNT(`Item Purchased`) as num_of_items
FROM shopping_behavior_updated
GROUP BY `Season`
ORDER BY num_of_items DESC
LIMIT 1;

#result: Most of the customers purchased their items in the Spring. 


# Which category is the most popular in the spring
SELECT `Category`, COUNT(`Item Purchased`) as num_of_items_purchased_in_spring
FROM shopping_behavior_updated
WHERE `Season` = 'Spring'
GROUP BY `Category`
ORDER BY num_of_items_purchased_in_spring  DESC
LIMIT 1;

#result: Clothing is the most popular category in the Spring

#Which item has the most ratings between 4 and 5
SELECT `Item Purchased`, COUNT(`Review Rating`) as num_of_ratings_between_4_and_5
FROM shopping_behavior_updated
WHERE `Review Rating` BETWEEN 4 AND 5
GROUP BY `Item Purchased`
ORDER BY  num_of_ratings_between_4_and_5  DESC
LIMIT 1;

#result: Sandals

#Which season do most customers order sandals
SELECT `Season`, COUNT(`Item Purchased`) as num_of_sandals
FROM shopping_behavior_updated
WHERE `Item Purchased` = 'Sandals'
GROUP BY `Season`
ORDER BY num_of_sandals DESC;

#result: Most customers purchase sandals in the Spring and Fall. 

# Which location were most of the purchases made from
SELECT `Location`, COUNT(`Item Purchased`) as num_of_items_purchased
FROM shopping_behavior_updated
GROUP BY `Location`
ORDER BY num_of_items_purchased DESC
LIMIT 1;

#result: Most of the purchases were made from Montana. 


#Out of the customers who purchased items in Montana, what is their preferred payment method
SELECT COUNT(sb.`Customer ID`) as num_of_customers, st.`Preferred Payment Method`
FROM shopping_behavior_updated sb
INNER JOIN shopping_trends st 
ON sb.`Customer ID` = st.`Customer ID`
WHERE sb.`Location` =  'Montana'
GROUP BY st.`Preferred Payment Method`
ORDER BY num_of_customers DESC;

#result: Cash and Bank Transfer







