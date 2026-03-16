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
CASE 
WHEN shortText LIKE '%Yellow Card%' THEN shortText
ELSE''
END AS 'Yellow_Card',
CASE 
WHEN shortText LIKE '%Red_Card%' THEN shortText
ELSE''
END AS 'Red Card ',
CASE 
WHEN shortText LIKE '%Goal%' THEN shortText
ELSE''
END AS 'Goal',
CASE 
WHEN shortText LIKE '%Substitution%' THEN shortText
ELSE''
END AS 'Substitution',
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
CASE 
WHEN shortText LIKE '%Yellow Card%' THEN shortText
ELSE''
END AS 'Yellow_Card',
CASE 
WHEN shortText LIKE '%Red Card%' THEN shortText
ELSE''
END AS 'Red_Card ',
CASE 
WHEN shortText LIKE '%Goal%' THEN shortText
ELSE''
END AS 'Goal',
CASE 
WHEN shortText LIKE '%Substitution%' THEN shortText
ELSE''
END AS 'Substitution',
pf.clockDisplayvalue
FROM plays_2025_fifa_world_u17 pf
JOIN playerstats_2025_fifa_world_u17 pp ON pf.seasonType = pp.seasonType 

