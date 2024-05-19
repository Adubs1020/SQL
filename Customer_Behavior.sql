#Downloaded dataset from Kaggle
#This is a dataset on consumer behavior and shopping habbits.
#Performed exploratory data analysis in MYSQL to develop a greater understanding of the data.

#List the highest number of previous purchases
SELECT MAX(`Previous Purchases`) as highest_previous_purchases
FROM shopping_behavior_updated;


#How many customers purchased 50 items.
SELECT  COUNT(`Customer ID`)
FROM shopping_behavior_updated
WHERE `Previous Purchases` = 50;


# Out of the customers who purchased 50 items, what is their preferred method of payment
SELECT COUNT(sb.`Customer ID`) as num_of_customers, st.`Preferred Payment Method`
FROM shopping_behavior_updated sb
INNER JOIN shopping_trends st 
ON sb.`Customer ID` = st.`Customer ID`
WHERE sb.`Previous Purchases` = 50
GROUP BY st.`Preferred Payment Method`
ORDER BY num_of_customers DESC;


#List the customers whose preferred payment method is Venmo, who frequently purchased items weekly, and who have previously purchased 50 items. 
SELECT *
FROM shopping_behavior_updated
WHERE `Customer ID` in 
       (SELECT `Customer ID`
        FROM shopping_trends
        WHERE `Preferred Payment Method` = 'Venmo'
        AND `Frequency of Purchases` = 'Weekly'
        AND `Previous Purchases` = 50);

        
        
# In which season did most of the customers purchase their items. 
SELECT `Season`, COUNT(`Item Purchased`) as num_of_items
FROM shopping_behavior_updated
GROUP BY `Season`
ORDER BY num_of_items DESC
LIMIT 1;



# Which category is the most popular in the spring
SELECT `Category`, COUNT(`Item Purchased`) as num_of_items_purchased_in_spring
FROM shopping_behavior_updated
WHERE `Season` = 'Spring'
GROUP BY `Category`
ORDER BY num_of_items_purchased_in_spring  DESC
LIMIT 1;


#Which item has the most ratings between 4 and 5
SELECT `Item Purchased`, COUNT(`Review Rating`) as num_of_ratings_between_4_and_5
FROM shopping_behavior_updated
WHERE `Review Rating` BETWEEN 4 AND 5
GROUP BY `Item Purchased`
ORDER BY  num_of_ratings_between_4_and_5  DESC
LIMIT 1;


#Which season do most customers order sandals
SELECT `Season`, COUNT(`Item Purchased`) as num_of_sandals
FROM shopping_behavior_updated
WHERE `Item Purchased` = 'Sandals'
GROUP BY `Season`
ORDER BY num_of_sandals DESC;
 

# Which location were most of the purchases made from
SELECT `Location`, COUNT(`Item Purchased`) as num_of_items_purchased
FROM shopping_behavior_updated
GROUP BY `Location`
ORDER BY num_of_items_purchased DESC
LIMIT 1;



#Out of the customers who purchased items in Montana, what is their preferred payment method
SELECT COUNT(sb.`Customer ID`) as num_of_customers, st.`Preferred Payment Method`
FROM shopping_behavior_updated sb
INNER JOIN shopping_trends st 
ON sb.`Customer ID` = st.`Customer ID`
WHERE sb.`Location` =  'Montana'
GROUP BY st.`Preferred Payment Method`
ORDER BY num_of_customers DESC;








