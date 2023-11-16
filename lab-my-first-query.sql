USE lab1;
SELECT *  
FROM applestore2;

#1. Which are the different genres?
SELECT DISTINCT prime_genre
FROM applestore2;

#2. Which is the genre with more apps rated?
SELECT prime_genre
FROM applestore2
GROUP BY prime_genre
ORDER BY COUNT(*) DESC
LIMIT 1;

#3. Which is the genre with more apps?
SELECT prime_genre, COUNT(*) AS app_count
FROM applestore2
GROUP BY prime_genre
ORDER BY app_count DESC;

#4. Which is the one with less?
SELECT prime_genre, COUNT(*) AS app_count
FROM applestore2
GROUP BY prime_genre
ORDER BY app_count;

#5. Take the 10 apps most rated.
SELECT track_name, rating_count_tot
FROM applestore2
ORDER BY rating_count_tot DESC
LIMIT 10;

#6. Take the 10 apps best rated by users.
SELECT track_name, user_rating
FROM applestore2
ORDER BY user_rating DESC
LIMIT 10;

#7. Take a look on the data you retrieved in the question 5. Give some insights.
#Facebook and instagram are the most rated apps, what makes sense because a lot of people use them,
#followed by other apps that also have a lot of users

#8. Take a look on the data you retrieved in the question 6. Give some insights.
#The best rated apps are all with 5 stars, and they are not very famous. I suppose they are apps
#with less amount of ratings, since it's difficult to have rating 5 if a lot of people are rating them

#9. Now compare the data from questions 5 and 6. What do you see?
#The most rated apps are different from the best rated apps, I think it's because if you have a lot of
#ratings it's almost impossible to ger a rating 5 in your app, because everybody would need to give a rate 5

#10. How could you take the top 3 regarding the user ratings but also the number of votes?
SELECT track_name, user_rating, rating_count_tot
FROM applestore2
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 3;

#11. Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?
-- Average rating for free apps
SELECT AVG(user_rating) AS avg_rating_free
FROM applestore2
WHERE price = 0;

-- Average rating for paid apps
SELECT AVG(user_rating) AS avg_rating_paid
FROM applestore2
WHERE price > 0;

#There is not a big difference between the averege of free and paid apps, so we can conclude that people
-- don't really care about price
