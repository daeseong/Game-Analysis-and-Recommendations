WITH seasons AS (

	SELECT
		app_id,
		CASE
			WHEN DATE_PART('month', date_release) BETWEEN 3 AND 5
				THEN 'Spring'
			WHEN DATE_PART('month', date_release) BETWEEN 6 AND 8
				THEN 'Summer'
			WHEN DATE_PART('month', date_release) BETWEEN 9 AND 11
				THEN 'Fall'
			WHEN DATE_PART('month', date_release) IN (12, 1, 2)
				THEN 'Winter'
			END 			AS season,
		rating,
		price_final AS price
	FROM game_data

)


SELECT
	season,
	CASE
		WHEN LOWER(rating) LIKE '%positive' THEN 'Positive'
		WHEN LOWER(rating) LIKE 'mixed' THEN 'Mixed'
		WHEN LOWER(rating) LIKE '%negative' THEN 'Negative'
		ELSE NULL
	END										AS simple_rating,
	COUNT(app_id)					AS rating_count,
	ROUND(AVG(price), 2)	AS avg_price -- avg price per season per rating type
FROM seasons
GROUP BY 1, 2
ORDER BY 1, 2
