-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 18 2018 г., 15:00
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
-- База данных: `poliklinika2`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id_categ` int(5) NOT NULL,
  `name_categ` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id_categ`, `name_categ`) VALUES
(1, 'Первая'),
(2, 'Вторая'),
(3, 'Высшая');

-- --------------------------------------------------------

--
-- Структура таблицы `diagnosis`
--

CREATE TABLE `diagnosis` (
  `id_diag` int(5) NOT NULL,
  `name_diag` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `doctor`
--

CREATE TABLE `doctor` (
  `nom_diploma` int(6) NOT NULL,
  `FIO` varchar(25) NOT NULL,
  `staj` int(2) NOT NULL,
  `zarplata` int(6) NOT NULL,
  `id_categ` int(5) NOT NULL,
  `id_spec` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `illness`
--

CREATE TABLE `illness` (
  `id_ill` int(5) NOT NULL,
  `data_first_obrash` date NOT NULL,
  `forma_zabolev` varchar(25) NOT NULL,
  `dlitelnost` varchar(25) NOT NULL,
  `analyz` longtext NOT NULL,
  `zacluchenie_vr` text NOT NULL,
  `name_ill` varchar(100) NOT NULL,
  `id_diag` int(5) NOT NULL,
  `opisanie_bolezni` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `patient`
--

CREATE TABLE `patient` (
  `nomer_card` int(6) NOT NULL,
  `FIOpats` varchar(25) NOT NULL,
  `sex` varchar(7) NOT NULL,
  `adress` text NOT NULL,
  `birthday` varchar(25) NOT NULL,
  `disable` int(25) NOT NULL,
  `tel_number` int(10) NOT NULL,
  `id_ill` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `specialty`
--

CREATE TABLE `specialty` (
  `id_spec` int(5) NOT NULL,
  `name_spec` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `specialty`
--

INSERT INTO `specialty` (`id_spec`, `name_spec`) VALUES
(1, 'Стоматолог'),
(2, 'Хирург'),
(3, 'Гинеколог'),
(4, 'Дерматолог'),
(5, 'Окулист'),
(6, 'Диетолог'),
(7, 'ЛОР'),
(8, 'Онколог'),
(9, 'Ортопед'),
(10, 'Подолог');

-- --------------------------------------------------------

--
-- Структура таблицы `visit`
--

CREATE TABLE `visit` (
  `id_visit` int(5) NOT NULL,
  `visit_date` date NOT NULL,
  `nomer_card` int(6) NOT NULL,
  `nom_diploma` int(6) NOT NULL,
  `treatments` text NOT NULL,
  `id_ill` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_categ`);

--
-- Индексы таблицы `diagnosis`
--
ALTER TABLE `diagnosis`
  ADD PRIMARY KEY (`id_diag`);

--
-- Индексы таблицы `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`nom_diploma`),
  ADD KEY `id_categ` (`id_categ`),
  ADD KEY `id_spec` (`id_spec`);

--
-- Индексы таблицы `illness`
--
ALTER TABLE `illness`
  ADD PRIMARY KEY (`id_ill`),
  ADD KEY `id_diag` (`id_diag`);

--
-- Индексы таблицы `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`nomer_card`),
  ADD KEY `id_ill` (`id_ill`);

--
-- Индексы таблицы `specialty`
--
ALTER TABLE `specialty`
  ADD PRIMARY KEY (`id_spec`);

--
-- Индексы таблицы `visit`
--
ALTER TABLE `visit`
  ADD PRIMARY KEY (`id_visit`),
  ADD UNIQUE KEY `visit_AK` (`nomer_card`,`nom_diploma`,`visit_date`),
  ADD KEY `nom_diploma` (`nom_diploma`),
  ADD KEY `id_ill` (`id_ill`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id_categ` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `diagnosis`
--
ALTER TABLE `diagnosis`
  MODIFY `id_diag` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT для таблицы `illness`
--
ALTER TABLE `illness`
  MODIFY `id_ill` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT для таблицы `patient`
--
ALTER TABLE `patient`
  MODIFY `nomer_card` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;
--
-- AUTO_INCREMENT для таблицы `specialty`
--
ALTER TABLE `specialty`
  MODIFY `id_spec` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT для таблицы `visit`
--
ALTER TABLE `visit`
  MODIFY `id_visit` int(5) NOT NULL AUTO_INCREMENT;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`id_categ`) REFERENCES `category` (`id_categ`),
  ADD CONSTRAINT `doctor_ibfk_2` FOREIGN KEY (`id_spec`) REFERENCES `specialty` (`id_spec`);

--
-- Ограничения внешнего ключа таблицы `illness`
--
ALTER TABLE `illness`
  ADD CONSTRAINT `illness_ibfk_1` FOREIGN KEY (`id_diag`) REFERENCES `diagnosis` (`id_diag`);

--
-- Ограничения внешнего ключа таблицы `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`id_ill`) REFERENCES `illness` (`id_ill`);

--
-- Ограничения внешнего ключа таблицы `visit`
--
ALTER TABLE `visit`
  ADD CONSTRAINT `visit_ibfk_1` FOREIGN KEY (`nomer_card`) REFERENCES `patient` (`nomer_card`),
  ADD CONSTRAINT `visit_ibfk_2` FOREIGN KEY (`nom_diploma`) REFERENCES `doctor` (`nom_diploma`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
