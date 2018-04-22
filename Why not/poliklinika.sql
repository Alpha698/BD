-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 21 2018 г., 20:37
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
-- База данных: `poliklinika`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Patsient`
--

CREATE TABLE `Patsient` (
  `id_pats` int(255) NOT NULL,
  `nomkart` int(255) NOT NULL,
  `FIOpats` text NOT NULL,
  `adress` text NOT NULL,
  `pol` text NOT NULL,
  `dataroj` date NOT NULL,
  `inval` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Patsient`
--

INSERT INTO `Patsient` (`id_pats`, `nomkart`, `FIOpats`, `adress`, `pol`, `dataroj`, `inval`) VALUES
(1, 12345678, 'Шипков В.И.', 'Одесса', 'муж', '2018-04-12', 'да'),
(2, 12312322, 'Шипков И.С.', 'Одесса', 'муж', '2000-01-16', 'нет'),
(3, 65422321, 'Бонько Т.В.', 'Одесса', 'жен', '2018-04-11', 'нет'),
(4, 45612378, 'Зинчук В.С.', 'Одесса', 'муж', '1998-03-14', 'нет'),
(5, 92307323, 'Корся С.И.', 'Одесса', 'муж', '2003-10-01', 'да');

-- --------------------------------------------------------

--
-- Структура таблицы `Priem`
--

CREATE TABLE `Priem` (
  `id_pr` int(255) NOT NULL,
  `datapr` text NOT NULL,
  `vrem` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Priem`
--

INSERT INTO `Priem` (`id_pr`, `datapr`, `vrem`) VALUES
(1, '2018-04-18', '12:00'),
(2, '2018-04-10', '13:30'),
(3, '2018-04-01', '13:00'),
(4, '2018-04-02', '09:10');

-- --------------------------------------------------------

--
-- Структура таблицы `Raspis_pr`
--

CREATE TABLE `Raspis_pr` (
  `id_zap` int(11) NOT NULL,
  `id_vrach` int(11) NOT NULL,
  `id_pr` int(11) NOT NULL,
  `id_pats` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Raspis_pr`
--

INSERT INTO `Raspis_pr` (`id_zap`, `id_vrach`, `id_pr`, `id_pats`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 4),
(3, 4, 3, 3),
(4, 3, 4, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `Vrach`
--

CREATE TABLE `Vrach` (
  `id_vrach` int(255) NOT NULL,
  `nomer_dip` int(255) NOT NULL,
  `FIOvr` text NOT NULL,
  `spetsialnost` text NOT NULL,
  `staj` int(11) NOT NULL,
  `kategoria` text NOT NULL,
  `oklad` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Vrach`
--

INSERT INTO `Vrach` (`id_vrach`, `nomer_dip`, `FIOvr`, `spetsialnost`, `staj`, `kategoria`, `oklad`) VALUES
(1, 12345678, 'Слюсар П.Р.', 'Терапевт', 5, 'Доктор наук', 4300),
(2, 66664666, 'Шипков В.И.', 'Хирург', 6, 'Врач 2 категории', 6600),
(3, 76588713, 'Дергунова Т.С.', 'Дантист', 1, 'Медсестра', 2400),
(4, 45872122, 'Высоцкий Р.Ю.', 'Психотерапевт', 7, 'Врач 1 категории', 6020);

-- --------------------------------------------------------

--
-- Структура таблицы `zabolevania`
--

CREATE TABLE `zabolevania` (
  `id_zab` int(255) NOT NULL,
  `dataobr` text NOT NULL,
  `diagnoz` text NOT NULL,
  `tiaj` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `zabolevania`
--

INSERT INTO `zabolevania` (`id_zab`, `dataobr`, `diagnoz`, `tiaj`) VALUES
(1, '2018-03-04', 'Язва желудка', 'Средняя'),
(2, '2018-04-01', 'Перелом руки', 'Высокая'),
(3, '2018-04-12', 'Открытый перелом черепа', 'Высокая'),
(4, '2018-04-13', 'Гипертонический крисс', 'Средняя'),
(5, '2018-04-28', 'Остеохондроз', 'Низкая'),
(6, '2018-03-25', 'Анорексия', 'Средняя'),
(7, '2018-04-21', 'Депрессия', 'Низкая'),
(8, '2018-04-19', 'Диссоциативное расстройство личности', 'Высокая');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Patsient`
--
ALTER TABLE `Patsient`
  ADD PRIMARY KEY (`id_pats`);

--
-- Индексы таблицы `Priem`
--
ALTER TABLE `Priem`
  ADD PRIMARY KEY (`id_pr`);

--
-- Индексы таблицы `Raspis_pr`
--
ALTER TABLE `Raspis_pr`
  ADD PRIMARY KEY (`id_zap`),
  ADD KEY `id_vrach` (`id_vrach`),
  ADD KEY `id_pr` (`id_pr`),
  ADD KEY `id_pats` (`id_pats`);

--
-- Индексы таблицы `Vrach`
--
ALTER TABLE `Vrach`
  ADD PRIMARY KEY (`id_vrach`);

--
-- Индексы таблицы `zabolevania`
--
ALTER TABLE `zabolevania`
  ADD PRIMARY KEY (`id_zab`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Patsient`
--
ALTER TABLE `Patsient`
  MODIFY `id_pats` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `Priem`
--
ALTER TABLE `Priem`
  MODIFY `id_pr` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `Raspis_pr`
--
ALTER TABLE `Raspis_pr`
  MODIFY `id_zap` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `Vrach`
--
ALTER TABLE `Vrach`
  MODIFY `id_vrach` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `zabolevania`
--
ALTER TABLE `zabolevania`
  MODIFY `id_zab` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Raspis_pr`
--
ALTER TABLE `Raspis_pr`
  ADD CONSTRAINT `raspis_pr_ibfk_1` FOREIGN KEY (`id_vrach`) REFERENCES `Vrach` (`id_vrach`),
  ADD CONSTRAINT `raspis_pr_ibfk_2` FOREIGN KEY (`id_pr`) REFERENCES `Priem` (`id_pr`),
  ADD CONSTRAINT `raspis_pr_ibfk_3` FOREIGN KEY (`id_pats`) REFERENCES `Patsient` (`id_pats`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
