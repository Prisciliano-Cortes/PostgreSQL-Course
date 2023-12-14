-- CHANGE NAME NORMAL VIEWS AND MATERIALIZED VIEWS
SELECT * FROM comments_per_week;

ALTER VIEW comments_per_week RENAME TO posts_per_week;

ALTER MATERIALIZED VIEW comments_per_week_mat RENAME TO posts_per_week_mat;