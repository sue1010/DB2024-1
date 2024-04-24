SELECT NAME
FROM COUNTRY;
--45.
SELECT name, surfacearea, population
FROM country
WHERE name = 'Spain';

--46.
SELECT name, population, lifeexpectancy
FROM country
WHERE name = 'Poland';

--47.
SELECT countrycode, language
FROM countrylanguage
WHERE countrycode = 'AUT';

--48.
SELECT countrycode, language, percentage
FROM countrylanguage
WHERE countrycode = 'CZE';

--49.
SELECT name, population
FROM city
WHERE countrycode = 'AUT';

--50.
SELECT name, population
FROM city
WHERE name = 'London';

--51.
SELECT name, surfacearea
FROM country
WHERE surfacearea >= 30000;

--52.
SELECT name, surfacearea, population
FROM country
WHERE surfacearea>=40000 AND population >= 3000000;

--53.
SELECT name, lifeexpectancy
FROM country
WHERE lifeexpectancy BETWEEN 60 AND 70;

--54.
SELECT name, GNP
FROM country
WHERE GNP BETWEEN 100000 AND 200000;

--55.
SELECT DISTINCT language
FROM countrylanguage
ORDER BY language ASC;

--56.
SELECT name
FROM country
WHERE name LIKE 'A%' OR 
name LIKE 'B%';

--57.
SELECT name, GNP
FROM country
WHERE lifeexpectancy IS NULL;

--58.
SELECT count(code)
FROM country
WHERE population >= 10000000;

--59.
SELECT AVG(surfacearea)
FROM country
WHERE population >= 10000000;

--60.
SELECT MAX(GNP)
FROM country
WHERE lifeexpectancy <=70;
 
-- 61.
SELECT SUM(GNP)
FROM country
WHERE lifeexpectancy >= 80;

--62.
SELECT MAX(GNP)-MIN(GNP)
FROM country
WHERE surfacearea >= 30000;

--63.
SELECT SUM(population*1.05)
FROM country;

--64.
SELECT name, GNP/population
FROM country
WHERE surfacearea >= 30000;

--65.
SELECT name, population/surfacearea
FROM country
WHERE lifeexpectancy >= 80;

--66.
SELECT MAX(population/surfacearea)
FROM country
WHERE surfacearea > 0;

--67.
SELECT countrycode, COUNT(language)
FROM countrylanguage
GROUP BY countrycode
ORDER BY countrycode ASC;

--68.
SELECT countrycode, COUNT(language)
FROM countrylanguage
GROUP BY countrycode
HAVING COUNT(language) >= 3
ORDER BY COUNT(language) DESC;

--69.
SELECT countrycode, COUNT(language)
FROM countrylanguage
WHERE percentage >= 10
GROUP BY countrycode;

--70.
SELECT countrycode, COUNT(language)
FROM countrylanguage
WHERE percentage > 5
GROUP BY countrycode
HAVING COUNT(language) >= 4
ORDER BY COUNT(language) DESC;

--71.
SELECT countrycode, COUNT(id)
FROM city
GROUP BY countrycode
ORDER BY countrycode ASC;

--72.
SELECT countrycode, COUNT(id), SUM(population)
FROM city
GROUP BY countrycode
HAVING COUNT(id) >= 2;

--73.
SELECT countrycode, COUNT(ID), SUM(population)
FROM city
WHERE NOT population < 90000
GROUP BY countrycode;

--74.
SELECT countrycode, AVG(population)
FROM city
GROUP BY countrycode
ORDER BY countrycode ASC;

--75.
SELECT countrycode, MAX(population)
FROM city
GROUP BY countrycode;
