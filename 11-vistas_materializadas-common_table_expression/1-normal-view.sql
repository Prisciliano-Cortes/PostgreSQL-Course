-- VIEWS

-- TRUNCATE DATE
SELECT date_trunc('year', created_at), created_at FROM posts ORDER BY created_at DESC;

SELECT date_trunc('week', created_at), created_at FROM posts ORDER BY created_at DESC;

SELECT date_trunc('year', created_at) AS years, COUNT(*) FROM posts GROUP BY years ORDER BY years DESC;

SELECT date_trunc('week', created_at) AS week, COUNT(*) FROM posts GROUP BY week ORDER BY week DESC;

SELECT date_trunc('week', posts.created_at) AS week, COUNT( DISTINCT posts.post_id ) AS number_of_posts, SUM(claps.counter) AS total_claps FROM posts INNER JOIN claps ON claps.post_id = posts.post_id GROUP BY week ORDER BY week DESC;

-- CRTEATE VIEWS
CREATE VIEW comments_per_week AS
SELECT date_trunc('week', posts.created_at) AS week, COUNT( DISTINCT posts.post_id ) AS number_of_posts, SUM(claps.counter) AS total_claps FROM posts INNER JOIN claps ON claps.post_id = posts.post_id GROUP BY week ORDER BY week DESC;

-- CRTEATE OR REPLACE THE VIEW
CREATE OR REPLACE VIEW comments_per_week AS
SELECT date_trunc('week', posts.created_at) AS week, COUNT( DISTINCT posts.post_id ) AS number_of_posts, SUM(claps.counter) AS total_claps, COUNT(*) AS number_of_claps FROM posts INNER JOIN claps ON claps.post_id = posts.post_id GROUP BY week ORDER BY week DESC;

-- SELECT VIEW CREATED
SELECT * FROM comments_per_week;

-- DROP VIEW
DROP VIEW comments_per_week;

-- LAS VISTAS NORMALES SE USAN PARA REDUCIR EL TAMAÑO DE LAS QUERIES MUY COMPLEJAS, BÁSICAMENTE ES UN ALIAS PARA UNA QUERY GRANDE O COMPLEJA

