-- show databases
-- use homework




-- LOAD DATA INFILE "/Users/⁨yuyizhang/⁨FCR⁩/⁨NEU/CPS/Analytics_2018/ALY 6030_Data Warehousing and SQL⁩/Week 56⁩/Yelp_reviews.csv"
-- INTO TABLE YelpReviews
-- FIELDS TERMINATED BY ',' 
-- -- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS;



-- 1
-- SELECT COUNT(DISTINCT name)
-- FROM YelpReviews
-- WHERE is_open = 1;



-- 2
-- SELECT COUNT(DISTINCT id_2)
-- FROM YelpReviews;


-- 3
-- SELECT name_1, average_stars
-- FROM YelpReviews
-- ORDER BY average_stars DESC;



-- 4,5
-- describe YelpReviews



-- 6
-- SELECT name_1, average_stars, useful_1, cool_1
-- FROM YelpReviews
-- ORDER BY average_stars DESC, useful_1 DESC, cool_1 DESC;



-- 7
-- SELECT name_1, yelping_since
-- FROM YelpReviews
-- ORDER BY yelping_since;



-- 8
-- SELECT name, stars, review_count
-- FROM YelpReviews
-- WHERE is_open = 1
-- ORDER BY stars DESC, review_count DESC;	



-- 9
-- SELECT name_1
-- FROM YelpReviews
-- ORDER BY review_count_1 DESC
-- LIMIT 1;



-- 10
-- SELECT (neighborhood), COUNT(name)
-- FROM YelpReviews
-- WHERE is_open = 1
-- GROUP BY neighborhood
-- ORDER BY COUNT(name);



-- 11
-- with c as
-- (SELECT neighborhood, COUNT(name) as cn
-- FROM YelpReviews
-- WHERE is_open = 1
-- GROUP BY neighborhood)

-- SELECT *
-- FROM C
-- WHERE cn > 100
-- ORDER BY cn DESC;



-- 12
-- SELECT neighborhood, SUM(review_count)
-- FROM YelpAttributes
-- GROUP BY neighborhood
-- ORDER BY SUM(review_count) DESC;



-- 13
-- SELECT neighborhood, SUM(stars * review_count) / SUM(review_count) as s
-- FROM YelpAttributes
-- GROUP BY neighborhood;



-- 14
-- SELECT name_1, average_stars, review_count_1
-- FROM YelpReviews
-- ORDER BY review_count_1 DESC
-- LIMIT 1;



-- 15
-- SELECT name_1, count(name_1) AS feasures
-- FROM YelpAttributes
-- GROUP BY name_1
-- ORDER BY feasures DESC
-- LIMIT 10;



-- 16
-- WITH cd AS(
-- SELECT DISTINCT(name), review_count
-- FROM YelpCategories 
-- ORDER BY review_count DESC
-- LIMIT 1),

-- y AS (select * from YelpCategories) 

-- SELECT cd.name, y.category, y.stars, y.review_count
-- FROM cd LEFT JOIN y ON cd.name = y.name;




-- 17
-- SELECT name, review_count, stars
-- FROM YelpCategories
-- WHERE category = 'Sushi Bars'
-- ORDER BY review_count DESC, stars DESC;




-- 18
-- WITH b AS 
-- (SELECT name, review_count
-- FROM YelpCategories
-- WHERE category = 'Bars'),

-- r AS
-- (SELECT name, review_count
-- FROM YelpCategories
-- WHERE category = 'Restaurants')

-- SELECT b.name, b.review_count
-- FROM b INNER JOIN r ON b.name = r.name
-- ORDER BY b.review_count DESC;



-- 19.1
-- SELECT AVG(stars), AVG(stars_1)
-- FROM YelpReviews;



-- 19.2
-- WITH c AS
-- (SELECT name, AVG(stars) AS s
-- FROM YelpAttributes
-- GROUP BY name
-- ORDER BY s DESC)

-- SELECT COUNT(*)
-- FROM c
-- WHERE s <= 2.5;



-- 19.3
-- SELECT category, SUM(review_count) AS r
-- FROM YelpCategories
-- GROUP BY category
-- ORDER BY r DESC;



-- 19.4
-- SELECT name, review_count
-- FROM YelpAttributes
-- WHERE name_1 = 'BusinessAcceptsCreditCards'
-- ORDER BY review_count DESC;



-- 19.5
-- SELECT name, MAX(review_count) AS r
-- FROM YelpAttributes
-- GROUP BY name
-- ORDER BY r DESC
-- LIMIT 19;

-- SELECT name, review_count
-- FROM YelpAttributes
-- WHERE name_1 = 'WiFi' and value = 'free'
-- ORDER BY review_count DESC;



-- 20
SELECT *, compliment_hot + compliment_more + compliment_profile + compliment_cute + compliment_list + compliment_note + compliment_plain 
+ compliment_cool + compliment_funny + compliment_writer + compliment_photos as compliments
FROM YelpReviews
ORDER BY compliments DESC

