CREATE DATABASE DUNGEONS_AND_DRAGONS; 
USE DUNGEONS_AND_DRAGONS;

CREATE TABLE female_characters (id int primary key AUTO_INCREMENT, name varchar(60), class varchar(60), race varchar(60));
INSERT INTO female_characters (name, class, race) VALUES ('Serena', 'Sorceror', 'Aasimar');
CREATE TABLE male_characters (id int primary key AUTO_INCREMENT, name varchar(60), class varchar(60), race varchar(60));
INSERT INTO male_characters (name, class, race) VALUES ('Gerhardt', 'Sorceror', 'Variant Human');

INSERT INTO female_characters (name, class, race)
SELECT name, class, race 
FROM male_characters; 
SELECT * FROM female_characters;
DROP TABLE characters;

LOCK TABLE female_characters WRITE;
INSERT INTO female_characters (name, class, race) VALUES ('Jude', 'Rogue', 'Human');
UPDATE female_characters SET name = 'Serena', class = 'Sorceror' WHERE id = 1;

UNLOCK TABLES;

UPDATE female_characters
SET 
class = 'Cleric', name = 'Blake'
WHERE
id = 1;

SELECT * FROM female_characters;
DELETE FROM female_characters WHERE name = 'Gerhardt';

CREATE VIEW test 
AS
	SELECT name
	FROM female_characters;
    
SELECT * FROM test;