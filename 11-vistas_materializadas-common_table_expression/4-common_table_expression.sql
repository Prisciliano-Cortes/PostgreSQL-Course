-- COMMON TABLE EXPRESSIONS - CTE

WITH posts_week_2024 AS (
	SELECT date_trunc('week', posts.created_at) AS weeks, 
	SUM(claps.counter) AS total_claps, 
	COUNT(DISTINCT posts.post_id) AS number_of_posts, 
	COUNT(*) AS number_of_claps 
	FROM posts 
	JOIN claps ON claps.post_id = posts.post_id 
	GROUP BY (date_trunc ('week', posts.created_at)) 
	ORDER BY (date_trunc('week', posts.created_at)) DESC
) 
SELECT * FROM posts_week_2024 WHERE weeks BETWEEN '2024-01-01' AND '2024-12-31' AND total_claps > 600;

-- Nos sirve para tratar de separar queries complejos en queries más sencillos
-- En donde se muy necesarios son el los queries recursivos