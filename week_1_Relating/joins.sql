-- remember use .table to see what tables are in a db.

-- JOIN - take one table and combine it with some other table. 
-- can match an primary key and use to join two tables together.

-- INNER JOIN - (This is just using the keyword JOIN) If each table has the same id then will join thoses rows. Things that don't match go away

-- OUTER JOIN - the below are all apat of this outer join family. Lets you keep some of the data even if it gives you back some Null values.
-- LEFT JOIN - will prioritize the first table which is being on the left so to speak. By doing this, we will keep all the things in the left table even though it may not have data in the other table. 
-- RIGHT JOIN - prioritizes the second table which below is the migrations table. By doing so now some of the seals are left off and we have no name or species for some of the distance and day rows 
-- FULL JOIN - joins both tables completely and we will then see all the rows regardless of data missing.

-- NATURAL JOIN assumes you will join by the like column. In this case the id


-- Demonstrates joining tables with JOIN
-- Uses sea_lions.db

-- Shows all sea lions for which we have data
-- after JOIN you list the table you want to have join to the original table and then use ON
-- ON is where you identify what needs to match up in order to combine the list. Noting that things where they don't match up will go away. Where they do match the info will not be combined into one row.
-- Note that their is also a dot (.) between the list name and then the column name. 
SELECT * FROM "sea_lions"
JOIN "migrations" ON "migrations"."id" = "sea_lions"."id";

-- Shows all sea lions, whether or not we have data
-- This will keep Jolie the sea lion that doesn't have a distance or days column
SELECT * FROM "sea_lions"
LEFT JOIN "migrations" ON "migrations"."id" = "sea_lions"."id";

-- Shows all data, whether or not there are matching sea lions
-- This will remove some of the sea lions and, give us back rows that just have distance and days in some cases
SELECT * FROM "sea_lions"
RIGHT JOIN "migrations" ON "migrations"."id" = "sea_lions"."id";

-- Shows all data and all sea lions
SELECT * FROM "sea_lions"
FULL JOIN "migrations" ON "migrations"."id" = "sea_lions"."id";

-- JOINs sea lions and migrations without specifying matching column
-- NATURAL JOIN assumes you will join by the like column. In this case the id, you also don't get two separate id columns like we have seen in other calls.
SELECT * FROM "sea_lions"
NATURAL JOIN "migrations";

-- Uses WHERE after joining a table
SELECT * FROM "sea_lions"
JOIN "migrations" ON "migrations"."id" = "sea_lions"."id"
WHERE "migrations"."distance" > 1500;
