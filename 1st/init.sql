create table if not exists subject(
	subject_id int primary key generated always as identity,
 	name_subject text
);

insert into subject(name_subject)
values ('Основы SQL'),
       ('Основы баз данных'),
       ('Физика');

create table if not exists student(
	student_id int primary key generated always as identity,
	name_student text
);

insert into student(name_student)
values ('Баранов Павел'),
       ('Абрамова Катя'),
       ('Семенов Иван'),
       ('Яковлева Галина');

create table if not exists attempt(
	attempt_id int primary key generated always as identity,
	subject_id int references subject(subject_id) on delete cascade,
	student_id int references student(student_id) on delete cascade,
	date_attempt date,
	result int
);

insert into attempt(student_id, subject_id, date_attempt, result)
values (1, 2, '2020-03-23',  67),
       (3, 1, '2020-03-23', 100),
       (4, 2, '2020-03-26',   0),
       (1, 1, '2020-04-15',  33),
       (3, 1, '2020-04-15',  67),
       (4, 2, '2020-04-21', 100),
       (3, 1, '2020-05-17',  33);

create table if not exists question(
	question_id int primary key generated always as identity,
	name_question text,
	subject_id int references subject(subject_id) on delete cascade
);

insert into question(name_question, subject_id)
values ('Запрос на выборку начинается с ключевого слова:', 1),
       ('Условие, по которому отбираются записи, задаётся после ключевого слова:', 1),
       ('Для сортировки используется:', 1),
       ('Какой запрос выбирает все записи из таблицы student:', 1),
       ('Для внутреннего соединения таблиц используется оператор:', 1),
       ('База данных - это:', 2),
       ('Отношение - это:', 2),
       ('Концептуальная модель используется для', 2),
       ('Какой тип данных не допустим в реляционной таблице?', 2);

create table if not exists answer(
	answer_id int primary key generated always as identity,
	name_answer text,
	is_correct boolean,
	question_id int references question(question_id) on delete cascade
);

insert into answer(name_answer, question_id, is_correct)
values ('UPDATE',   1, false),
       ('SELECT',   1, true),
       ('INSERT',   1, false),
       ('GROUP BY', 2, false),
       ('FROM',     2, false),
       ('WHERE',    2, true),
       ('SELECT',   2, false),
       ('SORT',     3, false),
       ('ORDER BY', 3, true),
       ('RANG BY',  3, false),
       ('SELECT * FROM student', 4, true),
       ('SELECT student',        4, false),
       ('INNER JOIN',     5, true),
       ('LEFT JOIN',      5, false),
       ('RIGHT JOIN',     5, false),
       ('CROSS JOIN',     5, false),
       ('совокупность данных, организованных по определённым праилам',                                 6, true),
       ('совокупность программ для хранения и обработки больших массивов информации', 6, false),
       ('строка',  7, false),
       ('столбец', 7, false),
       ('таблица', 7, true),
       ('обобщенное представление пользователей о данных',   8, true),
       ('описание представления данных в памяти компьютера', 8, false),
       ('база данных', 8, false),
       ('file',    9, true),
       ('INT',     9, false),
       ('VARCHAR', 9, false),
       ('DATE',    9, false);

create table if not exists testing(
	testing_id int primary key generated always as identity,
	attempt_id int references attempt(attempt_id) on delete cascade,
	question_id int references question(question_id) on delete cascade,
	answer_id int references answer(answer_id) on delete cascade
);

insert into testing(attempt_id, question_id, answer_id)
values (1, 9, 25),
       (1, 7, 19),
       (1, 6, 17),
       (2, 3, 9),
       (2, 1, 2),
       (2, 4, 11),
       (3, 6, 18),
       (3, 8, 24),
       (3, 9, 28),
       (4, 1, 2),
       (4, 5, 16),
       (4, 3, 10),
       (5, 2, 6),
       (5, 1, 2),
       (5, 4, 12),
       (6, 6, 17),
       (6, 8, 22),
       (6, 7, 21),
       (7, 1, 3),
       (7, 4, 11),
       (7, 5, 16);

