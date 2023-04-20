-- создаём базу данных
DROP DATABASE IF EXISTS seminar_1;
CREATE DATABASE seminar_1;
USE seminar_1;

/* Задача 1
Создайте таблицу с мобильными телефонами, используя графический интерфейс. 
Заполните БД данными (поля и наполнение см. в презентации)
*/
-- создание таблицы
CREATE TABLE phone(
	phone_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY, 
	product_name VARCHAR(45) NOT NULL, 
    manufacturer VARCHAR(45) NOT NULL,
    product_count INT UNSIGNED NOT NULL,
    price INT UNSIGNED NOT NULL
);

-- наполнение нужными данными
INSERT INTO phone (product_name, manufacturer, product_count, price)
VALUES 
('iPhone X', 'Apple', 3, 76000),
('iPhone 8', 'Apple', 2, 51000),
('Galaxy S9', 'Samsung', 2, 56000),
('Galaxy S8', 'Samsung', 1, 41000),
('P20 Pro', 'Huawei', 5, 36000);
-- посмотреть все данные
SELECT product_name, manufacturer, product_count, price FROM phone; 

/* Задача 2
Выведите название, производителя и цену для товаров, количество которых превышает 2
*/
SELECT manufacturer, price FROM phone
WHERE product_count>2;

/* Задача 3
Выведите весь ассортимент товаров марки “Samsung”
*/
SELECT product_name, manufacturer, product_count, price FROM phone
WHERE manufacturer='Samsung';

/* Задача 4 (по желанию)
С помощью регулярных выражений найти:
Товары, в которых есть упоминание "Iphone"
Товары, в которых есть упоминание"Samsung"
Товары, в которых есть ЦИФРЫ
Товары, в которых есть ЦИФРА "8"
*/
-- Товары, в которых есть упоминание "Iphone"
SELECT product_name, manufacturer, product_count, price FROM phone
WHERE product_name  REGEXP "Iphone"
OR manufacturer  REGEXP "Iphone";

-- Товары, в которых есть упоминание"Samsung"
SELECT product_name, manufacturer, product_count, price FROM phone
WHERE product_name  REGEXP "Samsung"
OR manufacturer  REGEXP "Samsung";

-- Товары, в которых есть ЦИФРЫ
SELECT product_name, manufacturer, product_count, price FROM phone
WHERE product_name REGEXP '[0-9]';

-- Товары, в которых есть ЦИФРА "8"
SELECT product_name, manufacturer, product_count, price FROM phone
WHERE product_name REGEXP '8';


