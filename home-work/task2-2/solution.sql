SELECT conference FROM Paper GROUP BY conference HAVING count(DISTINCT location) > 1
UNION
SELECT conference FROM Paper WHERE conference NOT IN (SELECT value FROM conference);
