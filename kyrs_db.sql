-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 25 2018 г., 21:22
-- Версия сервера: 5.6.37
-- Версия PHP: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `kyrs_db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Auditorya`
--

CREATE TABLE `Auditorya` (
  `id_Aud` int(255) NOT NULL,
  `nomer` int(255) NOT NULL,
  `kolvoMest` int(255) NOT NULL,
  `korpys` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Auditorya`
--

INSERT INTO `Auditorya` (`id_Aud`, `nomer`, `kolvoMest`, `korpys`) VALUES
(1, 101, 16, 'Административный'),
(2, 104, 16, 'Лабораторный'),
(3, 123, 33, 'Главный'),
(4, 215, 33, 'Учебный'),
(5, 216, 16, 'Главный'),
(6, 235, 16, 'Учебный'),
(7, 301, 33, 'Лабораторный'),
(8, 304, 33, 'Учебный'),
(9, 323, 16, 'Учебный'),
(10, 404, 16, 'Учебный'),
(11, 406, 16, 'Учебный'),
(12, 407, 16, 'Учебный'),
(13, 444, 44, 'Лабораторный'),
(14, 555, 55, 'Учебный'),
(15, 111, 12, 'Административный'),
(16, 666, 66, 'Учебный');

-- --------------------------------------------------------

--
-- Структура таблицы `DataPar`
--

CREATE TABLE `DataPar` (
  `id_data` int(255) NOT NULL,
  `denNedeli` text NOT NULL,
  `nomerPary` int(255) NOT NULL,
  `nedStart` int(255) NOT NULL,
  `nedEnd` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `DataPar`
--

INSERT INTO `DataPar` (`id_data`, `denNedeli`, `nomerPary`, `nedStart`, `nedEnd`) VALUES
(1, 'Понедельник', 3, 1, 9),
(2, 'Понедельник', 4, 1, 13),
(3, 'Четверг', 1, 1, 14),
(4, 'Понедельник', 2, 1, 9),
(5, 'Понедельник', 1, 1, 16),
(6, 'Вторник', 2, 1, 14),
(7, 'Вторник', 3, 1, 11),
(8, 'Среда', 1, 1, 16),
(9, 'Вторник', 1, 1, 16),
(10, 'Вторник', 4, 2, 9),
(11, 'Среда', 2, 1, 12),
(12, 'Среда', 3, 1, 13),
(13, 'Среда', 4, 2, 9),
(14, 'Четверг', 2, 1, 14),
(27, 'Понедельник', 1, 1, 16);

-- --------------------------------------------------------

--
-- Структура таблицы `Grypa`
--

CREATE TABLE `Grypa` (
  `id_gr` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `spetsialnost` text NOT NULL,
  `kol_stud` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Grypa`
--

INSERT INTO `Grypa` (`id_gr`, `name`, `spetsialnost`, `kol_stud`) VALUES
(1, '1 КС', 'Инф. Технол.', 16),
(2, '2 КС', 'Инф. Технол.', 16),
(3, '3 КС', 'Инф. Технол.', 12);

-- --------------------------------------------------------

--
-- Структура таблицы `Napravlenie`
--

CREATE TABLE `Napravlenie` (
  `id_nap` int(255) NOT NULL,
  `kafedra` text NOT NULL,
  `fakyltet` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Napravlenie`
--

INSERT INTO `Napravlenie` (`id_nap`, `kafedra`, `fakyltet`) VALUES
(1, 'ТК', 'КС'),
(2, 'КС', 'КС'),
(3, 'ПИ', 'ПИ'),
(4, 'Матем', 'КС'),
(5, 'Ядерн. Физика', 'Ядерн. Физика');

-- --------------------------------------------------------

--
-- Структура таблицы `Prepodavateli`
--

CREATE TABLE `Prepodavateli` (
  `id_Prep` int(255) NOT NULL,
  `FIOpr` text NOT NULL,
  `nomerUdostov` int(255) NOT NULL,
  `doljnost` text NOT NULL,
  `staj` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Prepodavateli`
--

INSERT INTO `Prepodavateli` (`id_Prep`, `FIOpr`, `nomerUdostov`, `doljnost`, `staj`) VALUES
(1, 'Ивлев В.С.', 1234567, 'Профессор', 5),
(2, 'Петров А.И.', 2345678, 'Доцент', 3),
(3, 'Толкачев Д.С.', 1264565, 'Ст. преп.', 3),
(4, 'Шибаев Д.С.', 5545608, 'Доцент', 2),
(5, 'Николаева Н.О.', 2345698, 'Доцент', 2),
(6, 'Антошкина О.О', 8761236, 'Доцент', 2),
(7, 'Трушникова Т.Г.', 4776098, 'Профессор', 5),
(8, 'Рыбак М.И.', 7776662, 'Доцент', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `Raspis`
--

CREATE TABLE `Raspis` (
  `id_zap` int(255) NOT NULL,
  `id_data` int(255) NOT NULL,
  `id_Zanatia` int(255) NOT NULL,
  `id_Prep` int(255) NOT NULL,
  `id_Aud` int(255) NOT NULL,
  `id_gr` int(255) NOT NULL,
  `id_nap` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Raspis`
--

INSERT INTO `Raspis` (`id_zap`, `id_data`, `id_Zanatia`, `id_Prep`, `id_Aud`, `id_gr`, `id_nap`) VALUES
(111, 5, 1, 3, 10, 2, 1),
(112, 4, 2, 7, 7, 2, 5),
(113, 4, 2, 7, 7, 3, 5),
(114, 1, 4, 6, 3, 2, 4),
(115, 1, 4, 6, 3, 3, 4),
(116, 2, 1, 3, 10, 3, 1),
(117, 9, 7, 1, 4, 1, 1),
(118, 6, 3, 2, 11, 3, 2),
(119, 7, 5, 4, 11, 2, 1),
(120, 10, 13, 2, 1, 2, 1),
(121, 8, 6, 3, 10, 1, 1),
(122, 11, 8, 5, 12, 1, 1),
(123, 12, 4, 6, 2, 2, 4),
(124, 13, 13, 2, 1, 3, 1),
(125, 3, 12, 5, 9, 1, 1),
(126, 14, 12, 5, 9, 2, 1),
(130, 10, 13, 2, 1, 2, 1),
(131, 13, 13, 2, 1, 3, 1),
(132, 1, 1, 1, 1, 1, 1),
(138, 5, 1, 3, 10, 2, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `Zanatie`
--

CREATE TABLE `Zanatie` (
  `id_Zanatia` int(255) NOT NULL,
  `nazvanie` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Zanatie`
--

INSERT INTO `Zanatie` (`id_Zanatia`, `nazvanie`) VALUES
(1, 'Базы данных'),
(2, 'Физика'),
(3, 'Комп. Сети'),
(4, 'Высш. Матем.'),
(5, 'ТСПП'),
(6, 'Web прогр.'),
(7, 'КПП'),
(8, 'Комп. Графика'),
(12, 'ООП'),
(13, 'Схемотехника');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Auditorya`
--
ALTER TABLE `Auditorya`
  ADD PRIMARY KEY (`id_Aud`);

--
-- Индексы таблицы `DataPar`
--
ALTER TABLE `DataPar`
  ADD PRIMARY KEY (`id_data`);

--
-- Индексы таблицы `Grypa`
--
ALTER TABLE `Grypa`
  ADD PRIMARY KEY (`id_gr`);

--
-- Индексы таблицы `Napravlenie`
--
ALTER TABLE `Napravlenie`
  ADD PRIMARY KEY (`id_nap`);

--
-- Индексы таблицы `Prepodavateli`
--
ALTER TABLE `Prepodavateli`
  ADD PRIMARY KEY (`id_Prep`);

--
-- Индексы таблицы `Raspis`
--
ALTER TABLE `Raspis`
  ADD PRIMARY KEY (`id_zap`),
  ADD KEY `id_data` (`id_data`),
  ADD KEY `id_Aud` (`id_Aud`),
  ADD KEY `id_Prep` (`id_Prep`),
  ADD KEY `id_Zanatia` (`id_Zanatia`),
  ADD KEY `id_gr` (`id_gr`),
  ADD KEY `id_nap` (`id_nap`);

--
-- Индексы таблицы `Zanatie`
--
ALTER TABLE `Zanatie`
  ADD PRIMARY KEY (`id_Zanatia`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Auditorya`
--
ALTER TABLE `Auditorya`
  MODIFY `id_Aud` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT для таблицы `DataPar`
--
ALTER TABLE `DataPar`
  MODIFY `id_data` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT для таблицы `Grypa`
--
ALTER TABLE `Grypa`
  MODIFY `id_gr` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `Napravlenie`
--
ALTER TABLE `Napravlenie`
  MODIFY `id_nap` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `Prepodavateli`
--
ALTER TABLE `Prepodavateli`
  MODIFY `id_Prep` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `Raspis`
--
ALTER TABLE `Raspis`
  MODIFY `id_zap` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;
--
-- AUTO_INCREMENT для таблицы `Zanatie`
--
ALTER TABLE `Zanatie`
  MODIFY `id_Zanatia` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Raspis`
--
ALTER TABLE `Raspis`
  ADD CONSTRAINT `raspis_ibfk_1` FOREIGN KEY (`id_Aud`) REFERENCES `Auditorya` (`id_Aud`),
  ADD CONSTRAINT `raspis_ibfk_2` FOREIGN KEY (`id_data`) REFERENCES `DataPar` (`id_data`),
  ADD CONSTRAINT `raspis_ibfk_3` FOREIGN KEY (`id_Prep`) REFERENCES `Prepodavateli` (`id_Prep`),
  ADD CONSTRAINT `raspis_ibfk_4` FOREIGN KEY (`id_Zanatia`) REFERENCES `Zanatie` (`id_Zanatia`),
  ADD CONSTRAINT `raspis_ibfk_5` FOREIGN KEY (`id_gr`) REFERENCES `Grypa` (`id_gr`),
  ADD CONSTRAINT `raspis_ibfk_6` FOREIGN KEY (`id_nap`) REFERENCES `Napravlenie` (`id_nap`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
