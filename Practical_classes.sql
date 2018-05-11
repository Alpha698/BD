-- phpMyAdmin SQL Dump
-- version 5.0.0-dev
-- https://www.phpmyadmin.net/
--
-- Хост: 192.168.30.23
-- Время создания: Май 10 2018 г., 08:06
-- Версия сервера: 8.0.3-rc-log
-- Версия PHP: 7.2.4-1+0~20180405085422.20+stretch~1.gbpbff9f0

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

-- --------------------------------------------------------

--
-- Структура таблицы `day_week`
--

CREATE TABLE `day_week` (
  `id_day` int(3) NOT NULL,
  `name_day` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `degree`
--

CREATE TABLE `degree` (
  `id_degree` int(25) NOT NULL,
  `name_degree` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `department`
--

CREATE TABLE `department` (
  `id_department` int(25) NOT NULL,
  `name_department` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `discipline`
--

CREATE TABLE `discipline` (
  `id_discipline` int(25) NOT NULL,
  `name_discipline` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `faculty`
--

CREATE TABLE `faculty` (
  `id_faculty` int(25) NOT NULL,
  `name_faculty` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `form_training`
--

CREATE TABLE `form_training` (
  `id_form` int(25) NOT NULL,
  `name_form` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `number_lesson`
--

CREATE TABLE `number_lesson` (
  `number` int(3) NOT NULL,
  `week_start` int(5) NOT NULL,
  `week_end` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `post`
--

CREATE TABLE `post` (
  `id_post` int(25) NOT NULL,
  `name_post` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `rank`
--

CREATE TABLE `rank` (
  `id_rank` int(25) NOT NULL,
  `name_rank` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `schedule`
--

CREATE TABLE `schedule` (
  `id_schedule` int(25) NOT NULL,
  `id_group` int(25) NOT NULL,
  `number_aud` int(5) NOT NULL,
  `id_teacher` int(25) NOT NULL,
  `id_discipline` int(25) NOT NULL,
  `id_day` int(3) NOT NULL,
  `id_type` int(25) NOT NULL,
  `number` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `specialty`
--

CREATE TABLE `specialty` (
  `id_specialty` int(25) NOT NULL,
  `name_specialty` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `study_group`
--

CREATE TABLE `study_group` (
  `id_group` int(25) NOT NULL,
  `number_students` int(5) NOT NULL,
  `id_faculty` int(25) NOT NULL,
  `id_specialty` int(25) NOT NULL,
  `id_form` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `teachers`
--

CREATE TABLE `teachers` (
  `id_teacher` int(25) NOT NULL,
  `experience` int(3) NOT NULL,
  `FIO_teacher` varchar(25) NOT NULL,
  `id_department` int(25) NOT NULL,
  `id_post` int(25) NOT NULL,
  `id_rank` int(25) NOT NULL,
  `id_degree` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `type_occupation`
--

CREATE TABLE `type_occupation` (
  `id_type` int(25) NOT NULL,
  `name_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  ADD PRIMARY KEY (`number`);

--
-- Индексы таблицы `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id_post`);

--
-- Индексы таблицы `rank`
--
ALTER TABLE `rank`
  ADD PRIMARY KEY (`id_rank`);

--
-- Индексы таблицы `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id_schedule`),
  ADD KEY `id_group` (`id_group`),
  ADD KEY `number_aud` (`number_aud`),
  ADD KEY `id_teacher` (`id_teacher`),
  ADD KEY `id_discipline` (`id_discipline`),
  ADD KEY `id_day` (`id_day`),
  ADD KEY `id_type` (`id_type`),
  ADD KEY `number` (`number`);

--
-- Индексы таблицы `specialty`
--
ALTER TABLE `specialty`
  ADD PRIMARY KEY (`id_specialty`);

--
-- Индексы таблицы `study_group`
--
ALTER TABLE `study_group`
  ADD PRIMARY KEY (`id_group`),
  ADD KEY `id_faculty` (`id_faculty`),
  ADD KEY `id_specialty` (`id_specialty`),
  ADD KEY `id_form` (`id_form`);

--
-- Индексы таблицы `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id_teacher`),
  ADD KEY `id_department` (`id_department`),
  ADD KEY `id_post` (`id_post`),
  ADD KEY `id_rank` (`id_rank`),
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
  MODIFY `id_day` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `degree`
--
ALTER TABLE `degree`
  MODIFY `id_degree` int(25) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `department`
--
ALTER TABLE `department`
  MODIFY `id_department` int(25) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `discipline`
--
ALTER TABLE `discipline`
  MODIFY `id_discipline` int(25) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `faculty`
--
ALTER TABLE `faculty`
  MODIFY `id_faculty` int(25) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `form_training`
--
ALTER TABLE `form_training`
  MODIFY `id_form` int(25) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `post`
--
ALTER TABLE `post`
  MODIFY `id_post` int(25) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `rank`
--
ALTER TABLE `rank`
  MODIFY `id_rank` int(25) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id_schedule` int(25) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `specialty`
--
ALTER TABLE `specialty`
  MODIFY `id_specialty` int(25) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `study_group`
--
ALTER TABLE `study_group`
  MODIFY `id_group` int(25) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id_teacher` int(25) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `type_occupation`
--
ALTER TABLE `type_occupation`
  MODIFY `id_type` int(25) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `audience`
--
ALTER TABLE `audience`
  ADD CONSTRAINT `audience_ibfk_1` FOREIGN KEY (`number_aud`) REFERENCES `schedule` (`number_aud`);

--
-- Ограничения внешнего ключа таблицы `day_week`
--
ALTER TABLE `day_week`
  ADD CONSTRAINT `day_week_ibfk_1` FOREIGN KEY (`id_day`) REFERENCES `schedule` (`id_day`);

--
-- Ограничения внешнего ключа таблицы `degree`
--
ALTER TABLE `degree`
  ADD CONSTRAINT `degree_ibfk_1` FOREIGN KEY (`id_degree`) REFERENCES `teachers` (`id_degree`);

--
-- Ограничения внешнего ключа таблицы `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`id_department`) REFERENCES `teachers` (`id_department`);

--
-- Ограничения внешнего ключа таблицы `discipline`
--
ALTER TABLE `discipline`
  ADD CONSTRAINT `discipline_ibfk_1` FOREIGN KEY (`id_discipline`) REFERENCES `schedule` (`id_discipline`);

--
-- Ограничения внешнего ключа таблицы `faculty`
--
ALTER TABLE `faculty`
  ADD CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`id_faculty`) REFERENCES `study_group` (`id_faculty`);

--
-- Ограничения внешнего ключа таблицы `form_training`
--
ALTER TABLE `form_training`
  ADD CONSTRAINT `form_training_ibfk_1` FOREIGN KEY (`id_form`) REFERENCES `study_group` (`id_form`);

--
-- Ограничения внешнего ключа таблицы `number_lesson`
--
ALTER TABLE `number_lesson`
  ADD CONSTRAINT `number_lesson_ibfk_1` FOREIGN KEY (`number`) REFERENCES `schedule` (`number`);

--
-- Ограничения внешнего ключа таблицы `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`id_post`) REFERENCES `teachers` (`id_post`);

--
-- Ограничения внешнего ключа таблицы `rank`
--
ALTER TABLE `rank`
  ADD CONSTRAINT `rank_ibfk_1` FOREIGN KEY (`id_rank`) REFERENCES `teachers` (`id_rank`);

--
-- Ограничения внешнего ключа таблицы `specialty`
--
ALTER TABLE `specialty`
  ADD CONSTRAINT `specialty_ibfk_1` FOREIGN KEY (`id_specialty`) REFERENCES `study_group` (`id_specialty`);

--
-- Ограничения внешнего ключа таблицы `study_group`
--
ALTER TABLE `study_group`
  ADD CONSTRAINT `study_group_ibfk_1` FOREIGN KEY (`id_group`) REFERENCES `schedule` (`id_group`);

--
-- Ограничения внешнего ключа таблицы `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`id_teacher`) REFERENCES `schedule` (`id_teacher`);

--
-- Ограничения внешнего ключа таблицы `type_occupation`
--
ALTER TABLE `type_occupation`
  ADD CONSTRAINT `type_occupation_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `schedule` (`id_type`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
