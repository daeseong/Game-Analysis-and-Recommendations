WITH game_data_filtered AS (

	SELECT
		app_id,
		title,
		date_release,
		CASE
			WHEN rating IN ('Overwhelmingly Positive', 'Very Positive') THEN 5
			WHEN rating IN ('Mostly Positive', 'Positive') THEN 4
			WHEN rating = 'Mixed' THEN 3 
			WHEN rating IN ('Mostly Negative', 'Negative') THEN 2
			WHEN rating IN ('Overwhelmingly Negative', 'Very Negative') THEN 1
			ELSE NULL
		END 						AS rating,
		positive_ratio,
		user_reviews 		AS num_reviews,
		price_final		  AS price
	FROM game_data
	
),
/*
Removed OS and steam deck compatibility and discount.
It won't be necessary for our pricing analysis. The column
price_original will be excluded in the top 100 analysis, since
pricing data is incorrect. Changed rating system to be from 0-5.
*/

top_100_games AS (

	SELECT
		RANK() OVER(ORDER BY num_reviews DESC) AS sales_rank,
		*
	FROM game_data_filtered
	ORDER BY 1 
	LIMIT 100

)

SELECT
	rating,
	COUNT(*)											AS num_of_games,
	MIN(price)										AS min_price,
	ROUND(AVG(price), 2)					AS avg_price,
	MAX(price)										AS max_price,
	SUM(num_reviews)							AS total_reviews,
	ROUND(AVG(positive_ratio, 2)	AS avg_positive_ratio
FROM top_100_games
GROUP BY 1


/*
The following SQL queries were used to look at some 
basic statistics before importing to Python, to run
more complex analytics
*/

/*
-- Lowest 3 Rating in Top 100
SELECT
	app_id,
	title,
	rating,
	DENSE_RANK() OVER(ORDER BY rating) AS rating_rank
FROM top_100_games
ORDER BY 3
LIMIT 3

-- -- Average price of top 100 games
SELECT ROUND(AVG(price_final), 2) AS avg_price
FROM top_100_games;

-- Free to play games in the top 100
SELECT
	app_id,
	title,
	sales_rank
FROM top_100_games
WHERE price_final = 0
ORDER BY 3;
*/

	

	