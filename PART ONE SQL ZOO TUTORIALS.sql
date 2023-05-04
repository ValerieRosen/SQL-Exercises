--SQL ZOO TUTORIALS

--00 SELECT BASICS

1. Introducing the world table of countries
/*The example uses a WHERE clause to show the population of 'France'. 
Note that strings (pieces of text that are data) should be in 'single quotes';
Modify it to show the population of Germany*/
SELECT population FROM world
  WHERE name = 'Germany'

2. Scandinavia
/*Checking a list The word IN allows us to check if an item is in a list. 
The example shows the name and population for the countries 'Brazil', 'Russia', 'India' and 'China'.
Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.*/
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

3. Just the right size
/*Which countries are not too small and not too big? BETWEEN allows range checking 
(range specified is inclusive of boundary values). The example below shows countries with an area 
of 250,000-300,000 sq. km. 
Modify it to show the country and the area for countries with an area between 200,000 and 250,000.*/
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000


--01 SELECT NAMES

1. 
/*You can use WHERE name LIKE 'B%' to find the countries that start with "B".
The % is a wild-card it can match any characters
Find the country that start with Y*/
SELECT name FROM world
  WHERE name LIKE 'Y%'

2. Find the countries that end with y

SELECT name FROM world
  WHERE name LIKE '%y'

3. Luxembourg has an x - so does one other country. List them both.
Find the countries that contain the letter x

SELECT name FROM world
  WHERE name LIKE '%x%'

4. Iceland, Switzerland end with land - but are there others?
Find the countries that end with land

SELECT name FROM world
  WHERE name LIKE '%land'

5. Columbia starts with a C and ends with ia - there are two more like this.
Find the countries that start with C and end with ia

SELECT name FROM world
  WHERE name LIKE 'C%ia%'

6. Greece has a double e - who has a double o?
Find the country that has oo in the name

SELECT name FROM world
  WHERE name LIKE '%oo%'

7. Bahamas has three a - who else?
Find the countries that have three or more a in the name

SELECT name FROM world
  WHERE name LIKE '%a%a%a%'

8. India and Angola have an n as the second character. 
You can use the underscore as a single character wildcard.

SELECT name FROM world
 WHERE name LIKE '_n%'
ORDER BY name
Find the countries that have "t" as the second character.

SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name

9. Lesotho and Moldova both have two o characters separated by two other characters.
Find the countries that have two "o" characters separated by two others.

SELECT name FROM world
 WHERE name LIKE '%o__o%'

10. Cuba and Togo have four characters names.
Find the countries that have exactly four characters.

SELECT name FROM world
 WHERE name LIKE '____'

11. The capital of Luxembourg is Luxembourg. 
Show all the countries where the capital is the same as the name of the country
Find the country where the name is the capital city.

SELECT name
  FROM world
 WHERE name = capital;

12. The capital of Mexico is Mexico City. 
Show all the countries where the capital has the country together with the word "City".
Find the country where the capital is the country plus "City".
The concat function
The function concat is short for concatenate - you can use it to combine two or more strings.

SELECT name
  FROM world
 WHERE capital = concat(name, ' City');

 13. Find the capital and the name where the capital includes the name of the country.

SELECT capital, name
FROM world
WHERE capital LIKE concat('%', name, '%');

14. Find the capital and the name where the capital is an extension of name of the country.
You should include Mexico City as it is longer than Mexico.
You should not include Luxembourg as the capital is the same as the country.

SELECT capital, name
FROM world
WHERE capital LIKE concat('%', name, '%') AND capital > name;

15. For Monaco-Ville the name is Monaco and the extension is -Ville.
Show the name and the extension where the capital is an extension of name of the country.
You can use the SQL function REPLACE.

SELECT name, REPLACE(capital, name, '') 
FROM world 
WHERE capital LIKE concat('%', name, '%') AND capital > name;

--02 SELECT FROM WORLD

1. Read the notes about this table. Observe the result of 
running this SQL command to show the name, continent and population of all countries.

SELECT name, continent, population FROM world

2. Large Countries
How to use WHERE to filter records. 
Show the name for the countries that have a population of at least 200 million.
 200 million is 200000000, there are eight zeros.

SELECT name FROM world
WHERE population >= 200000000;

3. Per capita GDP
Give the name and the per capita GDP for those countries with a population of at 
least 200 million.
HELP:How to calculate per capita GDP

SELECT name, gdp/population
FROM world
WHERE population >= 200000000

4. South America In millions
Show the name and population in millions for the countries of the continent 'South America'. 
Divide the population by 1000000 to get population in millions.

SELECT name, population
FROM world
WHERE continent = 'South America';

5. France, Germany, Italy
Show the name and population for France, Germany, Italy

SELECT name, population
FROM world
WHERE name IN ('France', 'Germany', 'Italy');

6. United
Show the countries which have a name that includes the word 'United'

SELECT name
FROM world
WHERE name LIKE ('%United%');

7. Two ways to be big
Two ways to be big: A country is big if it has an area of more than 3 million sq km 
or it has a population of more than 250 million.
Show the countries that are big by area or big by population. Show name, population and area.

SELECT name, population, area
FROM world
WHERE area >= 3000000 OR population >250000000;

8. One or the other (but not both)
Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.

Australia has a big area but a small population, it should be included.
Indonesia has a big population but a small area, it should be included.
China has a big population and big area, it should be excluded.
United Kingdom has a small population and a small area, it should be excluded.

SELECT name, population, area
FROM world
WHERE (area > 3000000 AND population <= 250000000)
OR (area <= 3000000 AND population > 250000000)

9. Rounding
Show the name and population in millions and the GDP in billions for the countries of 
the continent 'South America'. Use the ROUND function to show the values to two decimal 
places.
For South America show population in millions and GDP in billions both to 2 decimal places.
Millions and billions

SELECT name, population/1000000
FROM world
WHERE continent ='South America';

10. Trillion dollar economies
Show the name and per-capita GDP for those countries with a GDP of at least one trillion 
(1000000000000; that is 12 zeros). Round this value to the nearest 1000.
Show per-capita GDP for the trillion dollar countries to the nearest $1000.

SELECT name, ROUND(gdp/population, -3)
FROM world
WHERE gdp >1000000000000;

11. Name and capital have the same length
Greece has capital Athens.

Each of the strings 'Greece', and 'Athens' has 6 characters.

Show the name and capital where the name and the capital have the same number of characters.

You can use the LENGTH function to find the number of characters in a string

SELECT name, capital
FROM world
WHERE LENGTH(name) = LENGTH(capital);

12. Matching name and capital
The capital of Sweden is Stockholm. Both words start with the letter 'S'.

Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
You can use the function LEFT to isolate the first character.
You can use <> as the NOT EQUALS operator.

SELECT name, capital
FROM world
WHERE LEFT(name, 1) =  LEFT(capital, 1) XOR name = capital;

13. All the vowels
Equatorial Guinea and Dominican Republic have all of the vowels (a e i o u) in the name. 
They don't count because they have more than one word in the name.

Find the country that has all the vowels and no spaces in its name.

You can use the phrase name NOT LIKE '%a%' to exclude characters from your results.
The query shown misses countries like Bahamas and Belarus because they contain at least one 'a'

SELECT name
   FROM world
WHERE name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%' AND name LIKE '%o%' AND name LIKE '%u%' AND name NOT LIKE '% %';


--03 NOBEL LAUREATES

1. Winners from 1950
Change the query shown so that it displays Nobel prizes for 1950.

SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

2. 1962 Literature
Show who won the 1962 prize for literature.

SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'literature'

3. Albert Einstein
Show the year and subject that won 'Albert Einstein' his prize.

SELECT yr, subject
FROM nobel WHERE winner = 'Albert Einstein';

4. Recent Peace Prizes
Give the name of the 'peace' winners since the year 2000, including 2000.

SELECT winner FROM nobel WHERE yr >=2000 AND subject = 'peace';

5. Literature in the 1980's
Show all details (yr, subject, winner) of the literature prize winners for 1980 to 1989 inclusive.

SELECT yr, subject, winner
 FROM nobel 
WHERE subject = 'literature' AND yr BETWEEN 1980 AND 1989;

6. Only Presidents
Show all details of the presidential winners:

Theodore Roosevelt
Thomas Woodrow Wilson
Jimmy Carter
Barack Obama

SELECT * FROM nobel
 WHERE subject = 'peace' AND winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama');

7. John
Show the winners with first name John

SELECT winner FROM nobel
WHERE winner LIKE 'John%';

8. Chemistry and Physics from different years
Show the year, subject, and name of physics winners 
for 1980 together with the chemistry winners for 1984.

SELECT yr, subject, winner FROM nobel 
WHERE subject = 'physics' AND yr = '1980' OR subject = 'chemistry' AND yr = '1984'

9. Exclude Chemists and Medics
Show the year, subject, and name of winners for 1980 excluding chemistry and medicine

SELECT *
FROM nobel
WHERE yr = '1980' AND subject NOT IN ('chemistry', 'medicine')

10. Early Medicine, Late Literature
Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) 
together with winners of a 'Literature' prize in a later year (after 2004, including 2004)

SELECT *
FROM nobel
WHERE (subject = 'medicine' AND yr <1910) OR (subject = 'literature' AND yr >=2004);

11. Umlaut
Find all details of the prize won by PETER GRÜNBERG

Non-ASCII characters

SELECT * 
FROM nobel
WHERE winner LIKE 'Peter Gr%nberg';

12. Apostrophe
Find all details of the prize won by EUGENE O'NEILL

Escaping single quotes.
You can't put a single quote in a quote string directly. 
You can use two single quotes within a quoted string.

SELECT *
FROM nobel
WHERE winner = 'Eugene O''Neill';

13. Knights of the realm
Knights in order

List the winners, year and subject where the winner starts with Sir. 
Show the the most recent first, then by name order.

SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC, winner

14. Chemistry and Physics last
The expression subject IN ('chemistry','physics') can be used as a value - it will be 0 or 1.

Show the 1984 winners and subject ordered by subject and winner name; 
but list chemistry and physics last

SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('physics', 'chemistry'), subject, winner
