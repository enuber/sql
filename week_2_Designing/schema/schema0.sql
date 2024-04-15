-- Schema refers to what kinds of tables and columns would the tables have and what type of data should the columns have. 

-- subway system info
-- Id (primary key), Name, Station, Action, Fare, Balance
-- because people with the same name may rider, we should probably have a table tghat is just for "riders" where they get their own ID per person so if someone has the same name they can be identified. 
-- Could also have a table for just the statios where we have a station_id and a location

-- Normalizing - reduce redundancies to take one table and split them up into multiple tables where each entity is then represented separately. 
-- First take your entities like stations and riders and put them each in their own table. If you add more data make sure that it only is about the table it is being added too. So if a column is to add to stations, it should only be about stations. 
-- Looking at relationship between rider and station, A rider must have at least one station associated to them but they may have many ----|-<-. A station could have anywhere from no riders to hundres of riders ----O-<-.

-- CREATE TABLE - keyword to allows us to create a new table


-- Demonstrates creating a table schema
-- Creates mbta.db

-- before doing anything need to create the database to work in.
sqlite3 mbta.db
are you sure you wnat to create mbtra.db? [y/N] y


-- Deletes prior tables if they exist
-- NOTE: Can do a similar thing where we 
-- CREATE TABLE IF NOT EXISTS "stations" (
--     "id" INTEGER, 
--     "name" TEXT, 
--     "line" TEXT
-- );
DROP TABLE IF EXISTS "riders";
DROP TABLE IF EXISTS "stations";
DROP TABLE IF EXISTS "visits";
DROP TABLE IF EXISTS "swipes";
DROP TABLE IF EXISTS "cards";

-- Creates three tables without specified type affinities
-- convention to indent by 4 spaces. comma separated, don't need to have a comma on final column name.
CREATE TABLE "riders" (
    "id",
    "name"
);

CREATE TABLE "stations" (
    "id",
    "name",
    "line"
);

-- we need to relate the two tables together to implement the many to many relationship. Has many names, could be considered a junction table, an associate table, a join table...but done like this. 
CREATE TABLE "visits" (
    "rider_id",
    "station_id"
);
