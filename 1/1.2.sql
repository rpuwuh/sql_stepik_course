-- Все запросы будут формулироваться для таблицы book(создание, заполнение):
-- 
-- book_id	title	author	price	amount
-- INT PRIMARY KEY AUTO_INCREMENT	VARCHAR(50)	VARCHAR(30)	DECIMAL(8,2)	INT
-- 1	Мастер и Маргарита	Булгаков М.А.	670.99	3
-- 2	Белая гвардия	Булгаков М.А.	540.50	5
-- 3	Идиот	Достоевский Ф.М.	460.00	10
-- 4	Братья Карамазовы	Достоевский Ф.М.	799.01	2
-- 5	Стихотворения и поэмы	Есенин С.А.	650.00	15

-- Задание
-- Вывести информацию о всех книгах, хранящихся на складе.
-- 
-- Для этого: 
-- 
-- Напишите SQL запрос в окне кода; 
-- Отправьте на проверку (кнопка  Отправить); 
-- Если запрос работает неверно, исправьте его и снова отправьте на проверку.
-- Важно! В окне кода можно использовать комментарии для сохранения разных вариантов запросов или пояснений. Комментарии заключаются в /* и */
-- 
-- Результат:
-- 
-- +---------+-----------------------+------------------+--------+--------+
-- | book_id | title                 | author           | price  | amount |
-- +---------+-----------------------+------------------+--------+--------+
-- | 1       | Мастер и Маргарита    | Булгаков М.А.    | 670.99 | 3      |
-- | 2       | Белая гвардия         | Булгаков М.А.    | 540.50 | 5      |
-- | 3       | Идиот                 | Достоевский Ф.М. | 460.00 | 10     |
-- | 4       | Братья Карамазовы     | Достоевский Ф.М. | 799.01 | 2      |
-- | 5       | Стихотворения и поэмы | Есенин С.А.      | 650.00 | 15     |
-- +---------+-----------------------+------------------+--------+--------+
-- Affected rows: 5

SELECT * FROM book;

-- Выбрать авторов, название книг и их цену из таблицы book.
-- 
-- Результат:
-- 
-- +------------------+-----------------------+--------+
-- | author           | title                 | price  |
-- +------------------+-----------------------+--------+
-- | Булгаков М.А.    | Мастер и Маргарита    | 670.99 |
-- | Булгаков М.А.    | Белая гвардия         | 540.50 |
-- | Достоевский Ф.М. | Идиот                 | 460.00 |
-- | Достоевский Ф.М. | Братья Карамазовы     | 799.01 |
-- | Есенин С.А.      | Стихотворения и поэмы | 650.00 |
-- +------------------+-----------------------+--------+
-- Affected rows: 5

SELECT author, title, price FROM book;

-- Выбрать названия книг и авторов из таблицы book, для поля title задать имя(псевдоним) Название, для поля author –  Автор. 
-- 
-- Результат:
-- 
-- +-----------------------+------------------+
-- | Название              | Автор            |
-- +-----------------------+------------------+
-- | Мастер и Маргарита    | Булгаков М.А.    |
-- | Белая гвардия         | Булгаков М.А.    |
-- | Идиот                 | Достоевский Ф.М. |
-- | Братья Карамазовы     | Достоевский Ф.М. |
-- | Стихотворения и поэмы | Есенин С.А.      |
-- +-----------------------+------------------+
-- Affected rows: 5

SELECT title AS Название, author AS Автор
FROM book;

-- Для упаковки каждой книги требуется один лист бумаги, цена которого 1 рубль 65 копеек. Посчитать стоимость упаковки для каждой книги (сколько денег потребуется, чтобы упаковать все экземпляры книги). В запросе вывести название книги, ее количество и стоимость упаковки, последний столбец назвать pack. 
-- 
-- Результат:
-- 
-- +-----------------------+--------+-------+
-- | title                 | amount | pack  |
-- +-----------------------+--------+-------+
-- | Мастер и Маргарита    | 3      | 4.95  |
-- | Белая гвардия         | 5      | 8.25  |
-- | Идиот                 | 10     | 16.50 |
-- | Братья Карамазовы     | 2      | 3.30  |
-- | Стихотворения и поэмы | 15     | 24.75 |
-- +-----------------------+--------+-------+
-- Affected rows: 5

SELECT title, amount, 
     1.65 * amount AS pack
FROM book;

-- В конце года цену каждой книги на складе пересчитывают – снижают ее на 30%. Написать SQL запрос, который из таблицы book выбирает названия, авторов, количества и вычисляет новые цены книг. Столбец с новой ценой назвать new_price, цену округлить до 2-х знаков после запятой.
-- 
-- Результат:
-- 
-- +-----------------------+------------------+--------+-----------+
-- | title                 | author           | amount | new_price |
-- +-----------------------+------------------+--------+-----------+
-- | Мастер и Маргарита    | Булгаков М.А.    | 3      | 469.69    |
-- | Белая гвардия         | Булгаков М.А.    | 5      | 378.35    |
-- | Идиот                 | Достоевский Ф.М. | 10     | 322.00    |
-- | Братья Карамазовы     | Достоевский Ф.М. | 2      | 559.31    |
-- | Стихотворения и поэмы | Есенин С.А.      | 15     | 455.00    |
-- +-----------------------+------------------+--------+-----------+

SELECT title, author, amount,
    ROUND((price * 70)/(100), 2) AS new_price
FROM book;

-- При анализе продаж книг выяснилось, что наибольшей популярностью пользуются книги Михаила Булгакова, на втором месте книги Сергея Есенина. Исходя из этого решили поднять цену книг Булгакова на 10%, а цену книг Есенина - на 5%. Написать запрос, куда включить автора, название книги и новую цену, последний столбец назвать new_price. Значение округлить до двух знаков после запятой.
-- 
-- Пояснение
-- фамилию автора задавать с инициалами (как занесено в таблице), заключая в одинарные или двойные кавычки;
-- для сравнения на равенство использовать знак =, например author = "Булгаков М.А.".
-- Результат:
-- 
-- +------------------+-----------------------+-----------+
-- | author           | title                 | new_price |
-- +------------------+-----------------------+-----------+
-- | Булгаков М.А.    | Мастер и Маргарита    | 738.09    |
-- | Булгаков М.А.    | Белая гвардия         | 594.55    |
-- | Достоевский Ф.М. | Идиот                 | 460.00    |
-- | Достоевский Ф.М. | Братья Карамазовы     | 799.01    |
-- | Есенин С.А.      | Стихотворения и поэмы | 682.50    |
-- +------------------+-----------------------+-----------+

SELECT author, title,  
    ROUND (IF (author = "Булгаков М.А.", (price * 110) / (100) ,
              IF (author = "Есенин С.А.", (price * 105) / (100), price))
    ,2) AS new_price
FROM book;

-- Вывести автора, название  и цены тех книг, количество которых меньше 10.
-- 
-- Результат:
-- 
-- +------------------+--------------------+--------+
-- | author           | title              | price  |
-- +------------------+--------------------+--------+
-- | Булгаков М.А.    | Мастер и Маргарита | 670.99 |
-- | Булгаков М.А.    | Белая гвардия      | 540.50 |
-- | Достоевский Ф.М. | Братья Карамазовы  | 799.01 |
-- +------------------+--------------------+--------+

SELECT author, title, price
FROM book
WHERE amount < 10;

-- Вывести название, автора,  цену  и количество всех книг, цена которых меньше 500 или больше 600, а стоимость всех экземпляров этих книг больше или равна 5000.
-- 
--  Результат:
-- 
-- +-----------------------+-------------+--------+--------+
-- | title                 | author      | price  | amount |
-- +-----------------------+-------------+--------+--------+
-- | Стихотворения и поэмы | Есенин С.А. | 650.00 | 15     |
-- +-----------------------+-------------+--------+--------+

SELECT title, author, price, amount
FROM book
WHERE (price < 500 OR price > 600) AND price * amount >= 5000;

-- Вывести название и авторов тех книг, цены которых принадлежат интервалу от 540.50 до 800 (включая границы),  а количество или 2, или 3, или 5, или 7 .
-- 
-- Результат:
-- 
-- +--------------------+------------------+
-- | title              | author           |
-- +--------------------+------------------+
-- | Мастер и Маргарита | Булгаков М.А.    |
-- | Белая гвардия      | Булгаков М.А.    |
-- | Братья Карамазовы  | Достоевский Ф.М. |
-- +--------------------+------------------+

SELECT title, author 
FROM book
WHERE (price BETWEEN 540.50 AND 800) AND (amount IN (2, 3, 5, 7));

-- Вывести  автора и название  книг, количество которых принадлежит интервалу от 2 до 14 (включая границы). Информацию  отсортировать сначала по авторам (в обратном алфавитном порядке), а затем по названиям книг (по алфавиту).
-- 
-- Результат:
-- 
-- +------------------+--------------------+
-- | author           | title              |
-- +------------------+--------------------+
-- | Достоевский Ф.М. | Братья Карамазовы  |
-- | Достоевский Ф.М. | Идиот              |
-- | Булгаков М.А.    | Белая гвардия      |
-- | Булгаков М.А.    | Мастер и Маргарита |
-- +------------------+--------------------+

SELECT author, title
FROM book
WHERE amount BETWEEN 2 AND 14
ORDER BY author DESC, title ASC;

--Вывести название и автора тех книг, название которых состоит из двух и более слов, а инициалы автора содержат букву «С». Считать, что в названии слова отделяются друг от друга пробелами и не содержат знаков препинания, между фамилией автора и инициалами обязателен пробел, инициалы записываются без пробела в формате: буква, точка, буква, точка. Информацию отсортировать по названию книги в алфавитном порядке.
--
--Результат:
--
--+-----------------------+-------------+
--| title                 | author      |
--+-----------------------+-------------+
--| Капитанская дочка     | Пушкин А.С. |
--| Стихотворения и поэмы | Есенин С.А. |
--+-----------------------+-------------+

SELECT    title, author
FROM    book 
WHERE    title LIKE "_% _%"
    AND author LIKE "%С.%"
ORDER BY author DESC

-- Придумайте один или несколько запросов к нашей таблице book. Проверьте, правильно ли они работают.
-- 
-- При желании можно формулировку запросов  разместить в комментариях.
-- 
-- Размещенные задания можно использовать для закрепления материала урока.
-- 
-- Оценивайте понравившиеся Вам запросы.
-- 
-- В последнем модуле создан отдельный урок, в котором мы разместим запросы, набравшие наибольшее количество лайков. 
-- 
-- Структура и наполнение таблицы book:
-- 
-- book_id	title	author	price	amount
-- INT PRIMARY KEY AUTO_INCREMENT	VARCHAR(50)	VARCHAR(30)	DECIMAL(8,2)	INT
-- 1	Мастер и Маргарита	Булгаков М.А.	670.99	3
-- 2	Белая гвардия	Булгаков М.А.	540.50	5
-- 3	Идиот	Достоевский Ф.М.	460.00	10
-- 4	Братья Карамазовы	Достоевский Ф.М.	799.01	2
-- 5	Стихотворения и поэмы	Есенин С.А.	650.00	15

-- Магазин счёл, что классика уже не пользуется популярностью, поэтому необходимо в выборке:
-- 
-- 1. Сменить всех авторов на "Донцова Дарья".
-- 
-- 2. К названию каждой книги в начале дописать "Евлампия Романова и".
-- 
-- 3. Цену поднять на 42%.
-- 
-- 4. Отсортировать по убыванию цены и убыванию названия.
-- 
-- Query result:
-- +---------------+-------------------------------------------+---------+
-- | author        | title                                     | price   |
-- +---------------+-------------------------------------------+---------+
-- | Донцова Дарья | Евлампия романова и Братья Карамазовы     | 1134.59 |
-- | Донцова Дарья | Евлампия романова и Мастер и Маргарита    | 952.81  |
-- | Донцова Дарья | Евлампия романова и Стихотворения и поэмы | 923.00  |
-- | Донцова Дарья | Евлампия романова и Белая гвардия         | 767.51  |
-- | Донцова Дарья | Евлампия романова и Идиот                 | 653.20  |
-- +---------------+-------------------------------------------+---------+

SELECT   "Донцова Дарья" AS author,
    CONCAT('Евлампия романова и ', title)  AS title,
    ROUND ((price * 142) / (100), 2) AS price
FROM    book 
ORDER BY price DESC, title DESC
