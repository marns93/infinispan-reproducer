
SELECT * from pg_stat_activity;

SELECT
    pg_terminate_backend(pid)
FROM
    pg_stat_activity
WHERE
    datname = 'infinispan' and application_name = 'PostgreSQL JDBC Driver' limit 1;