/*
What is the trend of user engagement for games across 
different price ranges over the last year?
*/

--
WITH playtime_per_game AS (

	SELECT
		app_id,
		DATE_TRUNC('month', date)	AS date,
		SUM(hours) 								AS total_playtime
	FROM reviews
	WHERE DATE_PART('year', date) = 2022
	GROUP BY 1, 2
	
),

price_ranges AS (

	SELECT
		app_id,
		title,
		CASE
			WHEN price_final BETWEEN 0 AND 0.99 THEN 'Free Tier'
			WHEN price_final BETWEEN 1 AND 8.99 THEN 'Low Tier'
			WHEN price_final BETWEEN 9 AND 15.99 THEN 'Mid Tier'
			WHEN price_final BETWEEN 16 AND 25.99 THEN 'High Tier'
			WHEN price_final BETWEEN 26 AND 49.99 THEN 'Premium Tier'
			ELSE 'AAA Tier'
		END 							AS price_tier,
		SUM(user_reviews)	AS num_of_reviews
	FROM game_data
	GROUP BY 1, 2, 3

),
/*
3 month rolling average of engagement metrics: 
average playtime and number of reviews
*/

engagement_metrics AS (

	SELECT
		price_tier,
		date 																																	AS date,
		total_playtime,
		num_of_reviews,
		ROUND(
			AVG(total_playtime)
			OVER(PARTITION BY price_tier 
					 ORDER BY playtime_per_game.date
					 ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2)	AS rolling_avg_playtime
	FROM price_ranges
	JOIN playtime_per_game
		ON price_ranges.app_id = playtime_per_game.app_id

)

SELECT 
    price_tier,
    date,
    SUM(num_of_reviews) 						 	AS total_reviews,
    ROUND(
			AVG(rolling_avg_playtime), 2)	AS avg_rolling_playtime
FROM engagement_metrics
GROUP BY 1, 2
ORDER BY 2, 1

/*
We will import the resulting tables into Python to do further analysis.
It'll be interesting to see if there is a correlation between playtime
and price tier, date and play time, playtime and total reviews.
*/
