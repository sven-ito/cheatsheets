# Name einer Table ist maximal 64 Zeichen

# MySQL Console
# mysql -h [Host] -P [Port] -u [Username] -p[Passwort]		für Windows

# MySQL Parameter auslesen
show variables like ''

# MySQL Export
SELECT id, name, email INTO OUTFILE '/tmp/result.csv'
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
ESCAPED BY ‘\\’
LINES TERMINATED BY '\n'
FROM users WHERE 1

# MySQL Dump
mysqldump -u username -pMyPassword dbname > dumpfile.sql

# Import Big Dump
mysql -u root
use myDataBaseName
source C:/dumpfile.sql		# Windows

# Prozess-Management in der DB (als Root)
show processlist;
kill [Prozess-ID];

# Funktionen - Beispiel

DELIMITER $$

CREATE DEFINER='root'@'[server]' FUNCTION 'TIME_DIFF_PREV'(dateTime DATETIME, microSeconds INT) RETURNS bigint(20)
BEGIN
SET @oldPrevDateTime := @prevDateTime;
SET @prevDateTime := dateTime;
SET @oldPrevMicroSeconds := @prevMicroSeconds;
SET @prevMicroSeconds := microSeconds;
RETURN TIME_TO_SEC(TIMEDIFF(dateTime, @oldPrevDateTime)) * 1000000 + (microSeconds - @oldPrevMicroSeconds);
END$$

# Auto Increment - letzte ID eines Inserts
SELECT LAST_INSERT_ID()

# Insert
INSERT INTO mytable (column1,column2) VALUES ('value1','value2');

# Update
UPDATE mytable SET column1='value1' WHERE column2="value2";

# Search for Date, YYYY-MM-DD
SELECT * FROM myTable WHERE date_column >= '2009-06-01';