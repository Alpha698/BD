-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 14 2018 г., 20:23
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
-- База данных: `hospital`
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

--
-- Дамп данных таблицы `diagnosis`
--

INSERT INTO `diagnosis` (`id_diag`, `name_diag`) VALUES
(1, 'СПИД'),
(2, 'Перелом');

-- --------------------------------------------------------

--
-- Структура таблицы `doctor`
--

CREATE TABLE `doctor` (
  `nom_diploma` int(6) NOT NULL,
  `FIO` varchar(25) NOT NULL,
  `exper` int(2) NOT NULL,
  `salary` int(6) NOT NULL,
  `id_categ` int(5) NOT NULL,
  `id_spec` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `doctor`
--

INSERT INTO `doctor` (`nom_diploma`, `FIO`, `exper`, `salary`, `id_categ`, `id_spec`) VALUES
(123456, 'Шипков В.И.', 3, 1200, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `illness`
--

CREATE TABLE `illness` (
  `id_ill` int(5) NOT NULL,
  `data_first` varchar(25) NOT NULL,
  `haviness` varchar(25) NOT NULL,
  `longiness` varchar(25) NOT NULL,
  `analyzes` varchar(25) NOT NULL,
  `conclusion` varchar(25) NOT NULL,
  `name_ill` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `patient`
--

CREATE TABLE `patient` (
  `cardnom` int(6) NOT NULL,
  `FIO` varchar(25) NOT NULL,
  `sex` int(7) NOT NULL,
  `adress` int(25) NOT NULL,
  `date_br` int(25) NOT NULL,
  `disable` int(25) NOT NULL,
  `telephone` int(10) NOT NULL,
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
(1, 'Дантист'),
(2, 'Хирург');

-- --------------------------------------------------------

--
-- Структура таблицы `treatment`
--

CREATE TABLE `treatment` (
  `id_tr` int(5) NOT NULL,
  `description` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `visit`
--

CREATE TABLE `visit` (
  `id_visit` int(5) NOT NULL,
  `visit_date` varchar(25) NOT NULL,
  `id_diag` int(5) NOT NULL,
  `id_tr` int(5) NOT NULL,
  `cardnom` int(6) NOT NULL,
  `nom_diploma` int(6) NOT NULL
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
  ADD PRIMARY KEY (`id_ill`);

--
-- Индексы таблицы `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`cardnom`),
  ADD KEY `id_ill` (`id_ill`);

--
-- Индексы таблицы `specialty`
--
ALTER TABLE `specialty`
  ADD PRIMARY KEY (`id_spec`);

--
-- Индексы таблицы `treatment`
--
ALTER TABLE `treatment`
  ADD PRIMARY KEY (`id_tr`);

--
-- Индексы таблицы `visit`
--
ALTER TABLE `visit`
  ADD PRIMARY KEY (`id_visit`),
  ADD KEY `id_diag` (`id_diag`),
  ADD KEY `id_tr` (`id_tr`),
  ADD KEY `cardnom` (`cardnom`),
  ADD KEY `nom_diploma` (`nom_diploma`);

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
  MODIFY `id_diag` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `illness`
--
ALTER TABLE `illness`
  MODIFY `id_ill` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `patient`
--
ALTER TABLE `patient`
  MODIFY `cardnom` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `specialty`
--
ALTER TABLE `specialty`
  MODIFY `id_spec` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `treatment`
--
ALTER TABLE `treatment`
  MODIFY `id_tr` int(5) NOT NULL AUTO_INCREMENT;
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
-- Ограничения внешнего ключа таблицы `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`id_ill`) REFERENCES `illness` (`id_ill`);

--
-- Ограничения внешнего ключа таблицы `visit`
--
ALTER TABLE `visit`
  ADD CONSTRAINT `visit_ibfk_1` FOREIGN KEY (`id_diag`) REFERENCES `diagnosis` (`id_diag`),
  ADD CONSTRAINT `visit_ibfk_2` FOREIGN KEY (`id_tr`) REFERENCES `treatment` (`id_tr`),
  ADD CONSTRAINT `visit_ibfk_3` FOREIGN KEY (`cardnom`) REFERENCES `patient` (`cardnom`),
  ADD CONSTRAINT `visit_ibfk_4` FOREIGN KEY (`nom_diploma`) REFERENCES `doctor` (`nom_diploma`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
