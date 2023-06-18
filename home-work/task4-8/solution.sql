SELECT c.name AS Commander, s.name AS Spacecraft, f.start_date AS date
FROM Flight AS f
JOIN Spacecraft AS s ON s.id = f.spacecraft_id
JOIN Commander AS c ON c.id = f.commander_id
WHERE f.commander_id = 6;
