-- Сформулируйте SQL запрос для создания таблицы book, занесите  его в окно кода (расположено ниже)  и отправьте на проверку (кнопка Отправить). Структура таблицы book:
-- 
-- Поле	Тип, описание
-- book_id	INT PRIMARY KEY AUTO_INCREMENT
-- title	VARCHAR(50)
-- author	VARCHAR(30)
-- price	DECIMAL(8, 2)
-- amount	INT

CREATE TABLE book(
    book_id	INT PRIMARY KEY AUTO_INCREMENT,
    title	VARCHAR(50),
    author	VARCHAR(30),
    price	DECIMAL(8, 2),
    amount	INT
);

-- Занесите новую строку в таблицу book (текстовые значения (тип VARCHAR) заключать либо в двойные, либо в одинарные кавычки):
-- 
-- book_id	title	author	price	amount
-- INT PRIMARY KEY AUTO_INCREMENT	VARCHAR(50)	VARCHAR(30)	DECIMAL(8,2)	INT
-- 1	Мастер и Маргарита	Булгаков М.А.	670.99	3

INSERT INTO book (title, author, price, amount) 
VALUES ('Мастер и Маргарита', 'Булгаков М.А.', 670.99, 3);

SELECT * FROM book

-- Занесите три последние записи в таблицуbook,  первая запись уже добавлена на предыдущем шаге:
-- 
-- book_id	title	author	price	amount
-- INT PRIMARY KEY AUTO_INCREMENT	VARCHAR(50)	VARCHAR(30)	DECIMAL(8,2)	INT
-- 1	Мастер и Маргарита	Булгаков М.А.	670.99	3
-- 2	Белая гвардия	Булгаков М.А.	540.50	5
-- 3	Идиот	Достоевский Ф.М.	460.00	10
-- 4	Братья Карамазовы	Достоевский Ф.М.	799.01	2

INSERT INTO book (title, author, price, amount) 
VALUES ('Белая гвардия', 'Булгаков М.А.', 540.50, 5);

INSERT INTO book (title, author, price, amount) 
VALUES ('Идиот', 'Достоевский Ф.М.', 460.00, 10);

INSERT INTO book (title, author, price, amount) 
VALUES ('Братья Карамазовы', 'Достоевский Ф.М.', 799.01, 2);

SELECT * FROM book
