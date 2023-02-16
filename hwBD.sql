Задание 1
skypro=# SELECT * FROM employee;
id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  1 | Elena      | Petrova   | female |  23
  2 | Svetlana   | Golovina  | female |  37
  3 | Egor       | Ivanov    | male   |  34
  4 | Mila       | Sergeeva  | female |  25
  5 | Sergey     | Trofimov  | male   |  18
(5 ёЄЁюъ)

   skypro=# SELECT first_name AS имя, last_name AS фамилия
                   skypro-# FROM employee;
имя    | фамилия
----------+----------
 Elena    | Petrova
 Svetlana | Golovina
 Egor     | Ivanov
 Mila     | Sergeeva
 Sergey   | Trofimov
(5 ёЄЁюъ)

    skypro=# SELECT * FROM employee
                                      skypro-# WHERE age <30;
id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  1 | Elena      | Petrova   | female |  23
  4 | Mila       | Sergeeva  | female |  25
  5 | Sergey     | Trofimov  | male   |  18
(3 ёЄЁюъш)

   skypro=# SELECT * FROM employee
                                 skypro-# WHERE age > 50;
id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
(0 ёЄЁюъ)


skypro=# SELECT * FROM employee
skypro-# WHERE age
skypro-# BETWEEN 30 AND 50;
id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  2 | Svetlana   | Golovina  | female |  37
  3 | Egor       | Ivanov    | male   |  34
(2 ёЄЁюъш)

    skypro=# SELECT * FROM employee
                                  skypro-# ORDER BY last_name DESC;
id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  5 | Sergey     | Trofimov  | male   |  18
  4 | Mila       | Sergeeva  | female |  25
  1 | Elena      | Petrova   | female |  23
  3 | Egor       | Ivanov    | male   |  34
  2 | Svetlana   | Golovina  | female |  37
(5 ёЄЁюъ)

    skypro=# SELECT * FROM employee WHERE first_name LIKE '____';
id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  3 | Egor       | Ivanov    | male   |  34
  4 | Mila       | Sergeeva  | female |  25
(2 ёЄЁюъш)

    Задание 2

    skypro=# UPDATE employee SET first_name = 'Svetlana' WHERE id = 1;
UPDATE 1
    skypro=# UPDATE employee SET last_name = ‘Golovina ’ WHERE id=1;
UPDATE 1
    skypro=# UPDATE employee SET first_name = 'Egor' WHERE id = 5;
UPDATE 1
    skypro=# UPDATE employee SET last_name = 'Ivanov' WHERE id = 5;
UPDATE 1
    skypro=# SELECT * FROM employee;
id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  2 | Svetlana   | Golovina  | female |  37
  3 | Egor       | Ivanov    | male   |  34
  4 | Mila       | Sergeeva  | female |  25
  1 | Svetlana   | Golovina  | female |  23
  5 | Egor       | Ivanov    | male   |  18
(5 ёЄЁюъ)

    skypro=# SELECT first_name AS Имя,
                    skypro-# SUM(age) AS Суммарный_возраст
skypro-# FROM employee GROUP BY Имя;
Имя    | Суммарный_возраст
----------+-------------------
 Egor     |                52
 Svetlana |                60
 Mila     |                25
(3 ёЄЁюъш)

    skypro=# SELECT first_name, age
    skypro-# FROM employee
                      skypro-# WHERE age = (
                        skypro(# SELECT MIN(age)
                        skypro(# FROM employee
                        skypro(# );
 first_name | age
------------+-----
 Egor       |  18
(1 ёЄЁюър)


    skypro=# SELECT first_name AS Имя,
    skypro-# MAX(age) AS Максимальный_возраст
    skypro-# FROM employee
    skypro-# GROUP BY Имя
    skypro-# HAVING count(first_name) > 1
    skypro-# ORDER BY Максимальный_возраст;
    Имя    | Максимальный_возраст
----------+----------------------
    Egor     |                   34
    Svetlana |                   37
                                   (2 ёЄЁюъш)


    skypro=#

