-- Scaling - ability to increase or decrease capacity to meet demand.
-- DBMS - database management Systems

-- SQLite is an embeded database where as MySQL and Postgres are database servers. They often run on their own hardware and you connect to them. THey can store data on an SSD or a hard drive, but in RAM, which allows for faster querying. They also have feature sets like replication and charting. 

-- to login --
-- -u followed by user you want to login as. "root" is the admin of the database.
-- may often include the IP address of the computer. 
-- -h is the host followed by the IP address. 127.0.0.1 is the local host (ie home computer)
-- -P is the the port followed by the port address.
-- -p is password and is lower case. 
-- mysql -u


-- Demonstrates navigating a MySQL database

-- Starts MySQL server using Docker
docker container run --name mysql -p 3306:3306 -v /workspaces/$RepositoryName:/mnt -e MYSQL_ROOT_PASSWORD=crimson -d mysql

-- Logs in, if using 'crimson' as password
mysql -h 127.0.0.1 -P 3306 -u root -p

-- Lists all databases on server
SHOW DATABASES;
