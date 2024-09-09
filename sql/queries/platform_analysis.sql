/*
Manipulating tables and performing EDA before
importing into Python and doing more in-depth analysis.
*/

WITH platform_table AS (

	SELECT
		app_id,
		title,
		date_release,
		CASE
			WHEN win AND mac AND linux THEN 'All Platforms'
			WHEN win AND mac THEN 'Windows + Mac'
			WHEN win AND linux THEN 'Windows + Linux'
			WHEN mac and linux THEN 'Mac and Linux'
			WHEN win THEN 'Windows Only'
			WHEN mac THEN 'Mac Only'
			WHEN linux THEN 'Linux Only'
			ELSE 'Steam Deck Only'
		END						AS platform_support,
		steam_deck::bool,
		rating,
		positive_ratio,
		user_reviews 	AS reviews,
		price_final		AS price
	FROM game_data

)


-- Number of games, average price, total reviews, and avg postitive ratio
SELECT
	platform_support,
	COUNT(app_id)														AS num_games,
	ROUND(AVG(price), 2)										AS avg_price,
	SUM(reviews)														AS total_reviews,
	ROUND(AVG(positive_ratio)::numeric, 2)	AS avg_pr,
	SUM(
		CASE
			WHEN steam_deck
				THEN 1
			ELSE 0
		END)																	AS steam_deck_count
FROM platform_table
GROUP BY 1;


-- How does support change over time, let's look at windows and all platform
SELECT
	DATE_PART('year', date_release) AS release_year,
	SUM(
		CASE platform_support
			WHEN 'All Platforms' THEN 1
			ELSE 0
		END) 														AS all_count,
	SUM(
		CASE platform_support
			WHEN 'Windows Only' THEN 1
			ELSE 0
		END)														AS windows_count
FROM platform_table
GROUP BY 1
ORDER BY 1;
		
	