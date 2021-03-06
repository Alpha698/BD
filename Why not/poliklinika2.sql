-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 18 2018 г., 09:26
-- Версия сервера: 5.6.38
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

--
-- Дамп данных таблицы `diagnosis`
--

INSERT INTO `diagnosis` (`id_diag`, `name_diag`) VALUES
(1, 'Ветрянка'),
(2, 'Отит'),
(3, 'Дальнозоркость'),
(4, 'Близорукость'),
(5, 'Плоскостопия'),
(6, 'Воспаление легких'),
(7, 'Аутизм'),
(8, 'Ожирение'),
(9, 'Анарексия'),
(10, 'Перелом ноги');

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

--
-- Дамп данных таблицы `doctor`
--

INSERT INTO `doctor` (`nom_diploma`, `FIO`, `staj`, `zarplata`, `id_categ`, `id_spec`) VALUES
(1424, 'Подать Д.Р.', 2, 4200, 2, 3),
(2325, 'Чабан В.И.', 5, 7000, 3, 5),
(4515, 'Коломоец Р.О.', 6, 6600, 1, 7),
(5854, 'Шульгина Е.В.', 3, 17500, 3, 1),
(6523, 'Ватулина В.С.', 9, 18000, 3, 2),
(7854, 'Васюченко Э.Л.', 7, 8000, 3, 6),
(9541, 'Сиваш М.И.', 4, 8200, 1, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `illness`
--

CREATE TABLE `illness` (
  `id_ill` int(5) NOT NULL,
  `data_1obrash` date NOT NULL,
  `forma_zabolev` varchar(25) NOT NULL,
  `dlitelnost` varchar(25) NOT NULL,
  `analyz` longtext NOT NULL,
  `zacluchenie_vr` text NOT NULL,
  `name_ill` varchar(100) NOT NULL,
  `diag_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `illness`
--

INSERT INTO `illness` (`id_ill`, `data_1obrash`, `forma_zabolev`, `dlitelnost`, `analyz`, `zacluchenie_vr`, `name_ill`, `diag_fk`) VALUES
(1, '0000-00-00', 'Легкая', '4 дня', 'нет', 'капли', 'отит', 0),
(2, '0000-00-00', 'Легкая', '3 дня', 'скоб', 'высыпания на теле', 'ветрянка', 0),
(3, '0000-00-00', 'тяжелая', '3 года', 'проверка зрения', 'плохое зрение', 'дальнозоркость', 0),
(4, '0000-00-00', 'тяжелая', '18 лет', 'проверка зрения', '+15', 'близорукость', 0),
(5, '0000-00-00', 'средняя', '1,5 года', 'осмотр врача', 'неправильная стопа', 'плоскостопия', 0),
(6, '0000-00-00', 'средняя', '6 дней', 'флюорография', 'лечение ', 'воспаление легких', 0),
(7, '0000-00-00', 'тяжелая', '9 лет', 'томография мозга', 'отсталось в развитии', 'аутизм', 0),
(8, '0000-00-00', 'средняя', '3 года', 'Кровь', 'избыточность веса', 'Ожирение', 0),
(9, '0000-00-00', 'средняя', '1 год', 'кровь', 'нехватка веса', 'анарексия', 0),
(10, '0000-00-00', 'легкая', '1 день', 'снимок ноги', 'перелом в 1 месте', 'перелом ноги', 0);

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
  `tel_number` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `patient`
--

INSERT INTO `patient` (`nomer_card`, `FIOpats`, `sex`, `adress`, `birthday`, `disable`, `tel_number`) VALUES
(100, 'Алимова Е.Г.', 'ж', 'Бреуса 96', '02.02.1994', 48, 458763623),
(111, 'Ландарь Н.Н.', 'м', 'Бунина 78', '12.04.1985', 5, 505856942),
(222, 'Орел Д.Л.', 'м', 'Львовская 96', '15.06.1974', 4, 635478212),
(333, 'Масленников А.П.', 'м', 'Балковская 18', '11.12.1965', 1, 505412475),
(444, 'Безуглый А.Р.', 'м', 'Средняя 47', '11.11.2011', 1, 685984125),
(555, 'Ворощук И.М.', 'м', 'Пантелеймоновская 1', '14.01.1996', 45, 507458523),
(666, 'Волошенюк С.Р.', 'ж', 'Дерибасовская 10', '15.01.1995', 56, 954125478),
(777, 'Марченко Л.Л.', 'ж', 'Левитана 14', '17.04.1997', 555, 52542654),
(888, 'Филлипенко О.В.', 'ж', 'Марсельская 3', '18.09.2001', 45, 96415872),
(999, 'Варнава Д.Л', 'ж', 'Леваневского 78', '17.11.2000', 77, 654158622);

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
-- Структура таблицы `treatment`
--

CREATE TABLE `treatment` (
  `id_tr` int(5) NOT NULL,
  `description` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `treatment`
--

INSERT INTO `treatment` (`id_tr`, `description`) VALUES
(1, 'Диета'),
(2, 'Хирургическое вмешательство'),
(3, 'Носка необходимых очков'),
(4, 'Таблетки, назначенные врачем'),
(5, 'Наложение гипса'),
(6, 'Использование капель'),
(7, 'Занятия с врачем');

-- --------------------------------------------------------

--
-- Структура таблицы `visit`
--

CREATE TABLE `visit` (
  `id_visit` int(5) NOT NULL,
  `visit_date` date NOT NULL,
  `nomer_card` int(6) NOT NULL,
  `nom_diploma` int(6) NOT NULL,
  `treatments` text NOT NULL
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
  ADD PRIMARY KEY (`nomer_card`);

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
  ADD UNIQUE KEY `visit_AK` (`nomer_card`,`nom_diploma`,`visit_date`);

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
-- AUTO_INCREMENT для таблицы `treatment`
--
ALTER TABLE `treatment`
  MODIFY `id_tr` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  ADD CONSTRAINT `illness_ibfk_1` FOREIGN KEY (`id_ill`) REFERENCES `diagnosis` (`id_diag`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
