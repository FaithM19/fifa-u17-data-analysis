USE fifa_world_cup_2024_2025;
SELECT
ps.seasonType,
ps.year,
pt.typeId,
pt.eventId,
pt.teamId,
pt.playOrder,
pt.playId,
pt.athleteId,
pt.period,
pt.participant AS athlete_name, 
-- flags per player 
CASE 
WHEN shortText LIKE '%Yellow Card%' THEN 1 ELSE 0 END AS 'Yellow_Card_Flag',
CASE 
WHEN shortText LIKE '%Red Card%' THEN 1 ELSE 0 END AS 'Red_Card_Flag',
CASE 
WHEN shortText LIKE '%Goal%' THEN 1 ELSE 0 END AS 'Goal_Flag',
pt.clockDisplayvalue
FROM plays_2024_fifa_world_u17 pt 
JOIN playerstats_2024_fifa_world_u17 ps ON pt.seasonType = ps.seasonType

UNION 

SELECT 
pp.seasonType,
pp.year,
pf.typeId,
pf.eventId,
pf.teamId,
pf.playOrder,
pf.playId,
pf.athleteId,
pf.period,
pf.participant AS athlete_name,
-- flag per player 
CASE 
WHEN shortText LIKE '%Yellow Card%' THEN 1 ELSE 0 END AS 'Yellow_Card_Flag',
CASE 
WHEN shortText LIKE '%Red Card%' THEN 1 ELSE 0 END AS 'Red_Card_Flag',
CASE 
WHEN shortText LIKE '%Goal%' THEN 1 ELSE 0 END AS 'Goal_Flag',
pf.clockDisplayvalue
FROM plays_2025_fifa_world_u17 pf
JOIN playerstats_2025_fifa_world_u17 pp ON pf.seasonType = pp.seasonType 

