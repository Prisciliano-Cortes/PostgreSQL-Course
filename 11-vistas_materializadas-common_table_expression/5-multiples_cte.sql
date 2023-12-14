-- MULTIPLES CTE
WITH claps_per_posts AS (
	SELECT post_id, SUM(counter) FROM claps GROUP BY post_id
), posts_from_2023 AS (
	SELECT * FROM posts WHERE created_at BETWEEN '2023-01-01' AND '2023-12-31'
)
SELECT * FROM claps_per_posts WHERE claps_per_posts.post_id IN ( SELECT post_id FROM posts_from_2023)
