-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 30 2018 г., 14:26
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
-- База данных: `test`
--

-- --------------------------------------------------------

--
-- Структура таблицы `DocPrice`
--

CREATE TABLE `DocPrice` (
  `id` int(10) UNSIGNED NOT NULL,
  `datetime` date NOT NULL,
  `status` int(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `DocPrice`
--

INSERT INTO `DocPrice` (`id`, `datetime`, `status`) VALUES
(1, '2018-05-29', 1),
(2, '2018-05-28', 0),
(3, '2018-05-29', 0),
(4, '2018-05-28', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `DocPriceBody`
--

CREATE TABLE `DocPriceBody` (
  `id` int(10) UNSIGNED NOT NULL,
  `doc_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `price` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `DocPriceBody`
--

INSERT INTO `DocPriceBody` (`id`, `doc_id`, `product_id`, `price`) VALUES
(1, 1, 1, 49),
(2, 2, 1, 50),
(3, 3, 4, 11),
(4, 4, 4, 23),
(5, 3, 5, 56),
(6, 4, 5, 65);

-- --------------------------------------------------------

--
-- Структура таблицы `Product`
--

CREATE TABLE `Product` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` int(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Product`
--

INSERT INTO `Product` (`id`, `title`, `description`, `status`) VALUES
(1, 'title 1`', 'description 1', 1),
(4, 'title2', 'description2', 1),
(5, 'title3', 'description3', 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `DocPrice`
--
ALTER TABLE `DocPrice`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `DocPriceBody`
--
ALTER TABLE `DocPriceBody`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `doc_id` (`doc_id`);

--
-- Индексы таблицы `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `DocPrice`
--
ALTER TABLE `DocPrice`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `DocPriceBody`
--
ALTER TABLE `DocPriceBody`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `Product`
--
ALTER TABLE `Product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `DocPriceBody`
--
ALTER TABLE `DocPriceBody`
  ADD CONSTRAINT `docpricebody_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `Product` (`id`),
  ADD CONSTRAINT `docpricebody_ibfk_2` FOREIGN KEY (`doc_id`) REFERENCES `DocPrice` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
