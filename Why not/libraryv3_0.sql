-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 25 2018 г., 11:05
-- Версия сервера: 10.1.31-MariaDB
-- Версия PHP: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `libraryv3.0`
--

-- --------------------------------------------------------

--
-- Структура таблицы `author`
--

CREATE TABLE `author` (
  `id_author` int(11) NOT NULL,
  `author_name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `author`
--

INSERT INTO `author` (`id_author`, `author_name`) VALUES
(3, 'Пушкин А.С.');

-- --------------------------------------------------------

--
-- Структура таблицы `book`
--

CREATE TABLE `book` (
  `id_book` int(11) NOT NULL,
  `names` varchar(60) NOT NULL,
  `publish_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `book`
--

INSERT INTO `book` (`id_book`, `names`, `publish_date`) VALUES
(1, 'Золотой пет', '1989-11-28');

-- --------------------------------------------------------

--
-- Структура таблицы `book_example`
--

CREATE TABLE `book_example` (
  `examples` int(11) NOT NULL,
  `id_book` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `book_example`
--

INSERT INTO `book_example` (`examples`, `id_book`) VALUES
(10, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `book_has_theme`
--

CREATE TABLE `book_has_theme` (
  `book_thema_id_thematik` int(11) NOT NULL,
  `book_id_book` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `book_has_theme`
--

INSERT INTO `book_has_theme` (`book_thema_id_thematik`, `book_id_book`) VALUES
(1, 1),
(2, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `book_have_author`
--

CREATE TABLE `book_have_author` (
  `book_id_book` int(11) NOT NULL,
  `author_id_author` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `book_have_author`
--

INSERT INTO `book_have_author` (`book_id_book`, `author_id_author`) VALUES
(1, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `book_thema`
--

CREATE TABLE `book_thema` (
  `id_thematik` int(11) NOT NULL,
  `thema` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `book_thema`
--

INSERT INTO `book_thema` (`id_thematik`, `thema`) VALUES
(1, 'Сказки'),
(2, 'Классика'),
(3, 'Фантастика'),
(4, 'Детектив'),
(5, 'Научная'),
(6, 'Антиутопия'),
(7, 'Мистика'),
(8, 'Ужасы'),
(9, 'Компьютерная литература'),
(10, 'Научная литература'),
(11, 'Повесть'),
(12, 'Фэнтези');

-- --------------------------------------------------------

--
-- Структура таблицы `reader`
--

CREATE TABLE `reader` (
  `id_reader` int(11) NOT NULL,
  `fio` varchar(60) NOT NULL,
  `phone` int(11) NOT NULL,
  `addres` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `reader`
--

INSERT INTO `reader` (`id_reader`, `fio`, `phone`, `addres`) VALUES
(1, 'Петров', 2233344, 'Мира 8 кв 6'),
(2, 'Слюсар П.Р.', 253412892, 'Когото 5 дом 5'),
(3, 'Иванченко М.М.', 253414592, 'Когото 59 дом 5'),
(4, 'Солодовникова Е.В.', 253964592, 'Когото 9 дом 5'),
(5, 'Антоненко Д.А.', 253445792, 'Когото 59 дом 9');

-- --------------------------------------------------------

--
-- Структура таблицы `reader_took_book`
--

CREATE TABLE `reader_took_book` (
  `id_book` int(11) NOT NULL,
  `id_reader` int(11) NOT NULL,
  `took_date` date NOT NULL,
  `date_of_return` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `reader_took_book`
--

INSERT INTO `reader_took_book` (`id_book`, `id_reader`, `took_date`, `date_of_return`) VALUES
(1, 1, '2018-03-12', NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id_author`),
  ADD UNIQUE KEY `id_author` (`id_author`),
  ADD KEY `id_author_2` (`id_author`);

--
-- Индексы таблицы `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id_book`),
  ADD KEY `book_by_name_Ind` (`names`);

--
-- Индексы таблицы `book_example`
--
ALTER TABLE `book_example`
  ADD KEY `examples` (`examples`),
  ADD KEY `id_book` (`id_book`);

--
-- Индексы таблицы `book_has_theme`
--
ALTER TABLE `book_has_theme`
  ADD PRIMARY KEY (`book_thema_id_thematik`,`book_id_book`),
  ADD KEY `fk_book_has_theme_book1_idx` (`book_id_book`),
  ADD KEY `fk_book` (`book_id_book`);

--
-- Индексы таблицы `book_have_author`
--
ALTER TABLE `book_have_author`
  ADD PRIMARY KEY (`book_id_book`,`author_id_author`),
  ADD KEY `fk_book_have_author_author1_idx` (`author_id_author`),
  ADD KEY `fk_book_have_name_ind` (`book_id_book`);

--
-- Индексы таблицы `book_thema`
--
ALTER TABLE `book_thema`
  ADD PRIMARY KEY (`id_thematik`);

--
-- Индексы таблицы `reader`
--
ALTER TABLE `reader`
  ADD PRIMARY KEY (`id_reader`),
  ADD UNIQUE KEY `id_reader` (`fio`,`addres`),
  ADD KEY `id_reader_2` (`fio`);

--
-- Индексы таблицы `reader_took_book`
--
ALTER TABLE `reader_took_book`
  ADD PRIMARY KEY (`id_book`,`id_reader`,`took_date`),
  ADD KEY `id_book_2` (`id_book`),
  ADD KEY `id_reader_2` (`id_reader`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `author`
--
ALTER TABLE `author`
  MODIFY `id_author` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `book`
--
ALTER TABLE `book`
  MODIFY `id_book` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `book_thema`
--
ALTER TABLE `book_thema`
  MODIFY `id_thematik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `reader`
--
ALTER TABLE `reader`
  MODIFY `id_reader` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `book_example`
--
ALTER TABLE `book_example`
  ADD CONSTRAINT `book_example_ibfk_1` FOREIGN KEY (`id_book`) REFERENCES `reader_took_book` (`id_book`);

--
-- Ограничения внешнего ключа таблицы `book_has_theme`
--
ALTER TABLE `book_has_theme`
  ADD CONSTRAINT `fk_book_has_theme_book1` FOREIGN KEY (`book_id_book`) REFERENCES `book` (`id_book`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_book_has_theme_book_thema1` FOREIGN KEY (`book_thema_id_thematik`) REFERENCES `book_thema` (`id_thematik`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `book_have_author`
--
ALTER TABLE `book_have_author`
  ADD CONSTRAINT `fk_book_have_author_author1` FOREIGN KEY (`author_id_author`) REFERENCES `author` (`id_author`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_book_have_author_book1` FOREIGN KEY (`book_id_book`) REFERENCES `book` (`id_book`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `reader_took_book`
--
ALTER TABLE `reader_took_book`
  ADD CONSTRAINT `reader_took_book_ibfk_1` FOREIGN KEY (`id_reader`) REFERENCES `reader` (`id_reader`),
  ADD CONSTRAINT `reader_took_book_ibfk_2` FOREIGN KEY (`id_book`) REFERENCES `book` (`id_book`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
