// Which category has the highest success rate? How many projects were successful?//

SELECT Category as Kategoria,
       CONCAT(ROUND(SUM(CASE WHEN State = 'Successful' THEN 1 ELSE 0 END) * 100 / COUNT(*), 2), '%') AS Odsetek_Sukcesow,
       SUM(CASE WHEN State = 'Successful' THEN 1 ELSE 0 end)  as 'Udane_Projekty'
FROM projekty_kickstarter 
GROUP BY Category
ORDER BY odsetek_sukcesow desc



//Which project with a goal over $1,000 had the highest percentage of goal completion? How much money has been pledged?//

SELECT 	Name as Project_Name,
		Goal,
		Pledged,
		CONCAT(ROUND((Pledged * 100 / Goal), 2), '%') as procent_realizacji
from projekty_kickstarter
where 'Goal' > '1000'
group by Name, Goal, Pledged
order by procent_realizacji desc 
limit 1;




//Can you identify any trends in project success rates over the years?//

SELECT YEAR(Deadline) AS Rok,
       CONCAT(ROUND(sum(CASE WHEN State = 'Successful' THEN 1 END) * 100.0 / COUNT(*), 2), '%') AS Odsetek_sukcesow,
       sum(CASE WHEN State = 'Successful' THEN 1 END) as ile_udanych
FROM projekty_kickstarter
GROUP BY YEAR(Deadline)
ORDER BY Rok