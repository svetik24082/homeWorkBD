Задание
1
skypro=#
SELECT *
FROM employee;
id
| first_name | last_name | gender | age
----+------------+-----------+--------+-----
  1 | Elena      | Petrova   | female |  23
  2 | Svetlana   | Golovina  | female |  37
  3 | Egor       | Ivanov    | male   |  34
  4 | Mila       | Sergeeva  | female |  25
  5 | Sergey     | Trofimov  | male   |  18
(5 ёЄЁюъ)

   skypro=#
SELECT first_name AS имя,
       last_name  AS фамилия
    skypro-#
FROM employee;
имя
| фамилия
----------+----------
 Elena    | Petrova
 Svetlana | Golovina
 Egor     | Ivanov
 Mila     | Sergeeva
 Sergey   | Trofimov
(5 ёЄЁюъ)

    skypro=#
SELECT *
FROM employee skypro-#
WHERE age <30;
id
| first_name | last_name | gender | age
----+------------+-----------+--------+-----
  1 | Elena      | Petrova   | female |  23
  4 | Mila       | Sergeeva  | female |  25
  5 | Sergey     | Trofimov  | male   |  18
(3 ёЄЁюъш)

   skypro=#
SELECT *
FROM employee skypro-#
WHERE age > 50;
id
| first_name | last_name | gender | age
----+------------+-----------+--------+-----
(0 ёЄЁюъ)


skypro=#
SELECT *
FROM employee skypro-#
WHERE age
    skypro-# BETWEEN 30
  AND 50;
id
| first_name | last_name | gender | age
----+------------+-----------+--------+-----
  2 | Svetlana   | Golovina  | female |  37
  3 | Egor       | Ivanov    | male   |  34
(2 ёЄЁюъш)

    skypro=#
SELECT *
FROM employee skypro-#
ORDER BY last_name DESC;
id
| first_name | last_name | gender | age
----+------------+-----------+--------+-----
  5 | Sergey     | Trofimov  | male   |  18
  4 | Mila       | Sergeeva  | female |  25
  1 | Elena      | Petrova   | female |  23
  3 | Egor       | Ivanov    | male   |  34
  2 | Svetlana   | Golovina  | female |  37
(5 ёЄЁюъ)

    skypro=#
SELECT *
FROM employee
WHERE first_name LIKE '____';
id
| first_name | last_name | gender | age
----+------------+-----------+--------+-----
  3 | Egor       | Ivanov    | male   |  34
  4 | Mila       | Sergeeva  | female |  25
(2 ёЄЁюъш)

    Задание 2

    skypro=#
UPDATE employee
SET first_name = 'Svetlana'
WHERE id = 1;
UPDATE 1
    skypro=#
UPDATE employee
SET last_name = ‘Golovina ’
WHERE id = 1;
UPDATE 1
    skypro=#
UPDATE employee
SET first_name = 'Egor'
WHERE id = 5;
UPDATE 1
    skypro=#
UPDATE employee
SET last_name = 'Ivanov'
WHERE id = 5;
UPDATE 1
    skypro=#
SELECT *
FROM employee;
id
| first_name | last_name | gender | age
----+------------+-----------+--------+-----
  2 | Svetlana   | Golovina  | female |  37
  3 | Egor       | Ivanov    | male   |  34
  4 | Mila       | Sergeeva  | female |  25
  1 | Svetlana   | Golovina  | female |  23
  5 | Egor       | Ivanov    | male   |  18
(5 ёЄЁюъ)

    skypro=#
SELECT first_name AS Имя,
       skypro - # SUM(age) AS Суммарный_возраст
skypro-#
FROM employee
GROUP BY Имя;
Имя
| Суммарный_возраст
----------+-------------------
 Egor     |                52
 Svetlana |                60
 Mila     |                25
(3 ёЄЁюъш)

    skypro=#
SELECT first_name,
       age
           skypro-#
FROM employee skypro-#
WHERE age = (
    skypro(# SELECT MIN (age)
    skypro(# FROM employee
    skypro(# )
    ;
    first_name | age
------------+-----
    Egor | 18
    (1 ёЄЁюър)
    skypro=# SELECT first_name AS Имя
    , skypro-# MAX (age) AS Максимальный_возраст
    skypro-# FROM employee
    skypro-# GROUP BY Имя
    skypro-# HAVING count (first_name)
    > 1
    skypro-# ORDER BY Максимальный_возраст
    ;
    Имя | Максимальный_возраст
----------+----------------------
    Egor | 34
    Svetlana | 37
    (2 ёЄЁюъш)
    skypro=#

    ########################
    Домашнее задание N 3


    skypro=# CREATE TABLE city(
    skypro(# city_id BIGSERIAL NOT NULL PRIMARY KEY
    , skypro(# city_name VARCHAR (60)
    skypro(# )
    ;
    CREATE TABLE
    skypro=# CREATE TABLE employee(
    skypro(# id BIGSERIAL NOT NULL PRIMARY KEY
    , skypro(# first_name VARCHAR (50) NOT NULL
    , skypro(# last_name VARCHAR (50) NOT NULL
    , skypro(# gender VARCHAR (15) NOT NULL
    , skypro(# age INT NOT NULL
    , skypro(# city_id INT NOT NULL
    , skypro(# FOREIGN KEY (city_id) REFERENCES city (city_id)
    skypro(# )
    ;
    CREATE TABLE
    skypro=# INSERT INTO city(
    skypro(# city_name)
    skypro-# VALUES ('Екатеринбург')
    ;
    INSERT 0 1
    skypro=# SELECT * FROM city
    ;
    city_id | city_name
---------+--------------
    1 | Екатеринбург
    (1 ёЄЁюър)
    skypro=# INSERT INTO city(
    skypro(# city_name)
    skypro-# VALUES ('Москва')
    ;
    INSERT 0 1
    skypro=# INSERT INTO city(
    skypro(# city_name)
    skypro-# VALUES ('Самара')
    ;
    INSERT 0 1
    skypro=# INSERT INTO city(
    skypro(# city_name)
    skypro-# VALUES ('Киров ')
    ;
    INSERT 0 1
    skypro=# INSERT INTO city(
    skypro(# city_name)
    skypro-# VALUES ('Челябинск ')
    ;
    INSERT 0 1
    skypro=# SELECT * FROM city
    ;
    city_id | city_name
---------+--------------
    1 | Екатеринбург
    2 | Москва
    3 | Самара
    4 | Киров
    5 | Челябинск
    (5 ёЄЁюъ)
    skypro=# INSERT INTO employee(
    skypro(# first_name
    , last_name
    , gender
    , age
    , city_id)
    skypro-# VALUES (‘Svetlana’, ‘Golovina’, ‘female’, 37, 1);
INSERT 0 1
skypro=# SELECT * FROM employee;
 id | first_name | last_name | gender | age | city_id
----+------------+-----------+--------+-----+---------
  1 | Svetlana   | Golovina  | female |  37 |       1
(1 ёЄЁюър)


skypro=# INSERT INTO employee(
skypro(# first_name,last_name,gender, age, city_id)
skypro-# VALUES (‘Egor’, ‘Ivanov’, ‘male’, 34, 2);
INSERT 0 1
skypro=# INSERT INTO employee(
skypro(# first_name,last_name,gender, age, city_id)
skypro-# VALUES (‘Elena’, ‘Petrova’, ‘female’, 23, 3);
INSERT 0 1
skypro=# INSERT INTO employee(
skypro(# first_name,last_name,gender, age, city_id)
skypro-# VALUES (‘Marina', 'Makeeva',‘female’,39, 4);
INSERT 0 1
skypro=# INSERT INTO employee(
skypro(# first_name,last_name,gender, age, city_id)
skypro-# VALUES (‘Andrey', 'Bykov', ‘male’, 30, 5);
INSERT 0 1
skypro=# SELECT * FROM employee;
 id | first_name | last_name | gender | age | city_id
----+------------+-----------+--------+-----+---------
  1 | Svetlana   | Golovina  | female |  37 |       1
  2 | Egor       | Ivanov    | male   |  34 |       2
  3 | Elena      | Petrova   | female |  23 |       3
  4 | Marina     | Makeeva   | female |  39 |       4
  5 | Andrey     | Bykov     | male   |  30 |       5

      skypro=# SELECT first_name,last_name, city_name
skypro-# FROM city
skypro-# INNER JOIN employee
skypro-# ON city.city_id=employee.city_id;
 first_name | last_name |  city_name
------------+-----------+--------------
 Svetlana   | Golovina  | Екатеринбург
 Egor       | Ivanov    | Москва
 Elena      | Petrova   | Самара
 Marina     | Makeeva   | Киров
 Andrey     | Bykov     | Челябинск
(5 ёЄЁюъ)

     skypro=# INSERT INTO city(
skypro(# city_name)
skypro-# VALUES ( 'Саратов');
INSERT 0 1
skypro=# INSERT INTO employee(
skypro(# first_name,last_name,gender, age, city_id)
skypro-# VALUES ('Michail', 'Sergeev', 'male', 22 , 3);
INSERT 0 1
skypro=# SELECT city_name,first_name,last_name
skypro-# FROM city
skypro-# LEFT JOIN employee
skypro-# ON city.city_id=employee.city_id;
  city_name   | first_name | last_name
--------------+------------+-----------
 Екатеринбург | Svetlana   | Golovina
 Москва       | Egor       | Ivanov
 Самара       | Elena      | Petrova
 Киров        | Marina     | Makeeva
 Челябинск    | Andrey     | Bykov
 Самара       | Michail    | Sergeev
 Саратов      |            |
(7 ёЄЁюъ)



skypro=# SELECT first_name,last_name, city_name
skypro-# FROM city
skypro-# FULL JOIN employee
skypro-# ON city.city_id=employee.city_id;
 first_name | last_name |  city_name
------------+-----------+--------------
 Svetlana   | Golovina  | Екатеринбург
 Egor       | Ivanov    | Москва
 Elena      | Petrova   | Самара
 Marina     | Makeeva   | Киров
 Andrey     | Bykov     | Челябинск
 Michail    | Sergeev   | Самара
            |           | Саратов
(7 ёЄЁюъ)


   skypro=# SELECT city_name,first_name,last_name
skypro-# FROM city
skypro-# CROSS JOIN employee
skypro-# ;
  city_name   | first_name | last_name
--------------+------------+-----------
 Екатеринбург | Svetlana   | Golovina
 Екатеринбург | Egor       | Ivanov
 Екатеринбург | Elena      | Petrova
 Екатеринбург | Marina     | Makeeva
 Екатеринбург | Andrey     | Bykov
 Екатеринбург | Michail    | Sergeev
 Москва       | Svetlana   | Golovina
 Москва       | Egor       | Ivanov
 Москва       | Elena      | Petrova
 Москва       | Marina     | Makeeva
 Москва       | Andrey     | Bykov
 Москва       | Michail    | Sergeev
 Самара       | Svetlana   | Golovina
 Самара       | Egor       | Ivanov
 Самара       | Elena      | Petrova
 Самара       | Marina     | Makeeva
 Самара       | Andrey     | Bykov
 Самара       | Michail    | Sergeev
 Киров        | Svetlana   | Golovina
 Киров        | Egor       | Ivanov
 Киров        | Elena      | Petrova
 Киров        | Marina     | Makeeva
 Киров        | Andrey     | Bykov
 Киров        | Michail    | Sergeev
 Челябинск    | Svetlana   | Golovina
 Челябинск    | Egor       | Ivanov
 Челябинск    | Elena      | Petrova
-- Далее  --

