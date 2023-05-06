PART TWO: MORE SQL (INCLUDING AGGREGATES)

--SQL BASICS: SIMPLE WHERE AND ORDER BY
For this challenge you need to create a simple SELECT statement that will return 
all columns from the people table WHERE their age is over 50

SELECT *
FROM people
WHERE age > 50
ORDER BY age DESC;

--SQL BASICS: SIMPLE SUM
For this challenge you need to create a simple SUM statement that will sum all the ages.

SELECT SUM(age) as age_sum FROM people;

--SQL BASICS: SIMPLE MIN/MAX
For this challenge you need to create a simple MIN / MAX statement that will return 
the Minimum and Maximum ages out of all the people.

SELECT min(age) AS age_min, max(age) AS age_max FROM people

--FIND ALL ACTIVE STUDENTS
Create a simple SELECT query to display student information of all ACTIVE students

SELECT FirstName, LastName 
FROM students 
WHERE IsActive == 1;

--SQL BASICS: SIMPLE GROUP BY
For this challenge you need to create a simple GROUP BY statement, you want to group all 
the people by their age and count the people who have the same age.

SELECT age, count(id) AS people_count
FROM people
GROUP BY age;

--SQL BASICS: SIMPLE HAVING
For this challenge you need to create a simple HAVING statement, you want to count how many people have the same age
and return the groups with 10 or more people who have that age.

SELECT age, COUNT(*) AS total_people
FROM people
GROUP BY age
HAVING COUNT(*) >= 10

--SQL ZOO: TUTORIAL 5 (SUM_AND_COUNT)

1.Show the total population of the world.

world(name, continent, area, population, gdp)

SELECT SUM(population)
FROM world

2. List all the continents - just once each.

SELECT DISTINCT continent
FROM world

3. Give the total GDP of Africa

SELECT SUM(gdp)
FROM world
WHERE continent = 'Africa';

4. How many countries have an area of at least 1000000

SELECT COUNT(area)
FROM world
WHERE area >= 1000000;

5. What is the total population of ('Estonia', 'Latvia', 'Lithuania')

SELECT SUM(population)
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania');

6. For each continent show the continent and number of countries.

SELECT continent, COUNT(area)
FROM world
GROUP BY continent;

7. For each continent show the continent and number of countries with populations of at least 10 million.

SELECT continent, COUNT(name)
FROM world
WHERE population >= 10000000
GROUP BY continent;

8. List the continents that have a total population of at least 100 million.

SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) >= 100000000;

