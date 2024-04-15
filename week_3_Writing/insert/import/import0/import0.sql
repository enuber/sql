-- Note that if you don't have Null in the CSV it will just appear as a blank value.

-- Import into an existing table by specifying mode and skipping header columns
-- this is with the mfa_original.csv where we have the id also included. 
.import --csv --skip 1 mfa.csv collections

-- start with sqlite3 mfa.db
-- bring in the schema again with .read schema.sql from the correct schema file.
-- then...   .import --csv --skip 1 mfa.csv collections

-- --csv --skip 1  - this means importing a csv the skip 1 skips the header row.
-- mfa.csv - this is the name of the csv file we are importing from
-- collections - the table we are importing the data into in

