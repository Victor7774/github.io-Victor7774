SELECT * FROM [dbo].['Football Players Data$']

--1	Write a query to find all the players in the "Arizona" team.
  SELECT * FROM [dbo].['Football Players Data$']
  WHERE Team = 'Arizona'
--2	Write a query to find all the players who play as a "WR" (Wide Receiver).
  SELECT * FROM [dbo].['Football Players Data$']
  WHERE Pos = 'WR'
--3	Write a query to list all players taller than 6 feet 2 inches.
  SELECT * FROM [dbo].['Football Players Data$']
  WHERE Ft > 5 AND [In] > 2
--4	Write a query to find all players who attended the "Washington" college.
  SELECT * FROM [dbo].['Football Players Data$']
  WHERE[College] ='Washington'     
--5	Write a query to list players who are 25 years old or younger.
 SELECT *

FROM [dbo].['Football Players Data$']
WHERE TRY_CAST([Age] AS INT) <= 25

---SELECT *
SELECT *,RANK() OVER(PARTITION BY [Team] ORDER BY [Age] ASC) FROM [dbo].['Football Players Data$']
WHERE [Age] <> 'N/A'
  AND [Age] <= 25
--6	Write a query to find all players with missing Age data.
SELECT *,ROW_NUMBER() OVER(PARTITION BY [Age],[Team],[Year],[NAME] ORDER BY [Age]) FROM [dbo].['Football Players Data$']
WHERE [Age] <> 'N/A'
  AND [Age] <= 25
--7	Write a query to find players who are rookies (Exp = 'R').
  SELECT * FROM [dbo].['Football Players Data$']
  WHERE [Exp] = 'R'
--8	Write a query to find the tallest player on the "New Orleans" team.
     
  SELECT *,
       MAX([INCHES]) OVER (PARTITION BY [Team]) AS MaxInches
FROM [dbo].['Football Players Data$']
WHERE [Team] = 'New Orleans'


--9	Write a query to find players weighing more than 250 pounds.
SELECT * FROM [dbo].['Football Players Data$']
WHERE [Wt] > 250
--10	Write a query to calculate the average height of players at each position.
        SELECT [Pos], ROUND(AVG(Inches),0) AS AVG_Height FROM [dbo].['Football Players Data$'] 
        Group by [Pos]
        ORDER BY AVG_Height desC
