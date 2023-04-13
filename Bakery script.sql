CREATE DATABASE Bakery;

USE Bakery;
CREATE TABLE Sweet (
    id INT NOT NULL,
    item_name VARCHAR(50) NOT NULL,
    price FLOAT(2)
);

CREATE TABLE Savoury (
    id INT NOT NULL,
    item_name VARCHAR(50) NOT NULL,
    price FLOAT(2),
    main_ingredient VARCHAR(50)
);

-- Populate the Sweet table
INSERT INTO Sweet
(id, item_name, price)
VALUES
(1, 'doughnut', 0.50),
(2, 'croissant', 0.75),
(3, 'painauchocolat', 0.55),
(4, 'cinnamon twirl', 0.45),
(5, 'cannoli', 0.88),
(6, 'apple tart', 1.12);

INSERT INTO Savoury
(id, item_name, price, main_ingredient)
VALUES
(1, 'meat pie', 1.25, 'pork'),
(2, 'sausage roll', 1.00, null),
(3, 'pasty', 2.45, 'beef');

SELECT * FROM Sweet;
DROP TABLE Savoury;
INSERT INTO Sweet(id, item_name, price) SELECT id,item_name,price FROM Savoury WHERE item_name like 'm%';

SELECT DISTINCT n.item_name FROM Sweet n;
SELECT m.main_ingredient FROM Savoury m WHERE m.item_name = 'bread';

-- COMPARATORS
SELECT item_name FROM Savoury WHERE main_ingredient = 'Pork' OR main_ingredient = 'Beef';
SELECT item_name FROM Sweet WHERE price < 0.50;
SELECT item_name, price FROM Sweet WHERE item_name != 'cannoli';
SELECT item_name FROM Sweet WHERE item_name LIKE 'C%';
SELECT item_name FROM Savoury WHERE price BETWEEN 1.01 AND 2.99;
SELECT item_name FROM Savoury WHERE price > 1 AND price < 3;
SELECT SUM(p.price) FROM Sweet p;

SELECT * FROM Sweet;


-- CREATE PROCEDURES --

DELIMITER //

CREATE PROCEDURE InsertValue(id INT, item_name varchar(20), price float)

BEGIN 
	INSERT INTO Sweet (id, item_name, price) VALUES (id, item_name, price);
END //

DELIMITER ;

CALL InsertValue(7, 'Banana bread', 1.80);


CREATE or REPLACE VIEW swett_3
AS
SELECT id,item_name, price
FROM Sweet WHERE item_name LIKE 'c%';

SELECT * FROM Sweet;

INSERT INTO swett_3(id,item_name, price) VALUES (9,'crisps', 1.50);