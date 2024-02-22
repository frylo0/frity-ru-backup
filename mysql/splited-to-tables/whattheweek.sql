-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Фев 22 2024 г., 18:25
-- Версия сервера: 8.0.36-0ubuntu0.20.04.1
-- Версия PHP: 7.4.3-4ubuntu2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `whattheweek`
--

-- --------------------------------------------------------

--
-- Структура таблицы `jf-cms_account`
--

CREATE TABLE `jf-cms_account` (
  `id_account` int NOT NULL,
  `account_email` varchar(75) NOT NULL,
  `account_login` varchar(35) NOT NULL,
  `account_password` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `jf-cms_account`
--

INSERT INTO `jf-cms_account` (`id_account`, `account_email`, `account_login`, `account_password`) VALUES
(1, 'nikonovfedor36936@gmail.com', 'frity', '6918c6cfd0dead1f0f0b4783949d8359'),
(2, '', 'mart', '25d55ad283aa400af464c76d713c07ad');

-- --------------------------------------------------------

--
-- Структура таблицы `jf-cms_db-access`
--

CREATE TABLE `jf-cms_db-access` (
  `id_db-access` int NOT NULL,
  `db-access_id_account` int NOT NULL,
  `db-access_id_db-item` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `jf-cms_db-item`
--

CREATE TABLE `jf-cms_db-item` (
  `id_db-item` int NOT NULL,
  `db-item_key` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `db-item_name` varchar(255) NOT NULL,
  `db-item_value` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `db-item_value-type` int NOT NULL,
  `db-item_value-subtype` int DEFAULT NULL,
  `db-item_parent` int DEFAULT NULL,
  `db-item_path` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `jf-cms_db-item`
--

INSERT INTO `jf-cms_db-item` (`id_db-item`, `db-item_key`, `db-item_name`, `db-item_value`, `db-item_value-type`, `db-item_value-subtype`, `db-item_parent`, `db-item_path`) VALUES
(1, '/', '/', '220', 4, NULL, NULL, '/'),
(220, 'wtw', 'WhatTheWeek', '221', 4, NULL, 1, '/wtw'),
(221, 'excel', 'Excel for processing', '8', 12, NULL, 220, '/wtw/excel');

-- --------------------------------------------------------

--
-- Структура таблицы `jf-cms_type`
--

CREATE TABLE `jf-cms_type` (
  `id_type` int NOT NULL,
  `type_is-basic` tinyint(1) NOT NULL,
  `type_has-children` tinyint(1) NOT NULL DEFAULT '0',
  `type_name` varchar(75) NOT NULL,
  `type_descr` json DEFAULT NULL,
  `type_icon` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `jf-cms_type`
--

INSERT INTO `jf-cms_type` (`id_type`, `type_is-basic`, `type_has-children`, `type_name`, `type_descr`, `type_icon`) VALUES
(1, 1, 0, 'field', '\"string\"', 'field.png'),
(2, 1, 0, 'text', '{\"html\": \"string\", \"value\": \"string\"}', 'text.png'),
(3, 1, 0, 'image', '{\"src\": \"string\", \"name\": \"string\"}', 'image.png'),
(4, 1, 1, 'object', NULL, 'object.png'),
(5, 1, 1, 'list', NULL, ''),
(6, 1, 0, 'space', '\"string\"', 'space.png'),
(7, 1, 0, 'boolean', '\"int\"', 'boolean.png'),
(8, 1, 0, 'file', '{\"src\": \"string\", \"name\": \"string\"}', 'file.png'),
(9, 1, 0, 'audio', '{\"src\": \"string\", \"name\": \"string\"}', 'audio.png'),
(10, 1, 0, 'video', '{\"src\": \"string\", \"name\": \"string\"}', 'video.png'),
(11, 1, 0, 'mirror', NULL, 'mirror.png'),
(12, 0, 0, 'excel', '{\"src\": \"string\", \"name\": \"string\"}', 'excel.png');

-- --------------------------------------------------------

--
-- Структура таблицы `jf-cms_T_audio`
--

CREATE TABLE `jf-cms_T_audio` (
  `id_audio` int NOT NULL,
  `audio_src` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `jf-cms_T_boolean`
--

CREATE TABLE `jf-cms_T_boolean` (
  `id_boolean` int NOT NULL,
  `boolean_value` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `jf-cms_T_excel`
--

CREATE TABLE `jf-cms_T_excel` (
  `id_excel` int NOT NULL,
  `excel_src` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `jf-cms_T_excel`
--

INSERT INTO `jf-cms_T_excel` (`id_excel`, `excel_src`) VALUES
(1, 'excel1.xlsx'),
(8, 'excel8.');

-- --------------------------------------------------------

--
-- Структура таблицы `jf-cms_T_field`
--

CREATE TABLE `jf-cms_T_field` (
  `id_field` int NOT NULL,
  `field_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `jf-cms_T_file`
--

CREATE TABLE `jf-cms_T_file` (
  `id_file` int NOT NULL,
  `file_src` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `jf-cms_T_image`
--

CREATE TABLE `jf-cms_T_image` (
  `id_image` int NOT NULL,
  `image_src` varchar(20000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `jf-cms_T_space`
--

CREATE TABLE `jf-cms_T_space` (
  `id_space` int NOT NULL,
  `space_value` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `jf-cms_T_text`
--

CREATE TABLE `jf-cms_T_text` (
  `id_text` int NOT NULL,
  `text_value` text NOT NULL,
  `text_html` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `jf-cms_T_video`
--

CREATE TABLE `jf-cms_T_video` (
  `id_video` int NOT NULL,
  `video_src` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `jf-cms_account`
--
ALTER TABLE `jf-cms_account`
  ADD PRIMARY KEY (`id_account`);

--
-- Индексы таблицы `jf-cms_db-access`
--
ALTER TABLE `jf-cms_db-access`
  ADD PRIMARY KEY (`id_db-access`),
  ADD KEY `db-access_id_account` (`db-access_id_account`,`db-access_id_db-item`),
  ADD KEY `db-access_id_db-item` (`db-access_id_db-item`);

--
-- Индексы таблицы `jf-cms_db-item`
--
ALTER TABLE `jf-cms_db-item`
  ADD PRIMARY KEY (`id_db-item`),
  ADD KEY `db-item_id_type` (`db-item_value-type`) USING BTREE,
  ADD KEY `db-item_value-subtype` (`db-item_value-subtype`);

--
-- Индексы таблицы `jf-cms_type`
--
ALTER TABLE `jf-cms_type`
  ADD PRIMARY KEY (`id_type`);

--
-- Индексы таблицы `jf-cms_T_audio`
--
ALTER TABLE `jf-cms_T_audio`
  ADD PRIMARY KEY (`id_audio`);

--
-- Индексы таблицы `jf-cms_T_boolean`
--
ALTER TABLE `jf-cms_T_boolean`
  ADD PRIMARY KEY (`id_boolean`);

--
-- Индексы таблицы `jf-cms_T_excel`
--
ALTER TABLE `jf-cms_T_excel`
  ADD PRIMARY KEY (`id_excel`);

--
-- Индексы таблицы `jf-cms_T_field`
--
ALTER TABLE `jf-cms_T_field`
  ADD PRIMARY KEY (`id_field`);

--
-- Индексы таблицы `jf-cms_T_file`
--
ALTER TABLE `jf-cms_T_file`
  ADD PRIMARY KEY (`id_file`);

--
-- Индексы таблицы `jf-cms_T_image`
--
ALTER TABLE `jf-cms_T_image`
  ADD PRIMARY KEY (`id_image`);

--
-- Индексы таблицы `jf-cms_T_space`
--
ALTER TABLE `jf-cms_T_space`
  ADD PRIMARY KEY (`id_space`);

--
-- Индексы таблицы `jf-cms_T_text`
--
ALTER TABLE `jf-cms_T_text`
  ADD PRIMARY KEY (`id_text`);

--
-- Индексы таблицы `jf-cms_T_video`
--
ALTER TABLE `jf-cms_T_video`
  ADD PRIMARY KEY (`id_video`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `jf-cms_account`
--
ALTER TABLE `jf-cms_account`
  MODIFY `id_account` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `jf-cms_db-access`
--
ALTER TABLE `jf-cms_db-access`
  MODIFY `id_db-access` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `jf-cms_db-item`
--
ALTER TABLE `jf-cms_db-item`
  MODIFY `id_db-item` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=222;

--
-- AUTO_INCREMENT для таблицы `jf-cms_type`
--
ALTER TABLE `jf-cms_type`
  MODIFY `id_type` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `jf-cms_T_audio`
--
ALTER TABLE `jf-cms_T_audio`
  MODIFY `id_audio` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `jf-cms_T_boolean`
--
ALTER TABLE `jf-cms_T_boolean`
  MODIFY `id_boolean` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `jf-cms_T_excel`
--
ALTER TABLE `jf-cms_T_excel`
  MODIFY `id_excel` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `jf-cms_T_field`
--
ALTER TABLE `jf-cms_T_field`
  MODIFY `id_field` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT для таблицы `jf-cms_T_file`
--
ALTER TABLE `jf-cms_T_file`
  MODIFY `id_file` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `jf-cms_T_image`
--
ALTER TABLE `jf-cms_T_image`
  MODIFY `id_image` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT для таблицы `jf-cms_T_space`
--
ALTER TABLE `jf-cms_T_space`
  MODIFY `id_space` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `jf-cms_T_text`
--
ALTER TABLE `jf-cms_T_text`
  MODIFY `id_text` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `jf-cms_T_video`
--
ALTER TABLE `jf-cms_T_video`
  MODIFY `id_video` int NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `jf-cms_db-access`
--
ALTER TABLE `jf-cms_db-access`
  ADD CONSTRAINT `jf-cms_db-access_ibfk_1` FOREIGN KEY (`db-access_id_account`) REFERENCES `jf-cms_account` (`id_account`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `jf-cms_db-access_ibfk_2` FOREIGN KEY (`db-access_id_db-item`) REFERENCES `jf-cms_db-item` (`id_db-item`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `jf-cms_db-item`
--
ALTER TABLE `jf-cms_db-item`
  ADD CONSTRAINT `jf-cms_db-item_ibfk_1` FOREIGN KEY (`db-item_value-type`) REFERENCES `jf-cms_type` (`id_type`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `jf-cms_db-item_ibfk_2` FOREIGN KEY (`db-item_value-subtype`) REFERENCES `jf-cms_type` (`id_type`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
