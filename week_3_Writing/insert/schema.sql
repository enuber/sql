-- START HERE - there is no schema when we do sqlite3 mfa.db
-- .read <filename>.sql - will add the schema to the database
-- after doing this then go to insert0.sql file.


-- Demonstrates schema of mfa.db for insert files
-- Creates mfa.db

-- Deletes prior tables if they exist
DROP TABLE IF EXISTS "collections";
DROP TABLE IF EXISTS "artists";
DROP TABLE IF EXISTS "created";

-- Creates collections table
CREATE TABLE "collections" IF NOT EXISTS (
    "id" INTEGER,
    "title" TEXT NOT NULL,
    "accession_number" TEXT NOT NULL UNIQUE,
    "acquired" NUMERIC,
    PRIMARY KEY("id")
);
