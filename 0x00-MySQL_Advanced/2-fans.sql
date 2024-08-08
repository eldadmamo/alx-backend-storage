-- SQL script that ranks country of origins of band ordered by number of
-- (non-unique) 
SELECT origin, SUM(fans) as nb_fans 
FROM metal_bands
GROUP BY origin
ORDER BY nb_fans DESC;
