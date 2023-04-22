-- создаём базу данных
DROP DATABASE IF EXISTS seminar_2;
CREATE DATABASE seminar_2;
USE seminar_2;

/* Задача 1
Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными.
*/
-- создание таблицы
CREATE TABLE sales(
	id SERIAL PRIMARY KEY, 
	order_date DATE NOT NULL, 
    count_product INT UNSIGNED NOT NULL
);

-- наполнение нужными данными
INSERT INTO sales (order_date, count_product)
VALUES 
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341);
-- посмотреть все данные
SELECT id, order_date, count_product FROM sales; 

/* Задача 2
Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва : 
меньше 100 - Маленький заказ; 
от 100 до 300 - Средний заказ; 
больше 300 - Большой заказ.
*/
SELECT id AS 'id заказа',
	CASE 
		WHEN count_product < 100 THEN 'Маленький заказ'
		WHEN count_product BETWEEN 100 AND 300 THEN 'Средний заказ'
		WHEN count_product > 300 THEN 'Большой заказ'
		ELSE 'Не определено'
	END AS 'Тип заказа'	
FROM sales;

/* Задача 3
Создайте таблицу “orders”, заполните ее значениями. Выберите все заказы. 
В зависимости от поля order_status выведите столбец full_order_status: 
OPEN – «Order is in open state» ; 
CLOSED - «Order is closed»; 
CANCELLED - «Order is cancelled»
*/
-- создание таблицы
CREATE TABLE orders(
	id SERIAL PRIMARY KEY, 
	employee_id VARCHAR(10) NOT NULL, 
	amount FLOAT (8,2) NOT NULL,
	order_status VARCHAR(30) NOT NULL
);

-- наполнение нужными данными
INSERT INTO orders (employee_id, amount, order_status)
VALUES 
('e03', 15, 'OPEN'),
('e01', 25.5, 'OPEN'),
('e05', 100.7, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.5, 'CANCELLED');

-- вывод запроса
SELECT id, employee_id, amount, order_status,
	CASE order_status 
		WHEN 'OPEN' THEN 'Order is in open state'
		WHEN 'CLOSED' THEN 'Order is closed'
		WHEN 'CANCELLED' THEN 'Order is cancelled'
		ELSE 'unknown'
	END AS 'full_order_status'	
FROM orders;

/* Задача 4
Чем NULL отличается от 0?

Ответ:
NULL – это отсутствие какого либо значения, 
0 – это значение равное нулю, то есть значение задано и оно равняется нулю.
*/
