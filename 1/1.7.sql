-- Структура и наполнение таблиц
-- В таблице fine  представлена информация о начисленных водителям штрафах за нарушения правил дорожного движения (ПДД)
-- (фамилия водителя, номер машины, описание нарушения, сумма штрафа, дата совершения нарушения и дата оплаты штрафа):
-- 
-- fine_id	name	number_plate	violation	sum_fine	date_violation	date_payment
-- INT PRIMARY KEY
-- AUTO_INCREMENT	VARCHAR(30)	    VARCHAR(6)	VARCHAR(50)	                        DECIMAL(8,2)	DATЕ	    DATE
-- 1	            Баранов П.Е.	Р523ВТ	    Превышение скорости (от 40 до 60)	500.00	        2020-01-12	2020-01-17
-- 2	            Абрамова К.А.	О111АВ	    Проезд на запрещающий сигнал	    1000.00	        2020-01-14	2020-02-27
-- 3	            Яковлев Г.Р.	Т330ТТ	    Превышение скорости (от 20 до 40)	500.00	        2020-01-23	2020-02-23
-- 4	            Яковлев Г.Р.	М701АА	    Превышение скорости (от 20 до 40)	                2020-01-12	 
-- 5	            Колесов С.П.	К892АХ	    Превышение скорости (от 20 до 40)	                2020-02-01	 
-- 6	            Баранов П.Е.	Р523ВТ	    Превышение скорости (от 40 до 60)	                2020-02-14	 
-- 7	            Абрамова К.А.	О111АВ	    Проезд на запрещающий сигнал	 	                2020-02-23	 
-- 8	            Яковлев Г.Р.	Т330ТТ	    Проезд на запрещающий сигнал	 	                2020-03-03	 
-- 
-- В таблицу  traffic_violation занесены нарушения ПДД и соответствующие штрафы (в рублях): 
-- 
-- violation_id	violation	sum_fine
-- INT PRIMARY KEY
-- AUTO_INCREMENT	VARCHAR(50)	                       DECIMAL(8,2)
-- 1	            Превышение скорости (от 20 до 40)  500.00
-- 2	            Превышение скорости (от 40 до 60)  1000.00
-- 3	            Проезд на запрещающий сигнал	   1000.00

-- Создать таблицу fine следующей структуры:
-- 
-- Поле	Описание
-- fine_id	ключевой столбец целого типа с автоматическим увеличением значения ключа на 1
-- name	строка длиной 30
-- number_plate	строка длиной 6
-- violation	строка длиной 50
-- sum_fine	вещественное число, максимальная длина 8, количество знаков после запятой 2
-- date_violation	дата
-- date_payment	дата

CREATE TABLE fine (
    fine_id         INT PRIMARY KEY AUTO_INCREMENT,
    name            VARCHAR(30),
    number_plate    VARCHAR(6),
    violation       VARCHAR(50),
    sum_fine        DECIMAL(8, 2),
    date_violation  DATE,
    date_payment    DATE
);

-- В таблицу fine первые 5 строк уже занесены. Добавить в таблицу записи с ключевыми значениями 6, 7, 8.
-- 
-- fine_id	name	        number_plate	violation	                        sum_fine	date_violation	date_payment
-- 1	    Баранов П.Е.	Р523ВТ	        Превышение скорости (от 40 до 60)	500.00	    2020-01-12	    2020-01-17
-- 2	    Абрамова К.А.	О111АВ	        Проезд на запрещающий сигнал	    1000.00	    2020-01-14	    2020-02-27
-- 3	    Яковлев Г.Р.	Т330ТТ	        Превышение скорости (от 20 до 40)	500.00	    2020-01-23	    2020-02-23
-- 4	    Яковлев Г.Р.	М701АА	        Превышение скорости (от 20 до 40)	    	    2020-01-12	 
-- 5	    Колесов С.П.	К892АХ	        Превышение скорости (от 20 до 40)	    	    2020-02-01	 
-- 6	    Баранов П.Е.	Р523ВТ	        Превышение скорости (от 40 до 60)	    	    2020-02-14	 
-- 7	    Абрамова К.А.	О111АВ	        Проезд на запрещающий сигнал	 	            2020-02-23	 
-- 8	    Яковлев Г.Р.	Т330ТТ	        Проезд на запрещающий сигнал	 	            2020-03-03	 

INSERT INTO fine (name, number_plate, violation, date_violation)
VALUES
    ('Баранов П.Е.', 'Р523ВТ', 'Превышение скорости(от 40 до 60)', '2020-02-14'),
    ('Абрамова К.А.', 'О111АВ', 'Проезд на запрещающий сигнал', 	'2020-02-23'),
    ('Яковлев Г.Р.', 'Т330ТТ', 'Проезд на запрещающий сигнал', 	'2020-03-03');

-- Занести в таблицу fine суммы штрафов, которые должен оплатить водитель,
-- в соответствии с данными из таблицы traffic_violation.
-- При этом суммы заносить только в пустые поля столбца  sum_fine.
-- 
-- Таблица traffic_violationсоздана и заполнена.
-- 
-- Важно! Сравнение значения столбца с пустым значением осуществляется с помощью оператора IS NULL.

UPDATE  fine, traffic_violation
SET     fine.sum_fine = traffic_violation.sum_fine
WHERE   
    fine.violation = traffic_violation.violation
    AND fine.sum_fine is NULL
;

-- Вывести фамилию, номер машины и нарушение только для тех водителей,
-- которые на одной машине нарушили одно и то же правило два и более раз.
-- При этом учитывать все нарушения, независимо от того оплачены они или нет.
-- Информацию отсортировать в алфавитном порядке, сначала по фамилии водителя,
-- потом по номеру машины и, наконец, по нарушению.

SELECT name, number_plate, violation
FROM fine
GROUP BY name, number_plate, violation
HAVING count(*) >= 2
ORDER BY name ASC,
         number_plate ASC,
         violation ASC
;

-- В таблице fine увеличить в два раза сумму неоплаченных штрафов
-- для отобранных на предыдущем шаге записей. 

UPDATE fine,
(    SELECT name, number_plate, violation
        FROM fine
        GROUP BY name, number_plate, violation
        HAVING count(*) >= 2
        ORDER BY name ASC,
            number_plate ASC,
            violation ASC
) query_in
SET 
    fine.sum_fine = fine.sum_fine * 2
WHERE
    fine.name = query_in.name
    AND fine.number_plate = query_in.number_plate
    AND fine.violation = query_in.violation
    AND fine.date_payment is NULL
;

-- Водители оплачивают свои штрафы. В таблице payment занесены даты их оплаты:
-- 
-- payment_id	name	        number_plate    violation	                        date_violation	date_payment
-- 1	        Яковлев Г.Р.	М701АА	        Превышение скорости (от 20 до 40)	2020-01-12	    2020-01-22
-- 2	        Баранов П.Е.	Р523ВТ	        Превышение скорости (от 40 до 60)	2020-02-14	    2020-03-06
-- 3	        Яковлев Г.Р.	Т330ТТ	        Проезд на запрещающий сигнал	    2020-03-03	    2020-03-23
-- Необходимо:
-- 
-- в таблицу fine занести дату оплаты соответствующего штрафа из таблицы payment; 
-- уменьшить начисленный штраф в таблице fine в два раза  (только для тех штрафов,
-- информация о которых занесена в таблицу payment),
-- если оплата произведена не позднее 20 дней со дня нарушения.

UPDATE fine f, payment p
SET 
    f.date_payment = p.date_payment,
    f.sum_fine = IF (DATEDIFF(p.date_payment, p.date_violation) < 21, f.sum_fine/2, f.sum_fine)
WHERE
    f.name = p.name
    AND f.number_plate = p.number_plate
    AND f.violation = p.violation
    AND f.date_payment is NULL
;

-- Создать новую таблицу back_payment, куда внести информацию
-- о неоплаченных штрафах
-- (Фамилию и инициалы водителя, номер машины, нарушение, сумму штрафа 
-- и дату нарушения) из таблицы fine.
-- 
-- Пояснение
-- Важно.
-- На этом шаге необходимо создать таблицу на основе запроса!
-- Не нужно одним запросом создавать таблицу, а вторым в нее добавлять строки.

CREATE TABLE back_payment AS
SELECT name, number_plate, violation, sum_fine, date_violation
FROM fine
WHERE date_payment is NULL
;

-- Удалить из таблицы fine информацию о нарушениях,
-- совершенных раньше 1 февраля 2020 года.

DELETE
FROM fine
WHERE date_violation < '2020-02-01'
;
