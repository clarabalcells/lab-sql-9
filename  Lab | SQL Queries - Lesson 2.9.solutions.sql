#How many distinct (different) actors' last names are there?

SELECT 
count(distinct last_name) AS "UNIQUE LAST NAMES"
FROM ACTOR;

#Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

SELECT *,
           CASE
             WHEN weekday(rental_date) < 6 then 'workday'
             ELSE 'weekend'
           END AS 'day_type'
           FROM rental;
           
           
#Get all films with ARMAGEDDON in the title.

SELECT title FROM film WHERE title like "ARMAGEDDON";


#Get 10 the longest films.

SELECT * FROM film ORDER BY length DESC LIMIT 10;

#How many films include Behind the Scenes content?

SELECT count(*) FROM film WHERE special_features LIKE "Behind the Scenes";

#Which kind of movies (rating) have a mean duration of more than two hours?

SELECT rating, round(AVG(length),2) as "Mean_length" 
FROM film 
GROUP BY rating 
HAVING Mean_length >120;

#Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.

SELECT title, length, RANK() 
OVER (ORDER BY length) AS ranking FROM film
WHERE length > 0 AND NOT ISNULL(length);
