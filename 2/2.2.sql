-- Вывести название, жанр и цену тех книг, количество которых больше 8,
-- в отсортированном по убыванию цены виде.

SELECT title, name_genre, price
FROM 
    book JOIN genre JOIN author
    ON genre.genre_id = book.genre_id
    AND author.author_id = book.author_id
    AND book.amount > 8
ORDER BY book.price DESC
;

-- Вывести все жанры, которые не представлены в книгах на складе.

SELECT name_genre
FROM genre LEFT JOIN book
     ON  book.genre_id = genre.genre_id
WHERE  book.book_id IS NULL
      AND book.title IS NULL
      AND book.author_id IS NULL
      AND book.price IS NULL
      AND book.amount IS NULL
;

-- Есть список городов, хранящийся в таблице city:
-- 
-- city_id	name_city
-- 1	    Москва
-- 2	    Санкт-Петербург
-- 3	    Владивосток
-- Необходимо в каждом городе провести выставку книг каждого автора
-- в течение 2020 года. Дату проведения выставки выбрать случайным образом.
-- Создать запрос, который выведет город, автора и дату проведения выставки.
-- Последний столбец назвать Дата. Информацию вывести, отсортировав сначала
-- в алфавитном порядке по названиям городов, а потом по убыванию дат проведения выставок.

SELECT name_city, name_author,
    DATE_ADD('2020-01-01', INTERVAL (FLOOR(RAND() * 365)) DAY) AS Дата
FROM 
    city
    CROSS JOIN author
ORDER BY name_city, 3 DESC;


-- Вывести информацию о книгах (жанр, книга, автор),
-- относящихся к жанру, включающему слово «роман»
-- в отсортированном по названиям книг виде.

SELECT name_genre, title, name_author
FROM
    author 
    INNER JOIN  book ON author.author_id = book.author_id
    INNER JOIN genre ON genre.genre_id = book.genre_id
WHERE genre.name_genre LIKE '%роман%'
ORDER BY title
;