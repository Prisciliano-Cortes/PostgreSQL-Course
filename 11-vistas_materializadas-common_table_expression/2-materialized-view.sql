-- VIEWS

-- MATERIALIZED VIEW
CREATE MATERIALIZED VIEW comments_per_week_mat AS
SELECT date_trunc('week', posts.created_at) AS week, COUNT( DISTINCT posts.post_id ) AS number_of_posts, SUM(claps.counter) AS total_claps, COUNT(*) AS number_of_claps FROM posts INNER JOIN claps ON claps.post_id = posts.post_id GROUP BY week ORDER BY week DESC;

-- LAS VISTAS MATERIALIZADAS HACEN COMO UN TIPO COPIA DE LA TABLA CON TODOS SUS DATOS, PERO SI SE AGREGAN NUEVOS DATOS, ESTOS NO LOS INCLUYE HASTA QUE SE ACTUALICE

-- COMPARE NORMAL VIEW AND MATERIALIED VIEW
SELECT * FROM comments_per_week;
SELECT * FROM comments_per_week_mat;

-- UPDATE MATERIALIZE VIEW
REFRESH MATERIALIZED VIEW comments_per_week_mat;