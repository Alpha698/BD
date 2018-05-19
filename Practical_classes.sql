-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 19 2018 г., 14:27
-- Версия сервера: 5.6.37
-- Версия PHP: 7.0.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `Practical_classes`
--

-- --------------------------------------------------------

--
-- Структура таблицы `audience`
--

CREATE TABLE `audience` (
  `number_aud` int(5) NOT NULL,
  `quantity_seats` int(5) NOT NULL,
  `housing` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `audience`
--

INSERT INTO `audience` (`number_aud`, `quantity_seats`, `housing`) VALUES
(101, 16, 'Административный'),
(102, 16, 'Главный'),
(123, 33, 'Главный'),
(124, 33, 'Лабораторный'),
(201, 16, 'Главный'),
(215, 33, 'Учебный'),
(216, 16, 'Главный'),
(301, 33, 'Лабораторный'),
(303, 33, 'Лабораторный'),
(323, 16, 'Учебный'),
(404, 16, 'Учебный'),
(406, 16, 'Учебный');

-- --------------------------------------------------------

--
-- Структура таблицы `day_week`
--

CREATE TABLE `day_week` (
  `id_day` int(3) NOT NULL,
  `name_day` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `day_week`
--

INSERT INTO `day_week` (`id_day`, `name_day`) VALUES
(1, 'Понедельник'),
(2, 'Вторник'),
(3, 'Среда'),
(4, 'Четверг'),
(5, 'Пятница'),
(6, 'Суббота'),
(7, 'Воскресенье');

-- --------------------------------------------------------

--
-- Структура таблицы `degree`
--

CREATE TABLE `degree` (
  `id_degree` int(25) NOT NULL,
  `name_degree` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `degree`
--

INSERT INTO `degree` (`id_degree`, `name_degree`) VALUES
(1, 'Кандидат наук'),
(2, 'Доктор наук'),
(3, 'Кандидат технических наук'),
(4, 'Доктор экономических наук');

-- --------------------------------------------------------

--
-- Структура таблицы `department`
--

CREATE TABLE `department` (
  `id_department` int(25) NOT NULL,
  `name_department` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `department`
--

INSERT INTO `department` (`id_department`, `name_department`) VALUES
(1, 'ТК'),
(2, 'ИТ'),
(3, 'БЖЭиХ'),
(4, 'ПиЭММ');

-- --------------------------------------------------------

--
-- Структура таблицы `discipline`
--

CREATE TABLE `discipline` (
  `id_discipline` int(25) NOT NULL,
  `name_discipline` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `discipline`
--

INSERT INTO `discipline` (`id_discipline`, `name_discipline`) VALUES
(1, 'Физика'),
(2, 'БД'),
(3, 'КПП'),
(4, 'ТСПП'),
(5, 'Схемотехника'),
(6, 'ООП'),
(7, 'КС'),
(8, 'Высшая математика'),
(9, 'Web программирование'),
(10, 'КГ'),
(11, 'Теория алгоритмов'),
(12, 'КПO'),
(13, 'Математический анализ'),
(14, 'ТЗИ'),
(15, 'ИЗВП'),
(16, 'Тестирование');

-- --------------------------------------------------------

--
-- Структура таблицы `faculty`
--

CREATE TABLE `faculty` (
  `id_faculty` int(25) NOT NULL,
  `name_faculty` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `faculty`
--

INSERT INTO `faculty` (`id_faculty`, `name_faculty`) VALUES
(1, 'Экономический факультет'),
(2, 'Юридический факультет'),
(3, 'Факультет воднотранспортных и шельфовых сооружений'),
(4, 'ФСИТиС'),
(5, 'Факультет портового инжиниринга'),
(6, 'Учебно-научный институт морского флота'),
(7, 'Учебно-научный институт морского бизнеса');

-- --------------------------------------------------------

--
-- Структура таблицы `form_training`
--

CREATE TABLE `form_training` (
  `id_form` int(25) NOT NULL,
  `name_form` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `form_training`
--

INSERT INTO `form_training` (`id_form`, `name_form`) VALUES
(1, 'Очная (дневная)'),
(2, 'Заочная'),
(3, 'Экстернат '),
(4, 'Очно — заочная (вечерняя)');

-- --------------------------------------------------------

--
-- Структура таблицы `number_lesson`
--

CREATE TABLE `number_lesson` (
  `id_num` int(5) NOT NULL,
  `number` int(5) NOT NULL,
  `week_start` tinyint(5) NOT NULL,
  `week_end` tinyint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `number_lesson`
--

INSERT INTO `number_lesson` (`id_num`, `number`, `week_start`, `week_end`) VALUES
(1, 1, 1, 9),
(2, 1, 3, 13),
(3, 2, 1, 13),
(4, 3, 2, 14);

-- --------------------------------------------------------

--
-- Структура таблицы `post`
--

CREATE TABLE `post` (
  `id_post` int(25) NOT NULL,
  `name_post` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `post`
--

INSERT INTO `post` (`id_post`, `name_post`) VALUES
(1, 'Аспирант'),
(2, 'Ассистент'),
(3, 'Доцент'),
(4, 'Преподаватель'),
(5, 'Профессор'),
(6, 'Старший преподаватель');

-- --------------------------------------------------------

--
-- Структура таблицы `specialty`
--

CREATE TABLE `specialty` (
  `id_specialty` int(25) NOT NULL,
  `name_specialty` varchar(50) NOT NULL,
  `id_faculty` int(5) NOT NULL,
  `id_discipline` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `specialty`
--

INSERT INTO `specialty` (`id_specialty`, `name_specialty`, `id_faculty`, `id_discipline`) VALUES
(1, 'Компьютерные науки', 4, 2),
(2, 'Судостроение', 3, 8),
(3, 'Отраслевое машиностроение', 3, 1),
(4, 'Психология', 2, 8),
(5, 'Философия', 1, 8),
(6, 'Право', 2, 8),
(7, 'Туризм', 1, 1),
(8, 'Речной и морской транспорт', 6, 1),
(9, 'Транспортные технологии', 3, 1),
(10, 'Экономика', 7, 13),
(16, 'Компьютерные науки', 4, 3),
(17, 'Компьютерные науки', 4, 4),
(18, 'Компьютерные науки', 4, 5),
(19, 'Компьютерные науки', 4, 6),
(20, 'Компьютерные науки', 4, 7),
(21, 'Компьютерные науки', 4, 9),
(22, 'Компьютерные науки', 4, 10),
(23, 'Компьютерные науки', 4, 11),
(24, 'Компьютерные науки', 4, 12),
(25, 'Компьютерные науки', 4, 14);

-- --------------------------------------------------------

--
-- Структура таблицы `sschedule`
--

CREATE TABLE `sschedule` (
  `id_schedule` int(25) NOT NULL,
  `id_group` int(25) NOT NULL,
  `number_aud` int(5) NOT NULL,
  `id_day` int(3) NOT NULL,
  `id_type` int(25) NOT NULL,
  `id_num` int(3) NOT NULL,
  `card_num` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `sschedule`
--

INSERT INTO `sschedule` (`id_schedule`, `id_group`, `number_aud`, `id_day`, `id_type`, `id_num`, `card_num`) VALUES
(1, 5, 102, 1, 1, 1, 102345),
(2, 2, 404, 1, 1, 2, 123456),
(3, 6, 123, 1, 1, 3, 123456),
(4, 13, 215, 2, 1, 4, 234565),
(5, 2, 215, 2, 1, 1, 234565),
(6, 1, 406, 3, 1, 3, 234565),
(7, 2, 201, 1, 1, 3, 512335),
(8, 11, 303, 1, 2, 3, 274561),
(9, 4, 323, 2, 1, 1, 238901),
(10, 12, 303, 2, 2, 2, 923511),
(11, 14, 102, 2, 2, 3, 512335),
(12, 11, 406, 3, 1, 1, 238901),
(13, 2, 201, 3, 1, 2, 234565),
(14, 3, 406, 3, 2, 3, 102345),
(15, 5, 124, 4, 2, 2, 666723),
(16, 1, 323, 4, 1, 3, 123456),
(17, 2, 323, 4, 1, 1, 445973);

-- --------------------------------------------------------

--
-- Структура таблицы `study_group`
--

CREATE TABLE `study_group` (
  `id_group` int(25) NOT NULL,
  `name_group` varchar(25) NOT NULL,
  `number_students` tinyint(5) NOT NULL,
  `id_specialty` int(25) NOT NULL,
  `id_form` int(25) NOT NULL,
  `date_creation` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `study_group`
--

INSERT INTO `study_group` (`id_group`, `name_group`, `number_students`, `id_specialty`, `id_form`, `date_creation`) VALUES
(1, 'К13.1', 13, 17, 1, '2018-09-01'),
(2, 'К14.2', 16, 1, 1, '2017-09-01'),
(3, 'П13.1', 12, 4, 1, '2017-09-01'),
(4, 'П13.2', 8, 4, 2, '2017-09-01'),
(5, 'К13.1', 13, 18, 1, '2018-09-01'),
(6, 'К14.1', 13, 24, 1, '2017-09-01'),
(7, 'К13.3', 13, 20, 1, '2018-09-01'),
(8, 'К13.1', 13, 16, 1, '2018-09-01'),
(9, 'К14.1', 13, 25, 1, '2017-09-01'),
(10, 'К13.3', 13, 23, 1, '2018-09-01'),
(11, 'К13.3', 16, 22, 1, '2018-09-01'),
(12, 'К13.2', 16, 25, 1, '2018-09-01'),
(13, 'К13.2', 16, 18, 1, '2018-09-01'),
(14, 'К13.2', 16, 20, 1, '2018-09-01');

-- --------------------------------------------------------

--
-- Структура таблицы `teachers`
--

CREATE TABLE `teachers` (
  `card_num` int(6) NOT NULL,
  `experience` int(3) NOT NULL,
  `FIO_teacher` varchar(25) NOT NULL,
  `id_department` int(25) NOT NULL,
  `id_post` int(25) NOT NULL,
  `id_degree` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `teachers`
--

INSERT INTO `teachers` (`card_num`, `experience`, `FIO_teacher`, `id_department`, `id_post`, `id_degree`) VALUES
(102345, 1, 'Дубощит Т.В.', 2, 2, 1),
(123456, 6, 'Толкачев И.С.', 1, 6, 3),
(234565, 4, 'Николаева Н.О.', 1, 3, 1),
(238901, 6, 'Трушникова Т.Г.', 2, 6, 3),
(274561, 6, 'Кристалов С.С.', 1, 5, 2),
(445973, 1, 'Рыбак М.И.', 2, 2, 1),
(512335, 3, 'Шибаев Д.С.', 2, 4, 1),
(666723, 4, 'Кузнецов В.И.', 1, 3, 3),
(867890, 5, 'Филинский А.В.', 1, 6, 1),
(923511, 3, 'Стуенко И.И.', 2, 4, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `type_occupation`
--

CREATE TABLE `type_occupation` (
  `id_type` int(25) NOT NULL,
  `name_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `type_occupation`
--

INSERT INTO `type_occupation` (`id_type`, `name_type`) VALUES
(1, 'Лекция'),
(2, 'Практика'),
(3, 'Модуль'),
(4, 'Экзамен'),
(5, 'Отработка');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `audience`
--
ALTER TABLE `audience`
  ADD PRIMARY KEY (`number_aud`);

--
-- Индексы таблицы `day_week`
--
ALTER TABLE `day_week`
  ADD PRIMARY KEY (`id_day`);

--
-- Индексы таблицы `degree`
--
ALTER TABLE `degree`
  ADD PRIMARY KEY (`id_degree`);

--
-- Индексы таблицы `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id_department`);

--
-- Индексы таблицы `discipline`
--
ALTER TABLE `discipline`
  ADD PRIMARY KEY (`id_discipline`);

--
-- Индексы таблицы `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`id_faculty`);

--
-- Индексы таблицы `form_training`
--
ALTER TABLE `form_training`
  ADD PRIMARY KEY (`id_form`);

--
-- Индексы таблицы `number_lesson`
--
ALTER TABLE `number_lesson`
  ADD PRIMARY KEY (`id_num`);

--
-- Индексы таблицы `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id_post`);

--
-- Индексы таблицы `specialty`
--
ALTER TABLE `specialty`
  ADD PRIMARY KEY (`id_specialty`),
  ADD KEY `id_faculty` (`id_faculty`),
  ADD KEY `id_discipline` (`id_discipline`);

--
-- Индексы таблицы `sschedule`
--
ALTER TABLE `sschedule`
  ADD PRIMARY KEY (`id_schedule`),
  ADD KEY `id_group` (`id_group`),
  ADD KEY `id_day` (`id_day`),
  ADD KEY `id_type` (`id_type`),
  ADD KEY `number` (`id_num`),
  ADD KEY `number_aud` (`number_aud`),
  ADD KEY `card_num` (`card_num`);

--
-- Индексы таблицы `study_group`
--
ALTER TABLE `study_group`
  ADD PRIMARY KEY (`id_group`),
  ADD KEY `id_specialty` (`id_specialty`),
  ADD KEY `id_form` (`id_form`);

--
-- Индексы таблицы `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`card_num`),
  ADD KEY `id_department` (`id_department`),
  ADD KEY `id_post` (`id_post`),
  ADD KEY `id_degree` (`id_degree`);

--
-- Индексы таблицы `type_occupation`
--
ALTER TABLE `type_occupation`
  ADD PRIMARY KEY (`id_type`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `day_week`
--
ALTER TABLE `day_week`
  MODIFY `id_day` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `degree`
--
ALTER TABLE `degree`
  MODIFY `id_degree` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `department`
--
ALTER TABLE `department`
  MODIFY `id_department` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `discipline`
--
ALTER TABLE `discipline`
  MODIFY `id_discipline` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT для таблицы `faculty`
--
ALTER TABLE `faculty`
  MODIFY `id_faculty` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `form_training`
--
ALTER TABLE `form_training`
  MODIFY `id_form` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `number_lesson`
--
ALTER TABLE `number_lesson`
  MODIFY `id_num` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `post`
--
ALTER TABLE `post`
  MODIFY `id_post` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `specialty`
--
ALTER TABLE `specialty`
  MODIFY `id_specialty` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT для таблицы `sschedule`
--
ALTER TABLE `sschedule`
  MODIFY `id_schedule` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT для таблицы `study_group`
--
ALTER TABLE `study_group`
  MODIFY `id_group` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT для таблицы `teachers`
--
ALTER TABLE `teachers`
  MODIFY `card_num` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT для таблицы `type_occupation`
--
ALTER TABLE `type_occupation`
  MODIFY `id_type` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `specialty`
--
ALTER TABLE `specialty`
  ADD CONSTRAINT `specialty_ibfk_1` FOREIGN KEY (`id_faculty`) REFERENCES `faculty` (`id_faculty`),
  ADD CONSTRAINT `specialty_ibfk_2` FOREIGN KEY (`id_discipline`) REFERENCES `discipline` (`id_discipline`);

--
-- Ограничения внешнего ключа таблицы `sschedule`
--
ALTER TABLE `sschedule`
  ADD CONSTRAINT `sschedule_ibfk_1` FOREIGN KEY (`number_aud`) REFERENCES `audience` (`number_aud`),
  ADD CONSTRAINT `sschedule_ibfk_3` FOREIGN KEY (`id_group`) REFERENCES `study_group` (`id_group`),
  ADD CONSTRAINT `sschedule_ibfk_5` FOREIGN KEY (`id_day`) REFERENCES `day_week` (`id_day`),
  ADD CONSTRAINT `sschedule_ibfk_7` FOREIGN KEY (`id_type`) REFERENCES `type_occupation` (`id_type`),
  ADD CONSTRAINT `sschedule_ibfk_8` FOREIGN KEY (`id_num`) REFERENCES `number_lesson` (`id_num`),
  ADD CONSTRAINT `sschedule_ibfk_9` FOREIGN KEY (`card_num`) REFERENCES `teachers` (`card_num`);

--
-- Ограничения внешнего ключа таблицы `study_group`
--
ALTER TABLE `study_group`
  ADD CONSTRAINT `study_group_ibfk_1` FOREIGN KEY (`id_form`) REFERENCES `form_training` (`id_form`),
  ADD CONSTRAINT `study_group_ibfk_2` FOREIGN KEY (`id_specialty`) REFERENCES `specialty` (`id_specialty`);

--
-- Ограничения внешнего ключа таблицы `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`id_degree`) REFERENCES `degree` (`id_degree`),
  ADD CONSTRAINT `teachers_ibfk_2` FOREIGN KEY (`id_department`) REFERENCES `department` (`id_department`),
  ADD CONSTRAINT `teachers_ibfk_3` FOREIGN KEY (`id_post`) REFERENCES `post` (`id_post`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
