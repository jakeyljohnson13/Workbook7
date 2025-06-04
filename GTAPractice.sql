--GTA MISSIONS
--Scanning the Grid

--List names, aliases, and professions
SELECT Name, Alias, Profession
FROM GTA.Citizens;

--List those under 25
SELECT Name, Alias, Age
FROM GTA.Citizens
WHERE Age < 25;

--List Vehicles by speed
SELECT Type, Brand, Speed
FROM GTA.Vehicles
ORDER BY Speed ASC;

--List those who own a vehicle and the number of vehicles owned
SELECT c.Name, COUNT(v.VehicleID) AS [Vehicles Owned]
FROM GTA.Citizens c 
LEFT JOIN GTA.Vehicles v 
ON c.CitizenID = v.OwnerID
GROUP BY c.Name;

--List most wanted person
SELECT Name, MAX(WantedLevel) AS [Most Wanted]
FROM GTA.Citizens
WHERE WantedLevel = (SELECT MAX(WantedLevel) FROM Gta.Citizens)
GROUP BY Name;

--Most wanted persons
SELECT Name, Alias, WantedLevel
FROM GTA.Citizens
WHERE WantedLevel >= 2;

--List those who have stolen vehicles
SELECT c.Name
FROM GTA.Citizens c 
JOIN GTA.Vehicles v 
ON c.CitizenID = v.OwnerID
WHERE v.IsStolen = 1
GROUP BY c.Name;

--List names with total rewards from missions
SELECT c.Name, c.CitizenID, sum(m.Reward) AS [Total Rewards]
FROM GTA.Missions m
JOIN GTA.Assignments a
ON m.MissionID = a.MissionID
JOIN GTA.Citizens c
ON c.CitizenID = a.CitizenID
WHERE a.Completed = 1
AND m.MissionID = a.MissionID
GROUP BY c.Name, c.CitizenID
ORDER BY SUM(m.Reward) DESC;

--Mission completion times, fastest to slowest
SELECT c.Name, COUNT(a.Completed) AS [Missions Completed], MIN(a.TimeSpent) AS Fastest, MAX(a.TimeSpent) AS Slowest
FROM GTA.Citizens c 
JOIN GTA.Assignments a 
ON c.CitizenID = a.CitizenID
WHERE a.Completed = 1
AND c.CitizenID = a.CitizenID
GROUP BY c.Name, c.CitizenID, a.TimeSpent
ORDER BY a.TimeSpent ASC;

--Most effective members with 2 missions completed and +$4000 revenue
SELECT c.Name, c.CitizenID, COUNT(a.Completed) AS [Missions Completed], sum(m.Reward) AS [Total Rewards]
FROM GTA.Missions m
JOIN GTA.Assignments a
ON m.MissionID = a.MissionID
JOIN GTA.Citizens c
ON c.CitizenID = a.CitizenID
WHERE a.Completed = 1
GROUP BY c.Name, c.CitizenID
HAVING SUM(m.Reward) > 4000
AND COUNT(a.Completed) > 1;

--Reference tables to check work
SELECT *
FROM GTA.Missions;

SELECT *
FROM GTA.Assignments;

SELECT *
FROM GTA.Citizens;