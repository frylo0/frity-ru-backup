-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Фев 22 2024 г., 18:24
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
-- База данных: `just-field-cms`
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
-- Структура таблицы `jf-cms_authorization_account`
--

CREATE TABLE `jf-cms_authorization_account` (
  `id_account` int NOT NULL,
  `account_login` varchar(100) NOT NULL,
  `account_password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `account_group` varchar(50) NOT NULL,
  `account_name` varchar(100) NOT NULL,
  `account_surname` varchar(100) NOT NULL,
  `account_patronymic` varchar(100) NOT NULL,
  `account_birthday` date DEFAULT NULL,
  `account_email` varchar(100) NOT NULL,
  `account_phone` varchar(30) NOT NULL,
  `account_field-id` int DEFAULT NULL,
  `account_activation-code` varchar(50) NOT NULL DEFAULT '',
  `account_data` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `jf-cms_authorization_account`
--

INSERT INTO `jf-cms_authorization_account` (`id_account`, `account_login`, `account_password`, `account_group`, `account_name`, `account_surname`, `account_patronymic`, `account_birthday`, `account_email`, `account_phone`, `account_field-id`, `account_activation-code`, `account_data`) VALUES
(21, '', '$2y$10$s5JB8Tmxi58vJjxEzDVO6elTtpGwuaplRq1yHsUVq7VVkDBf6OEfO', 'users', 'Федор', '', '', NULL, 'nikonovfedor36936@gmail.com', '', 1082, '61efc1ea21a95', NULL),
(22, 'frity', '$2y$10$r0suAGEpyXooAyAnqKOz/ufHgKVNjqeIE9hp64D6HDJGUfsH71dyG', 'just-field-admin-panel', 'Федор', '', '', NULL, 'nikonovfedor36936@gmail.com', '', NULL, '61f506cd1bd80', NULL),
(23, 'mart', '$2y$10$2rlYawe1/wdHvhQfHsXrluqjbl1EAAD7r54QpqZUoYvSZLp9wj91C', 'just-field-admin-panel', 'Ирина', '', '', NULL, '', '', NULL, '61f5078d15a53', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `jf-cms_authorization_session`
--

CREATE TABLE `jf-cms_authorization_session` (
  `id_session` varchar(255) NOT NULL,
  `session_id_authorization_account` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `jf-cms_authorization_session`
--

INSERT INTO `jf-cms_authorization_session` (`id_session`, `session_id_authorization_account`) VALUES
('11705f6857b52c95db9c20f9f499a7aadc49f8d4c22581a22aaae21828207fb6df1bcf2888d0877fbe59f54a859d0e98dc471acac8e51d1d964710168eede5489cb8f94d7de2228674b76b85be6256a17be65c6438ff1242c371a8e4e53081c6cc7dc97164b6c86b9a5d546dff454919dac0721df641bf6e046e29a3', 22);

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
(1, '/', '/', '48,47,42,162,206,1036,1199', 4, NULL, NULL, '/'),
(42, 'pages', 'Страницы', '46,177,184,250,651,704,794,928', 4, NULL, 1, '/pages'),
(46, 'home', 'Главная', '54,62,66', 4, NULL, 42, '/pages/home'),
(47, 'logo', 'Логотип', '2', 3, NULL, 1, '/logo'),
(48, 'header', 'Шапка', '49,50', 4, NULL, 1, '/header'),
(49, 'slogan_1', 'Первая часть слогана', '7', 1, NULL, 48, '/header/slogan_1'),
(50, 'slogan_2', 'Вторая часть слогана', '8', 1, NULL, 48, '/header/slogan_2'),
(54, 'sections', 'Секции', '55,76,125,132,139,146,153', 4, NULL, 46, '/pages/home/sections'),
(55, 'about-me', 'Обо мне', '56,58,57,59,60,61', 4, NULL, 54, '/pages/home/sections/about-me'),
(56, 'title', 'Заголовок', '12', 1, NULL, 55, '/pages/home/sections/about-me/title'),
(57, 'text', 'Текст', '2', 2, NULL, 55, '/pages/home/sections/about-me/text'),
(58, 'image', 'Фото', '3', 3, NULL, 55, '/pages/home/sections/about-me/image'),
(59, 'icon', 'Картинка за текстом', '4', 3, NULL, 55, '/pages/home/sections/about-me/icon'),
(60, 'is_main', 'Секция главная?', '2', 7, NULL, 55, '/pages/home/sections/about-me/is_main'),
(61, 'is_image_right', 'Картинка справа?', '3', 7, NULL, 55, '/pages/home/sections/about-me/is_image_right'),
(62, 'sales', 'Плашка \"Акция\"', '63,64,65', 4, NULL, 46, '/pages/home/sales'),
(63, 'link', 'Ссылка подробнее', '13', 1, NULL, 62, '/pages/home/sales/link'),
(64, 'text', 'Текст', '3', 2, NULL, 62, '/pages/home/sales/text'),
(65, 'is_shown', 'Показывать плашку?', '4', 7, NULL, 62, '/pages/home/sales/is_shown'),
(66, 'contacts', 'Контакты', '67,70,73,160,161', 4, NULL, 46, '/pages/home/contacts'),
(67, 'facebook', 'Фейсбук', '68,69', 4, NULL, 66, '/pages/home/contacts/facebook'),
(68, 'link', 'Ссылка', '14', 1, NULL, 67, '/pages/home/contacts/facebook/link'),
(69, 'text', 'Текст', '15', 1, NULL, 67, '/pages/home/contacts/facebook/text'),
(70, 'instagram', 'Инстаграм', '71,72', 4, NULL, 66, '/pages/home/contacts/instagram'),
(71, 'link', 'Ссылка', '16', 1, NULL, 70, '/pages/home/contacts/instagram/link'),
(72, 'text', 'Текст', '17', 1, NULL, 70, '/pages/home/contacts/instagram/text'),
(73, 'skype', 'Скайп', '74,75', 4, NULL, 66, '/pages/home/contacts/skype'),
(74, 'link', 'Ссылка', '18', 1, NULL, 73, '/pages/home/contacts/skype/link'),
(75, 'text', 'Текст', '19', 1, NULL, 73, '/pages/home/contacts/skype/text'),
(76, 'about-project', 'О проекте', '77,78,165,79,80,81,82', 4, NULL, 54, '/pages/home/sections/about-project'),
(77, 'title', 'Заголовок', '20', 1, NULL, 76, '/pages/home/sections/about-project/title'),
(78, 'image', 'Фото', '5', 3, NULL, 76, '/pages/home/sections/about-project/image'),
(79, 'text', 'Текст', '4', 2, NULL, 76, '/pages/home/sections/about-project/text'),
(80, 'icon', 'Картинка за текстом', '6', 3, NULL, 76, '/pages/home/sections/about-project/icon'),
(81, 'is_main', 'Секция главная?', '5', 7, NULL, 76, '/pages/home/sections/about-project/is_main'),
(82, 'is_image_right', 'Картинка справа?', '6', 7, NULL, 76, '/pages/home/sections/about-project/is_image_right'),
(125, 'consult', 'Консультации', '126,127,128,129,130,131', 4, NULL, 54, '/pages/home/sections/consult'),
(126, 'title', 'Заголовок', '23', 1, NULL, 125, '/pages/home/sections/consult/title'),
(127, 'image', 'Фото', '45', 3, NULL, 125, '/pages/home/sections/consult/image'),
(128, 'text', 'Текст', '5', 2, NULL, 125, '/pages/home/sections/consult/text'),
(129, 'icon', 'Картинка за текстом', '46', 3, NULL, 125, '/pages/home/sections/consult/icon'),
(130, 'is_main', 'Секция главная?', '7', 7, NULL, 125, '/pages/home/sections/consult/is_main'),
(131, 'is_image_right', 'Картинка справа?', '8', 7, NULL, 125, '/pages/home/sections/consult/is_image_right'),
(132, 'event', 'Ближ мероприятия', '133,134,169,135,136,137,138', 4, NULL, 54, '/pages/home/sections/event'),
(133, 'title', 'Заголовок', '24', 1, NULL, 132, '/pages/home/sections/event/title'),
(134, 'image', 'Фото', '47', 3, NULL, 132, '/pages/home/sections/event/image'),
(135, 'text', 'Текст', '6', 2, NULL, 132, '/pages/home/sections/event/text'),
(136, 'icon', 'Картинка за текстом', '48', 3, NULL, 132, '/pages/home/sections/event/icon'),
(137, 'is_main', 'Секция главная?', '9', 7, NULL, 132, '/pages/home/sections/event/is_main'),
(138, 'is_image_right', 'Картинка справа?', '10', 7, NULL, 132, '/pages/home/sections/event/is_image_right'),
(139, 'numerology', 'Нумерология', '140,141,173,142,143,144,145', 4, NULL, 54, '/pages/home/sections/numerology'),
(140, 'title', 'Заголовок', '25', 1, NULL, 139, '/pages/home/sections/numerology/title'),
(141, 'image', 'Фото', '49', 3, NULL, 139, '/pages/home/sections/numerology/image'),
(142, 'text', 'Текст', '7', 2, NULL, 139, '/pages/home/sections/numerology/text'),
(143, 'icon', 'Картинка за текстом', '50', 3, NULL, 139, '/pages/home/sections/numerology/icon'),
(144, 'is_main', 'Секция главная?', '11', 7, NULL, 139, '/pages/home/sections/numerology/is_main'),
(145, 'is_image_right', 'Картинка справа?', '12', 7, NULL, 139, '/pages/home/sections/numerology/is_image_right'),
(146, 'shop', 'Магазин', '147,148,149,150,151,152', 4, NULL, 54, '/pages/home/sections/shop'),
(147, 'title', 'Заголовок', '26', 1, NULL, 146, '/pages/home/sections/shop/title'),
(148, 'image', 'Фото', '51', 3, NULL, 146, '/pages/home/sections/shop/image'),
(149, 'text', 'Текст', '8', 2, NULL, 146, '/pages/home/sections/shop/text'),
(150, 'icon', 'Картинка за текстом', '52', 3, NULL, 146, '/pages/home/sections/shop/icon'),
(151, 'is_main', 'Секция главная?', '13', 7, NULL, 146, '/pages/home/sections/shop/is_main'),
(152, 'is_image_right', 'Картинка справа?', '14', 7, NULL, 146, '/pages/home/sections/shop/is_image_right'),
(153, 'blog', 'Блог', '154,155,156,157,158,159', 4, NULL, 54, '/pages/home/sections/blog'),
(154, 'title', 'Заголовок', '27', 1, NULL, 153, '/pages/home/sections/blog/title'),
(155, 'image', 'Фото', '53', 3, NULL, 153, '/pages/home/sections/blog/image'),
(156, 'text', 'Текст', '9', 2, NULL, 153, '/pages/home/sections/blog/text'),
(157, 'icon', 'Картинка за текстом', '54', 3, NULL, 153, '/pages/home/sections/blog/icon'),
(158, 'is_main', 'Секция главная?', '15', 7, NULL, 153, '/pages/home/sections/blog/is_main'),
(159, 'is_image_right', 'Картинка справа?', '16', 7, NULL, 153, '/pages/home/sections/blog/is_image_right'),
(160, 'phone', 'Телефон', '28', 1, NULL, 66, '/pages/home/contacts/phone'),
(161, 'email', 'Email', '29', 1, NULL, 66, '/pages/home/contacts/email'),
(162, 'copywrite', 'Копирайт', '163,164', 4, NULL, 1, '/copywrite'),
(163, 'text', 'Текст', '30', 1, NULL, 162, '/copywrite/text'),
(164, 'date', 'Дата', '31', 1, NULL, 162, '/copywrite/date'),
(165, 'image_pos', 'Позиция фото', '166,167,168', 4, NULL, 76, '/pages/home/sections/about-project/image_pos'),
(166, NULL, '', '3', 6, NULL, 165, '/pages/home/sections/about-project/image_pos/'),
(167, 'x', 'Горизонталь', '32', 1, NULL, 165, '/pages/home/sections/about-project/image_pos/x'),
(168, 'y', 'Вертикаль', '33', 1, NULL, 165, '/pages/home/sections/about-project/image_pos/y'),
(169, 'image_pos', 'Позиция фото', '170,171,172', 4, NULL, 132, '/pages/home/sections/event/image_pos'),
(170, '', '', '4', 6, NULL, 169, '/pages/home/sections/event/image_pos/'),
(171, 'x', 'Горизонталь', '34', 1, NULL, 169, '/pages/home/sections/event/image_pos/x'),
(172, 'y', 'Вертикаль', '35', 1, NULL, 169, '/pages/home/sections/event/image_pos/y'),
(173, 'image_pos', 'Позиция фото', '174,175,176', 4, NULL, 139, '/pages/home/sections/numerology/image_pos'),
(174, '', '', '5', 6, NULL, 173, '/pages/home/sections/numerology/image_pos/'),
(175, 'x', 'Горизонталь', '36', 1, NULL, 173, '/pages/home/sections/numerology/image_pos/x'),
(176, 'y', 'Вертикаль', '37', 1, NULL, 173, '/pages/home/sections/numerology/image_pos/y'),
(177, 'about-me', 'Обо мне', '178,179,180,181,182,183', 4, NULL, 42, '/pages/about-me'),
(178, 'title', 'Заголовок', '38', 1, NULL, 177, '/pages/about-me/title'),
(179, 'image', 'Фото', '55', 3, NULL, 177, '/pages/about-me/image'),
(180, 'text', 'Текст', '10', 2, NULL, 177, '/pages/about-me/text'),
(181, 'icon', 'Картинка за текстом', '56', 3, NULL, 177, '/pages/about-me/icon'),
(182, 'is_main', 'Секция главная?', '17', 7, NULL, 177, '/pages/about-me/is_main'),
(183, 'is_image_right', 'Картинка справа?', '18', 7, NULL, 177, '/pages/about-me/is_image_right'),
(184, 'about-project', 'О проекте', '185,186,187,191,192,193,194', 4, NULL, 42, '/pages/about-project'),
(185, 'title', 'Заголовок', '39', 1, NULL, 184, '/pages/about-project/title'),
(186, 'image', 'Фото', '57', 3, NULL, 184, '/pages/about-project/image'),
(187, 'image_pos', 'Позиция фото', '188,189,190', 4, NULL, 184, '/pages/about-project/image_pos'),
(188, '', '', '6', 6, NULL, 187, '/pages/about-project/image_pos/'),
(189, 'x', 'Горизонталь', '40', 1, NULL, 187, '/pages/about-project/image_pos/x'),
(190, 'y', 'Вертикаль', '41', 1, NULL, 187, '/pages/about-project/image_pos/y'),
(191, 'text', 'Текст', '11', 2, NULL, 184, '/pages/about-project/text'),
(192, 'icon', 'Картинка за текстом', '58', 3, NULL, 184, '/pages/about-project/icon'),
(193, 'is_main', 'Секция главная?', '19', 7, NULL, 184, '/pages/about-project/is_main'),
(194, 'is_image_right', 'Картинка справа?', '20', 7, NULL, 184, '/pages/about-project/is_image_right'),
(206, 'mailing', 'Рассылки', '207,1086,1071', 4, NULL, 1, '/mailing'),
(207, '__tpl__', 'Шаблон', '1065,1066,1067,1068,1112', 4, NULL, 206, '/mailing/__tpl__'),
(250, 'consult', 'Консультации', '252,879,251', 4, NULL, 42, '/pages/consult'),
(251, 'rating', 'Рейтинг услуг', '327,397,420,443,466,559,489,512,535,582,605,628', 4, NULL, 250, '/pages/consult/rating'),
(252, 'types', 'Виды консультаций', '255,350,373', 4, NULL, 250, '/pages/consult/types'),
(255, 'once', 'Разовые', '256,259,292,291,290,258,285,301,886,887', 4, NULL, 252, '/pages/consult/types/once'),
(256, 'title', 'Название', '58', 1, NULL, 255, '/pages/consult/types/once/title'),
(257, 'image', 'Картинка', '66', 3, NULL, 290, '/pages/consult/types/once/page/image'),
(258, 'tags', 'Тэги', '297,293,294,295,296', 4, NULL, 255, '/pages/consult/types/once/tags'),
(259, 'type', 'Тип продукта', '59', 1, NULL, 255, '/pages/consult/types/once/type'),
(260, 'normal', 'Цена', '60', 1, NULL, 292, '/pages/consult/types/once/price/normal'),
(261, 'sale', 'Цена со скидкой', '61', 1, NULL, 292, '/pages/consult/types/once/price/sale'),
(262, 'text', 'Краткое описание', '20', 2, NULL, 291, '/pages/consult/types/once/annotation/text'),
(263, 'image', 'Картинка аннотации', '67', 3, NULL, 291, '/pages/consult/types/once/annotation/image'),
(264, 'text', 'Описание', '21', 2, NULL, 290, '/pages/consult/types/once/page/text'),
(285, 'is_enroll', 'Можно записаться?', '21', 7, NULL, 255, '/pages/consult/types/once/is_enroll'),
(290, 'page', 'Страница', '257,300,298,299,264', 4, NULL, 255, '/pages/consult/types/once/page'),
(291, 'annotation', 'Аннотация', '262,263,881', 4, NULL, 255, '/pages/consult/types/once/annotation'),
(292, 'price', 'Цена', '260,261', 4, NULL, 255, '/pages/consult/types/once/price'),
(293, NULL, '', '70', 1, NULL, 258, '/pages/consult/types/once/tags'),
(294, NULL, '', '71', 1, NULL, 258, '/pages/consult/types/once/tags'),
(295, NULL, '', '72', 1, NULL, 258, '/pages/consult/types/once/tags'),
(296, NULL, '', '73', 1, NULL, 258, '/pages/consult/types/once/tags'),
(297, NULL, '', '7', 6, NULL, 258, '/pages/consult/types/once/tags'),
(298, 'image_pos_x', 'Горизонтальное выравнивание картинки', '74', 1, NULL, 290, '/pages/consult/types/once/page/image_pos_x'),
(299, 'image_pos_y', 'Вертикальное вырванивание картинки', '75', 1, NULL, 290, '/pages/consult/types/once/page/image_pos_y'),
(300, NULL, '', '8', 6, NULL, 290, '/pages/consult/types/once/page'),
(301, 'is_buy', 'Можно купить?', '46', 7, NULL, 255, '/pages/consult/types/once/is_buy'),
(327, 'email', 'Email консультация', '328,329,330,333,336,342,348,349,892,893', 4, NULL, 251, '/pages/consult/rating/email'),
(328, 'title', 'Название', '86', 1, NULL, 327, '/pages/consult/rating/email/title'),
(329, 'type', 'Тип продукта', '87', 1, NULL, 327, '/pages/consult/rating/email/type'),
(330, 'price', 'Цена', '331,332', 4, NULL, 327, '/pages/consult/rating/email/price'),
(331, 'normal', 'Цена', '88', 1, NULL, 330, '/pages/consult/rating/email/price/normal'),
(332, 'sale', 'Цена со скидкой', '89', 1, NULL, 330, '/pages/consult/rating/email/price/sale'),
(333, 'annotation', 'Аннотация', '334,396', 4, NULL, 327, '/pages/consult/rating/email/annotation'),
(334, 'text', 'Краткое описание', '28', 2, NULL, 333, '/pages/consult/rating/email/annotation/text'),
(336, 'page', 'Страница', '337,338,339,340,341', 4, NULL, 327, '/pages/consult/rating/email/page'),
(337, 'image', 'Картинка', '75', 3, NULL, 336, '/pages/consult/rating/email/page/image'),
(338, '', '', '11', 6, NULL, 336, '/pages/consult/rating/email/page/'),
(339, 'image_pos_x', 'Горизонтальное выравнивание картинки', '90', 1, NULL, 336, '/pages/consult/rating/email/page/image_pos_x'),
(340, 'image_pos_y', 'Вертикальное вырванивание картинки', '91', 1, NULL, 336, '/pages/consult/rating/email/page/image_pos_y'),
(341, 'text', 'Описание', '29', 2, NULL, 336, '/pages/consult/rating/email/page/text'),
(342, 'tags', 'Тэги', '343,344,345,346,347', 4, NULL, 327, '/pages/consult/rating/email/tags'),
(343, '', '', '12', 6, NULL, 342, '/pages/consult/rating/email/tags/'),
(344, '', '', '92', 1, NULL, 342, '/pages/consult/rating/email/tags/'),
(345, '', '', '93', 1, NULL, 342, '/pages/consult/rating/email/tags/'),
(346, '', '', '94', 1, NULL, 342, '/pages/consult/rating/email/tags/'),
(347, '', '', '95', 1, NULL, 342, '/pages/consult/rating/email/tags/'),
(348, 'is_enroll', 'Можно записаться?', '51', 7, NULL, 327, '/pages/consult/rating/email/is_enroll'),
(349, 'is_buy', 'Можно купить?', '52', 7, NULL, 327, '/pages/consult/rating/email/is_buy'),
(350, 'serial', 'Серийные', '351,352,353,356,359,365,371,372,888,889', 4, NULL, 252, '/pages/consult/types/serial'),
(351, 'title', 'Название', '96', 1, NULL, 350, '/pages/consult/types/serial/title'),
(352, 'type', 'Тип продукта', '97', 1, NULL, 350, '/pages/consult/types/serial/type'),
(353, 'price', 'Цена', '354,355', 4, NULL, 350, '/pages/consult/types/serial/price'),
(354, 'normal', 'Цена', '98', 1, NULL, 353, '/pages/consult/types/serial/price/normal'),
(355, 'sale', 'Цена со скидкой', '99', 1, NULL, 353, '/pages/consult/types/serial/price/sale'),
(356, 'annotation', 'Аннотация', '357,358,880', 4, NULL, 350, '/pages/consult/types/serial/annotation'),
(357, 'text', 'Краткое описание', '30', 2, NULL, 356, '/pages/consult/types/serial/annotation/text'),
(358, 'image', 'Картинка аннотации', '76', 3, NULL, 356, '/pages/consult/types/serial/annotation/image'),
(359, 'page', 'Страница', '360,361,362,363,364', 4, NULL, 350, '/pages/consult/types/serial/page'),
(360, 'image', 'Картинка', '77', 3, NULL, 359, '/pages/consult/types/serial/page/image'),
(361, '', '', '13', 6, NULL, 359, '/pages/consult/types/serial/page/'),
(362, 'image_pos_x', 'Горизонтальное выравнивание картинки', '100', 1, NULL, 359, '/pages/consult/types/serial/page/image_pos_x'),
(363, 'image_pos_y', 'Вертикальное вырванивание картинки', '101', 1, NULL, 359, '/pages/consult/types/serial/page/image_pos_y'),
(364, 'text', 'Описание', '31', 2, NULL, 359, '/pages/consult/types/serial/page/text'),
(365, 'tags', 'Тэги', '366,367,368,369,370', 4, NULL, 350, '/pages/consult/types/serial/tags'),
(366, '', '', '14', 6, NULL, 365, '/pages/consult/types/serial/tags/'),
(367, '', '', '102', 1, NULL, 365, '/pages/consult/types/serial/tags/'),
(368, '', '', '103', 1, NULL, 365, '/pages/consult/types/serial/tags/'),
(369, '', '', '104', 1, NULL, 365, '/pages/consult/types/serial/tags/'),
(370, '', '', '105', 1, NULL, 365, '/pages/consult/types/serial/tags/'),
(371, 'is_enroll', 'Можно записаться?', '53', 7, NULL, 350, '/pages/consult/types/serial/is_enroll'),
(372, 'is_buy', 'Можно купить?', '54', 7, NULL, 350, '/pages/consult/types/serial/is_buy'),
(373, 'family', 'Семейные', '374,375,376,379,382,388,394,395,890,891', 4, NULL, 252, '/pages/consult/types/family'),
(374, 'title', 'Название', '106', 1, NULL, 373, '/pages/consult/types/family/title'),
(375, 'type', 'Тип продукта', '107', 1, NULL, 373, '/pages/consult/types/family/type'),
(376, 'price', 'Цена', '377,378', 4, NULL, 373, '/pages/consult/types/family/price'),
(377, 'normal', 'Цена', '108', 1, NULL, 376, '/pages/consult/types/family/price/normal'),
(378, 'sale', 'Цена со скидкой', '109', 1, NULL, 376, '/pages/consult/types/family/price/sale'),
(379, 'annotation', 'Аннотация', '380,381,882', 4, NULL, 373, '/pages/consult/types/family/annotation'),
(380, 'text', 'Краткое описание', '32', 2, NULL, 379, '/pages/consult/types/family/annotation/text'),
(381, 'image', 'Картинка аннотации', '78', 3, NULL, 379, '/pages/consult/types/family/annotation/image'),
(382, 'page', 'Страница', '383,384,385,386,387', 4, NULL, 373, '/pages/consult/types/family/page'),
(383, 'image', 'Картинка', '79', 3, NULL, 382, '/pages/consult/types/family/page/image'),
(384, '', '', '15', 6, NULL, 382, '/pages/consult/types/family/page/'),
(385, 'image_pos_x', 'Горизонтальное выравнивание картинки', '110', 1, NULL, 382, '/pages/consult/types/family/page/image_pos_x'),
(386, 'image_pos_y', 'Вертикальное вырванивание картинки', '111', 1, NULL, 382, '/pages/consult/types/family/page/image_pos_y'),
(387, 'text', 'Описание', '33', 2, NULL, 382, '/pages/consult/types/family/page/text'),
(388, 'tags', 'Тэги', '389,390,391,392,393', 4, NULL, 373, '/pages/consult/types/family/tags'),
(389, '', '', '16', 6, NULL, 388, '/pages/consult/types/family/tags/'),
(390, '', '', '112', 1, NULL, 388, '/pages/consult/types/family/tags/'),
(391, '', '', '113', 1, NULL, 388, '/pages/consult/types/family/tags/'),
(392, '', '', '114', 1, NULL, 388, '/pages/consult/types/family/tags/'),
(393, '', '', '115', 1, NULL, 388, '/pages/consult/types/family/tags/'),
(394, 'is_enroll', 'Можно записаться?', '55', 7, NULL, 373, '/pages/consult/types/family/is_enroll'),
(395, 'is_buy', 'Можно купить?', '56', 7, NULL, 373, '/pages/consult/types/family/is_buy'),
(396, 'image', 'Картинка аннотации', '80', 3, NULL, 333, '/pages/consult/rating/email/annotation/image'),
(397, 'letter', 'Написать письмо', '398,399,400,403,406,412,418,419,894,895', 4, NULL, 251, '/pages/consult/rating/letter'),
(398, 'title', 'Название', '116', 1, NULL, 397, '/pages/consult/rating/letter/title'),
(399, 'type', 'Тип продукта', '117', 1, NULL, 397, '/pages/consult/rating/letter/type'),
(400, 'price', 'Цена', '401,402', 4, NULL, 397, '/pages/consult/rating/letter/price'),
(401, 'normal', 'Цена', '118', 1, NULL, 400, '/pages/consult/rating/letter/price/normal'),
(402, 'sale', 'Цена со скидкой', '119', 1, NULL, 400, '/pages/consult/rating/letter/price/sale'),
(403, 'annotation', 'Аннотация', '404,405', 4, NULL, 397, '/pages/consult/rating/letter/annotation'),
(404, 'text', 'Краткое описание', '34', 2, NULL, 403, '/pages/consult/rating/letter/annotation/text'),
(405, 'image', 'Картинка аннотации', '81', 3, NULL, 403, '/pages/consult/rating/letter/annotation/image'),
(406, 'page', 'Страница', '407,408,409,410,411', 4, NULL, 397, '/pages/consult/rating/letter/page'),
(407, 'image', 'Картинка', '82', 3, NULL, 406, '/pages/consult/rating/letter/page/image'),
(408, '', '', '17', 6, NULL, 406, '/pages/consult/rating/letter/page/'),
(409, 'image_pos_x', 'Горизонтальное выравнивание картинки', '120', 1, NULL, 406, '/pages/consult/rating/letter/page/image_pos_x'),
(410, 'image_pos_y', 'Вертикальное вырванивание картинки', '121', 1, NULL, 406, '/pages/consult/rating/letter/page/image_pos_y'),
(411, 'text', 'Описание', '35', 2, NULL, 406, '/pages/consult/rating/letter/page/text'),
(412, 'tags', 'Тэги', '413,414,415,416,417', 4, NULL, 397, '/pages/consult/rating/letter/tags'),
(413, '', '', '18', 6, NULL, 412, '/pages/consult/rating/letter/tags/'),
(414, '', '', '122', 1, NULL, 412, '/pages/consult/rating/letter/tags/'),
(415, '', '', '123', 1, NULL, 412, '/pages/consult/rating/letter/tags/'),
(416, '', '', '124', 1, NULL, 412, '/pages/consult/rating/letter/tags/'),
(417, '', '', '125', 1, NULL, 412, '/pages/consult/rating/letter/tags/'),
(418, 'is_enroll', 'Можно записаться?', '57', 7, NULL, 397, '/pages/consult/rating/letter/is_enroll'),
(419, 'is_buy', 'Можно купить?', '58', 7, NULL, 397, '/pages/consult/rating/letter/is_buy'),
(420, 'payed_mailing', 'Платная рассылка', '421,422,423,426,429,435,441,442,896,897', 4, NULL, 251, '/pages/consult/rating/payed_mailing'),
(421, 'title', 'Название', '126', 1, NULL, 420, '/pages/consult/rating/payed_mailing/title'),
(422, 'type', 'Тип продукта', '127', 1, NULL, 420, '/pages/consult/rating/payed_mailing/type'),
(423, 'price', 'Цена', '424,425', 4, NULL, 420, '/pages/consult/rating/payed_mailing/price'),
(424, 'normal', 'Цена', '128', 1, NULL, 423, '/pages/consult/rating/payed_mailing/price/normal'),
(425, 'sale', 'Цена со скидкой', '129', 1, NULL, 423, '/pages/consult/rating/payed_mailing/price/sale'),
(426, 'annotation', 'Аннотация', '427,428', 4, NULL, 420, '/pages/consult/rating/payed_mailing/annotation'),
(427, 'text', 'Краткое описание', '36', 2, NULL, 426, '/pages/consult/rating/payed_mailing/annotation/text'),
(428, 'image', 'Картинка аннотации', '83', 3, NULL, 426, '/pages/consult/rating/payed_mailing/annotation/image'),
(429, 'page', 'Страница', '430,431,432,433,434', 4, NULL, 420, '/pages/consult/rating/payed_mailing/page'),
(430, 'image', 'Картинка', '84', 3, NULL, 429, '/pages/consult/rating/payed_mailing/page/image'),
(431, '', '', '19', 6, NULL, 429, '/pages/consult/rating/payed_mailing/page/'),
(432, 'image_pos_x', 'Горизонтальное выравнивание картинки', '130', 1, NULL, 429, '/pages/consult/rating/payed_mailing/page/image_pos_x'),
(433, 'image_pos_y', 'Вертикальное вырванивание картинки', '131', 1, NULL, 429, '/pages/consult/rating/payed_mailing/page/image_pos_y'),
(434, 'text', 'Описание', '37', 2, NULL, 429, '/pages/consult/rating/payed_mailing/page/text'),
(435, 'tags', 'Тэги', '436,437,438,439,440', 4, NULL, 420, '/pages/consult/rating/payed_mailing/tags'),
(436, '', '', '20', 6, NULL, 435, '/pages/consult/rating/payed_mailing/tags/'),
(437, '', '', '132', 1, NULL, 435, '/pages/consult/rating/payed_mailing/tags/'),
(438, '', '', '133', 1, NULL, 435, '/pages/consult/rating/payed_mailing/tags/'),
(439, '', '', '134', 1, NULL, 435, '/pages/consult/rating/payed_mailing/tags/'),
(440, '', '', '135', 1, NULL, 435, '/pages/consult/rating/payed_mailing/tags/'),
(441, 'is_enroll', 'Можно записаться?', '59', 7, NULL, 420, '/pages/consult/rating/payed_mailing/is_enroll'),
(442, 'is_buy', 'Можно купить?', '60', 7, NULL, 420, '/pages/consult/rating/payed_mailing/is_buy'),
(443, 'women_clubs', 'Женские клубы', '444,445,446,449,452,458,464,465,898,899', 4, NULL, 251, '/pages/consult/rating/women_clubs'),
(444, 'title', 'Название', '136', 1, NULL, 443, '/pages/consult/rating/women_clubs/title'),
(445, 'type', 'Тип продукта', '137', 1, NULL, 443, '/pages/consult/rating/women_clubs/type'),
(446, 'price', 'Цена', '447,448', 4, NULL, 443, '/pages/consult/rating/women_clubs/price'),
(447, 'normal', 'Цена', '138', 1, NULL, 446, '/pages/consult/rating/women_clubs/price/normal'),
(448, 'sale', 'Цена со скидкой', '139', 1, NULL, 446, '/pages/consult/rating/women_clubs/price/sale'),
(449, 'annotation', 'Аннотация', '450,451', 4, NULL, 443, '/pages/consult/rating/women_clubs/annotation'),
(450, 'text', 'Краткое описание', '38', 2, NULL, 449, '/pages/consult/rating/women_clubs/annotation/text'),
(451, 'image', 'Картинка аннотации', '85', 3, NULL, 449, '/pages/consult/rating/women_clubs/annotation/image'),
(452, 'page', 'Страница', '453,454,455,456,457', 4, NULL, 443, '/pages/consult/rating/women_clubs/page'),
(453, 'image', 'Картинка', '86', 3, NULL, 452, '/pages/consult/rating/women_clubs/page/image'),
(454, '', '', '21', 6, NULL, 452, '/pages/consult/rating/women_clubs/page/'),
(455, 'image_pos_x', 'Горизонтальное выравнивание картинки', '140', 1, NULL, 452, '/pages/consult/rating/women_clubs/page/image_pos_x'),
(456, 'image_pos_y', 'Вертикальное вырванивание картинки', '141', 1, NULL, 452, '/pages/consult/rating/women_clubs/page/image_pos_y'),
(457, 'text', 'Описание', '39', 2, NULL, 452, '/pages/consult/rating/women_clubs/page/text'),
(458, 'tags', 'Тэги', '459,460,461,462,463', 4, NULL, 443, '/pages/consult/rating/women_clubs/tags'),
(459, '', '', '22', 6, NULL, 458, '/pages/consult/rating/women_clubs/tags/'),
(460, '', '', '142', 1, NULL, 458, '/pages/consult/rating/women_clubs/tags/'),
(461, '', '', '143', 1, NULL, 458, '/pages/consult/rating/women_clubs/tags/'),
(462, '', '', '144', 1, NULL, 458, '/pages/consult/rating/women_clubs/tags/'),
(463, '', '', '145', 1, NULL, 458, '/pages/consult/rating/women_clubs/tags/'),
(464, 'is_enroll', 'Можно записаться?', '61', 7, NULL, 443, '/pages/consult/rating/women_clubs/is_enroll'),
(465, 'is_buy', 'Можно купить?', '62', 7, NULL, 443, '/pages/consult/rating/women_clubs/is_buy'),
(466, 'numero_study', 'Обучение нумерологии', '467,468,469,472,475,481,487,488,900,901', 4, NULL, 251, '/pages/consult/rating/numero_study'),
(467, 'title', 'Название', '146', 1, NULL, 466, '/pages/consult/rating/numero_study/title'),
(468, 'type', 'Тип продукта', '147', 1, NULL, 466, '/pages/consult/rating/numero_study/type'),
(469, 'price', 'Цена', '470,471', 4, NULL, 466, '/pages/consult/rating/numero_study/price'),
(470, 'normal', 'Цена', '148', 1, NULL, 469, '/pages/consult/rating/numero_study/price/normal'),
(471, 'sale', 'Цена со скидкой', '149', 1, NULL, 469, '/pages/consult/rating/numero_study/price/sale'),
(472, 'annotation', 'Аннотация', '473,474', 4, NULL, 466, '/pages/consult/rating/numero_study/annotation'),
(473, 'text', 'Краткое описание', '40', 2, NULL, 472, '/pages/consult/rating/numero_study/annotation/text'),
(474, 'image', 'Картинка аннотации', '87', 3, NULL, 472, '/pages/consult/rating/numero_study/annotation/image'),
(475, 'page', 'Страница', '476,477,478,479,480', 4, NULL, 466, '/pages/consult/rating/numero_study/page'),
(476, 'image', 'Картинка', '88', 3, NULL, 475, '/pages/consult/rating/numero_study/page/image'),
(477, '', '', '23', 6, NULL, 475, '/pages/consult/rating/numero_study/page/'),
(478, 'image_pos_x', 'Горизонтальное выравнивание картинки', '150', 1, NULL, 475, '/pages/consult/rating/numero_study/page/image_pos_x'),
(479, 'image_pos_y', 'Вертикальное вырванивание картинки', '151', 1, NULL, 475, '/pages/consult/rating/numero_study/page/image_pos_y'),
(480, 'text', 'Описание', '41', 2, NULL, 475, '/pages/consult/rating/numero_study/page/text'),
(481, 'tags', 'Тэги', '482,483,484,485,486', 4, NULL, 466, '/pages/consult/rating/numero_study/tags'),
(482, '', '', '24', 6, NULL, 481, '/pages/consult/rating/numero_study/tags/'),
(483, '', '', '152', 1, NULL, 481, '/pages/consult/rating/numero_study/tags/'),
(484, '', '', '153', 1, NULL, 481, '/pages/consult/rating/numero_study/tags/'),
(485, '', '', '154', 1, NULL, 481, '/pages/consult/rating/numero_study/tags/'),
(486, '', '', '155', 1, NULL, 481, '/pages/consult/rating/numero_study/tags/'),
(487, 'is_enroll', 'Можно записаться?', '63', 7, NULL, 466, '/pages/consult/rating/numero_study/is_enroll'),
(488, 'is_buy', 'Можно купить?', '64', 7, NULL, 466, '/pages/consult/rating/numero_study/is_buy'),
(489, 'online_courses', 'Онлайн курсы', '490,491,492,495,498,504,510,511,904,905', 4, NULL, 251, '/pages/consult/rating/online_courses'),
(490, 'title', 'Название', '156', 1, NULL, 489, '/pages/consult/rating/online_courses/title'),
(491, 'type', 'Тип продукта', '157', 1, NULL, 489, '/pages/consult/rating/online_courses/type'),
(492, 'price', 'Цена', '493,494', 4, NULL, 489, '/pages/consult/rating/online_courses/price'),
(493, 'normal', 'Цена', '158', 1, NULL, 492, '/pages/consult/rating/online_courses/price/normal'),
(494, 'sale', 'Цена со скидкой', '159', 1, NULL, 492, '/pages/consult/rating/online_courses/price/sale'),
(495, 'annotation', 'Аннотация', '496,497', 4, NULL, 489, '/pages/consult/rating/online_courses/annotation'),
(496, 'text', 'Краткое описание', '42', 2, NULL, 495, '/pages/consult/rating/online_courses/annotation/text'),
(497, 'image', 'Картинка аннотации', '89', 3, NULL, 495, '/pages/consult/rating/online_courses/annotation/image'),
(498, 'page', 'Страница', '499,500,501,502,503', 4, NULL, 489, '/pages/consult/rating/online_courses/page'),
(499, 'image', 'Картинка', '90', 3, NULL, 498, '/pages/consult/rating/online_courses/page/image'),
(500, '', '', '25', 6, NULL, 498, '/pages/consult/rating/online_courses/page/'),
(501, 'image_pos_x', 'Горизонтальное выравнивание картинки', '160', 1, NULL, 498, '/pages/consult/rating/online_courses/page/image_pos_x'),
(502, 'image_pos_y', 'Вертикальное вырванивание картинки', '161', 1, NULL, 498, '/pages/consult/rating/online_courses/page/image_pos_y'),
(503, 'text', 'Описание', '43', 2, NULL, 498, '/pages/consult/rating/online_courses/page/text'),
(504, 'tags', 'Тэги', '505,506,507,508,509', 4, NULL, 489, '/pages/consult/rating/online_courses/tags'),
(505, '', '', '26', 6, NULL, 504, '/pages/consult/rating/online_courses/tags/'),
(506, '', '', '162', 1, NULL, 504, '/pages/consult/rating/online_courses/tags/'),
(507, '', '', '163', 1, NULL, 504, '/pages/consult/rating/online_courses/tags/'),
(508, '', '', '164', 1, NULL, 504, '/pages/consult/rating/online_courses/tags/'),
(509, '', '', '165', 1, NULL, 504, '/pages/consult/rating/online_courses/tags/'),
(510, 'is_enroll', 'Можно записаться?', '65', 7, NULL, 489, '/pages/consult/rating/online_courses/is_enroll'),
(511, 'is_buy', 'Можно купить?', '66', 7, NULL, 489, '/pages/consult/rating/online_courses/is_buy'),
(512, 'online_mentor', 'Онлайн сопровождение', '513,514,515,518,521,527,533,534,906,907', 4, NULL, 251, '/pages/consult/rating/online_mentor'),
(513, 'title', 'Название', '166', 1, NULL, 512, '/pages/consult/rating/online_mentor/title'),
(514, 'type', 'Тип продукта', '167', 1, NULL, 512, '/pages/consult/rating/online_mentor/type'),
(515, 'price', 'Цена', '516,517', 4, NULL, 512, '/pages/consult/rating/online_mentor/price'),
(516, 'normal', 'Цена', '168', 1, NULL, 515, '/pages/consult/rating/online_mentor/price/normal'),
(517, 'sale', 'Цена со скидкой', '169', 1, NULL, 515, '/pages/consult/rating/online_mentor/price/sale'),
(518, 'annotation', 'Аннотация', '519,520', 4, NULL, 512, '/pages/consult/rating/online_mentor/annotation'),
(519, 'text', 'Краткое описание', '44', 2, NULL, 518, '/pages/consult/rating/online_mentor/annotation/text'),
(520, 'image', 'Картинка аннотации', '91', 3, NULL, 518, '/pages/consult/rating/online_mentor/annotation/image'),
(521, 'page', 'Страница', '522,523,524,525,526', 4, NULL, 512, '/pages/consult/rating/online_mentor/page'),
(522, 'image', 'Картинка', '92', 3, NULL, 521, '/pages/consult/rating/online_mentor/page/image'),
(523, '', '', '27', 6, NULL, 521, '/pages/consult/rating/online_mentor/page/'),
(524, 'image_pos_x', 'Горизонтальное выравнивание картинки', '170', 1, NULL, 521, '/pages/consult/rating/online_mentor/page/image_pos_x'),
(525, 'image_pos_y', 'Вертикальное вырванивание картинки', '171', 1, NULL, 521, '/pages/consult/rating/online_mentor/page/image_pos_y'),
(526, 'text', 'Описание', '45', 2, NULL, 521, '/pages/consult/rating/online_mentor/page/text'),
(527, 'tags', 'Тэги', '528,529,530,531,532', 4, NULL, 512, '/pages/consult/rating/online_mentor/tags'),
(528, '', '', '28', 6, NULL, 527, '/pages/consult/rating/online_mentor/tags/'),
(529, '', '', '172', 1, NULL, 527, '/pages/consult/rating/online_mentor/tags/'),
(530, '', '', '173', 1, NULL, 527, '/pages/consult/rating/online_mentor/tags/'),
(531, '', '', '174', 1, NULL, 527, '/pages/consult/rating/online_mentor/tags/'),
(532, '', '', '175', 1, NULL, 527, '/pages/consult/rating/online_mentor/tags/'),
(533, 'is_enroll', 'Можно записаться?', '67', 7, NULL, 512, '/pages/consult/rating/online_mentor/is_enroll'),
(534, 'is_buy', 'Можно купить?', '68', 7, NULL, 512, '/pages/consult/rating/online_mentor/is_buy'),
(535, 'assoc_shpar', 'Ассоциативная шпаргалка', '536,537,538,541,544,550,556,557,908,909', 4, NULL, 251, '/pages/consult/rating/assoc_shpar'),
(536, 'title', 'Название', '176', 1, NULL, 535, '/pages/consult/rating/assoc_shpar/title'),
(537, 'type', 'Тип продукта', '177', 1, NULL, 535, '/pages/consult/rating/assoc_shpar/type'),
(538, 'price', 'Цена', '539,540', 4, NULL, 535, '/pages/consult/rating/assoc_shpar/price'),
(539, 'normal', 'Цена', '178', 1, NULL, 538, '/pages/consult/rating/assoc_shpar/price/normal'),
(540, 'sale', 'Цена со скидкой', '179', 1, NULL, 538, '/pages/consult/rating/assoc_shpar/price/sale'),
(541, 'annotation', 'Аннотация', '542,543', 4, NULL, 535, '/pages/consult/rating/assoc_shpar/annotation'),
(542, 'text', 'Краткое описание', '46', 2, NULL, 541, '/pages/consult/rating/assoc_shpar/annotation/text'),
(543, 'image', 'Картинка аннотации', '93', 3, NULL, 541, '/pages/consult/rating/assoc_shpar/annotation/image'),
(544, 'page', 'Страница', '545,546,547,548,549', 4, NULL, 535, '/pages/consult/rating/assoc_shpar/page'),
(545, 'image', 'Картинка', '94', 3, NULL, 544, '/pages/consult/rating/assoc_shpar/page/image'),
(546, '', '', '29', 6, NULL, 544, '/pages/consult/rating/assoc_shpar/page/'),
(547, 'image_pos_x', 'Горизонтальное выравнивание картинки', '180', 1, NULL, 544, '/pages/consult/rating/assoc_shpar/page/image_pos_x'),
(548, 'image_pos_y', 'Вертикальное вырванивание картинки', '181', 1, NULL, 544, '/pages/consult/rating/assoc_shpar/page/image_pos_y'),
(549, 'text', 'Описание', '47', 2, NULL, 544, '/pages/consult/rating/assoc_shpar/page/text'),
(550, 'tags', 'Тэги', '551,552,553,554,555', 4, NULL, 535, '/pages/consult/rating/assoc_shpar/tags'),
(551, '', '', '30', 6, NULL, 550, '/pages/consult/rating/assoc_shpar/tags/'),
(552, '', '', '182', 1, NULL, 550, '/pages/consult/rating/assoc_shpar/tags/'),
(553, '', '', '183', 1, NULL, 550, '/pages/consult/rating/assoc_shpar/tags/'),
(554, '', '', '184', 1, NULL, 550, '/pages/consult/rating/assoc_shpar/tags/'),
(555, '', '', '185', 1, NULL, 550, '/pages/consult/rating/assoc_shpar/tags/'),
(556, 'is_enroll', 'Можно записаться?', '69', 7, NULL, 535, '/pages/consult/rating/assoc_shpar/is_enroll'),
(557, 'is_buy', 'Можно купить?', '70', 7, NULL, 535, '/pages/consult/rating/assoc_shpar/is_buy'),
(559, 'consult_numero', 'Консультации нумеролога', '560,561,562,565,568,574,580,581,902,903', 4, NULL, 251, '/pages/consult/rating/consult_numero'),
(560, 'title', 'Название', '186', 1, NULL, 559, '/pages/consult/rating/consult_numero/title'),
(561, 'type', 'Тип продукта', '187', 1, NULL, 559, '/pages/consult/rating/consult_numero/type'),
(562, 'price', 'Цена', '563,564', 4, NULL, 559, '/pages/consult/rating/consult_numero/price'),
(563, 'normal', 'Цена', '188', 1, NULL, 562, '/pages/consult/rating/consult_numero/price/normal'),
(564, 'sale', 'Цена со скидкой', '189', 1, NULL, 562, '/pages/consult/rating/consult_numero/price/sale'),
(565, 'annotation', 'Аннотация', '566,567', 4, NULL, 559, '/pages/consult/rating/consult_numero/annotation'),
(566, 'text', 'Краткое описание', '48', 2, NULL, 565, '/pages/consult/rating/consult_numero/annotation/text'),
(567, 'image', 'Картинка аннотации', '95', 3, NULL, 565, '/pages/consult/rating/consult_numero/annotation/image'),
(568, 'page', 'Страница', '569,570,571,572,573', 4, NULL, 559, '/pages/consult/rating/consult_numero/page'),
(569, 'image', 'Картинка', '96', 3, NULL, 568, '/pages/consult/rating/consult_numero/page/image'),
(570, '', '', '32', 6, NULL, 568, '/pages/consult/rating/consult_numero/page/'),
(571, 'image_pos_x', 'Горизонтальное выравнивание картинки', '190', 1, NULL, 568, '/pages/consult/rating/consult_numero/page/image_pos_x'),
(572, 'image_pos_y', 'Вертикальное вырванивание картинки', '191', 1, NULL, 568, '/pages/consult/rating/consult_numero/page/image_pos_y'),
(573, 'text', 'Описание', '49', 2, NULL, 568, '/pages/consult/rating/consult_numero/page/text'),
(574, 'tags', 'Тэги', '575,576,577,578,579', 4, NULL, 559, '/pages/consult/rating/consult_numero/tags'),
(575, '', '', '33', 6, NULL, 574, '/pages/consult/rating/consult_numero/tags/'),
(576, '', '', '192', 1, NULL, 574, '/pages/consult/rating/consult_numero/tags/'),
(577, '', '', '193', 1, NULL, 574, '/pages/consult/rating/consult_numero/tags/'),
(578, '', '', '194', 1, NULL, 574, '/pages/consult/rating/consult_numero/tags/'),
(579, '', '', '195', 1, NULL, 574, '/pages/consult/rating/consult_numero/tags/'),
(580, 'is_enroll', 'Можно записаться?', '71', 7, NULL, 559, '/pages/consult/rating/consult_numero/is_enroll'),
(581, 'is_buy', 'Можно купить?', '72', 7, NULL, 559, '/pages/consult/rating/consult_numero/is_buy'),
(582, 'numero_husband', 'Нумер. рассч. женихов', '583,584,585,588,591,597,603,604,910,911', 4, NULL, 251, '/pages/consult/rating/numero_husband'),
(583, 'title', 'Название', '196', 1, NULL, 582, '/pages/consult/rating/numero_husband/title'),
(584, 'type', 'Тип продукта', '197', 1, NULL, 582, '/pages/consult/rating/numero_husband/type'),
(585, 'price', 'Цена', '586,587', 4, NULL, 582, '/pages/consult/rating/numero_husband/price'),
(586, 'normal', 'Цена', '198', 1, NULL, 585, '/pages/consult/rating/numero_husband/price/normal'),
(587, 'sale', 'Цена со скидкой', '199', 1, NULL, 585, '/pages/consult/rating/numero_husband/price/sale'),
(588, 'annotation', 'Аннотация', '589,590', 4, NULL, 582, '/pages/consult/rating/numero_husband/annotation'),
(589, 'text', 'Краткое описание', '50', 2, NULL, 588, '/pages/consult/rating/numero_husband/annotation/text'),
(590, 'image', 'Картинка аннотации', '97', 3, NULL, 588, '/pages/consult/rating/numero_husband/annotation/image'),
(591, 'page', 'Страница', '592,593,594,595,596', 4, NULL, 582, '/pages/consult/rating/numero_husband/page'),
(592, 'image', 'Картинка', '98', 3, NULL, 591, '/pages/consult/rating/numero_husband/page/image'),
(593, '', '', '34', 6, NULL, 591, '/pages/consult/rating/numero_husband/page/'),
(594, 'image_pos_x', 'Горизонтальное выравнивание картинки', '200', 1, NULL, 591, '/pages/consult/rating/numero_husband/page/image_pos_x'),
(595, 'image_pos_y', 'Вертикальное вырванивание картинки', '201', 1, NULL, 591, '/pages/consult/rating/numero_husband/page/image_pos_y'),
(596, 'text', 'Описание', '51', 2, NULL, 591, '/pages/consult/rating/numero_husband/page/text'),
(597, 'tags', 'Тэги', '598,599,600,601,602', 4, NULL, 582, '/pages/consult/rating/numero_husband/tags'),
(598, '', '', '35', 6, NULL, 597, '/pages/consult/rating/numero_husband/tags/'),
(599, '', '', '202', 1, NULL, 597, '/pages/consult/rating/numero_husband/tags/'),
(600, '', '', '203', 1, NULL, 597, '/pages/consult/rating/numero_husband/tags/'),
(601, '', '', '204', 1, NULL, 597, '/pages/consult/rating/numero_husband/tags/'),
(602, '', '', '205', 1, NULL, 597, '/pages/consult/rating/numero_husband/tags/'),
(603, 'is_enroll', 'Можно записаться?', '73', 7, NULL, 582, '/pages/consult/rating/numero_husband/is_enroll'),
(604, 'is_buy', 'Можно купить?', '74', 7, NULL, 582, '/pages/consult/rating/numero_husband/is_buy'),
(605, 'hurt_work', 'Прораб. обиды и боли', '606,607,608,611,614,620,626,627,912,913', 4, NULL, 251, '/pages/consult/rating/hurt_work'),
(606, 'title', 'Название', '206', 1, NULL, 605, '/pages/consult/rating/hurt_work/title'),
(607, 'type', 'Тип продукта', '207', 1, NULL, 605, '/pages/consult/rating/hurt_work/type'),
(608, 'price', 'Цена', '609,610', 4, NULL, 605, '/pages/consult/rating/hurt_work/price'),
(609, 'normal', 'Цена', '208', 1, NULL, 608, '/pages/consult/rating/hurt_work/price/normal'),
(610, 'sale', 'Цена со скидкой', '209', 1, NULL, 608, '/pages/consult/rating/hurt_work/price/sale'),
(611, 'annotation', 'Аннотация', '612,613', 4, NULL, 605, '/pages/consult/rating/hurt_work/annotation'),
(612, 'text', 'Краткое описание', '52', 2, NULL, 611, '/pages/consult/rating/hurt_work/annotation/text'),
(613, 'image', 'Картинка аннотации', '99', 3, NULL, 611, '/pages/consult/rating/hurt_work/annotation/image'),
(614, 'page', 'Страница', '615,616,617,618,619', 4, NULL, 605, '/pages/consult/rating/hurt_work/page'),
(615, 'image', 'Картинка', '100', 3, NULL, 614, '/pages/consult/rating/hurt_work/page/image'),
(616, '', '', '36', 6, NULL, 614, '/pages/consult/rating/hurt_work/page/'),
(617, 'image_pos_x', 'Горизонтальное выравнивание картинки', '210', 1, NULL, 614, '/pages/consult/rating/hurt_work/page/image_pos_x'),
(618, 'image_pos_y', 'Вертикальное вырванивание картинки', '211', 1, NULL, 614, '/pages/consult/rating/hurt_work/page/image_pos_y'),
(619, 'text', 'Описание', '53', 2, NULL, 614, '/pages/consult/rating/hurt_work/page/text'),
(620, 'tags', 'Тэги', '621,622,623,624,625', 4, NULL, 605, '/pages/consult/rating/hurt_work/tags'),
(621, '', '', '37', 6, NULL, 620, '/pages/consult/rating/hurt_work/tags/'),
(622, '', '', '212', 1, NULL, 620, '/pages/consult/rating/hurt_work/tags/'),
(623, '', '', '213', 1, NULL, 620, '/pages/consult/rating/hurt_work/tags/'),
(624, '', '', '214', 1, NULL, 620, '/pages/consult/rating/hurt_work/tags/'),
(625, '', '', '215', 1, NULL, 620, '/pages/consult/rating/hurt_work/tags/'),
(626, 'is_enroll', 'Можно записаться?', '75', 7, NULL, 605, '/pages/consult/rating/hurt_work/is_enroll'),
(627, 'is_buy', 'Можно купить?', '76', 7, NULL, 605, '/pages/consult/rating/hurt_work/is_buy'),
(628, 'free_mailing', 'Бесплатная рассылка', '629,630,631,634,637,643,649,650,914,915', 4, NULL, 251, '/pages/consult/rating/free_mailing'),
(629, 'title', 'Название', '216', 1, NULL, 628, '/pages/consult/rating/free_mailing/title'),
(630, 'type', 'Тип продукта', '217', 1, NULL, 628, '/pages/consult/rating/free_mailing/type'),
(631, 'price', 'Цена', '632,633', 4, NULL, 628, '/pages/consult/rating/free_mailing/price'),
(632, 'normal', 'Цена', '218', 1, NULL, 631, '/pages/consult/rating/free_mailing/price/normal'),
(633, 'sale', 'Цена со скидкой', '219', 1, NULL, 631, '/pages/consult/rating/free_mailing/price/sale'),
(634, 'annotation', 'Аннотация', '635,636', 4, NULL, 628, '/pages/consult/rating/free_mailing/annotation'),
(635, 'text', 'Краткое описание', '54', 2, NULL, 634, '/pages/consult/rating/free_mailing/annotation/text'),
(636, 'image', 'Картинка аннотации', '101', 3, NULL, 634, '/pages/consult/rating/free_mailing/annotation/image'),
(637, 'page', 'Страница', '638,639,640,641,642', 4, NULL, 628, '/pages/consult/rating/free_mailing/page'),
(638, 'image', 'Картинка', '102', 3, NULL, 637, '/pages/consult/rating/free_mailing/page/image'),
(639, '', '', '38', 6, NULL, 637, '/pages/consult/rating/free_mailing/page/'),
(640, 'image_pos_x', 'Горизонтальное выравнивание картинки', '220', 1, NULL, 637, '/pages/consult/rating/free_mailing/page/image_pos_x'),
(641, 'image_pos_y', 'Вертикальное вырванивание картинки', '221', 1, NULL, 637, '/pages/consult/rating/free_mailing/page/image_pos_y'),
(642, 'text', 'Описание', '55', 2, NULL, 637, '/pages/consult/rating/free_mailing/page/text'),
(643, 'tags', 'Тэги', '644,645,646,647,648', 4, NULL, 628, '/pages/consult/rating/free_mailing/tags'),
(644, '', '', '39', 6, NULL, 643, '/pages/consult/rating/free_mailing/tags/'),
(645, '', '', '222', 1, NULL, 643, '/pages/consult/rating/free_mailing/tags/'),
(646, '', '', '223', 1, NULL, 643, '/pages/consult/rating/free_mailing/tags/'),
(647, '', '', '224', 1, NULL, 643, '/pages/consult/rating/free_mailing/tags/'),
(648, '', '', '225', 1, NULL, 643, '/pages/consult/rating/free_mailing/tags/'),
(649, 'is_enroll', 'Можно записаться?', '77', 7, NULL, 628, '/pages/consult/rating/free_mailing/is_enroll'),
(650, 'is_buy', 'Можно купить?', '78', 7, NULL, 628, '/pages/consult/rating/free_mailing/is_buy'),
(651, 'event', 'Ближайшие мероприятия', '652,677', 4, NULL, 42, '/pages/event'),
(652, 'event1', 'Вебинар. Личностный рост', '676,653,675,654,655,703,658,661,667,673,674,916,917', 4, NULL, 651, '/pages/event/event1'),
(653, 'title', 'Название', '226', 1, NULL, 652, '/pages/event/event1/title'),
(654, 'type', 'Тип продукта', '227', 1, NULL, 652, '/pages/event/event1/type'),
(655, 'price', 'Цена', '656,657', 4, NULL, 652, '/pages/event/event1/price'),
(656, 'normal', 'Цена', '228', 1, NULL, 655, '/pages/event/event1/price/normal'),
(657, 'sale', 'Цена со скидкой', '229', 1, NULL, 655, '/pages/event/event1/price/sale'),
(658, 'annotation', 'Аннотация', '659,660', 4, NULL, 652, '/pages/event/event1/annotation'),
(659, 'text', 'Краткое описание', '56', 2, NULL, 658, '/pages/event/event1/annotation/text'),
(660, 'image', 'Картинка аннотации', '103', 3, NULL, 658, '/pages/event/event1/annotation/image'),
(661, 'page', 'Страница', '662,663,664,665,666', 4, NULL, 652, '/pages/event/event1/page'),
(662, 'image', 'Картинка', '104', 3, NULL, 661, '/pages/event/event1/page/image'),
(663, '', '', '40', 6, NULL, 661, '/pages/event/event1/page/'),
(664, 'image_pos_x', 'Горизонтальное выравнивание картинки', '230', 1, NULL, 661, '/pages/event/event1/page/image_pos_x'),
(665, 'image_pos_y', 'Вертикальное вырванивание картинки', '231', 1, NULL, 661, '/pages/event/event1/page/image_pos_y'),
(666, 'text', 'Описание', '57', 2, NULL, 661, '/pages/event/event1/page/text'),
(667, 'tags', 'Тэги', '668,669,670,671,672', 4, NULL, 652, '/pages/event/event1/tags'),
(668, '', '', '41', 6, NULL, 667, '/pages/event/event1/tags/'),
(669, '', '', '232', 1, NULL, 667, '/pages/event/event1/tags/'),
(670, '', '', '233', 1, NULL, 667, '/pages/event/event1/tags/'),
(671, '', '', '234', 1, NULL, 667, '/pages/event/event1/tags/'),
(672, '', '', '235', 1, NULL, 667, '/pages/event/event1/tags/'),
(673, 'is_enroll', 'Можно записаться?', '79', 7, NULL, 652, '/pages/event/event1/is_enroll'),
(674, 'is_buy', 'Можно купить?', '80', 7, NULL, 652, '/pages/event/event1/is_buy'),
(675, 'datetime', 'Дата и время проведения', '236', 1, NULL, 652, '/pages/event/event1/datetime'),
(676, 'is_visible', 'Событие видно?', '81', 7, NULL, 652, '/pages/event/event1/is_visible'),
(677, 'event2', 'Консультация. Семейное счастье', '678,679,680,681,682,702,685,688,694,700,701,918,919', 4, NULL, 651, '/pages/event/event2'),
(678, 'is_visible', 'Событие видно?', '82', 7, NULL, 677, '/pages/event/event2/is_visible'),
(679, 'title', 'Название', '237', 1, NULL, 677, '/pages/event/event2/title'),
(680, 'datetime', 'Дата и время проведения', '238', 1, NULL, 677, '/pages/event/event2/datetime'),
(681, 'type', 'Тип продукта', '239', 1, NULL, 677, '/pages/event/event2/type'),
(682, 'price', 'Цена', '683,684', 4, NULL, 677, '/pages/event/event2/price'),
(683, 'normal', 'Цена', '240', 1, NULL, 682, '/pages/event/event2/price/normal'),
(684, 'sale', 'Цена со скидкой', '241', 1, NULL, 682, '/pages/event/event2/price/sale'),
(685, 'annotation', 'Аннотация', '686,687', 4, NULL, 677, '/pages/event/event2/annotation'),
(686, 'text', 'Краткое описание', '58', 2, NULL, 685, '/pages/event/event2/annotation/text'),
(687, 'image', 'Картинка аннотации', '105', 3, NULL, 685, '/pages/event/event2/annotation/image'),
(688, 'page', 'Страница', '689,690,691,692,693', 4, NULL, 677, '/pages/event/event2/page'),
(689, 'image', 'Картинка', '106', 3, NULL, 688, '/pages/event/event2/page/image'),
(690, '', '', '42', 6, NULL, 688, '/pages/event/event2/page/'),
(691, 'image_pos_x', 'Горизонтальное выравнивание картинки', '242', 1, NULL, 688, '/pages/event/event2/page/image_pos_x'),
(692, 'image_pos_y', 'Вертикальное вырванивание картинки', '243', 1, NULL, 688, '/pages/event/event2/page/image_pos_y'),
(693, 'text', 'Описание', '59', 2, NULL, 688, '/pages/event/event2/page/text'),
(694, 'tags', 'Тэги', '695,696,697,698,699', 4, NULL, 677, '/pages/event/event2/tags'),
(695, '', '', '43', 6, NULL, 694, '/pages/event/event2/tags/'),
(696, '', '', '244', 1, NULL, 694, '/pages/event/event2/tags/'),
(697, '', '', '245', 1, NULL, 694, '/pages/event/event2/tags/'),
(698, '', '', '246', 1, NULL, 694, '/pages/event/event2/tags/'),
(699, '', '', '247', 1, NULL, 694, '/pages/event/event2/tags/'),
(700, 'is_enroll', 'Можно записаться?', '83', 7, NULL, 677, '/pages/event/event2/is_enroll'),
(701, 'is_buy', 'Можно купить?', '84', 7, NULL, 677, '/pages/event/event2/is_buy'),
(702, NULL, '', '44', 6, NULL, 677, '/pages/event/event2'),
(703, '', '', '45', 6, NULL, 652, '/pages/event/event1/'),
(704, 'numerology', 'Нумерология', '706,729,750,751,752,773', 4, NULL, 42, '/pages/numerology'),
(705, 'text', 'Описание', '60', 2, NULL, 715, '/pages/numerology/consult_talk/page/text'),
(706, 'consult_talk', 'Консультации Общение', '707,708,709,712,715,721,727,728', 4, NULL, 704, '/pages/numerology/consult_talk'),
(707, 'title', 'Название', '248', 1, NULL, 706, '/pages/numerology/consult_talk/title'),
(708, 'type', 'Тип продукта', '249', 1, NULL, 706, '/pages/numerology/consult_talk/type'),
(709, 'price', 'Цена', '710,711', 4, NULL, 706, '/pages/numerology/consult_talk/price'),
(710, 'normal', 'Цена', '250', 1, NULL, 709, '/pages/numerology/consult_talk/price/normal'),
(711, 'sale', 'Цена со скидкой', '251', 1, NULL, 709, '/pages/numerology/consult_talk/price/sale'),
(712, 'annotation', 'Аннотация', '713,714', 4, NULL, 706, '/pages/numerology/consult_talk/annotation'),
(713, 'text', 'Краткое описание', '61', 2, NULL, 712, '/pages/numerology/consult_talk/annotation/text'),
(714, 'image', 'Картинка аннотации', '107', 3, NULL, 712, '/pages/numerology/consult_talk/annotation/image'),
(715, 'page', 'Страница', '716,717,718,719,705', 4, NULL, 706, '/pages/numerology/consult_talk/page'),
(716, 'image', 'Картинка', '108', 3, NULL, 715, '/pages/numerology/consult_talk/page/image'),
(717, '', '', '46', 6, NULL, 715, '/pages/numerology/consult_talk/page/'),
(718, 'image_pos_x', 'Горизонтальное выравнивание картинки', '252', 1, NULL, 715, '/pages/numerology/consult_talk/page/image_pos_x'),
(719, 'image_pos_y', 'Вертикальное вырванивание картинки', '253', 1, NULL, 715, '/pages/numerology/consult_talk/page/image_pos_y'),
(721, 'tags', 'Тэги', '722,723,724,725,726', 4, NULL, 706, '/pages/numerology/consult_talk/tags'),
(722, '', '', '47', 6, NULL, 721, '/pages/numerology/consult_talk/tags/'),
(723, '', '', '254', 1, NULL, 721, '/pages/numerology/consult_talk/tags/'),
(724, '', '', '255', 1, NULL, 721, '/pages/numerology/consult_talk/tags/'),
(725, '', '', '256', 1, NULL, 721, '/pages/numerology/consult_talk/tags/'),
(726, '', '', '257', 1, NULL, 721, '/pages/numerology/consult_talk/tags/'),
(727, 'is_enroll', 'Можно записаться?', '85', 7, NULL, 706, '/pages/numerology/consult_talk/is_enroll'),
(728, 'is_buy', 'Можно купить?', '86', 7, NULL, 706, '/pages/numerology/consult_talk/is_buy'),
(729, 'consult_write', 'Консультации Описательные', '730,731,732,735,738,743,748,749', 4, NULL, 704, '/pages/numerology/consult_write'),
(730, 'title', 'Название', '258', 1, NULL, 729, '/pages/numerology/consult_write/title'),
(731, 'type', 'Тип продукта', '259', 1, NULL, 729, '/pages/numerology/consult_write/type'),
(732, 'price', 'Цена', '733,734', 4, NULL, 729, '/pages/numerology/consult_write/price');
INSERT INTO `jf-cms_db-item` (`id_db-item`, `db-item_key`, `db-item_name`, `db-item_value`, `db-item_value-type`, `db-item_value-subtype`, `db-item_parent`, `db-item_path`) VALUES
(733, 'normal', 'Цена', '260', 1, NULL, 732, '/pages/numerology/consult_write/price/normal'),
(734, 'sale', 'Цена со скидкой', '261', 1, NULL, 732, '/pages/numerology/consult_write/price/sale'),
(735, 'annotation', 'Аннотация', '736,737', 4, NULL, 729, '/pages/numerology/consult_write/annotation'),
(736, 'text', 'Краткое описание', '63', 2, NULL, 735, '/pages/numerology/consult_write/annotation/text'),
(737, 'image', 'Картинка аннотации', '109', 3, NULL, 735, '/pages/numerology/consult_write/annotation/image'),
(738, 'page', 'Страница', '739,740,741,742', 4, NULL, 729, '/pages/numerology/consult_write/page'),
(739, 'image', 'Картинка', '110', 3, NULL, 738, '/pages/numerology/consult_write/page/image'),
(740, 'image_pos_x', 'Горизонтальное выравнивание картинки', '262', 1, NULL, 738, '/pages/numerology/consult_write/page/image_pos_x'),
(741, 'image_pos_y', 'Вертикальное вырванивание картинки', '263', 1, NULL, 738, '/pages/numerology/consult_write/page/image_pos_y'),
(742, 'text', 'Описание', '64', 2, NULL, 738, '/pages/numerology/consult_write/page/text'),
(743, 'tags', 'Тэги', '744,745,746,747', 4, NULL, 729, '/pages/numerology/consult_write/tags'),
(744, '', '', '264', 1, NULL, 743, '/pages/numerology/consult_write/tags/'),
(745, '', '', '265', 1, NULL, 743, '/pages/numerology/consult_write/tags/'),
(746, '', '', '266', 1, NULL, 743, '/pages/numerology/consult_write/tags/'),
(747, '', '', '267', 1, NULL, 743, '/pages/numerology/consult_write/tags/'),
(748, 'is_enroll', 'Можно записаться?', '87', 7, NULL, 729, '/pages/numerology/consult_write/is_enroll'),
(749, 'is_buy', 'Можно купить?', '88', 7, NULL, 729, '/pages/numerology/consult_write/is_buy'),
(750, 'teach', 'Обучение', '65', 2, NULL, 704, '/pages/numerology/teach'),
(751, 'teach_video', 'Видео', '1', 10, NULL, 704, '/pages/numerology/teach_video'),
(752, 'teach_real', 'Обучение Живое', '753,754,755,758,761,766,771,772', 4, NULL, 704, '/pages/numerology/teach_real'),
(753, 'title', 'Название', '268', 1, NULL, 752, '/pages/numerology/teach_real/title'),
(754, 'type', 'Тип продукта', '269', 1, NULL, 752, '/pages/numerology/teach_real/type'),
(755, 'price', 'Цена', '756,757', 4, NULL, 752, '/pages/numerology/teach_real/price'),
(756, 'normal', 'Цена', '270', 1, NULL, 755, '/pages/numerology/teach_real/price/normal'),
(757, 'sale', 'Цена со скидкой', '271', 1, NULL, 755, '/pages/numerology/teach_real/price/sale'),
(758, 'annotation', 'Аннотация', '759,760', 4, NULL, 752, '/pages/numerology/teach_real/annotation'),
(759, 'text', 'Краткое описание', '66', 2, NULL, 758, '/pages/numerology/teach_real/annotation/text'),
(760, 'image', 'Картинка аннотации', '111', 3, NULL, 758, '/pages/numerology/teach_real/annotation/image'),
(761, 'page', 'Страница', '762,763,764,765', 4, NULL, 752, '/pages/numerology/teach_real/page'),
(762, 'image', 'Картинка', '112', 3, NULL, 761, '/pages/numerology/teach_real/page/image'),
(763, 'image_pos_x', 'Горизонтальное выравнивание картинки', '272', 1, NULL, 761, '/pages/numerology/teach_real/page/image_pos_x'),
(764, 'image_pos_y', 'Вертикальное вырванивание картинки', '273', 1, NULL, 761, '/pages/numerology/teach_real/page/image_pos_y'),
(765, 'text', 'Описание', '67', 2, NULL, 761, '/pages/numerology/teach_real/page/text'),
(766, 'tags', 'Тэги', '767,768,769,770', 4, NULL, 752, '/pages/numerology/teach_real/tags'),
(767, '', '', '274', 1, NULL, 766, '/pages/numerology/teach_real/tags/'),
(768, '', '', '275', 1, NULL, 766, '/pages/numerology/teach_real/tags/'),
(769, '', '', '276', 1, NULL, 766, '/pages/numerology/teach_real/tags/'),
(770, '', '', '277', 1, NULL, 766, '/pages/numerology/teach_real/tags/'),
(771, 'is_enroll', 'Можно записаться?', '89', 7, NULL, 752, '/pages/numerology/teach_real/is_enroll'),
(772, 'is_buy', 'Можно купить?', '90', 7, NULL, 752, '/pages/numerology/teach_real/is_buy'),
(773, 'teach_online', 'Обучение Онлайн', '774,775,776,779,782,787,792,793', 4, NULL, 704, '/pages/numerology/teach_online'),
(774, 'title', 'Название', '278', 1, NULL, 773, '/pages/numerology/teach_online/title'),
(775, 'type', 'Тип продукта', '279', 1, NULL, 773, '/pages/numerology/teach_online/type'),
(776, 'price', 'Цена', '777,778', 4, NULL, 773, '/pages/numerology/teach_online/price'),
(777, 'normal', 'Цена', '280', 1, NULL, 776, '/pages/numerology/teach_online/price/normal'),
(778, 'sale', 'Цена со скидкой', '281', 1, NULL, 776, '/pages/numerology/teach_online/price/sale'),
(779, 'annotation', 'Аннотация', '780,781', 4, NULL, 773, '/pages/numerology/teach_online/annotation'),
(780, 'text', 'Краткое описание', '68', 2, NULL, 779, '/pages/numerology/teach_online/annotation/text'),
(781, 'image', 'Картинка аннотации', '113', 3, NULL, 779, '/pages/numerology/teach_online/annotation/image'),
(782, 'page', 'Страница', '783,784,785,786', 4, NULL, 773, '/pages/numerology/teach_online/page'),
(783, 'image', 'Картинка', '114', 3, NULL, 782, '/pages/numerology/teach_online/page/image'),
(784, 'image_pos_x', 'Горизонтальное выравнивание картинки', '282', 1, NULL, 782, '/pages/numerology/teach_online/page/image_pos_x'),
(785, 'image_pos_y', 'Вертикальное вырванивание картинки', '283', 1, NULL, 782, '/pages/numerology/teach_online/page/image_pos_y'),
(786, 'text', 'Описание', '69', 2, NULL, 782, '/pages/numerology/teach_online/page/text'),
(787, 'tags', 'Тэги', '788,789,790,791', 4, NULL, 773, '/pages/numerology/teach_online/tags'),
(788, '', '', '284', 1, NULL, 787, '/pages/numerology/teach_online/tags/'),
(789, '', '', '285', 1, NULL, 787, '/pages/numerology/teach_online/tags/'),
(790, '', '', '286', 1, NULL, 787, '/pages/numerology/teach_online/tags/'),
(791, '', '', '287', 1, NULL, 787, '/pages/numerology/teach_online/tags/'),
(792, 'is_enroll', 'Можно записаться?', '91', 7, NULL, 773, '/pages/numerology/teach_online/is_enroll'),
(793, 'is_buy', 'Можно купить?', '92', 7, NULL, 773, '/pages/numerology/teach_online/is_buy'),
(794, 'shop', 'Магазин', '795,816,837,858', 4, NULL, 42, '/pages/shop'),
(795, 'product1', 'Длинное название', '796,797,798,801,804,809,814,815,920,921', 4, NULL, 794, '/pages/shop/product1'),
(796, 'title', 'Название', '288', 1, NULL, 795, '/pages/shop/product1/title'),
(797, 'type', 'Тип продукта', '289', 1, NULL, 795, '/pages/shop/product1/type'),
(798, 'price', 'Цена', '799,800', 4, NULL, 795, '/pages/shop/product1/price'),
(799, 'normal', 'Цена', '290', 1, NULL, 798, '/pages/shop/product1/price/normal'),
(800, 'sale', 'Цена со скидкой', '291', 1, NULL, 798, '/pages/shop/product1/price/sale'),
(801, 'annotation', 'Аннотация', '802,803', 4, NULL, 795, '/pages/shop/product1/annotation'),
(802, 'text', 'Краткое описание', '70', 2, NULL, 801, '/pages/shop/product1/annotation/text'),
(803, 'image', 'Картинка аннотации', '115', 3, NULL, 801, '/pages/shop/product1/annotation/image'),
(804, 'page', 'Страница', '805,806,807,808', 4, NULL, 795, '/pages/shop/product1/page'),
(805, 'image', 'Картинка', '116', 3, NULL, 804, '/pages/shop/product1/page/image'),
(806, 'image_pos_x', 'Горизонтальное выравнивание картинки', '292', 1, NULL, 804, '/pages/shop/product1/page/image_pos_x'),
(807, 'image_pos_y', 'Вертикальное вырванивание картинки', '293', 1, NULL, 804, '/pages/shop/product1/page/image_pos_y'),
(808, 'text', 'Описание', '71', 2, NULL, 804, '/pages/shop/product1/page/text'),
(809, 'tags', 'Тэги', '812,813', 4, NULL, 795, '/pages/shop/product1/tags'),
(812, '', '', '296', 1, NULL, 809, '/pages/shop/product1/tags/'),
(813, '', '', '297', 1, NULL, 809, '/pages/shop/product1/tags/'),
(814, 'is_enroll', 'Можно записаться?', '93', 7, NULL, 795, '/pages/shop/product1/is_enroll'),
(815, 'is_buy', 'Можно купить?', '94', 7, NULL, 795, '/pages/shop/product1/is_buy'),
(816, 'product2', 'Очень очень очень длинное название', '817,818,819,822,825,830,835,836,922,923', 4, NULL, 794, '/pages/shop/product2'),
(817, 'title', 'Название', '298', 1, NULL, 816, '/pages/shop/product2/title'),
(818, 'type', 'Тип продукта', '299', 1, NULL, 816, '/pages/shop/product2/type'),
(819, 'price', 'Цена', '820,821', 4, NULL, 816, '/pages/shop/product2/price'),
(820, 'normal', 'Цена', '300', 1, NULL, 819, '/pages/shop/product2/price/normal'),
(821, 'sale', 'Цена со скидкой', '301', 1, NULL, 819, '/pages/shop/product2/price/sale'),
(822, 'annotation', 'Аннотация', '823,824', 4, NULL, 816, '/pages/shop/product2/annotation'),
(823, 'text', 'Краткое описание', '72', 2, NULL, 822, '/pages/shop/product2/annotation/text'),
(824, 'image', 'Картинка аннотации', '117', 3, NULL, 822, '/pages/shop/product2/annotation/image'),
(825, 'page', 'Страница', '826,827,828,829', 4, NULL, 816, '/pages/shop/product2/page'),
(826, 'image', 'Картинка', '118', 3, NULL, 825, '/pages/shop/product2/page/image'),
(827, 'image_pos_x', 'Горизонтальное выравнивание картинки', '302', 1, NULL, 825, '/pages/shop/product2/page/image_pos_x'),
(828, 'image_pos_y', 'Вертикальное вырванивание картинки', '303', 1, NULL, 825, '/pages/shop/product2/page/image_pos_y'),
(829, 'text', 'Описание', '73', 2, NULL, 825, '/pages/shop/product2/page/text'),
(830, 'tags', 'Тэги', '831,834', 4, NULL, 816, '/pages/shop/product2/tags'),
(831, '', '', '304', 1, NULL, 830, '/pages/shop/product2/tags/'),
(834, '', '', '307', 1, NULL, 830, '/pages/shop/product2/tags/'),
(835, 'is_enroll', 'Можно записаться?', '95', 7, NULL, 816, '/pages/shop/product2/is_enroll'),
(836, 'is_buy', 'Можно купить?', '96', 7, NULL, 816, '/pages/shop/product2/is_buy'),
(837, 'product3', 'Как стать успешным?', '838,839,840,843,846,851,856,857,924,925', 4, NULL, 794, '/pages/shop/product3'),
(838, 'title', 'Название', '308', 1, NULL, 837, '/pages/shop/product3/title'),
(839, 'type', 'Тип продукта', '309', 1, NULL, 837, '/pages/shop/product3/type'),
(840, 'price', 'Цена', '841,842', 4, NULL, 837, '/pages/shop/product3/price'),
(841, 'normal', 'Цена', '310', 1, NULL, 840, '/pages/shop/product3/price/normal'),
(842, 'sale', 'Цена со скидкой', '311', 1, NULL, 840, '/pages/shop/product3/price/sale'),
(843, 'annotation', 'Аннотация', '844,845', 4, NULL, 837, '/pages/shop/product3/annotation'),
(844, 'text', 'Краткое описание', '74', 2, NULL, 843, '/pages/shop/product3/annotation/text'),
(845, 'image', 'Картинка аннотации', '119', 3, NULL, 843, '/pages/shop/product3/annotation/image'),
(846, 'page', 'Страница', '847,848,849,850', 4, NULL, 837, '/pages/shop/product3/page'),
(847, 'image', 'Картинка', '120', 3, NULL, 846, '/pages/shop/product3/page/image'),
(848, 'image_pos_x', 'Горизонтальное выравнивание картинки', '312', 1, NULL, 846, '/pages/shop/product3/page/image_pos_x'),
(849, 'image_pos_y', 'Вертикальное вырванивание картинки', '313', 1, NULL, 846, '/pages/shop/product3/page/image_pos_y'),
(850, 'text', 'Описание', '75', 2, NULL, 846, '/pages/shop/product3/page/text'),
(851, 'tags', 'Тэги', '852,853', 4, NULL, 837, '/pages/shop/product3/tags'),
(852, '', '', '314', 1, NULL, 851, '/pages/shop/product3/tags/'),
(853, '', '', '315', 1, NULL, 851, '/pages/shop/product3/tags/'),
(856, 'is_enroll', 'Можно записаться?', '97', 7, NULL, 837, '/pages/shop/product3/is_enroll'),
(857, 'is_buy', 'Можно купить?', '98', 7, NULL, 837, '/pages/shop/product3/is_buy'),
(858, 'product4', '10 шагов к счастью', '859,860,861,864,867,872,877,878,926,927', 4, NULL, 794, '/pages/shop/product4'),
(859, 'title', 'Название', '318', 1, NULL, 858, '/pages/shop/product4/title'),
(860, 'type', 'Тип продукта', '319', 1, NULL, 858, '/pages/shop/product4/type'),
(861, 'price', 'Цена', '862,863', 4, NULL, 858, '/pages/shop/product4/price'),
(862, 'normal', 'Цена', '320', 1, NULL, 861, '/pages/shop/product4/price/normal'),
(863, 'sale', 'Цена со скидкой', '321', 1, NULL, 861, '/pages/shop/product4/price/sale'),
(864, 'annotation', 'Аннотация', '865,866', 4, NULL, 858, '/pages/shop/product4/annotation'),
(865, 'text', 'Краткое описание', '76', 2, NULL, 864, '/pages/shop/product4/annotation/text'),
(866, 'image', 'Картинка аннотации', '121', 3, NULL, 864, '/pages/shop/product4/annotation/image'),
(867, 'page', 'Страница', '868,869,870,871', 4, NULL, 858, '/pages/shop/product4/page'),
(868, 'image', 'Картинка', '122', 3, NULL, 867, '/pages/shop/product4/page/image'),
(869, 'image_pos_x', 'Горизонтальное выравнивание картинки', '322', 1, NULL, 867, '/pages/shop/product4/page/image_pos_x'),
(870, 'image_pos_y', 'Вертикальное вырванивание картинки', '323', 1, NULL, 867, '/pages/shop/product4/page/image_pos_y'),
(871, 'text', 'Описание', '77', 2, NULL, 867, '/pages/shop/product4/page/text'),
(872, 'tags', 'Тэги', '874,875', 4, NULL, 858, '/pages/shop/product4/tags'),
(874, '', '', '325', 1, NULL, 872, '/pages/shop/product4/tags/'),
(875, '', '', '326', 1, NULL, 872, '/pages/shop/product4/tags/'),
(877, 'is_enroll', 'Можно записаться?', '99', 7, NULL, 858, '/pages/shop/product4/is_enroll'),
(878, 'is_buy', 'Можно купить?', '100', 7, NULL, 858, '/pages/shop/product4/is_buy'),
(879, 'rating_title', 'Заголовок рейтинга', '328', 1, NULL, 250, '/pages/consult/rating_title'),
(880, 'image_padding', 'Отступ картинки', '329', 1, NULL, 356, '/pages/consult/types/serial/annotation/image_padding'),
(881, 'image_padding', 'Отступ картинки', '330', 1, NULL, 291, '/pages/consult/types/once/annotation/image_padding'),
(882, 'image_padding', 'Отступ картинки', '331', 1, NULL, 379, '/pages/consult/types/family/annotation/image_padding'),
(886, 'viewed_count', 'Просмотрено', '333', 1, NULL, 255, '/pages/consult/types/once/viewed_count'),
(887, 'bought_count', 'Куплено', '334', 1, NULL, 255, '/pages/consult/types/once/bought_count'),
(888, 'viewed_count', 'Просмотрено', '335', 1, NULL, 350, '/pages/consult/types/serial/viewed_count'),
(889, 'bought_count', 'Куплено', '336', 1, NULL, 350, '/pages/consult/types/serial/bought_count'),
(890, 'viewed_count', 'Просмотрено', '337', 1, NULL, 373, '/pages/consult/types/family/viewed_count'),
(891, 'bought_count', 'Куплено', '338', 1, NULL, 373, '/pages/consult/types/family/bought_count'),
(892, 'viewed_count', 'Просмотрено', '339', 1, NULL, 327, '/pages/consult/rating/email/viewed_count'),
(893, 'bought_count', 'Куплено', '340', 1, NULL, 327, '/pages/consult/rating/email/bought_count'),
(894, 'viewed_count', 'Просмотрено', '341', 1, NULL, 397, '/pages/consult/rating/letter/viewed_count'),
(895, 'bought_count', 'Куплено', '342', 1, NULL, 397, '/pages/consult/rating/letter/bought_count'),
(896, 'viewed_count', 'Просмотрено', '343', 1, NULL, 420, '/pages/consult/rating/payed_mailing/viewed_count'),
(897, 'bought_count', 'Куплено', '344', 1, NULL, 420, '/pages/consult/rating/payed_mailing/bought_count'),
(898, 'viewed_count', 'Просмотрено', '345', 1, NULL, 443, '/pages/consult/rating/women_clubs/viewed_count'),
(899, 'bought_count', 'Куплено', '346', 1, NULL, 443, '/pages/consult/rating/women_clubs/bought_count'),
(900, 'viewed_count', 'Просмотрено', '347', 1, NULL, 466, '/pages/consult/rating/numero_study/viewed_count'),
(901, 'bought_count', 'Куплено', '348', 1, NULL, 466, '/pages/consult/rating/numero_study/bought_count'),
(902, 'viewed_count', 'Просмотрено', '349', 1, NULL, 559, '/pages/consult/rating/consult_numero/viewed_count'),
(903, 'bought_count', 'Куплено', '350', 1, NULL, 559, '/pages/consult/rating/consult_numero/bought_count'),
(904, 'viewed_count', 'Просмотрено', '351', 1, NULL, 489, '/pages/consult/rating/online_courses/viewed_count'),
(905, 'bought_count', 'Куплено', '352', 1, NULL, 489, '/pages/consult/rating/online_courses/bought_count'),
(906, 'viewed_count', 'Просмотрено', '353', 1, NULL, 512, '/pages/consult/rating/online_mentor/viewed_count'),
(907, 'bought_count', 'Куплено', '354', 1, NULL, 512, '/pages/consult/rating/online_mentor/bought_count'),
(908, 'viewed_count', 'Просмотрено', '355', 1, NULL, 535, '/pages/consult/rating/assoc_shpar/viewed_count'),
(909, 'bought_count', 'Куплено', '356', 1, NULL, 535, '/pages/consult/rating/assoc_shpar/bought_count'),
(910, 'viewed_count', 'Просмотрено', '357', 1, NULL, 582, '/pages/consult/rating/numero_husband/viewed_count'),
(911, 'bought_count', 'Куплено', '358', 1, NULL, 582, '/pages/consult/rating/numero_husband/bought_count'),
(912, 'viewed_count', 'Просмотрено', '359', 1, NULL, 605, '/pages/consult/rating/hurt_work/viewed_count'),
(913, 'bought_count', 'Куплено', '360', 1, NULL, 605, '/pages/consult/rating/hurt_work/bought_count'),
(914, 'viewed_count', 'Просмотрено', '361', 1, NULL, 628, '/pages/consult/rating/free_mailing/viewed_count'),
(915, 'bought_count', 'Куплено', '362', 1, NULL, 628, '/pages/consult/rating/free_mailing/bought_count'),
(916, 'viewed_count', 'Просмотрено', '363', 1, NULL, 652, '/pages/event/event1/viewed_count'),
(917, 'bought_count', 'Куплено', '364', 1, NULL, 652, '/pages/event/event1/bought_count'),
(918, 'viewed_count', 'Просмотрено', '365', 1, NULL, 677, '/pages/event/event2/viewed_count'),
(919, 'bought_count', 'Куплено', '366', 1, NULL, 677, '/pages/event/event2/bought_count'),
(920, 'viewed_count', 'Просмотрено', '367', 1, NULL, 795, '/pages/shop/product1/viewed_count'),
(921, 'bought_count', 'Куплено', '368', 1, NULL, 795, '/pages/shop/product1/bought_count'),
(922, 'viewed_count', 'Просмотрено', '369', 1, NULL, 816, '/pages/shop/product2/viewed_count'),
(923, 'bought_count', 'Куплено', '370', 1, NULL, 816, '/pages/shop/product2/bought_count'),
(924, 'viewed_count', 'Просмотрено', '371', 1, NULL, 837, '/pages/shop/product3/viewed_count'),
(925, 'bought_count', 'Куплено', '372', 1, NULL, 837, '/pages/shop/product3/bought_count'),
(926, 'viewed_count', 'Просмотрено', '373', 1, NULL, 858, '/pages/shop/product4/viewed_count'),
(927, 'bought_count', 'Куплено', '374', 1, NULL, 858, '/pages/shop/product4/bought_count'),
(928, 'blog', 'Блог', '929,932,933', 4, NULL, 42, '/pages/blog'),
(929, 'header', 'Заголовок с цитатой', '931,930', 4, NULL, 928, '/pages/blog/header'),
(930, 'author', 'Автор', '375', 1, NULL, 929, '/pages/blog/header/author'),
(931, 'text', 'Текст', '78', 2, NULL, 929, '/pages/blog/header/text'),
(932, 'themes', 'Темы (квадратики)', '1004,1007,1010,1013,1019', 4, NULL, 928, '/pages/blog/themes'),
(933, 'posts', 'Посты', '956,980,1176', 4, NULL, 928, '/pages/blog/posts'),
(956, 'post1', '10 шагов к счастью', '957,958,979,959,962,965,970,973,974,975,976', 4, NULL, 933, '/pages/blog/posts/post1'),
(957, 'title', 'Название', '386', 1, NULL, 956, '/pages/blog/posts/post1/title'),
(958, 'type', 'Тип продукта', '387', 1, NULL, 956, '/pages/blog/posts/post1/type'),
(959, 'price', 'Цена', '960,961', 4, NULL, 956, '/pages/blog/posts/post1/price'),
(960, 'normal', 'Цена', '388', 1, NULL, 959, '/pages/blog/posts/post1/price/normal'),
(961, 'sale', 'Цена со скидкой', '389', 1, NULL, 959, '/pages/blog/posts/post1/price/sale'),
(962, 'annotation', 'Аннотация', '963,964', 4, NULL, 956, '/pages/blog/posts/post1/annotation'),
(963, 'text', 'Краткое описание', '81', 2, NULL, 962, '/pages/blog/posts/post1/annotation/text'),
(964, 'image', 'Картинка аннотации', '125', 3, NULL, 962, '/pages/blog/posts/post1/annotation/image'),
(965, 'page', 'Страница', '966,967,968,969', 4, NULL, 956, '/pages/blog/posts/post1/page'),
(966, 'image', 'Картинка', '126', 3, NULL, 965, '/pages/blog/posts/post1/page/image'),
(967, 'image_pos_x', 'Горизонтальное выравнивание картинки', '390', 1, NULL, 965, '/pages/blog/posts/post1/page/image_pos_x'),
(968, 'image_pos_y', 'Вертикальное вырванивание картинки', '391', 1, NULL, 965, '/pages/blog/posts/post1/page/image_pos_y'),
(969, 'text', 'Описание', '82', 2, NULL, 965, '/pages/blog/posts/post1/page/text'),
(970, 'tags', 'Тэги', '977,971', 4, NULL, 956, '/pages/blog/posts/post1/tags'),
(971, '', '', '392', 1, NULL, 970, '/pages/blog/posts/post1/tags/'),
(973, 'is_enroll', 'Можно записаться?', '103', 7, NULL, 956, '/pages/blog/posts/post1/is_enroll'),
(974, 'is_buy', 'Можно купить?', '104', 7, NULL, 956, '/pages/blog/posts/post1/is_buy'),
(975, 'viewed_count', 'Просмотрено', '394', 1, NULL, 956, '/pages/blog/posts/post1/viewed_count'),
(976, 'bought_count', 'Куплено', '395', 1, NULL, 956, '/pages/blog/posts/post1/bought_count'),
(977, NULL, '', '396', 1, NULL, 970, '/pages/blog/posts/post1/tags'),
(979, 'creation_date', 'Дата создания', '398', 1, NULL, 956, '/pages/blog/posts/post1/creation_date'),
(980, 'post2', 'Как стать успешным?', '981,982,983,984,987,990,995,1000,1001,1002,1003', 4, NULL, 933, '/pages/blog/posts/post2'),
(981, 'title', 'Название', '399', 1, NULL, 980, '/pages/blog/posts/post2/title'),
(982, 'type', 'Тип продукта', '400', 1, NULL, 980, '/pages/blog/posts/post2/type'),
(983, 'creation_date', 'Дата создания', '401', 1, NULL, 980, '/pages/blog/posts/post2/creation_date'),
(984, 'price', 'Цена', '985,986', 4, NULL, 980, '/pages/blog/posts/post2/price'),
(985, 'normal', 'Цена', '402', 1, NULL, 984, '/pages/blog/posts/post2/price/normal'),
(986, 'sale', 'Цена со скидкой', '403', 1, NULL, 984, '/pages/blog/posts/post2/price/sale'),
(987, 'annotation', 'Аннотация', '988,989', 4, NULL, 980, '/pages/blog/posts/post2/annotation'),
(988, 'text', 'Краткое описание', '83', 2, NULL, 987, '/pages/blog/posts/post2/annotation/text'),
(989, 'image', 'Картинка аннотации', '127', 3, NULL, 987, '/pages/blog/posts/post2/annotation/image'),
(990, 'page', 'Страница', '991,992,993,994', 4, NULL, 980, '/pages/blog/posts/post2/page'),
(991, 'image', 'Картинка', '128', 3, NULL, 990, '/pages/blog/posts/post2/page/image'),
(992, 'image_pos_x', 'Горизонтальное выравнивание картинки', '404', 1, NULL, 990, '/pages/blog/posts/post2/page/image_pos_x'),
(993, 'image_pos_y', 'Вертикальное вырванивание картинки', '405', 1, NULL, 990, '/pages/blog/posts/post2/page/image_pos_y'),
(994, 'text', 'Описание', '84', 2, NULL, 990, '/pages/blog/posts/post2/page/text'),
(995, 'tags', 'Тэги', '997,998', 4, NULL, 980, '/pages/blog/posts/post2/tags'),
(997, '', '', '407', 1, NULL, 995, '/pages/blog/posts/post2/tags/'),
(998, '', '', '408', 1, NULL, 995, '/pages/blog/posts/post2/tags/'),
(1000, 'is_enroll', 'Можно записаться?', '105', 7, NULL, 980, '/pages/blog/posts/post2/is_enroll'),
(1001, 'is_buy', 'Можно купить?', '106', 7, NULL, 980, '/pages/blog/posts/post2/is_buy'),
(1002, 'viewed_count', 'Просмотрено', '410', 1, NULL, 980, '/pages/blog/posts/post2/viewed_count'),
(1003, 'bought_count', 'Куплено', '411', 1, NULL, 980, '/pages/blog/posts/post2/bought_count'),
(1004, 'emotions', 'Эмоции и чувства', '1005,1006,1023', 4, NULL, 932, '/pages/blog/themes/emotions'),
(1005, 'tag', 'Тэг', '412', 1, NULL, 1004, '/pages/blog/themes/emotions/tag'),
(1006, 'image', 'Фоновая картинка', '129', 3, NULL, 1004, '/pages/blog/themes/emotions/image'),
(1007, 'career', 'Личностный рост', '1008,1009,1024', 4, NULL, 932, '/pages/blog/themes/career'),
(1008, 'tag', 'Тэг', '413', 1, NULL, 1007, '/pages/blog/themes/career/tag'),
(1009, 'image', 'Фоновая картинка', '130', 3, NULL, 1007, '/pages/blog/themes/career/image'),
(1010, 'relationships', 'Отношения', '1011,1012,1025', 4, NULL, 932, '/pages/blog/themes/relationships'),
(1011, 'tag', 'Тэг', '414', 1, NULL, 1010, '/pages/blog/themes/relationships/tag'),
(1012, 'image', 'Фоновая картинка', '131', 3, NULL, 1010, '/pages/blog/themes/relationships/image'),
(1013, 'happiness', 'Позитивное мышление', '1014,1015,1026', 4, NULL, 932, '/pages/blog/themes/happiness'),
(1014, 'tag', 'Тэг', '415', 1, NULL, 1013, '/pages/blog/themes/happiness/tag'),
(1015, 'image', 'Фоновая картинка', '132', 3, NULL, 1013, '/pages/blog/themes/happiness/image'),
(1019, 'self-love', 'Принятие себя', '1020,1021,1022', 4, NULL, 932, '/pages/blog/themes/self-love'),
(1020, 'tag', 'Тэг', '417', 1, NULL, 1019, '/pages/blog/themes/self-love/tag'),
(1021, 'image', 'Фоновая картинка', '134', 3, NULL, 1019, '/pages/blog/themes/self-love/image'),
(1022, 'annotation', 'Краткое описание', '85', 2, NULL, 1019, '/pages/blog/themes/self-love/annotation'),
(1023, 'annotation', 'Краткое описание', '86', 2, NULL, 1004, '/pages/blog/themes/emotions/annotation'),
(1024, 'annotation', 'Краткое описание', '87', 2, NULL, 1007, '/pages/blog/themes/career/annotation'),
(1025, 'annotation', 'Краткое описание', '88', 2, NULL, 1010, '/pages/blog/themes/relationships/annotation'),
(1026, 'annotation', 'Краткое описание', '89', 2, NULL, 1013, '/pages/blog/themes/happiness/annotation'),
(1027, NULL, '', '419', 1, NULL, 1, '/'),
(1036, 'account', 'Аккаунты', '1037,1049,1078,1082', 4, NULL, 1, '/account'),
(1037, '__tpl__', 'Шаблон', '1038,1039,1040', 4, NULL, 1036, '/account/__tpl__'),
(1038, 'materials', 'Материалы', '', 4, NULL, 1037, '/account/__tpl__/materials'),
(1039, 'tags_bought', 'Купленные тэги', '424', 1, NULL, 1037, '/account/__tpl__/tags_bought'),
(1040, 'tags_viewed', 'Просмотренные тэги', '425', 1, NULL, 1037, '/account/__tpl__/tags_viewed'),
(1049, 'account1049', 'Аккаунт Федор', '1050,1051,1052', 4, NULL, 1036, '/account/account1049'),
(1050, 'materials', 'Материалы', '', 4, NULL, 1049, '/account/account1049/materials'),
(1051, 'tags_bought', 'Купленные тэги', '430', 1, NULL, 1049, '/account/account1049/tags_bought'),
(1052, 'tags_viewed', 'Просмотренные тэги', '431', 1, NULL, 1049, '/account/account1049/tags_viewed'),
(1065, 'sender', 'Отправитель', '438', 1, NULL, 207, '/mailing/__tpl__/sender'),
(1066, 'subject', 'Тема письма', '439', 1, NULL, 207, '/mailing/__tpl__/subject'),
(1067, 'message', 'Письмо', '90', 2, NULL, 207, '/mailing/__tpl__/message'),
(1068, 'selectors', 'Параметры выборки', '1069', 4, NULL, 207, '/mailing/__tpl__/selectors'),
(1069, 'tags', 'Интересующие тэги', '1070', 4, NULL, 1068, '/mailing/__tpl__/selectors/tags'),
(1070, 'tag1070', 'Тэг', '440', 1, NULL, 1069, '/mailing/__tpl__/selectors/tags/tag1070'),
(1071, '__tpl__1071', 'Новый год 2022', '1072,1073,1074,1075,1115', 4, NULL, 206, '/mailing/__tpl__1071'),
(1072, 'sender', 'Отправитель', '441', 1, NULL, 1071, '/mailing/__tpl__1071/sender'),
(1073, 'subject', 'Тема письма', '442', 1, NULL, 1071, '/mailing/__tpl__1071/subject'),
(1074, 'message', 'Письмо', '91', 2, NULL, 1071, '/mailing/__tpl__1071/message'),
(1075, 'selectors', 'Параметры выборки', '1076', 4, NULL, 1071, '/mailing/__tpl__1071/selectors'),
(1076, 'tags', 'Интересующие тэги', '1077', 4, NULL, 1075, '/mailing/__tpl__1071/selectors/tags'),
(1077, 'tag1070', 'Тэг', '443', 1, NULL, 1076, '/mailing/__tpl__1071/selectors/tags/tag1070'),
(1078, 'account1078', 'Аккаунт Федор', '1079,1080,1081', 4, NULL, 1036, '/account/account1078'),
(1079, 'materials', 'Материалы', '', 4, NULL, 1078, '/account/account1078/materials'),
(1080, 'tags_bought', 'Купленные тэги', '444', 1, NULL, 1078, '/account/account1078/tags_bought'),
(1081, 'tags_viewed', 'Просмотренные тэги', '445', 1, NULL, 1078, '/account/account1078/tags_viewed'),
(1082, 'account1082', 'Аккаунт Федор', '1083,1084,1085', 4, NULL, 1036, '/account/account1082'),
(1083, 'materials', 'Материалы', '', 4, NULL, 1082, '/account/account1082/materials'),
(1084, 'tags_bought', 'Купленные тэги', '446', 1, NULL, 1082, '/account/account1082/tags_bought'),
(1085, 'tags_viewed', 'Просмотренные тэги', '447', 1, NULL, 1082, '/account/account1082/tags_viewed'),
(1086, '@register', 'Регистрация', '1087,1088,1089,1111,1113', 4, NULL, 206, '/mailing/@register'),
(1087, 'sender', 'Отправитель', '448', 1, NULL, 1086, '/mailing/@register/sender'),
(1088, 'subject', 'Тема письма', '449', 1, NULL, 1086, '/mailing/@register/subject'),
(1089, 'message', 'Письмо', '92', 2, NULL, 1086, '/mailing/@register/message'),
(1093, NULL, '', '48', 6, NULL, 1, '/'),
(1100, NULL, '', '49', 6, NULL, 1, '/'),
(1101, NULL, '', '50', 6, NULL, 1, '/'),
(1102, NULL, '', '51', 6, NULL, 1, '/'),
(1103, NULL, '', '52', 6, NULL, 1, '/'),
(1111, 'selectors', 'Параметры выборки', '', 4, NULL, 1086, '/mailing/@register/selectors'),
(1112, 'is_automailing', 'Только авторассылка?', '107', 7, NULL, 207, '/mailing/__tpl__/is_automailing'),
(1113, 'is_automailing', 'Только авторассылка?', '108', 7, NULL, 1086, '/mailing/@register/is_automailing'),
(1115, 'is_automailing', 'Только авторассылка?', '110', 7, NULL, 1071, '/mailing/__tpl__1071/is_automailing'),
(1176, 'post21176', 'Карьерный рост', '1177,1178,1179,1180,1183,1186,1191,1194,1195,1196,1197', 4, NULL, 933, '/pages/blog/posts/post21176'),
(1177, 'title', 'Название', '476', 1, NULL, 1176, '/pages/blog/posts/post21176/title'),
(1178, 'type', 'Тип продукта', '477', 1, NULL, 1176, '/pages/blog/posts/post21176/type'),
(1179, 'creation_date', 'Дата создания', '478', 1, NULL, 1176, '/pages/blog/posts/post21176/creation_date'),
(1180, 'price', 'Цена', '1181,1182', 4, NULL, 1176, '/pages/blog/posts/post21176/price'),
(1181, 'normal', 'Цена', '479', 1, NULL, 1180, '/pages/blog/posts/post21176/price/normal'),
(1182, 'sale', 'Цена со скидкой', '480', 1, NULL, 1180, '/pages/blog/posts/post21176/price/sale'),
(1183, 'annotation', 'Аннотация', '1184,1185', 4, NULL, 1176, '/pages/blog/posts/post21176/annotation'),
(1184, 'text', 'Краткое описание', '98', 2, NULL, 1183, '/pages/blog/posts/post21176/annotation/text'),
(1185, 'image', 'Картинка аннотации', '142', 3, NULL, 1183, '/pages/blog/posts/post21176/annotation/image'),
(1186, 'page', 'Страница', '1187,1188,1189,1190', 4, NULL, 1176, '/pages/blog/posts/post21176/page'),
(1187, 'image', 'Картинка', '143', 3, NULL, 1186, '/pages/blog/posts/post21176/page/image'),
(1188, 'image_pos_x', 'Горизонтальное выравнивание картинки', '481', 1, NULL, 1186, '/pages/blog/posts/post21176/page/image_pos_x'),
(1189, 'image_pos_y', 'Вертикальное вырванивание картинки', '482', 1, NULL, 1186, '/pages/blog/posts/post21176/page/image_pos_y'),
(1190, 'text', 'Описание', '99', 2, NULL, 1186, '/pages/blog/posts/post21176/page/text'),
(1191, 'tags', 'Тэги', '1192,1193,1198', 4, NULL, 1176, '/pages/blog/posts/post21176/tags'),
(1192, '', '', '483', 1, NULL, 1191, '/pages/blog/posts/post21176/tags/'),
(1193, '', '', '484', 1, NULL, 1191, '/pages/blog/posts/post21176/tags/'),
(1194, 'is_enroll', 'Можно записаться?', '116', 7, NULL, 1176, '/pages/blog/posts/post21176/is_enroll'),
(1195, 'is_buy', 'Можно купить?', '117', 7, NULL, 1176, '/pages/blog/posts/post21176/is_buy'),
(1196, 'viewed_count', 'Просмотрено', '485', 1, NULL, 1176, '/pages/blog/posts/post21176/viewed_count'),
(1197, 'bought_count', 'Куплено', '486', 1, NULL, 1176, '/pages/blog/posts/post21176/bought_count'),
(1198, NULL, '', '487', 1, NULL, 1191, '/pages/blog/posts/post21176/tags'),
(1199, 'lessons', 'Уроки', '1200,1201,1202,1203,1204,1205,1206,1207,1208,1209,1210,1211,1212', 4, NULL, 1, '/lessons'),
(1200, 'login', 'Вход в админку', '4', 10, NULL, 1199, '/lessons/login'),
(1201, 'dashboard', 'Панель управления', '5', 10, NULL, 1199, '/lessons/dashboard'),
(1202, 'field-add', 'Добавление поля', '6', 10, NULL, 1199, '/lessons/field-add'),
(1203, 'field-opers', 'Операции над полями', '7', 10, NULL, 1199, '/lessons/field-opers'),
(1204, 'header-footer', 'Шапка футер', '8', 10, NULL, 1199, '/lessons/header-footer'),
(1205, 'page-home', 'Главная страница', '9', 10, NULL, 1199, '/lessons/page-home'),
(1206, 'about-me-project', 'Обо мне, о проекте', '10', 10, NULL, 1199, '/lessons/about-me-project'),
(1207, 'consult', 'Консультации', '11', 10, NULL, 1199, '/lessons/consult'),
(1208, 'events', 'Ближ мероприятия', '12', 10, NULL, 1199, '/lessons/events'),
(1209, 'numero', 'Нумерология', '13', 10, NULL, 1199, '/lessons/numero'),
(1210, 'shop', 'Магазин', '14', 10, NULL, 1199, '/lessons/shop'),
(1211, 'blog', 'Блог', '15', 10, NULL, 1199, '/lessons/blog'),
(1212, 'backup', 'Бэкап', '16', 10, NULL, 1199, '/lessons/backup');

-- --------------------------------------------------------

--
-- Структура таблицы `jf-cms_interface-translate_phrase`
--

CREATE TABLE `jf-cms_interface-translate_phrase` (
  `id_phrase` int NOT NULL,
  `phrase_en-us` text NOT NULL,
  `phrase_ru-ru` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `jf-cms_interface-translate_phrase`
--

INSERT INTO `jf-cms_interface-translate_phrase` (`id_phrase`, `phrase_en-us`, `phrase_ru-ru`) VALUES
(1, 'Dashboard', 'Панель управления'),
(2, 'Fields', 'Поля'),
(3, 'Field types', 'Типы полей'),
(4, 'Accounts', 'Аккаунты'),
(5, 'Backup / Migrate', 'Бэкап / Миграция'),
(6, 'Store', 'Магазин'),
(7, 'Plugins', 'Плагины'),
(8, 'Translations', 'Переводы'),
(9, 'Version / Updates', 'Версия / Обновления'),
(10, 'Check for updates', 'Проверить обновления'),
(12, 'Logged as', 'Вы вошли как'),
(15, 'Tree View', 'Иерархия'),
(21, 'Type View', 'По типам'),
(22, 'Order', 'Порядок'),
(23, 'Key', 'Ключ'),
(24, 'Name', 'Имя'),
(25, 'Value', 'Значение'),
(26, 'Type', 'Тип'),
(27, 'Permission', 'Доступ'),
(28, 'edit', 'ред.'),
(29, 'Open', 'Открыть'),
(30, 'object', 'объект'),
(31, 'image', 'картинка'),
(32, 'Show', 'Показать'),
(33, 'Upload', 'Загрузить'),
(34, 'Your browser does not support the audio element.', 'Ваш браузер не поддерживает аудио элементы.'),
(35, 'Download', 'Скачать'),
(36, 'boolean', 'логический'),
(37, 'field', 'поле'),
(38, 'Input value...', 'Введите значение...'),
(39, 'Input key...', 'Введите ключ...'),
(40, 'Input name...', 'Введите имя...'),
(41, 'Text editor', 'Текстовый редактор'),
(42, 'text', 'текст'),
(43, 'Add', 'Добавить'),
(44, 'Delete', 'Удалить'),
(45, 'Duplicate', 'Дублировать'),
(46, 'Move', 'Переместить'),
(47, 'Here', 'Сюда'),
(48, 'Cancel', 'Отмена'),
(49, 'Close', 'Закрыть'),
(50, 'Collapse', 'Свернуть'),
(51, 'Close all editors', 'Закрыть все редакторы'),
(52, 'Save', 'Сохранить'),
(53, 'Select', 'Выбрать'),
(54, 'file', 'файл'),
(55, 'audio', 'аудио'),
(56, 'video', 'видео'),
(57, 'mirror', 'зеркало'),
(58, 'excel', 'эксель'),
(59, 'space', 'пробел'),
(60, 'Ready', 'Готово'),
(61, 'Updating', 'Обновление'),
(62, 'Saving', 'Сохранение'),
(63, 'Sending', 'Отправка'),
(64, 'Ordering', 'Смена порядка'),
(65, 'Uploading', 'Загрузка'),
(66, 'Selecting', 'Выбор'),
(67, 'Rendering', 'Отрисовка'),
(68, 'Uploading image', 'Загрузка картинки'),
(69, 'Deleting image', 'Удаление картинки'),
(70, 'Adding', 'Добавление'),
(71, 'Deleting', 'Удаление'),
(72, 'Duplicating', 'Дублирование'),
(73, 'Moving', 'Перемещение'),
(74, 'Sender', 'Отправитель'),
(75, 'Name', 'Название'),
(76, 'Subject', 'Тема'),
(77, 'Inspect', 'Изучить'),
(78, 'Send button', 'Кнопка отправки'),
(79, 'Mailing', 'Рассылки'),
(80, 'Login', 'Логин'),
(81, 'Accounts', 'Аккаунты'),
(82, 'Send', 'Отправить'),
(83, 'Wrong login or password', 'Неверный логин или пароль'),
(84, 'Exit', 'Выход'),
(85, 'Password', 'Пароль'),
(86, 'Sign in', 'Войти'),
(87, 'Fill all registration fields', 'Заполните все поля регистрации'),
(88, 'Register', 'Зарегистрировать'),
(89, 'Register new account', 'Регистрация нового аккаунта'),
(90, 'Account with such login or email already exists', 'Аккаунт с таким логином или email уже существует'),
(91, 'No items selected. Use Ctrl+Click to select row', 'Нет выбранных элементов. Используйте Ctrl+Клик'),
(92, 'Language', 'Язык'),
(96, 'Backups', 'Бэкапы'),
(97, 'New backup', 'Новый бэкап'),
(98, 'Last modification', 'Последние изменения'),
(99, 'Size', 'Размер'),
(100, 'Creating a backup', 'Создание бэкапа'),
(101, 'You are trying to delete List or Object.', 'Вы пытаетесь удалить Список или Объект.'),
(102, 'This action will delete inner content.', 'Тем самым вы удалите содержимое.'),
(103, 'Are you sure?', 'Вы уверены?'),
(104, 'You can lose you files.', 'Вы можете потерять ваши файлы.'),
(105, 'This action can\'t be reverted.', 'Это действие не может быть отменено.'),
(106, 'You are trying to delete backup.', 'Вы пытаетесь удалить бэкап.'),
(107, '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `jf-cms_session`
--

CREATE TABLE `jf-cms_session` (
  `id_session` varchar(255) NOT NULL,
  `session_id_account` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `jf-cms_session`
--

INSERT INTO `jf-cms_session` (`id_session`, `session_id_account`) VALUES
('0bb8cb36f82c51dc4cdc350c09eb37364c69f7fde489a0f94476', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `jf-cms_type`
--

CREATE TABLE `jf-cms_type` (
  `id_type` int NOT NULL,
  `type_is-basic` tinyint(1) NOT NULL,
  `type_has-children` tinyint(1) NOT NULL DEFAULT '0',
  `type_is-local` tinyint(1) NOT NULL DEFAULT '0',
  `type_name` varchar(75) NOT NULL,
  `type_descr` json DEFAULT NULL,
  `type_icon` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `jf-cms_type`
--

INSERT INTO `jf-cms_type` (`id_type`, `type_is-basic`, `type_has-children`, `type_is-local`, `type_name`, `type_descr`, `type_icon`) VALUES
(1, 1, 0, 0, 'field', '\"string\"', 'field.png'),
(2, 1, 0, 0, 'text', '{\"html\": \"string\", \"value\": \"string\"}', 'text.png'),
(3, 1, 0, 0, 'image', '{\"src\": \"string\", \"name\": \"string\"}', 'image.png'),
(4, 1, 1, 0, 'object', NULL, 'object.png'),
(5, 1, 1, 0, 'list', NULL, ''),
(6, 1, 0, 1, 'space', '\"string\"', 'space.png'),
(7, 1, 0, 0, 'boolean', '\"int\"', 'boolean.png'),
(8, 1, 0, 0, 'file', '{\"src\": \"string\", \"name\": \"string\"}', 'file.png'),
(9, 1, 0, 0, 'audio', '{\"src\": \"string\", \"name\": \"string\"}', 'audio.png'),
(10, 1, 0, 0, 'video', '{\"src\": \"string\", \"name\": \"string\"}', 'video.png'),
(11, 1, 0, 0, 'mirror', NULL, 'mirror.png'),
(12, 0, 0, 0, 'excel', '{\"src\": \"string\", \"name\": \"string\"}', 'excel.png');

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

--
-- Дамп данных таблицы `jf-cms_T_boolean`
--

INSERT INTO `jf-cms_T_boolean` (`id_boolean`, `boolean_value`) VALUES
(2, 1),
(3, 1),
(4, 1),
(5, 0),
(6, 0),
(7, 0),
(8, 1),
(9, 0),
(10, 0),
(11, 0),
(12, 1),
(13, 0),
(14, 0),
(15, 0),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 0),
(23, 0),
(24, 0),
(25, 0),
(26, 0),
(27, 0),
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(37, 0),
(38, 0),
(39, 0),
(40, 0),
(41, 0),
(46, 0),
(51, 1),
(52, 0),
(53, 1),
(54, 0),
(55, 1),
(56, 0),
(57, 1),
(58, 0),
(59, 1),
(60, 0),
(61, 1),
(62, 0),
(63, 1),
(64, 0),
(65, 1),
(66, 0),
(67, 1),
(68, 0),
(69, 1),
(70, 0),
(71, 1),
(72, 0),
(73, 1),
(74, 0),
(75, 1),
(76, 0),
(77, 1),
(78, 0),
(79, 1),
(80, 0),
(81, 1),
(82, 1),
(83, 1),
(84, 0),
(85, 1),
(86, 0),
(87, 1),
(88, 0),
(89, 1),
(90, 0),
(91, 1),
(92, 0),
(93, 0),
(94, 1),
(95, 0),
(96, 1),
(97, 0),
(98, 1),
(99, 0),
(100, 1),
(103, 0),
(104, 0),
(105, 0),
(106, 0),
(107, 0),
(108, 1),
(110, 0),
(116, 0),
(117, 0);

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
(1, 'excel1.xlsx');

-- --------------------------------------------------------

--
-- Структура таблицы `jf-cms_T_field`
--

CREATE TABLE `jf-cms_T_field` (
  `id_field` int NOT NULL,
  `field_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `jf-cms_T_field`
--

INSERT INTO `jf-cms_T_field` (`id_field`, `field_value`) VALUES
(7, 'Сайт психолога'),
(8, 'Ирены Беркуты'),
(12, 'Обо мне'),
(13, '../sales'),
(14, '#'),
(15, 'Facebook'),
(16, '#'),
(17, '@inst.account'),
(18, '#'),
(19, 'skypelogin'),
(20, ' О проекте'),
(23, 'Консультации психолога'),
(24, 'Мероприятия'),
(25, 'Нумерология'),
(26, 'Магазин шпаргалок'),
(27, 'Блог'),
(28, '70001234567'),
(29, 'email.email@email.email'),
(30, 'Ирена Беркута'),
(31, '2022'),
(32, '25'),
(33, '50'),
(34, '50'),
(35, '75'),
(36, '35'),
(37, '50'),
(38, 'Обо мне'),
(39, ' О проекте'),
(40, '25'),
(41, '50'),
(58, 'Разовые'),
(59, 'Тип консультации'),
(60, 'от 10 000 руб'),
(61, ''),
(70, 'нумерология'),
(71, 'семейные'),
(72, 'чувство-вины'),
(73, 'эмоции-и-чувства'),
(74, '50'),
(75, '35'),
(86, 'Email консультация'),
(87, 'Услуга'),
(88, 'от 1 000 руб'),
(89, ''),
(90, '50'),
(91, '35'),
(92, 'нумерология'),
(93, 'семейные'),
(94, 'чувство-вины'),
(95, 'эмоции-и-чувства'),
(96, 'Серийные'),
(97, 'Тип консультации'),
(98, 'от 7 000 руб'),
(99, ''),
(100, '50'),
(101, '35'),
(102, 'нумерология'),
(103, 'семейные'),
(104, 'чувство-вины'),
(105, 'эмоции-и-чувства'),
(106, 'Семейные'),
(107, 'Тип консультации'),
(108, 'от 15 000 руб'),
(109, ''),
(110, '50'),
(111, '35'),
(112, 'нумерология'),
(113, 'семейные'),
(114, 'чувство-вины'),
(115, 'эмоции-и-чувства'),
(116, 'Написать письмо'),
(117, 'Услуга'),
(118, 'от 1 500 руб'),
(119, ''),
(120, '50'),
(121, '35'),
(122, 'нумерология'),
(123, 'семейные'),
(124, 'чувство-вины'),
(125, 'эмоции-и-чувства'),
(126, 'Платная рассылка'),
(127, 'Услуга'),
(128, 'от 2 250 руб'),
(129, ''),
(130, '50'),
(131, '35'),
(132, 'нумерология'),
(133, 'семейные'),
(134, 'чувство-вины'),
(135, 'эмоции-и-чувства'),
(136, 'Женские клубы'),
(137, 'Услуга'),
(138, 'от 900 руб'),
(139, ''),
(140, '50'),
(141, '35'),
(142, 'нумерология'),
(143, 'семейные'),
(144, 'чувство-вины'),
(145, 'эмоции-и-чувства'),
(146, 'Обучение нумерологии'),
(147, 'Услуга'),
(148, 'от 1 300 руб'),
(149, ''),
(150, '50'),
(151, '35'),
(152, 'нумерология'),
(153, 'семейные'),
(154, 'чувство-вины'),
(155, 'эмоции-и-чувства'),
(156, 'Онлайн курсы'),
(157, 'Услуга'),
(158, 'от 1 000 руб'),
(159, ''),
(160, '50'),
(161, '35'),
(162, 'нумерология'),
(163, 'семейные'),
(164, 'чувство-вины'),
(165, 'эмоции-и-чувства'),
(166, 'Онлайн сопровождение'),
(167, 'Услуга'),
(168, 'от 1 500 руб'),
(169, ''),
(170, '50'),
(171, '35'),
(172, 'нумерология'),
(173, 'семейные'),
(174, 'чувство-вины'),
(175, 'эмоции-и-чувства'),
(176, 'Ассоциативная шпаргалка'),
(177, 'Услуга'),
(178, 'от 2 250 руб'),
(179, ''),
(180, '50'),
(181, '35'),
(182, 'нумерология'),
(183, 'семейные'),
(184, 'чувство-вины'),
(185, 'эмоции-и-чувства'),
(186, 'Консультации нумеролога'),
(187, 'Услуга'),
(188, 'от 1 300 руб'),
(189, ''),
(190, '50'),
(191, '35'),
(192, 'нумерология'),
(193, 'семейные'),
(194, 'чувство-вины'),
(195, 'эмоции-и-чувства'),
(196, 'Нумерологический рассчет женихов'),
(197, 'Услуга'),
(198, 'от 900 руб'),
(199, ''),
(200, '50'),
(201, '35'),
(202, 'нумерология'),
(203, 'семейные'),
(204, 'чувство-вины'),
(205, 'эмоции-и-чувства'),
(206, 'Проработка обиды и боли'),
(207, 'Услуга'),
(208, 'от 1 300 руб'),
(209, ''),
(210, '50'),
(211, '35'),
(212, 'нумерология'),
(213, 'семейные'),
(214, 'чувство-вины'),
(215, 'эмоции-и-чувства'),
(216, 'Бесплатная рассылка'),
(217, 'Услуга'),
(218, 'бесплатно'),
(219, ''),
(220, '50'),
(221, '35'),
(222, 'нумерология'),
(223, 'семейные'),
(224, 'чувство-вины'),
(225, 'эмоции-и-чувства'),
(226, 'Личностный рост'),
(227, 'Вебинар'),
(228, ''),
(229, ''),
(230, '50'),
(231, '35'),
(232, 'нумерология'),
(233, 'семейные'),
(234, 'чувство-вины'),
(235, 'эмоции-и-чувства'),
(236, '00 января, 00:00'),
(237, 'Семейное счастье'),
(238, '31 февраля, 23:59'),
(239, 'Консультация'),
(240, ''),
(241, ''),
(242, '50'),
(243, '35'),
(244, 'нумерология'),
(245, 'семейные'),
(246, 'чувство-вины'),
(247, 'эмоции-и-чувства'),
(248, 'Консультации Общение'),
(249, 'Нумерологическая консультация'),
(250, ''),
(251, ''),
(252, '50'),
(253, '35'),
(254, 'нумерология'),
(255, 'семейные'),
(256, 'чувство-вины'),
(257, 'эмоции-и-чувства'),
(258, 'Консультации Описательные'),
(259, 'Нумерологическая консультация'),
(260, ''),
(261, ''),
(262, '50'),
(263, '35'),
(264, 'нумерология'),
(265, 'семейные'),
(266, 'чувство-вины'),
(267, 'эмоции-и-чувства'),
(268, 'Обучение Живое'),
(269, 'Нумерологическая консультация'),
(270, ''),
(271, ''),
(272, '50'),
(273, '35'),
(274, 'нумерология'),
(275, 'семейные'),
(276, 'чувство-вины'),
(277, 'эмоции-и-чувства'),
(278, 'Обучение Онлайн'),
(279, 'Нумерологическая консультация'),
(280, ''),
(281, ''),
(282, '50'),
(283, '35'),
(284, 'нумерология'),
(285, 'семейные'),
(286, 'чувство-вины'),
(287, 'эмоции-и-чувства'),
(288, 'Длинное название'),
(289, 'Вебинар'),
(290, '1 250 руб'),
(291, ''),
(292, '50'),
(293, '35'),
(296, 'чувство-вины'),
(297, 'эмоции-и-чувства'),
(298, 'Очень очень очень очень длинное название'),
(299, 'Вебинар'),
(300, '77 000 руб'),
(301, '55 000 руб'),
(302, '50'),
(303, '35'),
(304, 'нумерология'),
(307, 'эмоции-и-чувства'),
(308, 'Как стать успешным?'),
(309, 'Курс'),
(310, '50 000 руб'),
(311, ''),
(312, '50'),
(313, '35'),
(314, 'нумерология'),
(315, 'семейные'),
(318, '10 шагов к счастью'),
(319, 'Книга'),
(320, '25 000 руб'),
(321, ''),
(322, '50'),
(323, '35'),
(325, 'семейные'),
(326, 'чувство-вины'),
(328, 'Рейтинг услуг'),
(329, '2.6em'),
(330, '2.6em'),
(331, '2.6em'),
(333, '9'),
(334, '0'),
(335, '4'),
(336, '0'),
(337, '3'),
(338, '0'),
(339, '5'),
(340, '0'),
(341, '3'),
(342, '0'),
(343, '1'),
(344, '0'),
(345, '1'),
(346, '0'),
(347, '0'),
(348, '0'),
(349, '0'),
(350, '0'),
(351, '0'),
(352, '0'),
(353, '0'),
(354, '0'),
(355, '0'),
(356, '0'),
(357, '1'),
(358, '0'),
(359, '0'),
(360, '0'),
(361, '0'),
(362, '0'),
(363, '6'),
(364, '0'),
(365, '1'),
(366, '0'),
(367, '5'),
(368, '0'),
(369, '4'),
(370, '0'),
(371, '1'),
(372, '0'),
(373, '1'),
(374, '0'),
(375, 'Зигмунд Фрейд'),
(386, '10 шагов к счастью'),
(387, 'Статья'),
(388, ''),
(389, ''),
(390, '50'),
(391, '35'),
(392, 'принятие-себя'),
(394, '13'),
(395, '0'),
(396, 'эмоции-и-чувства'),
(398, '17.01.2022'),
(399, 'Как стать успешным'),
(400, 'Статья'),
(401, '28.12.2021'),
(402, ''),
(403, ''),
(404, '50'),
(405, '35'),
(407, 'эмоции-и-чувства'),
(408, 'позитивное-мышление'),
(410, '105'),
(411, '0'),
(412, 'эмоции-и-чувства'),
(413, 'отношения'),
(414, 'личностный-рост'),
(415, 'позитивное-мышление'),
(417, 'принятие-себя'),
(418, ''),
(419, ''),
(424, ''),
(425, ''),
(430, ''),
(431, '{\"\\u043d\\u0443\\u043c\\u0435\\u0440\\u043e\\u043b\\u043e\\u0433\\u0438\\u044f\":2,\"\\u044d\\u043c\\u043e\\u0446\\u0438\\u0438-\\u0438-\\u0447\\u0443\\u0432\\u0441\\u0442\\u0432\\u0430\":6,\"\\u0447\\u0443\\u0432\\u0441\\u0442\\u0432\\u043e-\\u0432\\u0438\\u043d\\u044b\":2,\"\\u043f\\u043e\\u0437\\u0438\\u0442\\u0438\\u0432\\u043d\\u043e\\u0435-\\u043c\\u044b\\u0448\\u043b\\u0435\\u043d\\u0438\\u0435\":2,\"\\u043f\\u0440\\u0438\\u043d\\u044f\\u0442\\u0438\\u0435-\\u0441\\u0435\\u0431\\u044f\":1,\"\\u0441\\u0435\\u043c\\u0435\\u0439\\u043d\\u044b\\u0435\":1}'),
(438, 'no-reply'),
(439, ''),
(440, ''),
(441, 'no-reply'),
(442, 'Новый год 2022 со Шпаргалками'),
(443, ''),
(444, ''),
(445, ''),
(446, ''),
(447, '[]'),
(448, 'no-reply'),
(449, 'Регистрация \"Шпаргалки для лучшей жизни\"'),
(476, 'Карьерный рост'),
(477, 'Статья'),
(478, '06.02.2022'),
(479, ''),
(480, ''),
(481, '50'),
(482, '35'),
(483, 'эмоции-и-чувства'),
(484, 'позитивное-мышление'),
(485, '0'),
(486, '0'),
(487, 'трудности-в-работе');

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

--
-- Дамп данных таблицы `jf-cms_T_image`
--

INSERT INTO `jf-cms_T_image` (`id_image`, `image_src`) VALUES
(2, 'image2.png'),
(3, '3.jpg'),
(4, '4.svg'),
(5, '5.jpg'),
(6, '6.svg'),
(45, '45.jpeg'),
(46, '46.svg'),
(47, '47.jpeg'),
(48, '48.svg'),
(49, '49.jpeg'),
(50, '50.svg'),
(51, '51.jpg'),
(52, '52.svg'),
(53, '53.jpeg'),
(54, '54.svg'),
(55, '55.jpg'),
(56, '56.svg'),
(57, '57.jpg'),
(58, '58.svg'),
(66, '66.jpeg'),
(67, '67.svg'),
(75, '75.jpeg'),
(76, '76.svg'),
(77, '77.jpeg'),
(78, '78.svg'),
(79, '79.jpeg'),
(80, ''),
(81, ''),
(82, '82.jpeg'),
(83, ''),
(84, '84.jpeg'),
(85, ''),
(86, '86.jpeg'),
(87, ''),
(88, '88.jpeg'),
(89, ''),
(90, '90.jpeg'),
(91, ''),
(92, '92.jpeg'),
(93, ''),
(94, '94.jpeg'),
(95, ''),
(96, '96.jpeg'),
(97, ''),
(98, '98.jpeg'),
(99, ''),
(100, '100.jpeg'),
(101, ''),
(102, '102.jpeg'),
(103, '103.jpg'),
(104, '104.jpeg'),
(105, '105.jpeg'),
(106, '106.jpeg'),
(107, '107.svg'),
(108, '108.jpeg'),
(109, '109.svg'),
(110, '110.jpeg'),
(111, '111.svg'),
(112, '112.jpeg'),
(113, '113.svg'),
(114, '114.jpeg'),
(115, '115.jpeg'),
(116, '116.jpeg'),
(117, '117.jpg'),
(118, '118.jpeg'),
(119, '119.jpeg'),
(120, '120.jpeg'),
(121, '121.jpeg'),
(122, '122.jpeg'),
(125, '125.jpeg'),
(126, '126.jpeg'),
(127, '127.jpg'),
(128, '128.jpeg'),
(129, '129.jpeg'),
(130, '130.jpeg'),
(131, '131.jpeg'),
(132, '132.jpeg'),
(134, '134.jpeg'),
(142, '142.jpg'),
(143, '143.jpeg');

-- --------------------------------------------------------

--
-- Структура таблицы `jf-cms_T_space`
--

CREATE TABLE `jf-cms_T_space` (
  `id_space` int NOT NULL,
  `space_value` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `jf-cms_T_space`
--

INSERT INTO `jf-cms_T_space` (`id_space`, `space_value`) VALUES
(3, 'Положение картинки задаётся в процентах. Значения полей - число от 0 до 100. Значение 50 - по центру.'),
(4, 'Положение картинки задаётся в процентах. Значения полей - число от 0 до 100. Значение 50 - по центру.'),
(5, 'Положение картинки задаётся в процентах. Значения полей - число от 0 до 100. Значение 50 - по центру.'),
(6, 'Положение картинки задаётся в процентах. Значения полей - число от 0 до 100. Значение 50 - по центру.'),
(7, 'Тэги должны быть написаны маленькими буквами. Из символов можно только дефис \"-\".'),
(8, 'Положение картинки задается числом от 0 до 100 - количество процентов сдвига. Значение 50 - по центру'),
(11, 'Положение картинки задается числом от 0 до 100 - количество процентов сдвига. Значение 50 - по центру'),
(12, 'Тэги должны быть написаны маленькими буквами. Из символов можно только дефис \"-\".'),
(13, 'Положение картинки задается числом от 0 до 100 - количество процентов сдвига. Значение 50 - по центру'),
(14, 'Тэги должны быть написаны маленькими буквами. Из символов можно только дефис \"-\".'),
(15, 'Положение картинки задается числом от 0 до 100 - количество процентов сдвига. Значение 50 - по центру'),
(16, 'Тэги должны быть написаны маленькими буквами. Из символов можно только дефис \"-\".'),
(17, 'Положение картинки задается числом от 0 до 100 - количество процентов сдвига. Значение 50 - по центру'),
(18, 'Тэги должны быть написаны маленькими буквами. Из символов можно только дефис \"-\".'),
(19, 'Положение картинки задается числом от 0 до 100 - количество процентов сдвига. Значение 50 - по центру'),
(20, 'Тэги должны быть написаны маленькими буквами. Из символов можно только дефис \"-\".'),
(21, 'Положение картинки задается числом от 0 до 100 - количество процентов сдвига. Значение 50 - по центру'),
(22, 'Тэги должны быть написаны маленькими буквами. Из символов можно только дефис \"-\".'),
(23, 'Положение картинки задается числом от 0 до 100 - количество процентов сдвига. Значение 50 - по центру'),
(24, 'Тэги должны быть написаны маленькими буквами. Из символов можно только дефис \"-\".'),
(25, 'Положение картинки задается числом от 0 до 100 - количество процентов сдвига. Значение 50 - по центру'),
(26, 'Тэги должны быть написаны маленькими буквами. Из символов можно только дефис \"-\".'),
(27, 'Положение картинки задается числом от 0 до 100 - количество процентов сдвига. Значение 50 - по центру'),
(28, 'Тэги должны быть написаны маленькими буквами. Из символов можно только дефис \"-\".'),
(29, 'Положение картинки задается числом от 0 до 100 - количество процентов сдвига. Значение 50 - по центру'),
(30, 'Тэги должны быть написаны маленькими буквами. Из символов можно только дефис \"-\".'),
(32, 'Положение картинки задается числом от 0 до 100 - количество процентов сдвига. Значение 50 - по центру'),
(33, 'Тэги должны быть написаны маленькими буквами. Из символов можно только дефис \"-\".'),
(34, 'Положение картинки задается числом от 0 до 100 - количество процентов сдвига. Значение 50 - по центру'),
(35, 'Тэги должны быть написаны маленькими буквами. Из символов можно только дефис \"-\".'),
(36, 'Положение картинки задается числом от 0 до 100 - количество процентов сдвига. Значение 50 - по центру'),
(37, 'Тэги должны быть написаны маленькими буквами. Из символов можно только дефис \"-\".'),
(38, 'Положение картинки задается числом от 0 до 100 - количество процентов сдвига. Значение 50 - по центру'),
(39, 'Тэги должны быть написаны маленькими буквами. Из символов можно только дефис \"-\".'),
(40, 'Положение картинки задается числом от 0 до 100 - количество процентов сдвига. Значение 50 - по центру'),
(41, 'Тэги должны быть написаны маленькими буквами. Из символов можно только дефис \"-\".'),
(42, 'Положение картинки задается числом от 0 до 100 - количество процентов сдвига. Значение 50 - по центру'),
(43, 'Тэги должны быть написаны маленькими буквами. Из символов можно только дефис \"-\".'),
(44, 'Замена картинки на странице событий происходит в аннотации'),
(45, 'Замена картинки на странице событий происходит в аннотации'),
(46, 'Положение картинки задается числом от 0 до 100 - количество процентов сдвига. Значение 50 - по центру'),
(47, 'Тэги должны быть написаны маленькими буквами. Из символов можно только дефис \"-\".'),
(48, ''),
(49, ''),
(50, ''),
(51, ''),
(52, '');

-- --------------------------------------------------------

--
-- Структура таблицы `jf-cms_T_text`
--

CREATE TABLE `jf-cms_T_text` (
  `id_text` int NOT NULL,
  `text_value` text NOT NULL,
  `text_html` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `jf-cms_T_text`
--

INSERT INTO `jf-cms_T_text` (`id_text`, `text_value`, `text_html`) VALUES
(2, '{&quot;time&quot;:1641650446980,&quot;blocks&quot;:[{&quot;id&quot;:&quot;juFZVi1ZV9&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;\\u042d\\u0442\\u043e \\u043f\\u0440\\u043e\\u0441\\u0442\\u043e\\u0439 \\u0442\\u0435\\u043a\\u0441\\u0442, \\u0430 \\u044d\\u0442\\u043e&amp;nbsp;&lt;b&gt;\\u0436\\u0438\\u0440\\u043d\\u044b\\u0439&lt;\\/b&gt;, \\u0442\\u0435\\u043f\\u0435\\u0440\\u044c&amp;nbsp;&lt;i&gt;\\u043a\\u0443\\u0440\\u0441\\u0438\\u0432&lt;\\/i&gt;,&amp;nbsp;&lt;mark class=\\&quot;cdx-marker\\&quot;&gt;\\u043c\\u0430\\u0440\\u043a\\u0435\\u0440&lt;\\/mark&gt;,&amp;nbsp;&lt;a href=\\&quot;http:\\/\\/google.com\\/\\&quot;&gt;\\u0441\\u0441\\u044b\\u043b\\u043a\\u0430&lt;\\/a&gt;, \\u043f\\u043e\\u0434\\u0447\\u0435\\u0440\\u043a\\u0438\\u0432\\u0430\\u043d\\u0438\\u0435&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;jQM-I8isqG&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;\\u0422\\u0435\\u043a\\u0441\\u0442 \\u043f\\u043e \\u0446\\u0435\\u043d\\u0442\\u0440\\u0443&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;center&quot;}}},{&quot;id&quot;:&quot;2MbR_x0vBr&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;\\u0422\\u0435\\u043a\\u0441\\u0442 \\u043f\\u043e \\u043f\\u0440\\u0430\\u0432\\u043e\\u043c\\u0443 \\u043a\\u0440\\u0430\\u044e&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;right&quot;}}},{&quot;id&quot;:&quot;zZhZchaW8z&quot;,&quot;type&quot;:&quot;list&quot;,&quot;data&quot;:{&quot;style&quot;:&quot;ordered&quot;,&quot;items&quot;:[&quot;\\u041f\\u0440\\u043e\\u0441\\u0442\\u043e\\u0439 \\u043d\\u0443\\u043c\\u0435\\u0440\\u043e\\u0432\\u0430\\u043d\\u043d\\u044b\\u0439 \\u0441\\u043f\\u0438\\u0441\\u043e\\u043a&quot;,&quot;\\u0415\\u0449\\u0451 \\u0440\\u0430\\u0437&quot;]}},{&quot;id&quot;:&quot;u7pPH1B7kL&quot;,&quot;type&quot;:&quot;header&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;\\u0420\\u0430\\u0437\\u0440\\u044b\\u0432 \\u0437\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043a\\u043e\\u043c&quot;,&quot;level&quot;:2,&quot;anchor&quot;:&quot;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;CqQh-S-EpQ&quot;,&quot;type&quot;:&quot;list&quot;,&quot;data&quot;:{&quot;style&quot;:&quot;unordered&quot;,&quot;items&quot;:[&quot;\\u041d\\u0435\\u043d\\u0443\\u043c\\u0435\\u0440\\u043e\\u0432\\u0430\\u043d\\u043d\\u044b\\u0439 \\u0441\\u043f\\u0438\\u0441\\u043e\\u043a&quot;,&quot;\\u0415\\u0449\\u0451 \\u0440\\u0430\\u0437&quot;]}},{&quot;id&quot;:&quot;J26tfAcc8C&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lacus in iaculis ut ut facilisi suspendisse pharetra. Scelerisque convallis ac tellus felis mauris egestas amet, aenean urna. Scelerisque egestas sed cursus at felis urna nullam. Ut rutrum adipiscing hendrerit consectetur nulla cursus non gravida. Quam venenatis amet ultrices quam massa faucibus maecenas pellentesque. Orci neque ultrices pretium est et lectus enim vitae pellentesque.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: left\">Это простой текст, а это&nbsp;<b>жирный</b>, теперь&nbsp;<i>курсив</i>,&nbsp;<mark class=\"cdx-marker\">маркер</mark>,&nbsp;<a href=\"http://google.com/\">ссылка</a>, подчеркивание</p><p style=\"text-align: center\">Текст по центру</p><p style=\"text-align: right\">Текст по правому краю</p><ol><li>Простой нумерованный список</li><li>Ещё раз</li></ol><h2 style=\"text-align: left\" id=\"\">Разрыв заголовком</h2><ul><li>Ненумерованный список</li><li>Ещё раз</li></ul><p style=\"text-align: left\">Lacus in iaculis ut ut facilisi suspendisse pharetra. Scelerisque convallis ac tellus felis mauris egestas amet, aenean urna. Scelerisque egestas sed cursus at felis urna nullam. Ut rutrum adipiscing hendrerit consectetur nulla cursus non gravida. Quam venenatis amet ultrices quam massa faucibus maecenas pellentesque. Orci neque ultrices pretium est et lectus enim vitae pellentesque.</p>'),
(3, '{&quot;time&quot;:1641649905547,&quot;blocks&quot;:[{&quot;id&quot;:&quot;RsIEKjCdcD&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;\\u0422\\u043e\\u043b\\u044c\\u043a\\u043e \\u0441\\u0435\\u0433\\u043e\\u0434\\u043d\\u044f \\u0441\\u043a\\u0438\\u0434\\u043a\\u0430 \\u043d\\u0430 \\u0432\\u0441\\u0435 \\u043a\\u0443\\u0440\\u0441\\u044b&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;center&quot;}}},{&quot;id&quot;:&quot;Pxv2hl_ejP&quot;,&quot;type&quot;:&quot;header&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;20%&quot;,&quot;level&quot;:1,&quot;anchor&quot;:&quot;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;center&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: center\">Только сегодня скидка на все курсы</p><h1 style=\"text-align: center\" id=\"\">20%</h1>'),
(4, '{&quot;time&quot;:1675198664183,&quot;blocks&quot;:[{&quot;id&quot;:&quot;MUG_a1u5xb&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \"></p>'),
(5, '{&quot;time&quot;:1675199064199,&quot;blocks&quot;:[{&quot;id&quot;:&quot;MUG_a1u5xb&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \"></p>'),
(6, '{&quot;time&quot;:1675199198231,&quot;blocks&quot;:[{&quot;id&quot;:&quot;MUG_a1u5xb&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \"></p>'),
(7, '{&quot;time&quot;:1675199505997,&quot;blocks&quot;:[{&quot;id&quot;:&quot;MUG_a1u5xb&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \"></p>'),
(8, '{&quot;time&quot;:1675199732691,&quot;blocks&quot;:[{&quot;id&quot;:&quot;MUG_a1u5xb&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \"></p>'),
(9, '{&quot;time&quot;:1675199843357,&quot;blocks&quot;:[{&quot;id&quot;:&quot;MUG_a1u5xb&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \"></p>'),
(10, '{&quot;time&quot;:1649187492372,&quot;blocks&quot;:[{&quot;id&quot;:&quot;oXxZc8jlHZ&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lacus in iaculis ut ut facilisi suspendisse pharetra. Scelerisque convallis ac tellus felis mauris egestas amet, aenean urna. Scelerisque egestas sed cursus at felis urna nullam. Ut rutrum adipiscing hendrerit consectetur nulla cursus non gravida. Quam venenatis amet ultrices quam massa faucibus maecenas pellentesque. Orci neque ultrices pretium est et lectus enim vitae pellentesque.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;dk__xX88hC&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lacus in iaculis ut ut facilisi suspendisse pharetra. Scelerisque convallis ac tellus felis mauris egestas amet, aenean urna. Scelerisque egestas sed cursus at felis urna nullam. Ut rutrum adipiscing hendrerit consectetur nulla cursus non gravida. Quam venenatis amet ultrices quam massa faucibus maecenas pellentesque. Orci neque ultrices pretium est et lectus enim vitae pellentesque.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \">Lacus in iaculis ut ut facilisi suspendisse pharetra. Scelerisque convallis ac tellus felis mauris egestas amet, aenean urna. Scelerisque egestas sed cursus at felis urna nullam. Ut rutrum adipiscing hendrerit consectetur nulla cursus non gravida. Quam venenatis amet ultrices quam massa faucibus maecenas pellentesque. Orci neque ultrices pretium est et lectus enim vitae pellentesque.</p><p style=\"text-align: \">Lacus in iaculis ut ut facilisi suspendisse pharetra. Scelerisque convallis ac tellus felis mauris egestas amet, aenean urna. Scelerisque egestas sed cursus at felis urna nullam. Ut rutrum adipiscing hendrerit consectetur nulla cursus non gravida. Quam venenatis amet ultrices quam massa faucibus maecenas pellentesque. Orci neque ultrices pretium est et lectus enim vitae pellentesque.</p>'),
(11, '{&quot;time&quot;:1641742429664,&quot;blocks&quot;:[{&quot;id&quot;:&quot;XErbyrnEse&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lacus in iaculis ut ut facilisi suspendisse pharetra. Scelerisque convallis ac tellus felis mauris egestas amet, aenean urna. Scelerisque egestas sed cursus at felis urna nullam. Ut rutrum adipiscing hendrerit consectetur nulla cursus non gravida. Quam venenatis amet ultrices quam massa faucibus maecenas pellentesque. Orci neque ultrices pretium est et lectus enim vitae pellentesque.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;K--n4Y7LC9&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lacus in iaculis ut ut facilisi suspendisse pharetra. Scelerisque convallis ac tellus felis mauris egestas amet, aenean urna. Scelerisque egestas sed cursus at felis urna nullam. Ut rutrum adipiscing hendrerit consectetur nulla cursus non gravida. Quam venenatis amet ultrices quam massa faucibus maecenas pellentesque. Orci neque ultrices pretium est et lectus enim vitae pellentesque.&amp;nbsp;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: left\">Lacus in iaculis ut ut facilisi suspendisse pharetra. Scelerisque convallis ac tellus felis mauris egestas amet, aenean urna. Scelerisque egestas sed cursus at felis urna nullam. Ut rutrum adipiscing hendrerit consectetur nulla cursus non gravida. Quam venenatis amet ultrices quam massa faucibus maecenas pellentesque. Orci neque ultrices pretium est et lectus enim vitae pellentesque.</p><p style=\"text-align: left\">Lacus in iaculis ut ut facilisi suspendisse pharetra. Scelerisque convallis ac tellus felis mauris egestas amet, aenean urna. Scelerisque egestas sed cursus at felis urna nullam. Ut rutrum adipiscing hendrerit consectetur nulla cursus non gravida. Quam venenatis amet ultrices quam massa faucibus maecenas pellentesque. Orci neque ultrices pretium est et lectus enim vitae pellentesque.&nbsp;</p>'),
(20, '{&quot;time&quot;:1642171630789,&quot;blocks&quot;:[{&quot;id&quot;:&quot;VRvKTRTb1K&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor</p>'),
(21, '{&quot;time&quot;:1642200035147,&quot;blocks&quot;:[{&quot;id&quot;:&quot;zLobPqR6BZ&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;koEK8PEh1g&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Faucibus nisl tincidunt eget nullam non nisi. Pretium aenean pharetra magna ac placerat vestibulum. Tortor id aliquet lectus proin nibh nisl condimentum id. Sit amet porttitor eget dolor morbi non. Nulla facilisi cras fermentum odio eu feugiat. Aliquam nulla facilisi cras fermentum odio eu feugiat. Nisl condimentum id venenatis a condimentum vitae. Placerat duis ultricies lacus sed turpis tincidunt id. Diam quis enim lobortis scelerisque fermentum dui faucibus in. Suspendisse sed nisi lacus sed viverra tellus. Non nisi est sit amet facilisis magna etiam tempor. Porttitor lacus luctus accumsan tortor. Elementum eu facilisis sed odio morbi quis. Mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum. Sit amet justo donec enim diam vulputate ut. Vulputate mi sit amet mauris commodo quis imperdiet massa.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;G-PZtXSPwl&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Dui ut ornare lectus sit amet est placerat in egestas. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Commodo elit at imperdiet dui accumsan sit amet nulla. Fames ac turpis egestas integer eget aliquet nibh. Curabitur vitae nunc sed velit dignissim. Vitae congue eu consequat ac felis donec et odio pellentesque. Pellentesque sit amet porttitor eget dolor morbi. Porta lorem mollis aliquam ut porttitor. Pellentesque elit eget gravida cum sociis natoque penatibus et. Aliquet nibh praesent tristique magna sit amet purus. Nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Nisl suscipit adipiscing bibendum est ultricies integer. Sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Odio morbi quis commodo odio. Sed vulputate odio ut enim blandit volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Quis auctor elit sed vulputate mi sit amet mauris commodo. Quis hendrerit dolor magna eget est. Scelerisque viverra mauris in aliquam sem. Cursus metus aliquam eleifend mi in nulla.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;Hp48UgxG4d&quot;,&quot;type&quot;:&quot;image&quot;,&quot;data&quot;:{&quot;file&quot;:{&quot;url&quot;:&quot;..\\/__assets\\/T_text\\/21\\/Hp48UgxG4d.png&quot;},&quot;caption&quot;:&quot;\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a \\u0438\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u044f&quot;,&quot;withBorder&quot;:false,&quot;stretched&quot;:false,&quot;withBackground&quot;:false}},{&quot;id&quot;:&quot;wp4sDSvtop&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;DiBAMrMFaf&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.&amp;nbsp;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.</p><p style=\"text-align: \">Faucibus nisl tincidunt eget nullam non nisi. Pretium aenean pharetra magna ac placerat vestibulum. Tortor id aliquet lectus proin nibh nisl condimentum id. Sit amet porttitor eget dolor morbi non. Nulla facilisi cras fermentum odio eu feugiat. Aliquam nulla facilisi cras fermentum odio eu feugiat. Nisl condimentum id venenatis a condimentum vitae. Placerat duis ultricies lacus sed turpis tincidunt id. Diam quis enim lobortis scelerisque fermentum dui faucibus in. Suspendisse sed nisi lacus sed viverra tellus. Non nisi est sit amet facilisis magna etiam tempor. Porttitor lacus luctus accumsan tortor. Elementum eu facilisis sed odio morbi quis. Mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum. Sit amet justo donec enim diam vulputate ut. Vulputate mi sit amet mauris commodo quis imperdiet massa.</p><p style=\"text-align: \">Dui ut ornare lectus sit amet est placerat in egestas. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Commodo elit at imperdiet dui accumsan sit amet nulla. Fames ac turpis egestas integer eget aliquet nibh. Curabitur vitae nunc sed velit dignissim. Vitae congue eu consequat ac felis donec et odio pellentesque. Pellentesque sit amet porttitor eget dolor morbi. Porta lorem mollis aliquam ut porttitor. Pellentesque elit eget gravida cum sociis natoque penatibus et. Aliquet nibh praesent tristique magna sit amet purus. Nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Nisl suscipit adipiscing bibendum est ultricies integer. Sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Odio morbi quis commodo odio. Sed vulputate odio ut enim blandit volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Quis auctor elit sed vulputate mi sit amet mauris commodo. Quis hendrerit dolor magna eget est. Scelerisque viverra mauris in aliquam sem. Cursus metus aliquam eleifend mi in nulla.</p>\n            <figure>\n               <img \n                  src=\"../__assets/T_text/21/Hp48UgxG4d.png\" \n                  width=\"\"\n                  data-with-border=\"false\"\n                  data-with-background=\"false\" />\n               <figcaption>Заголовок изображения</figcaption>\n            </figure>\n            <p style=\"text-align: \">Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.</p><p style=\"text-align: \">Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.&nbsp;</p>'),
(28, '&quot;&quot;', ''),
(29, '{&quot;time&quot;:1642200035147,&quot;blocks&quot;:[{&quot;id&quot;:&quot;zLobPqR6BZ&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;koEK8PEh1g&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Faucibus nisl tincidunt eget nullam non nisi. Pretium aenean pharetra magna ac placerat vestibulum. Tortor id aliquet lectus proin nibh nisl condimentum id. Sit amet porttitor eget dolor morbi non. Nulla facilisi cras fermentum odio eu feugiat. Aliquam nulla facilisi cras fermentum odio eu feugiat. Nisl condimentum id venenatis a condimentum vitae. Placerat duis ultricies lacus sed turpis tincidunt id. Diam quis enim lobortis scelerisque fermentum dui faucibus in. Suspendisse sed nisi lacus sed viverra tellus. Non nisi est sit amet facilisis magna etiam tempor. Porttitor lacus luctus accumsan tortor. Elementum eu facilisis sed odio morbi quis. Mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum. Sit amet justo donec enim diam vulputate ut. Vulputate mi sit amet mauris commodo quis imperdiet massa.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;G-PZtXSPwl&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Dui ut ornare lectus sit amet est placerat in egestas. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Commodo elit at imperdiet dui accumsan sit amet nulla. Fames ac turpis egestas integer eget aliquet nibh. Curabitur vitae nunc sed velit dignissim. Vitae congue eu consequat ac felis donec et odio pellentesque. Pellentesque sit amet porttitor eget dolor morbi. Porta lorem mollis aliquam ut porttitor. Pellentesque elit eget gravida cum sociis natoque penatibus et. Aliquet nibh praesent tristique magna sit amet purus. Nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Nisl suscipit adipiscing bibendum est ultricies integer. Sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Odio morbi quis commodo odio. Sed vulputate odio ut enim blandit volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Quis auctor elit sed vulputate mi sit amet mauris commodo. Quis hendrerit dolor magna eget est. Scelerisque viverra mauris in aliquam sem. Cursus metus aliquam eleifend mi in nulla.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;Hp48UgxG4d&quot;,&quot;type&quot;:&quot;image&quot;,&quot;data&quot;:{&quot;file&quot;:{&quot;url&quot;:&quot;..\\/__assets\\/T_text\\/29\\/Hp48UgxG4d.png&quot;},&quot;caption&quot;:&quot;\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a \\u0438\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u044f&quot;,&quot;withBorder&quot;:false,&quot;stretched&quot;:false,&quot;withBackground&quot;:false}},{&quot;id&quot;:&quot;wp4sDSvtop&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;DiBAMrMFaf&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.&amp;nbsp;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.</p><p style=\"text-align: \">Faucibus nisl tincidunt eget nullam non nisi. Pretium aenean pharetra magna ac placerat vestibulum. Tortor id aliquet lectus proin nibh nisl condimentum id. Sit amet porttitor eget dolor morbi non. Nulla facilisi cras fermentum odio eu feugiat. Aliquam nulla facilisi cras fermentum odio eu feugiat. Nisl condimentum id venenatis a condimentum vitae. Placerat duis ultricies lacus sed turpis tincidunt id. Diam quis enim lobortis scelerisque fermentum dui faucibus in. Suspendisse sed nisi lacus sed viverra tellus. Non nisi est sit amet facilisis magna etiam tempor. Porttitor lacus luctus accumsan tortor. Elementum eu facilisis sed odio morbi quis. Mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum. Sit amet justo donec enim diam vulputate ut. Vulputate mi sit amet mauris commodo quis imperdiet massa.</p><p style=\"text-align: \">Dui ut ornare lectus sit amet est placerat in egestas. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Commodo elit at imperdiet dui accumsan sit amet nulla. Fames ac turpis egestas integer eget aliquet nibh. Curabitur vitae nunc sed velit dignissim. Vitae congue eu consequat ac felis donec et odio pellentesque. Pellentesque sit amet porttitor eget dolor morbi. Porta lorem mollis aliquam ut porttitor. Pellentesque elit eget gravida cum sociis natoque penatibus et. Aliquet nibh praesent tristique magna sit amet purus. Nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Nisl suscipit adipiscing bibendum est ultricies integer. Sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Odio morbi quis commodo odio. Sed vulputate odio ut enim blandit volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Quis auctor elit sed vulputate mi sit amet mauris commodo. Quis hendrerit dolor magna eget est. Scelerisque viverra mauris in aliquam sem. Cursus metus aliquam eleifend mi in nulla.</p>\n            <figure>\n               <img \n                  src=\"../__assets/T_text/29/Hp48UgxG4d.png\" \n                  width=\"\"\n                  data-with-border=\"false\"\n                  data-with-background=\"false\" />\n               <figcaption>Заголовок изображения</figcaption>\n            </figure>\n            <p style=\"text-align: \">Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.</p><p style=\"text-align: \">Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.&nbsp;</p>'),
(30, '{&quot;time&quot;:1642171630789,&quot;blocks&quot;:[{&quot;id&quot;:&quot;VRvKTRTb1K&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor</p>'),
(31, '{&quot;time&quot;:1642200035147,&quot;blocks&quot;:[{&quot;id&quot;:&quot;zLobPqR6BZ&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;koEK8PEh1g&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Faucibus nisl tincidunt eget nullam non nisi. Pretium aenean pharetra magna ac placerat vestibulum. Tortor id aliquet lectus proin nibh nisl condimentum id. Sit amet porttitor eget dolor morbi non. Nulla facilisi cras fermentum odio eu feugiat. Aliquam nulla facilisi cras fermentum odio eu feugiat. Nisl condimentum id venenatis a condimentum vitae. Placerat duis ultricies lacus sed turpis tincidunt id. Diam quis enim lobortis scelerisque fermentum dui faucibus in. Suspendisse sed nisi lacus sed viverra tellus. Non nisi est sit amet facilisis magna etiam tempor. Porttitor lacus luctus accumsan tortor. Elementum eu facilisis sed odio morbi quis. Mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum. Sit amet justo donec enim diam vulputate ut. Vulputate mi sit amet mauris commodo quis imperdiet massa.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;G-PZtXSPwl&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Dui ut ornare lectus sit amet est placerat in egestas. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Commodo elit at imperdiet dui accumsan sit amet nulla. Fames ac turpis egestas integer eget aliquet nibh. Curabitur vitae nunc sed velit dignissim. Vitae congue eu consequat ac felis donec et odio pellentesque. Pellentesque sit amet porttitor eget dolor morbi. Porta lorem mollis aliquam ut porttitor. Pellentesque elit eget gravida cum sociis natoque penatibus et. Aliquet nibh praesent tristique magna sit amet purus. Nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Nisl suscipit adipiscing bibendum est ultricies integer. Sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Odio morbi quis commodo odio. Sed vulputate odio ut enim blandit volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Quis auctor elit sed vulputate mi sit amet mauris commodo. Quis hendrerit dolor magna eget est. Scelerisque viverra mauris in aliquam sem. Cursus metus aliquam eleifend mi in nulla.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;Hp48UgxG4d&quot;,&quot;type&quot;:&quot;image&quot;,&quot;data&quot;:{&quot;file&quot;:{&quot;url&quot;:&quot;..\\/__assets\\/T_text\\/31\\/Hp48UgxG4d.png&quot;},&quot;caption&quot;:&quot;\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a \\u0438\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u044f&quot;,&quot;withBorder&quot;:false,&quot;stretched&quot;:false,&quot;withBackground&quot;:false}},{&quot;id&quot;:&quot;wp4sDSvtop&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;DiBAMrMFaf&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.&amp;nbsp;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.</p><p style=\"text-align: \">Faucibus nisl tincidunt eget nullam non nisi. Pretium aenean pharetra magna ac placerat vestibulum. Tortor id aliquet lectus proin nibh nisl condimentum id. Sit amet porttitor eget dolor morbi non. Nulla facilisi cras fermentum odio eu feugiat. Aliquam nulla facilisi cras fermentum odio eu feugiat. Nisl condimentum id venenatis a condimentum vitae. Placerat duis ultricies lacus sed turpis tincidunt id. Diam quis enim lobortis scelerisque fermentum dui faucibus in. Suspendisse sed nisi lacus sed viverra tellus. Non nisi est sit amet facilisis magna etiam tempor. Porttitor lacus luctus accumsan tortor. Elementum eu facilisis sed odio morbi quis. Mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum. Sit amet justo donec enim diam vulputate ut. Vulputate mi sit amet mauris commodo quis imperdiet massa.</p><p style=\"text-align: \">Dui ut ornare lectus sit amet est placerat in egestas. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Commodo elit at imperdiet dui accumsan sit amet nulla. Fames ac turpis egestas integer eget aliquet nibh. Curabitur vitae nunc sed velit dignissim. Vitae congue eu consequat ac felis donec et odio pellentesque. Pellentesque sit amet porttitor eget dolor morbi. Porta lorem mollis aliquam ut porttitor. Pellentesque elit eget gravida cum sociis natoque penatibus et. Aliquet nibh praesent tristique magna sit amet purus. Nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Nisl suscipit adipiscing bibendum est ultricies integer. Sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Odio morbi quis commodo odio. Sed vulputate odio ut enim blandit volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Quis auctor elit sed vulputate mi sit amet mauris commodo. Quis hendrerit dolor magna eget est. Scelerisque viverra mauris in aliquam sem. Cursus metus aliquam eleifend mi in nulla.</p>\n            <figure>\n               <img \n                  src=\"../__assets/T_text/31/Hp48UgxG4d.png\" \n                  width=\"\"\n                  data-with-border=\"false\"\n                  data-with-background=\"false\" />\n               <figcaption>Заголовок изображения</figcaption>\n            </figure>\n            <p style=\"text-align: \">Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.</p><p style=\"text-align: \">Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.&nbsp;</p>'),
(32, '{&quot;time&quot;:1642171630789,&quot;blocks&quot;:[{&quot;id&quot;:&quot;VRvKTRTb1K&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor</p>');
INSERT INTO `jf-cms_T_text` (`id_text`, `text_value`, `text_html`) VALUES
(33, '{&quot;time&quot;:1642200035147,&quot;blocks&quot;:[{&quot;id&quot;:&quot;zLobPqR6BZ&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;koEK8PEh1g&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Faucibus nisl tincidunt eget nullam non nisi. Pretium aenean pharetra magna ac placerat vestibulum. Tortor id aliquet lectus proin nibh nisl condimentum id. Sit amet porttitor eget dolor morbi non. Nulla facilisi cras fermentum odio eu feugiat. Aliquam nulla facilisi cras fermentum odio eu feugiat. Nisl condimentum id venenatis a condimentum vitae. Placerat duis ultricies lacus sed turpis tincidunt id. Diam quis enim lobortis scelerisque fermentum dui faucibus in. Suspendisse sed nisi lacus sed viverra tellus. Non nisi est sit amet facilisis magna etiam tempor. Porttitor lacus luctus accumsan tortor. Elementum eu facilisis sed odio morbi quis. Mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum. Sit amet justo donec enim diam vulputate ut. Vulputate mi sit amet mauris commodo quis imperdiet massa.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;G-PZtXSPwl&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Dui ut ornare lectus sit amet est placerat in egestas. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Commodo elit at imperdiet dui accumsan sit amet nulla. Fames ac turpis egestas integer eget aliquet nibh. Curabitur vitae nunc sed velit dignissim. Vitae congue eu consequat ac felis donec et odio pellentesque. Pellentesque sit amet porttitor eget dolor morbi. Porta lorem mollis aliquam ut porttitor. Pellentesque elit eget gravida cum sociis natoque penatibus et. Aliquet nibh praesent tristique magna sit amet purus. Nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Nisl suscipit adipiscing bibendum est ultricies integer. Sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Odio morbi quis commodo odio. Sed vulputate odio ut enim blandit volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Quis auctor elit sed vulputate mi sit amet mauris commodo. Quis hendrerit dolor magna eget est. Scelerisque viverra mauris in aliquam sem. Cursus metus aliquam eleifend mi in nulla.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;Hp48UgxG4d&quot;,&quot;type&quot;:&quot;image&quot;,&quot;data&quot;:{&quot;file&quot;:{&quot;url&quot;:&quot;..\\/__assets\\/T_text\\/33\\/Hp48UgxG4d.png&quot;},&quot;caption&quot;:&quot;\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a \\u0438\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u044f&quot;,&quot;withBorder&quot;:false,&quot;stretched&quot;:false,&quot;withBackground&quot;:false}},{&quot;id&quot;:&quot;wp4sDSvtop&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;DiBAMrMFaf&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.&amp;nbsp;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.</p><p style=\"text-align: \">Faucibus nisl tincidunt eget nullam non nisi. Pretium aenean pharetra magna ac placerat vestibulum. Tortor id aliquet lectus proin nibh nisl condimentum id. Sit amet porttitor eget dolor morbi non. Nulla facilisi cras fermentum odio eu feugiat. Aliquam nulla facilisi cras fermentum odio eu feugiat. Nisl condimentum id venenatis a condimentum vitae. Placerat duis ultricies lacus sed turpis tincidunt id. Diam quis enim lobortis scelerisque fermentum dui faucibus in. Suspendisse sed nisi lacus sed viverra tellus. Non nisi est sit amet facilisis magna etiam tempor. Porttitor lacus luctus accumsan tortor. Elementum eu facilisis sed odio morbi quis. Mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum. Sit amet justo donec enim diam vulputate ut. Vulputate mi sit amet mauris commodo quis imperdiet massa.</p><p style=\"text-align: \">Dui ut ornare lectus sit amet est placerat in egestas. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Commodo elit at imperdiet dui accumsan sit amet nulla. Fames ac turpis egestas integer eget aliquet nibh. Curabitur vitae nunc sed velit dignissim. Vitae congue eu consequat ac felis donec et odio pellentesque. Pellentesque sit amet porttitor eget dolor morbi. Porta lorem mollis aliquam ut porttitor. Pellentesque elit eget gravida cum sociis natoque penatibus et. Aliquet nibh praesent tristique magna sit amet purus. Nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Nisl suscipit adipiscing bibendum est ultricies integer. Sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Odio morbi quis commodo odio. Sed vulputate odio ut enim blandit volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Quis auctor elit sed vulputate mi sit amet mauris commodo. Quis hendrerit dolor magna eget est. Scelerisque viverra mauris in aliquam sem. Cursus metus aliquam eleifend mi in nulla.</p>\n            <figure>\n               <img \n                  src=\"../__assets/T_text/33/Hp48UgxG4d.png\" \n                  width=\"\"\n                  data-with-border=\"false\"\n                  data-with-background=\"false\" />\n               <figcaption>Заголовок изображения</figcaption>\n            </figure>\n            <p style=\"text-align: \">Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.</p><p style=\"text-align: \">Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.&nbsp;</p>'),
(34, '&quot;&quot;', ''),
(35, '{&quot;time&quot;:1642200035147,&quot;blocks&quot;:[{&quot;id&quot;:&quot;zLobPqR6BZ&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;koEK8PEh1g&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Faucibus nisl tincidunt eget nullam non nisi. Pretium aenean pharetra magna ac placerat vestibulum. Tortor id aliquet lectus proin nibh nisl condimentum id. Sit amet porttitor eget dolor morbi non. Nulla facilisi cras fermentum odio eu feugiat. Aliquam nulla facilisi cras fermentum odio eu feugiat. Nisl condimentum id venenatis a condimentum vitae. Placerat duis ultricies lacus sed turpis tincidunt id. Diam quis enim lobortis scelerisque fermentum dui faucibus in. Suspendisse sed nisi lacus sed viverra tellus. Non nisi est sit amet facilisis magna etiam tempor. Porttitor lacus luctus accumsan tortor. Elementum eu facilisis sed odio morbi quis. Mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum. Sit amet justo donec enim diam vulputate ut. Vulputate mi sit amet mauris commodo quis imperdiet massa.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;G-PZtXSPwl&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Dui ut ornare lectus sit amet est placerat in egestas. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Commodo elit at imperdiet dui accumsan sit amet nulla. Fames ac turpis egestas integer eget aliquet nibh. Curabitur vitae nunc sed velit dignissim. Vitae congue eu consequat ac felis donec et odio pellentesque. Pellentesque sit amet porttitor eget dolor morbi. Porta lorem mollis aliquam ut porttitor. Pellentesque elit eget gravida cum sociis natoque penatibus et. Aliquet nibh praesent tristique magna sit amet purus. Nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Nisl suscipit adipiscing bibendum est ultricies integer. Sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Odio morbi quis commodo odio. Sed vulputate odio ut enim blandit volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Quis auctor elit sed vulputate mi sit amet mauris commodo. Quis hendrerit dolor magna eget est. Scelerisque viverra mauris in aliquam sem. Cursus metus aliquam eleifend mi in nulla.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;Hp48UgxG4d&quot;,&quot;type&quot;:&quot;image&quot;,&quot;data&quot;:{&quot;file&quot;:{&quot;url&quot;:&quot;..\\/__assets\\/T_text\\/35\\/Hp48UgxG4d.png&quot;},&quot;caption&quot;:&quot;\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a \\u0438\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u044f&quot;,&quot;withBorder&quot;:false,&quot;stretched&quot;:false,&quot;withBackground&quot;:false}},{&quot;id&quot;:&quot;wp4sDSvtop&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;DiBAMrMFaf&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.&amp;nbsp;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.</p><p style=\"text-align: \">Faucibus nisl tincidunt eget nullam non nisi. Pretium aenean pharetra magna ac placerat vestibulum. Tortor id aliquet lectus proin nibh nisl condimentum id. Sit amet porttitor eget dolor morbi non. Nulla facilisi cras fermentum odio eu feugiat. Aliquam nulla facilisi cras fermentum odio eu feugiat. Nisl condimentum id venenatis a condimentum vitae. Placerat duis ultricies lacus sed turpis tincidunt id. Diam quis enim lobortis scelerisque fermentum dui faucibus in. Suspendisse sed nisi lacus sed viverra tellus. Non nisi est sit amet facilisis magna etiam tempor. Porttitor lacus luctus accumsan tortor. Elementum eu facilisis sed odio morbi quis. Mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum. Sit amet justo donec enim diam vulputate ut. Vulputate mi sit amet mauris commodo quis imperdiet massa.</p><p style=\"text-align: \">Dui ut ornare lectus sit amet est placerat in egestas. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Commodo elit at imperdiet dui accumsan sit amet nulla. Fames ac turpis egestas integer eget aliquet nibh. Curabitur vitae nunc sed velit dignissim. Vitae congue eu consequat ac felis donec et odio pellentesque. Pellentesque sit amet porttitor eget dolor morbi. Porta lorem mollis aliquam ut porttitor. Pellentesque elit eget gravida cum sociis natoque penatibus et. Aliquet nibh praesent tristique magna sit amet purus. Nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Nisl suscipit adipiscing bibendum est ultricies integer. Sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Odio morbi quis commodo odio. Sed vulputate odio ut enim blandit volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Quis auctor elit sed vulputate mi sit amet mauris commodo. Quis hendrerit dolor magna eget est. Scelerisque viverra mauris in aliquam sem. Cursus metus aliquam eleifend mi in nulla.</p>\n            <figure>\n               <img \n                  src=\"../__assets/T_text/35/Hp48UgxG4d.png\" \n                  width=\"\"\n                  data-with-border=\"false\"\n                  data-with-background=\"false\" />\n               <figcaption>Заголовок изображения</figcaption>\n            </figure>\n            <p style=\"text-align: \">Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.</p><p style=\"text-align: \">Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.&nbsp;</p>'),
(36, '&quot;&quot;', ''),
(37, '{&quot;time&quot;:1642200035147,&quot;blocks&quot;:[{&quot;id&quot;:&quot;zLobPqR6BZ&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;koEK8PEh1g&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Faucibus nisl tincidunt eget nullam non nisi. Pretium aenean pharetra magna ac placerat vestibulum. Tortor id aliquet lectus proin nibh nisl condimentum id. Sit amet porttitor eget dolor morbi non. Nulla facilisi cras fermentum odio eu feugiat. Aliquam nulla facilisi cras fermentum odio eu feugiat. Nisl condimentum id venenatis a condimentum vitae. Placerat duis ultricies lacus sed turpis tincidunt id. Diam quis enim lobortis scelerisque fermentum dui faucibus in. Suspendisse sed nisi lacus sed viverra tellus. Non nisi est sit amet facilisis magna etiam tempor. Porttitor lacus luctus accumsan tortor. Elementum eu facilisis sed odio morbi quis. Mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum. Sit amet justo donec enim diam vulputate ut. Vulputate mi sit amet mauris commodo quis imperdiet massa.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;G-PZtXSPwl&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Dui ut ornare lectus sit amet est placerat in egestas. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Commodo elit at imperdiet dui accumsan sit amet nulla. Fames ac turpis egestas integer eget aliquet nibh. Curabitur vitae nunc sed velit dignissim. Vitae congue eu consequat ac felis donec et odio pellentesque. Pellentesque sit amet porttitor eget dolor morbi. Porta lorem mollis aliquam ut porttitor. Pellentesque elit eget gravida cum sociis natoque penatibus et. Aliquet nibh praesent tristique magna sit amet purus. Nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Nisl suscipit adipiscing bibendum est ultricies integer. Sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Odio morbi quis commodo odio. Sed vulputate odio ut enim blandit volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Quis auctor elit sed vulputate mi sit amet mauris commodo. Quis hendrerit dolor magna eget est. Scelerisque viverra mauris in aliquam sem. Cursus metus aliquam eleifend mi in nulla.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;Hp48UgxG4d&quot;,&quot;type&quot;:&quot;image&quot;,&quot;data&quot;:{&quot;file&quot;:{&quot;url&quot;:&quot;..\\/__assets\\/T_text\\/37\\/Hp48UgxG4d.png&quot;},&quot;caption&quot;:&quot;\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a \\u0438\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u044f&quot;,&quot;withBorder&quot;:false,&quot;stretched&quot;:false,&quot;withBackground&quot;:false}},{&quot;id&quot;:&quot;wp4sDSvtop&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;DiBAMrMFaf&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.&amp;nbsp;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.</p><p style=\"text-align: \">Faucibus nisl tincidunt eget nullam non nisi. Pretium aenean pharetra magna ac placerat vestibulum. Tortor id aliquet lectus proin nibh nisl condimentum id. Sit amet porttitor eget dolor morbi non. Nulla facilisi cras fermentum odio eu feugiat. Aliquam nulla facilisi cras fermentum odio eu feugiat. Nisl condimentum id venenatis a condimentum vitae. Placerat duis ultricies lacus sed turpis tincidunt id. Diam quis enim lobortis scelerisque fermentum dui faucibus in. Suspendisse sed nisi lacus sed viverra tellus. Non nisi est sit amet facilisis magna etiam tempor. Porttitor lacus luctus accumsan tortor. Elementum eu facilisis sed odio morbi quis. Mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum. Sit amet justo donec enim diam vulputate ut. Vulputate mi sit amet mauris commodo quis imperdiet massa.</p><p style=\"text-align: \">Dui ut ornare lectus sit amet est placerat in egestas. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Commodo elit at imperdiet dui accumsan sit amet nulla. Fames ac turpis egestas integer eget aliquet nibh. Curabitur vitae nunc sed velit dignissim. Vitae congue eu consequat ac felis donec et odio pellentesque. Pellentesque sit amet porttitor eget dolor morbi. Porta lorem mollis aliquam ut porttitor. Pellentesque elit eget gravida cum sociis natoque penatibus et. Aliquet nibh praesent tristique magna sit amet purus. Nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Nisl suscipit adipiscing bibendum est ultricies integer. Sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Odio morbi quis commodo odio. Sed vulputate odio ut enim blandit volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Quis auctor elit sed vulputate mi sit amet mauris commodo. Quis hendrerit dolor magna eget est. Scelerisque viverra mauris in aliquam sem. Cursus metus aliquam eleifend mi in nulla.</p>\n            <figure>\n               <img \n                  src=\"../__assets/T_text/37/Hp48UgxG4d.png\" \n                  width=\"\"\n                  data-with-border=\"false\"\n                  data-with-background=\"false\" />\n               <figcaption>Заголовок изображения</figcaption>\n            </figure>\n            <p style=\"text-align: \">Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.</p><p style=\"text-align: \">Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.&nbsp;</p>'),
(38, '&quot;&quot;', ''),
(39, '{&quot;time&quot;:1642200035147,&quot;blocks&quot;:[{&quot;id&quot;:&quot;zLobPqR6BZ&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;koEK8PEh1g&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Faucibus nisl tincidunt eget nullam non nisi. Pretium aenean pharetra magna ac placerat vestibulum. Tortor id aliquet lectus proin nibh nisl condimentum id. Sit amet porttitor eget dolor morbi non. Nulla facilisi cras fermentum odio eu feugiat. Aliquam nulla facilisi cras fermentum odio eu feugiat. Nisl condimentum id venenatis a condimentum vitae. Placerat duis ultricies lacus sed turpis tincidunt id. Diam quis enim lobortis scelerisque fermentum dui faucibus in. Suspendisse sed nisi lacus sed viverra tellus. Non nisi est sit amet facilisis magna etiam tempor. Porttitor lacus luctus accumsan tortor. Elementum eu facilisis sed odio morbi quis. Mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum. Sit amet justo donec enim diam vulputate ut. Vulputate mi sit amet mauris commodo quis imperdiet massa.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;G-PZtXSPwl&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Dui ut ornare lectus sit amet est placerat in egestas. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Commodo elit at imperdiet dui accumsan sit amet nulla. Fames ac turpis egestas integer eget aliquet nibh. Curabitur vitae nunc sed velit dignissim. Vitae congue eu consequat ac felis donec et odio pellentesque. Pellentesque sit amet porttitor eget dolor morbi. Porta lorem mollis aliquam ut porttitor. Pellentesque elit eget gravida cum sociis natoque penatibus et. Aliquet nibh praesent tristique magna sit amet purus. Nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Nisl suscipit adipiscing bibendum est ultricies integer. Sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Odio morbi quis commodo odio. Sed vulputate odio ut enim blandit volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Quis auctor elit sed vulputate mi sit amet mauris commodo. Quis hendrerit dolor magna eget est. Scelerisque viverra mauris in aliquam sem. Cursus metus aliquam eleifend mi in nulla.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;Hp48UgxG4d&quot;,&quot;type&quot;:&quot;image&quot;,&quot;data&quot;:{&quot;file&quot;:{&quot;url&quot;:&quot;..\\/__assets\\/T_text\\/39\\/Hp48UgxG4d.png&quot;},&quot;caption&quot;:&quot;\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a \\u0438\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u044f&quot;,&quot;withBorder&quot;:false,&quot;stretched&quot;:false,&quot;withBackground&quot;:false}},{&quot;id&quot;:&quot;wp4sDSvtop&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;DiBAMrMFaf&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.&amp;nbsp;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.</p><p style=\"text-align: \">Faucibus nisl tincidunt eget nullam non nisi. Pretium aenean pharetra magna ac placerat vestibulum. Tortor id aliquet lectus proin nibh nisl condimentum id. Sit amet porttitor eget dolor morbi non. Nulla facilisi cras fermentum odio eu feugiat. Aliquam nulla facilisi cras fermentum odio eu feugiat. Nisl condimentum id venenatis a condimentum vitae. Placerat duis ultricies lacus sed turpis tincidunt id. Diam quis enim lobortis scelerisque fermentum dui faucibus in. Suspendisse sed nisi lacus sed viverra tellus. Non nisi est sit amet facilisis magna etiam tempor. Porttitor lacus luctus accumsan tortor. Elementum eu facilisis sed odio morbi quis. Mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum. Sit amet justo donec enim diam vulputate ut. Vulputate mi sit amet mauris commodo quis imperdiet massa.</p><p style=\"text-align: \">Dui ut ornare lectus sit amet est placerat in egestas. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Commodo elit at imperdiet dui accumsan sit amet nulla. Fames ac turpis egestas integer eget aliquet nibh. Curabitur vitae nunc sed velit dignissim. Vitae congue eu consequat ac felis donec et odio pellentesque. Pellentesque sit amet porttitor eget dolor morbi. Porta lorem mollis aliquam ut porttitor. Pellentesque elit eget gravida cum sociis natoque penatibus et. Aliquet nibh praesent tristique magna sit amet purus. Nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Nisl suscipit adipiscing bibendum est ultricies integer. Sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Odio morbi quis commodo odio. Sed vulputate odio ut enim blandit volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Quis auctor elit sed vulputate mi sit amet mauris commodo. Quis hendrerit dolor magna eget est. Scelerisque viverra mauris in aliquam sem. Cursus metus aliquam eleifend mi in nulla.</p>\n            <figure>\n               <img \n                  src=\"../__assets/T_text/39/Hp48UgxG4d.png\" \n                  width=\"\"\n                  data-with-border=\"false\"\n                  data-with-background=\"false\" />\n               <figcaption>Заголовок изображения</figcaption>\n            </figure>\n            <p style=\"text-align: \">Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.</p><p style=\"text-align: \">Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.&nbsp;</p>'),
(40, '&quot;&quot;', '');
INSERT INTO `jf-cms_T_text` (`id_text`, `text_value`, `text_html`) VALUES
(41, '{&quot;time&quot;:1642200035147,&quot;blocks&quot;:[{&quot;id&quot;:&quot;zLobPqR6BZ&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;koEK8PEh1g&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Faucibus nisl tincidunt eget nullam non nisi. Pretium aenean pharetra magna ac placerat vestibulum. Tortor id aliquet lectus proin nibh nisl condimentum id. Sit amet porttitor eget dolor morbi non. Nulla facilisi cras fermentum odio eu feugiat. Aliquam nulla facilisi cras fermentum odio eu feugiat. Nisl condimentum id venenatis a condimentum vitae. Placerat duis ultricies lacus sed turpis tincidunt id. Diam quis enim lobortis scelerisque fermentum dui faucibus in. Suspendisse sed nisi lacus sed viverra tellus. Non nisi est sit amet facilisis magna etiam tempor. Porttitor lacus luctus accumsan tortor. Elementum eu facilisis sed odio morbi quis. Mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum. Sit amet justo donec enim diam vulputate ut. Vulputate mi sit amet mauris commodo quis imperdiet massa.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;G-PZtXSPwl&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Dui ut ornare lectus sit amet est placerat in egestas. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Commodo elit at imperdiet dui accumsan sit amet nulla. Fames ac turpis egestas integer eget aliquet nibh. Curabitur vitae nunc sed velit dignissim. Vitae congue eu consequat ac felis donec et odio pellentesque. Pellentesque sit amet porttitor eget dolor morbi. Porta lorem mollis aliquam ut porttitor. Pellentesque elit eget gravida cum sociis natoque penatibus et. Aliquet nibh praesent tristique magna sit amet purus. Nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Nisl suscipit adipiscing bibendum est ultricies integer. Sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Odio morbi quis commodo odio. Sed vulputate odio ut enim blandit volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Quis auctor elit sed vulputate mi sit amet mauris commodo. Quis hendrerit dolor magna eget est. Scelerisque viverra mauris in aliquam sem. Cursus metus aliquam eleifend mi in nulla.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;Hp48UgxG4d&quot;,&quot;type&quot;:&quot;image&quot;,&quot;data&quot;:{&quot;file&quot;:{&quot;url&quot;:&quot;..\\/__assets\\/T_text\\/41\\/Hp48UgxG4d.png&quot;},&quot;caption&quot;:&quot;\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a \\u0438\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u044f&quot;,&quot;withBorder&quot;:false,&quot;stretched&quot;:false,&quot;withBackground&quot;:false}},{&quot;id&quot;:&quot;wp4sDSvtop&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;DiBAMrMFaf&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.&amp;nbsp;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.</p><p style=\"text-align: \">Faucibus nisl tincidunt eget nullam non nisi. Pretium aenean pharetra magna ac placerat vestibulum. Tortor id aliquet lectus proin nibh nisl condimentum id. Sit amet porttitor eget dolor morbi non. Nulla facilisi cras fermentum odio eu feugiat. Aliquam nulla facilisi cras fermentum odio eu feugiat. Nisl condimentum id venenatis a condimentum vitae. Placerat duis ultricies lacus sed turpis tincidunt id. Diam quis enim lobortis scelerisque fermentum dui faucibus in. Suspendisse sed nisi lacus sed viverra tellus. Non nisi est sit amet facilisis magna etiam tempor. Porttitor lacus luctus accumsan tortor. Elementum eu facilisis sed odio morbi quis. Mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum. Sit amet justo donec enim diam vulputate ut. Vulputate mi sit amet mauris commodo quis imperdiet massa.</p><p style=\"text-align: \">Dui ut ornare lectus sit amet est placerat in egestas. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Commodo elit at imperdiet dui accumsan sit amet nulla. Fames ac turpis egestas integer eget aliquet nibh. Curabitur vitae nunc sed velit dignissim. Vitae congue eu consequat ac felis donec et odio pellentesque. Pellentesque sit amet porttitor eget dolor morbi. Porta lorem mollis aliquam ut porttitor. Pellentesque elit eget gravida cum sociis natoque penatibus et. Aliquet nibh praesent tristique magna sit amet purus. Nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Nisl suscipit adipiscing bibendum est ultricies integer. Sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Odio morbi quis commodo odio. Sed vulputate odio ut enim blandit volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Quis auctor elit sed vulputate mi sit amet mauris commodo. Quis hendrerit dolor magna eget est. Scelerisque viverra mauris in aliquam sem. Cursus metus aliquam eleifend mi in nulla.</p>\n            <figure>\n               <img \n                  src=\"../__assets/T_text/41/Hp48UgxG4d.png\" \n                  width=\"\"\n                  data-with-border=\"false\"\n                  data-with-background=\"false\" />\n               <figcaption>Заголовок изображения</figcaption>\n            </figure>\n            <p style=\"text-align: \">Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.</p><p style=\"text-align: \">Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.&nbsp;</p>'),
(42, '&quot;&quot;', ''),
(43, '{&quot;time&quot;:1642200035147,&quot;blocks&quot;:[{&quot;id&quot;:&quot;zLobPqR6BZ&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;koEK8PEh1g&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Faucibus nisl tincidunt eget nullam non nisi. Pretium aenean pharetra magna ac placerat vestibulum. Tortor id aliquet lectus proin nibh nisl condimentum id. Sit amet porttitor eget dolor morbi non. Nulla facilisi cras fermentum odio eu feugiat. Aliquam nulla facilisi cras fermentum odio eu feugiat. Nisl condimentum id venenatis a condimentum vitae. Placerat duis ultricies lacus sed turpis tincidunt id. Diam quis enim lobortis scelerisque fermentum dui faucibus in. Suspendisse sed nisi lacus sed viverra tellus. Non nisi est sit amet facilisis magna etiam tempor. Porttitor lacus luctus accumsan tortor. Elementum eu facilisis sed odio morbi quis. Mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum. Sit amet justo donec enim diam vulputate ut. Vulputate mi sit amet mauris commodo quis imperdiet massa.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;G-PZtXSPwl&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Dui ut ornare lectus sit amet est placerat in egestas. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Commodo elit at imperdiet dui accumsan sit amet nulla. Fames ac turpis egestas integer eget aliquet nibh. Curabitur vitae nunc sed velit dignissim. Vitae congue eu consequat ac felis donec et odio pellentesque. Pellentesque sit amet porttitor eget dolor morbi. Porta lorem mollis aliquam ut porttitor. Pellentesque elit eget gravida cum sociis natoque penatibus et. Aliquet nibh praesent tristique magna sit amet purus. Nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Nisl suscipit adipiscing bibendum est ultricies integer. Sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Odio morbi quis commodo odio. Sed vulputate odio ut enim blandit volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Quis auctor elit sed vulputate mi sit amet mauris commodo. Quis hendrerit dolor magna eget est. Scelerisque viverra mauris in aliquam sem. Cursus metus aliquam eleifend mi in nulla.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;Hp48UgxG4d&quot;,&quot;type&quot;:&quot;image&quot;,&quot;data&quot;:{&quot;file&quot;:{&quot;url&quot;:&quot;..\\/__assets\\/T_text\\/43\\/Hp48UgxG4d.png&quot;},&quot;caption&quot;:&quot;\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a \\u0438\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u044f&quot;,&quot;withBorder&quot;:false,&quot;stretched&quot;:false,&quot;withBackground&quot;:false}},{&quot;id&quot;:&quot;wp4sDSvtop&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;DiBAMrMFaf&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.&amp;nbsp;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.</p><p style=\"text-align: \">Faucibus nisl tincidunt eget nullam non nisi. Pretium aenean pharetra magna ac placerat vestibulum. Tortor id aliquet lectus proin nibh nisl condimentum id. Sit amet porttitor eget dolor morbi non. Nulla facilisi cras fermentum odio eu feugiat. Aliquam nulla facilisi cras fermentum odio eu feugiat. Nisl condimentum id venenatis a condimentum vitae. Placerat duis ultricies lacus sed turpis tincidunt id. Diam quis enim lobortis scelerisque fermentum dui faucibus in. Suspendisse sed nisi lacus sed viverra tellus. Non nisi est sit amet facilisis magna etiam tempor. Porttitor lacus luctus accumsan tortor. Elementum eu facilisis sed odio morbi quis. Mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum. Sit amet justo donec enim diam vulputate ut. Vulputate mi sit amet mauris commodo quis imperdiet massa.</p><p style=\"text-align: \">Dui ut ornare lectus sit amet est placerat in egestas. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Commodo elit at imperdiet dui accumsan sit amet nulla. Fames ac turpis egestas integer eget aliquet nibh. Curabitur vitae nunc sed velit dignissim. Vitae congue eu consequat ac felis donec et odio pellentesque. Pellentesque sit amet porttitor eget dolor morbi. Porta lorem mollis aliquam ut porttitor. Pellentesque elit eget gravida cum sociis natoque penatibus et. Aliquet nibh praesent tristique magna sit amet purus. Nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Nisl suscipit adipiscing bibendum est ultricies integer. Sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Odio morbi quis commodo odio. Sed vulputate odio ut enim blandit volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Quis auctor elit sed vulputate mi sit amet mauris commodo. Quis hendrerit dolor magna eget est. Scelerisque viverra mauris in aliquam sem. Cursus metus aliquam eleifend mi in nulla.</p>\n            <figure>\n               <img \n                  src=\"../__assets/T_text/43/Hp48UgxG4d.png\" \n                  width=\"\"\n                  data-with-border=\"false\"\n                  data-with-background=\"false\" />\n               <figcaption>Заголовок изображения</figcaption>\n            </figure>\n            <p style=\"text-align: \">Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.</p><p style=\"text-align: \">Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.&nbsp;</p>'),
(44, '&quot;&quot;', ''),
(45, '{&quot;time&quot;:1642200035147,&quot;blocks&quot;:[{&quot;id&quot;:&quot;zLobPqR6BZ&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;koEK8PEh1g&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Faucibus nisl tincidunt eget nullam non nisi. Pretium aenean pharetra magna ac placerat vestibulum. Tortor id aliquet lectus proin nibh nisl condimentum id. Sit amet porttitor eget dolor morbi non. Nulla facilisi cras fermentum odio eu feugiat. Aliquam nulla facilisi cras fermentum odio eu feugiat. Nisl condimentum id venenatis a condimentum vitae. Placerat duis ultricies lacus sed turpis tincidunt id. Diam quis enim lobortis scelerisque fermentum dui faucibus in. Suspendisse sed nisi lacus sed viverra tellus. Non nisi est sit amet facilisis magna etiam tempor. Porttitor lacus luctus accumsan tortor. Elementum eu facilisis sed odio morbi quis. Mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum. Sit amet justo donec enim diam vulputate ut. Vulputate mi sit amet mauris commodo quis imperdiet massa.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;G-PZtXSPwl&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Dui ut ornare lectus sit amet est placerat in egestas. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Commodo elit at imperdiet dui accumsan sit amet nulla. Fames ac turpis egestas integer eget aliquet nibh. Curabitur vitae nunc sed velit dignissim. Vitae congue eu consequat ac felis donec et odio pellentesque. Pellentesque sit amet porttitor eget dolor morbi. Porta lorem mollis aliquam ut porttitor. Pellentesque elit eget gravida cum sociis natoque penatibus et. Aliquet nibh praesent tristique magna sit amet purus. Nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Nisl suscipit adipiscing bibendum est ultricies integer. Sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Odio morbi quis commodo odio. Sed vulputate odio ut enim blandit volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Quis auctor elit sed vulputate mi sit amet mauris commodo. Quis hendrerit dolor magna eget est. Scelerisque viverra mauris in aliquam sem. Cursus metus aliquam eleifend mi in nulla.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;Hp48UgxG4d&quot;,&quot;type&quot;:&quot;image&quot;,&quot;data&quot;:{&quot;file&quot;:{&quot;url&quot;:&quot;..\\/__assets\\/T_text\\/45\\/Hp48UgxG4d.png&quot;},&quot;caption&quot;:&quot;\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a \\u0438\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u044f&quot;,&quot;withBorder&quot;:false,&quot;stretched&quot;:false,&quot;withBackground&quot;:false}},{&quot;id&quot;:&quot;wp4sDSvtop&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;DiBAMrMFaf&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.&amp;nbsp;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.</p><p style=\"text-align: \">Faucibus nisl tincidunt eget nullam non nisi. Pretium aenean pharetra magna ac placerat vestibulum. Tortor id aliquet lectus proin nibh nisl condimentum id. Sit amet porttitor eget dolor morbi non. Nulla facilisi cras fermentum odio eu feugiat. Aliquam nulla facilisi cras fermentum odio eu feugiat. Nisl condimentum id venenatis a condimentum vitae. Placerat duis ultricies lacus sed turpis tincidunt id. Diam quis enim lobortis scelerisque fermentum dui faucibus in. Suspendisse sed nisi lacus sed viverra tellus. Non nisi est sit amet facilisis magna etiam tempor. Porttitor lacus luctus accumsan tortor. Elementum eu facilisis sed odio morbi quis. Mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum. Sit amet justo donec enim diam vulputate ut. Vulputate mi sit amet mauris commodo quis imperdiet massa.</p><p style=\"text-align: \">Dui ut ornare lectus sit amet est placerat in egestas. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Commodo elit at imperdiet dui accumsan sit amet nulla. Fames ac turpis egestas integer eget aliquet nibh. Curabitur vitae nunc sed velit dignissim. Vitae congue eu consequat ac felis donec et odio pellentesque. Pellentesque sit amet porttitor eget dolor morbi. Porta lorem mollis aliquam ut porttitor. Pellentesque elit eget gravida cum sociis natoque penatibus et. Aliquet nibh praesent tristique magna sit amet purus. Nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Nisl suscipit adipiscing bibendum est ultricies integer. Sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Odio morbi quis commodo odio. Sed vulputate odio ut enim blandit volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Quis auctor elit sed vulputate mi sit amet mauris commodo. Quis hendrerit dolor magna eget est. Scelerisque viverra mauris in aliquam sem. Cursus metus aliquam eleifend mi in nulla.</p>\n            <figure>\n               <img \n                  src=\"../__assets/T_text/45/Hp48UgxG4d.png\" \n                  width=\"\"\n                  data-with-border=\"false\"\n                  data-with-background=\"false\" />\n               <figcaption>Заголовок изображения</figcaption>\n            </figure>\n            <p style=\"text-align: \">Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.</p><p style=\"text-align: \">Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.&nbsp;</p>'),
(46, '&quot;&quot;', ''),
(47, '{&quot;time&quot;:1642200035147,&quot;blocks&quot;:[{&quot;id&quot;:&quot;zLobPqR6BZ&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;koEK8PEh1g&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Faucibus nisl tincidunt eget nullam non nisi. Pretium aenean pharetra magna ac placerat vestibulum. Tortor id aliquet lectus proin nibh nisl condimentum id. Sit amet porttitor eget dolor morbi non. Nulla facilisi cras fermentum odio eu feugiat. Aliquam nulla facilisi cras fermentum odio eu feugiat. Nisl condimentum id venenatis a condimentum vitae. Placerat duis ultricies lacus sed turpis tincidunt id. Diam quis enim lobortis scelerisque fermentum dui faucibus in. Suspendisse sed nisi lacus sed viverra tellus. Non nisi est sit amet facilisis magna etiam tempor. Porttitor lacus luctus accumsan tortor. Elementum eu facilisis sed odio morbi quis. Mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum. Sit amet justo donec enim diam vulputate ut. Vulputate mi sit amet mauris commodo quis imperdiet massa.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;G-PZtXSPwl&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Dui ut ornare lectus sit amet est placerat in egestas. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Commodo elit at imperdiet dui accumsan sit amet nulla. Fames ac turpis egestas integer eget aliquet nibh. Curabitur vitae nunc sed velit dignissim. Vitae congue eu consequat ac felis donec et odio pellentesque. Pellentesque sit amet porttitor eget dolor morbi. Porta lorem mollis aliquam ut porttitor. Pellentesque elit eget gravida cum sociis natoque penatibus et. Aliquet nibh praesent tristique magna sit amet purus. Nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Nisl suscipit adipiscing bibendum est ultricies integer. Sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Odio morbi quis commodo odio. Sed vulputate odio ut enim blandit volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Quis auctor elit sed vulputate mi sit amet mauris commodo. Quis hendrerit dolor magna eget est. Scelerisque viverra mauris in aliquam sem. Cursus metus aliquam eleifend mi in nulla.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;Hp48UgxG4d&quot;,&quot;type&quot;:&quot;image&quot;,&quot;data&quot;:{&quot;file&quot;:{&quot;url&quot;:&quot;..\\/__assets\\/T_text\\/47\\/Hp48UgxG4d.png&quot;},&quot;caption&quot;:&quot;\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a \\u0438\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u044f&quot;,&quot;withBorder&quot;:false,&quot;stretched&quot;:false,&quot;withBackground&quot;:false}},{&quot;id&quot;:&quot;wp4sDSvtop&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;DiBAMrMFaf&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.&amp;nbsp;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.</p><p style=\"text-align: \">Faucibus nisl tincidunt eget nullam non nisi. Pretium aenean pharetra magna ac placerat vestibulum. Tortor id aliquet lectus proin nibh nisl condimentum id. Sit amet porttitor eget dolor morbi non. Nulla facilisi cras fermentum odio eu feugiat. Aliquam nulla facilisi cras fermentum odio eu feugiat. Nisl condimentum id venenatis a condimentum vitae. Placerat duis ultricies lacus sed turpis tincidunt id. Diam quis enim lobortis scelerisque fermentum dui faucibus in. Suspendisse sed nisi lacus sed viverra tellus. Non nisi est sit amet facilisis magna etiam tempor. Porttitor lacus luctus accumsan tortor. Elementum eu facilisis sed odio morbi quis. Mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum. Sit amet justo donec enim diam vulputate ut. Vulputate mi sit amet mauris commodo quis imperdiet massa.</p><p style=\"text-align: \">Dui ut ornare lectus sit amet est placerat in egestas. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Commodo elit at imperdiet dui accumsan sit amet nulla. Fames ac turpis egestas integer eget aliquet nibh. Curabitur vitae nunc sed velit dignissim. Vitae congue eu consequat ac felis donec et odio pellentesque. Pellentesque sit amet porttitor eget dolor morbi. Porta lorem mollis aliquam ut porttitor. Pellentesque elit eget gravida cum sociis natoque penatibus et. Aliquet nibh praesent tristique magna sit amet purus. Nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Nisl suscipit adipiscing bibendum est ultricies integer. Sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Odio morbi quis commodo odio. Sed vulputate odio ut enim blandit volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Quis auctor elit sed vulputate mi sit amet mauris commodo. Quis hendrerit dolor magna eget est. Scelerisque viverra mauris in aliquam sem. Cursus metus aliquam eleifend mi in nulla.</p>\n            <figure>\n               <img \n                  src=\"../__assets/T_text/47/Hp48UgxG4d.png\" \n                  width=\"\"\n                  data-with-border=\"false\"\n                  data-with-background=\"false\" />\n               <figcaption>Заголовок изображения</figcaption>\n            </figure>\n            <p style=\"text-align: \">Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.</p><p style=\"text-align: \">Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.&nbsp;</p>'),
(48, '&quot;&quot;', '');
INSERT INTO `jf-cms_T_text` (`id_text`, `text_value`, `text_html`) VALUES
(49, '{&quot;time&quot;:1642200035147,&quot;blocks&quot;:[{&quot;id&quot;:&quot;zLobPqR6BZ&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;koEK8PEh1g&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Faucibus nisl tincidunt eget nullam non nisi. Pretium aenean pharetra magna ac placerat vestibulum. Tortor id aliquet lectus proin nibh nisl condimentum id. Sit amet porttitor eget dolor morbi non. Nulla facilisi cras fermentum odio eu feugiat. Aliquam nulla facilisi cras fermentum odio eu feugiat. Nisl condimentum id venenatis a condimentum vitae. Placerat duis ultricies lacus sed turpis tincidunt id. Diam quis enim lobortis scelerisque fermentum dui faucibus in. Suspendisse sed nisi lacus sed viverra tellus. Non nisi est sit amet facilisis magna etiam tempor. Porttitor lacus luctus accumsan tortor. Elementum eu facilisis sed odio morbi quis. Mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum. Sit amet justo donec enim diam vulputate ut. Vulputate mi sit amet mauris commodo quis imperdiet massa.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;G-PZtXSPwl&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Dui ut ornare lectus sit amet est placerat in egestas. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Commodo elit at imperdiet dui accumsan sit amet nulla. Fames ac turpis egestas integer eget aliquet nibh. Curabitur vitae nunc sed velit dignissim. Vitae congue eu consequat ac felis donec et odio pellentesque. Pellentesque sit amet porttitor eget dolor morbi. Porta lorem mollis aliquam ut porttitor. Pellentesque elit eget gravida cum sociis natoque penatibus et. Aliquet nibh praesent tristique magna sit amet purus. Nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Nisl suscipit adipiscing bibendum est ultricies integer. Sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Odio morbi quis commodo odio. Sed vulputate odio ut enim blandit volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Quis auctor elit sed vulputate mi sit amet mauris commodo. Quis hendrerit dolor magna eget est. Scelerisque viverra mauris in aliquam sem. Cursus metus aliquam eleifend mi in nulla.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;Hp48UgxG4d&quot;,&quot;type&quot;:&quot;image&quot;,&quot;data&quot;:{&quot;file&quot;:{&quot;url&quot;:&quot;..\\/__assets\\/T_text\\/49\\/Hp48UgxG4d.png&quot;},&quot;caption&quot;:&quot;\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a \\u0438\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u044f&quot;,&quot;withBorder&quot;:false,&quot;stretched&quot;:false,&quot;withBackground&quot;:false}},{&quot;id&quot;:&quot;wp4sDSvtop&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;DiBAMrMFaf&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.&amp;nbsp;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.</p><p style=\"text-align: \">Faucibus nisl tincidunt eget nullam non nisi. Pretium aenean pharetra magna ac placerat vestibulum. Tortor id aliquet lectus proin nibh nisl condimentum id. Sit amet porttitor eget dolor morbi non. Nulla facilisi cras fermentum odio eu feugiat. Aliquam nulla facilisi cras fermentum odio eu feugiat. Nisl condimentum id venenatis a condimentum vitae. Placerat duis ultricies lacus sed turpis tincidunt id. Diam quis enim lobortis scelerisque fermentum dui faucibus in. Suspendisse sed nisi lacus sed viverra tellus. Non nisi est sit amet facilisis magna etiam tempor. Porttitor lacus luctus accumsan tortor. Elementum eu facilisis sed odio morbi quis. Mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum. Sit amet justo donec enim diam vulputate ut. Vulputate mi sit amet mauris commodo quis imperdiet massa.</p><p style=\"text-align: \">Dui ut ornare lectus sit amet est placerat in egestas. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Commodo elit at imperdiet dui accumsan sit amet nulla. Fames ac turpis egestas integer eget aliquet nibh. Curabitur vitae nunc sed velit dignissim. Vitae congue eu consequat ac felis donec et odio pellentesque. Pellentesque sit amet porttitor eget dolor morbi. Porta lorem mollis aliquam ut porttitor. Pellentesque elit eget gravida cum sociis natoque penatibus et. Aliquet nibh praesent tristique magna sit amet purus. Nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Nisl suscipit adipiscing bibendum est ultricies integer. Sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Odio morbi quis commodo odio. Sed vulputate odio ut enim blandit volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Quis auctor elit sed vulputate mi sit amet mauris commodo. Quis hendrerit dolor magna eget est. Scelerisque viverra mauris in aliquam sem. Cursus metus aliquam eleifend mi in nulla.</p>\n            <figure>\n               <img \n                  src=\"../__assets/T_text/49/Hp48UgxG4d.png\" \n                  width=\"\"\n                  data-with-border=\"false\"\n                  data-with-background=\"false\" />\n               <figcaption>Заголовок изображения</figcaption>\n            </figure>\n            <p style=\"text-align: \">Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.</p><p style=\"text-align: \">Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.&nbsp;</p>'),
(50, '&quot;&quot;', ''),
(51, '{&quot;time&quot;:1642200035147,&quot;blocks&quot;:[{&quot;id&quot;:&quot;zLobPqR6BZ&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;koEK8PEh1g&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Faucibus nisl tincidunt eget nullam non nisi. Pretium aenean pharetra magna ac placerat vestibulum. Tortor id aliquet lectus proin nibh nisl condimentum id. Sit amet porttitor eget dolor morbi non. Nulla facilisi cras fermentum odio eu feugiat. Aliquam nulla facilisi cras fermentum odio eu feugiat. Nisl condimentum id venenatis a condimentum vitae. Placerat duis ultricies lacus sed turpis tincidunt id. Diam quis enim lobortis scelerisque fermentum dui faucibus in. Suspendisse sed nisi lacus sed viverra tellus. Non nisi est sit amet facilisis magna etiam tempor. Porttitor lacus luctus accumsan tortor. Elementum eu facilisis sed odio morbi quis. Mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum. Sit amet justo donec enim diam vulputate ut. Vulputate mi sit amet mauris commodo quis imperdiet massa.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;G-PZtXSPwl&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Dui ut ornare lectus sit amet est placerat in egestas. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Commodo elit at imperdiet dui accumsan sit amet nulla. Fames ac turpis egestas integer eget aliquet nibh. Curabitur vitae nunc sed velit dignissim. Vitae congue eu consequat ac felis donec et odio pellentesque. Pellentesque sit amet porttitor eget dolor morbi. Porta lorem mollis aliquam ut porttitor. Pellentesque elit eget gravida cum sociis natoque penatibus et. Aliquet nibh praesent tristique magna sit amet purus. Nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Nisl suscipit adipiscing bibendum est ultricies integer. Sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Odio morbi quis commodo odio. Sed vulputate odio ut enim blandit volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Quis auctor elit sed vulputate mi sit amet mauris commodo. Quis hendrerit dolor magna eget est. Scelerisque viverra mauris in aliquam sem. Cursus metus aliquam eleifend mi in nulla.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;Hp48UgxG4d&quot;,&quot;type&quot;:&quot;image&quot;,&quot;data&quot;:{&quot;file&quot;:{&quot;url&quot;:&quot;..\\/__assets\\/T_text\\/51\\/Hp48UgxG4d.png&quot;},&quot;caption&quot;:&quot;\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a \\u0438\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u044f&quot;,&quot;withBorder&quot;:false,&quot;stretched&quot;:false,&quot;withBackground&quot;:false}},{&quot;id&quot;:&quot;wp4sDSvtop&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;DiBAMrMFaf&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.&amp;nbsp;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.</p><p style=\"text-align: \">Faucibus nisl tincidunt eget nullam non nisi. Pretium aenean pharetra magna ac placerat vestibulum. Tortor id aliquet lectus proin nibh nisl condimentum id. Sit amet porttitor eget dolor morbi non. Nulla facilisi cras fermentum odio eu feugiat. Aliquam nulla facilisi cras fermentum odio eu feugiat. Nisl condimentum id venenatis a condimentum vitae. Placerat duis ultricies lacus sed turpis tincidunt id. Diam quis enim lobortis scelerisque fermentum dui faucibus in. Suspendisse sed nisi lacus sed viverra tellus. Non nisi est sit amet facilisis magna etiam tempor. Porttitor lacus luctus accumsan tortor. Elementum eu facilisis sed odio morbi quis. Mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum. Sit amet justo donec enim diam vulputate ut. Vulputate mi sit amet mauris commodo quis imperdiet massa.</p><p style=\"text-align: \">Dui ut ornare lectus sit amet est placerat in egestas. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Commodo elit at imperdiet dui accumsan sit amet nulla. Fames ac turpis egestas integer eget aliquet nibh. Curabitur vitae nunc sed velit dignissim. Vitae congue eu consequat ac felis donec et odio pellentesque. Pellentesque sit amet porttitor eget dolor morbi. Porta lorem mollis aliquam ut porttitor. Pellentesque elit eget gravida cum sociis natoque penatibus et. Aliquet nibh praesent tristique magna sit amet purus. Nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Nisl suscipit adipiscing bibendum est ultricies integer. Sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Odio morbi quis commodo odio. Sed vulputate odio ut enim blandit volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Quis auctor elit sed vulputate mi sit amet mauris commodo. Quis hendrerit dolor magna eget est. Scelerisque viverra mauris in aliquam sem. Cursus metus aliquam eleifend mi in nulla.</p>\n            <figure>\n               <img \n                  src=\"../__assets/T_text/51/Hp48UgxG4d.png\" \n                  width=\"\"\n                  data-with-border=\"false\"\n                  data-with-background=\"false\" />\n               <figcaption>Заголовок изображения</figcaption>\n            </figure>\n            <p style=\"text-align: \">Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.</p><p style=\"text-align: \">Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.&nbsp;</p>'),
(52, '&quot;&quot;', ''),
(53, '{&quot;time&quot;:1642200035147,&quot;blocks&quot;:[{&quot;id&quot;:&quot;zLobPqR6BZ&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;koEK8PEh1g&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Faucibus nisl tincidunt eget nullam non nisi. Pretium aenean pharetra magna ac placerat vestibulum. Tortor id aliquet lectus proin nibh nisl condimentum id. Sit amet porttitor eget dolor morbi non. Nulla facilisi cras fermentum odio eu feugiat. Aliquam nulla facilisi cras fermentum odio eu feugiat. Nisl condimentum id venenatis a condimentum vitae. Placerat duis ultricies lacus sed turpis tincidunt id. Diam quis enim lobortis scelerisque fermentum dui faucibus in. Suspendisse sed nisi lacus sed viverra tellus. Non nisi est sit amet facilisis magna etiam tempor. Porttitor lacus luctus accumsan tortor. Elementum eu facilisis sed odio morbi quis. Mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum. Sit amet justo donec enim diam vulputate ut. Vulputate mi sit amet mauris commodo quis imperdiet massa.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;G-PZtXSPwl&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Dui ut ornare lectus sit amet est placerat in egestas. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Commodo elit at imperdiet dui accumsan sit amet nulla. Fames ac turpis egestas integer eget aliquet nibh. Curabitur vitae nunc sed velit dignissim. Vitae congue eu consequat ac felis donec et odio pellentesque. Pellentesque sit amet porttitor eget dolor morbi. Porta lorem mollis aliquam ut porttitor. Pellentesque elit eget gravida cum sociis natoque penatibus et. Aliquet nibh praesent tristique magna sit amet purus. Nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Nisl suscipit adipiscing bibendum est ultricies integer. Sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Odio morbi quis commodo odio. Sed vulputate odio ut enim blandit volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Quis auctor elit sed vulputate mi sit amet mauris commodo. Quis hendrerit dolor magna eget est. Scelerisque viverra mauris in aliquam sem. Cursus metus aliquam eleifend mi in nulla.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;Hp48UgxG4d&quot;,&quot;type&quot;:&quot;image&quot;,&quot;data&quot;:{&quot;file&quot;:{&quot;url&quot;:&quot;..\\/__assets\\/T_text\\/53\\/Hp48UgxG4d.png&quot;},&quot;caption&quot;:&quot;\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a \\u0438\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u044f&quot;,&quot;withBorder&quot;:false,&quot;stretched&quot;:false,&quot;withBackground&quot;:false}},{&quot;id&quot;:&quot;wp4sDSvtop&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;DiBAMrMFaf&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.&amp;nbsp;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.</p><p style=\"text-align: \">Faucibus nisl tincidunt eget nullam non nisi. Pretium aenean pharetra magna ac placerat vestibulum. Tortor id aliquet lectus proin nibh nisl condimentum id. Sit amet porttitor eget dolor morbi non. Nulla facilisi cras fermentum odio eu feugiat. Aliquam nulla facilisi cras fermentum odio eu feugiat. Nisl condimentum id venenatis a condimentum vitae. Placerat duis ultricies lacus sed turpis tincidunt id. Diam quis enim lobortis scelerisque fermentum dui faucibus in. Suspendisse sed nisi lacus sed viverra tellus. Non nisi est sit amet facilisis magna etiam tempor. Porttitor lacus luctus accumsan tortor. Elementum eu facilisis sed odio morbi quis. Mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum. Sit amet justo donec enim diam vulputate ut. Vulputate mi sit amet mauris commodo quis imperdiet massa.</p><p style=\"text-align: \">Dui ut ornare lectus sit amet est placerat in egestas. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Commodo elit at imperdiet dui accumsan sit amet nulla. Fames ac turpis egestas integer eget aliquet nibh. Curabitur vitae nunc sed velit dignissim. Vitae congue eu consequat ac felis donec et odio pellentesque. Pellentesque sit amet porttitor eget dolor morbi. Porta lorem mollis aliquam ut porttitor. Pellentesque elit eget gravida cum sociis natoque penatibus et. Aliquet nibh praesent tristique magna sit amet purus. Nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Nisl suscipit adipiscing bibendum est ultricies integer. Sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Odio morbi quis commodo odio. Sed vulputate odio ut enim blandit volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Quis auctor elit sed vulputate mi sit amet mauris commodo. Quis hendrerit dolor magna eget est. Scelerisque viverra mauris in aliquam sem. Cursus metus aliquam eleifend mi in nulla.</p>\n            <figure>\n               <img \n                  src=\"../__assets/T_text/53/Hp48UgxG4d.png\" \n                  width=\"\"\n                  data-with-border=\"false\"\n                  data-with-background=\"false\" />\n               <figcaption>Заголовок изображения</figcaption>\n            </figure>\n            <p style=\"text-align: \">Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.</p><p style=\"text-align: \">Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.&nbsp;</p>'),
(54, '&quot;&quot;', ''),
(55, '{&quot;time&quot;:1642200035147,&quot;blocks&quot;:[{&quot;id&quot;:&quot;zLobPqR6BZ&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;koEK8PEh1g&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Faucibus nisl tincidunt eget nullam non nisi. Pretium aenean pharetra magna ac placerat vestibulum. Tortor id aliquet lectus proin nibh nisl condimentum id. Sit amet porttitor eget dolor morbi non. Nulla facilisi cras fermentum odio eu feugiat. Aliquam nulla facilisi cras fermentum odio eu feugiat. Nisl condimentum id venenatis a condimentum vitae. Placerat duis ultricies lacus sed turpis tincidunt id. Diam quis enim lobortis scelerisque fermentum dui faucibus in. Suspendisse sed nisi lacus sed viverra tellus. Non nisi est sit amet facilisis magna etiam tempor. Porttitor lacus luctus accumsan tortor. Elementum eu facilisis sed odio morbi quis. Mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum. Sit amet justo donec enim diam vulputate ut. Vulputate mi sit amet mauris commodo quis imperdiet massa.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;G-PZtXSPwl&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Dui ut ornare lectus sit amet est placerat in egestas. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Commodo elit at imperdiet dui accumsan sit amet nulla. Fames ac turpis egestas integer eget aliquet nibh. Curabitur vitae nunc sed velit dignissim. Vitae congue eu consequat ac felis donec et odio pellentesque. Pellentesque sit amet porttitor eget dolor morbi. Porta lorem mollis aliquam ut porttitor. Pellentesque elit eget gravida cum sociis natoque penatibus et. Aliquet nibh praesent tristique magna sit amet purus. Nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Nisl suscipit adipiscing bibendum est ultricies integer. Sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Odio morbi quis commodo odio. Sed vulputate odio ut enim blandit volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Quis auctor elit sed vulputate mi sit amet mauris commodo. Quis hendrerit dolor magna eget est. Scelerisque viverra mauris in aliquam sem. Cursus metus aliquam eleifend mi in nulla.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;Hp48UgxG4d&quot;,&quot;type&quot;:&quot;image&quot;,&quot;data&quot;:{&quot;file&quot;:{&quot;url&quot;:&quot;..\\/__assets\\/T_text\\/55\\/Hp48UgxG4d.png&quot;},&quot;caption&quot;:&quot;\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a \\u0438\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u044f&quot;,&quot;withBorder&quot;:false,&quot;stretched&quot;:false,&quot;withBackground&quot;:false}},{&quot;id&quot;:&quot;wp4sDSvtop&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;DiBAMrMFaf&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.&amp;nbsp;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.</p><p style=\"text-align: \">Faucibus nisl tincidunt eget nullam non nisi. Pretium aenean pharetra magna ac placerat vestibulum. Tortor id aliquet lectus proin nibh nisl condimentum id. Sit amet porttitor eget dolor morbi non. Nulla facilisi cras fermentum odio eu feugiat. Aliquam nulla facilisi cras fermentum odio eu feugiat. Nisl condimentum id venenatis a condimentum vitae. Placerat duis ultricies lacus sed turpis tincidunt id. Diam quis enim lobortis scelerisque fermentum dui faucibus in. Suspendisse sed nisi lacus sed viverra tellus. Non nisi est sit amet facilisis magna etiam tempor. Porttitor lacus luctus accumsan tortor. Elementum eu facilisis sed odio morbi quis. Mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum. Sit amet justo donec enim diam vulputate ut. Vulputate mi sit amet mauris commodo quis imperdiet massa.</p><p style=\"text-align: \">Dui ut ornare lectus sit amet est placerat in egestas. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Commodo elit at imperdiet dui accumsan sit amet nulla. Fames ac turpis egestas integer eget aliquet nibh. Curabitur vitae nunc sed velit dignissim. Vitae congue eu consequat ac felis donec et odio pellentesque. Pellentesque sit amet porttitor eget dolor morbi. Porta lorem mollis aliquam ut porttitor. Pellentesque elit eget gravida cum sociis natoque penatibus et. Aliquet nibh praesent tristique magna sit amet purus. Nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Nisl suscipit adipiscing bibendum est ultricies integer. Sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Odio morbi quis commodo odio. Sed vulputate odio ut enim blandit volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Quis auctor elit sed vulputate mi sit amet mauris commodo. Quis hendrerit dolor magna eget est. Scelerisque viverra mauris in aliquam sem. Cursus metus aliquam eleifend mi in nulla.</p>\n            <figure>\n               <img \n                  src=\"../__assets/T_text/55/Hp48UgxG4d.png\" \n                  width=\"\"\n                  data-with-border=\"false\"\n                  data-with-background=\"false\" />\n               <figcaption>Заголовок изображения</figcaption>\n            </figure>\n            <p style=\"text-align: \">Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.</p><p style=\"text-align: \">Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.&nbsp;</p>'),
(56, '&quot;&quot;', '');
INSERT INTO `jf-cms_T_text` (`id_text`, `text_value`, `text_html`) VALUES
(57, '{&quot;time&quot;:1642200035147,&quot;blocks&quot;:[{&quot;id&quot;:&quot;zLobPqR6BZ&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;koEK8PEh1g&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Faucibus nisl tincidunt eget nullam non nisi. Pretium aenean pharetra magna ac placerat vestibulum. Tortor id aliquet lectus proin nibh nisl condimentum id. Sit amet porttitor eget dolor morbi non. Nulla facilisi cras fermentum odio eu feugiat. Aliquam nulla facilisi cras fermentum odio eu feugiat. Nisl condimentum id venenatis a condimentum vitae. Placerat duis ultricies lacus sed turpis tincidunt id. Diam quis enim lobortis scelerisque fermentum dui faucibus in. Suspendisse sed nisi lacus sed viverra tellus. Non nisi est sit amet facilisis magna etiam tempor. Porttitor lacus luctus accumsan tortor. Elementum eu facilisis sed odio morbi quis. Mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum. Sit amet justo donec enim diam vulputate ut. Vulputate mi sit amet mauris commodo quis imperdiet massa.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;G-PZtXSPwl&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Dui ut ornare lectus sit amet est placerat in egestas. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Commodo elit at imperdiet dui accumsan sit amet nulla. Fames ac turpis egestas integer eget aliquet nibh. Curabitur vitae nunc sed velit dignissim. Vitae congue eu consequat ac felis donec et odio pellentesque. Pellentesque sit amet porttitor eget dolor morbi. Porta lorem mollis aliquam ut porttitor. Pellentesque elit eget gravida cum sociis natoque penatibus et. Aliquet nibh praesent tristique magna sit amet purus. Nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Nisl suscipit adipiscing bibendum est ultricies integer. Sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Odio morbi quis commodo odio. Sed vulputate odio ut enim blandit volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Quis auctor elit sed vulputate mi sit amet mauris commodo. Quis hendrerit dolor magna eget est. Scelerisque viverra mauris in aliquam sem. Cursus metus aliquam eleifend mi in nulla.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;Hp48UgxG4d&quot;,&quot;type&quot;:&quot;image&quot;,&quot;data&quot;:{&quot;file&quot;:{&quot;url&quot;:&quot;..\\/__assets\\/T_text\\/57\\/Hp48UgxG4d.png&quot;},&quot;caption&quot;:&quot;\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a \\u0438\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u044f&quot;,&quot;withBorder&quot;:false,&quot;stretched&quot;:false,&quot;withBackground&quot;:false}},{&quot;id&quot;:&quot;wp4sDSvtop&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;DiBAMrMFaf&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.&amp;nbsp;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.</p><p style=\"text-align: \">Faucibus nisl tincidunt eget nullam non nisi. Pretium aenean pharetra magna ac placerat vestibulum. Tortor id aliquet lectus proin nibh nisl condimentum id. Sit amet porttitor eget dolor morbi non. Nulla facilisi cras fermentum odio eu feugiat. Aliquam nulla facilisi cras fermentum odio eu feugiat. Nisl condimentum id venenatis a condimentum vitae. Placerat duis ultricies lacus sed turpis tincidunt id. Diam quis enim lobortis scelerisque fermentum dui faucibus in. Suspendisse sed nisi lacus sed viverra tellus. Non nisi est sit amet facilisis magna etiam tempor. Porttitor lacus luctus accumsan tortor. Elementum eu facilisis sed odio morbi quis. Mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum. Sit amet justo donec enim diam vulputate ut. Vulputate mi sit amet mauris commodo quis imperdiet massa.</p><p style=\"text-align: \">Dui ut ornare lectus sit amet est placerat in egestas. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Commodo elit at imperdiet dui accumsan sit amet nulla. Fames ac turpis egestas integer eget aliquet nibh. Curabitur vitae nunc sed velit dignissim. Vitae congue eu consequat ac felis donec et odio pellentesque. Pellentesque sit amet porttitor eget dolor morbi. Porta lorem mollis aliquam ut porttitor. Pellentesque elit eget gravida cum sociis natoque penatibus et. Aliquet nibh praesent tristique magna sit amet purus. Nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Nisl suscipit adipiscing bibendum est ultricies integer. Sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Odio morbi quis commodo odio. Sed vulputate odio ut enim blandit volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Quis auctor elit sed vulputate mi sit amet mauris commodo. Quis hendrerit dolor magna eget est. Scelerisque viverra mauris in aliquam sem. Cursus metus aliquam eleifend mi in nulla.</p>\n            <figure>\n               <img \n                  src=\"../__assets/T_text/57/Hp48UgxG4d.png\" \n                  width=\"\"\n                  data-with-border=\"false\"\n                  data-with-background=\"false\" />\n               <figcaption>Заголовок изображения</figcaption>\n            </figure>\n            <p style=\"text-align: \">Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.</p><p style=\"text-align: \">Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.&nbsp;</p>'),
(58, '&quot;&quot;', ''),
(59, '{&quot;time&quot;:1642200035147,&quot;blocks&quot;:[{&quot;id&quot;:&quot;zLobPqR6BZ&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;koEK8PEh1g&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Faucibus nisl tincidunt eget nullam non nisi. Pretium aenean pharetra magna ac placerat vestibulum. Tortor id aliquet lectus proin nibh nisl condimentum id. Sit amet porttitor eget dolor morbi non. Nulla facilisi cras fermentum odio eu feugiat. Aliquam nulla facilisi cras fermentum odio eu feugiat. Nisl condimentum id venenatis a condimentum vitae. Placerat duis ultricies lacus sed turpis tincidunt id. Diam quis enim lobortis scelerisque fermentum dui faucibus in. Suspendisse sed nisi lacus sed viverra tellus. Non nisi est sit amet facilisis magna etiam tempor. Porttitor lacus luctus accumsan tortor. Elementum eu facilisis sed odio morbi quis. Mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum. Sit amet justo donec enim diam vulputate ut. Vulputate mi sit amet mauris commodo quis imperdiet massa.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;G-PZtXSPwl&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Dui ut ornare lectus sit amet est placerat in egestas. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Commodo elit at imperdiet dui accumsan sit amet nulla. Fames ac turpis egestas integer eget aliquet nibh. Curabitur vitae nunc sed velit dignissim. Vitae congue eu consequat ac felis donec et odio pellentesque. Pellentesque sit amet porttitor eget dolor morbi. Porta lorem mollis aliquam ut porttitor. Pellentesque elit eget gravida cum sociis natoque penatibus et. Aliquet nibh praesent tristique magna sit amet purus. Nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Nisl suscipit adipiscing bibendum est ultricies integer. Sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Odio morbi quis commodo odio. Sed vulputate odio ut enim blandit volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Quis auctor elit sed vulputate mi sit amet mauris commodo. Quis hendrerit dolor magna eget est. Scelerisque viverra mauris in aliquam sem. Cursus metus aliquam eleifend mi in nulla.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;Hp48UgxG4d&quot;,&quot;type&quot;:&quot;image&quot;,&quot;data&quot;:{&quot;file&quot;:{&quot;url&quot;:&quot;..\\/__assets\\/T_text\\/59\\/Hp48UgxG4d.png&quot;},&quot;caption&quot;:&quot;\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a \\u0438\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u044f&quot;,&quot;withBorder&quot;:false,&quot;stretched&quot;:false,&quot;withBackground&quot;:false}},{&quot;id&quot;:&quot;wp4sDSvtop&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;DiBAMrMFaf&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.&amp;nbsp;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.</p><p style=\"text-align: \">Faucibus nisl tincidunt eget nullam non nisi. Pretium aenean pharetra magna ac placerat vestibulum. Tortor id aliquet lectus proin nibh nisl condimentum id. Sit amet porttitor eget dolor morbi non. Nulla facilisi cras fermentum odio eu feugiat. Aliquam nulla facilisi cras fermentum odio eu feugiat. Nisl condimentum id venenatis a condimentum vitae. Placerat duis ultricies lacus sed turpis tincidunt id. Diam quis enim lobortis scelerisque fermentum dui faucibus in. Suspendisse sed nisi lacus sed viverra tellus. Non nisi est sit amet facilisis magna etiam tempor. Porttitor lacus luctus accumsan tortor. Elementum eu facilisis sed odio morbi quis. Mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum. Sit amet justo donec enim diam vulputate ut. Vulputate mi sit amet mauris commodo quis imperdiet massa.</p><p style=\"text-align: \">Dui ut ornare lectus sit amet est placerat in egestas. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Commodo elit at imperdiet dui accumsan sit amet nulla. Fames ac turpis egestas integer eget aliquet nibh. Curabitur vitae nunc sed velit dignissim. Vitae congue eu consequat ac felis donec et odio pellentesque. Pellentesque sit amet porttitor eget dolor morbi. Porta lorem mollis aliquam ut porttitor. Pellentesque elit eget gravida cum sociis natoque penatibus et. Aliquet nibh praesent tristique magna sit amet purus. Nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Nisl suscipit adipiscing bibendum est ultricies integer. Sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Odio morbi quis commodo odio. Sed vulputate odio ut enim blandit volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Quis auctor elit sed vulputate mi sit amet mauris commodo. Quis hendrerit dolor magna eget est. Scelerisque viverra mauris in aliquam sem. Cursus metus aliquam eleifend mi in nulla.</p>\n            <figure>\n               <img \n                  src=\"../__assets/T_text/59/Hp48UgxG4d.png\" \n                  width=\"\"\n                  data-with-border=\"false\"\n                  data-with-background=\"false\" />\n               <figcaption>Заголовок изображения</figcaption>\n            </figure>\n            <p style=\"text-align: \">Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.</p><p style=\"text-align: \">Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.&nbsp;</p>'),
(60, '{&quot;time&quot;:1644173421190,&quot;blocks&quot;:[{&quot;id&quot;:&quot;RTJgbULmzd&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;AzYCf2GWTy&quot;,&quot;type&quot;:&quot;image&quot;,&quot;data&quot;:{&quot;file&quot;:{&quot;url&quot;:&quot;..\\/__assets\\/T_text\\/60\\/AzYCf2GWTy.png&quot;},&quot;caption&quot;:&quot;\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a \\u043a\\u0430\\u0440\\u0442\\u0438\\u043d\\u043a\\u0438&quot;,&quot;withBorder&quot;:false,&quot;stretched&quot;:false,&quot;withBackground&quot;:false}},{&quot;id&quot;:&quot;pcIg2VW2rk&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;xIvgavP6eO&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.</p>\n            <figure class=\"figure_no-caption\">\n               <img \n                  src=\"../__assets/T_text/60/AzYCf2GWTy.png\" \n                  width=\"\"\n                  data-with-border=\"false\"\n                  data-with-background=\"false\" />\n               <figcaption>Заголовок картинки</figcaption>\n            </figure>\n            <p style=\"text-align: \">Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.</p><p style=\"text-align: \">Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.</p>'),
(61, '{&quot;time&quot;:1642171630789,&quot;blocks&quot;:[{&quot;id&quot;:&quot;VRvKTRTb1K&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor</p>'),
(63, '{&quot;time&quot;:1642171630789,&quot;blocks&quot;:[{&quot;id&quot;:&quot;VRvKTRTb1K&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor</p>'),
(64, '{&quot;time&quot;:1642276475185,&quot;blocks&quot;:[{&quot;id&quot;:&quot;RTJgbULmzd&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;IfHSTMm76m&quot;,&quot;type&quot;:&quot;image&quot;,&quot;data&quot;:{&quot;file&quot;:{&quot;url&quot;:&quot;..\\/__assets\\/T_text\\/64\\/IfHSTMm76m.jpeg&quot;},&quot;caption&quot;:&quot;&quot;,&quot;withBorder&quot;:false,&quot;stretched&quot;:false,&quot;withBackground&quot;:false}},{&quot;id&quot;:&quot;pcIg2VW2rk&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;xIvgavP6eO&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.</p>\n            <figure class=\"figure_no-caption\">\n               <img \n                  src=\"../__assets/T_text/64/IfHSTMm76m.jpeg\" \n                  width=\"\"\n                  data-with-border=\"false\"\n                  data-with-background=\"false\" />\n               <figcaption></figcaption>\n            </figure>\n            <p style=\"text-align: \">Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.</p><p style=\"text-align: \">Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.</p>'),
(65, '{&quot;time&quot;:1644269073468,&quot;blocks&quot;:[{&quot;id&quot;:&quot;lUkNvf6dKY&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.</p>'),
(66, '{&quot;time&quot;:1642171630789,&quot;blocks&quot;:[{&quot;id&quot;:&quot;VRvKTRTb1K&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor</p>'),
(67, '{&quot;time&quot;:1642276135915,&quot;blocks&quot;:[{&quot;id&quot;:&quot;RTJgbULmzd&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.&amp;nbsp;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;iLfaYp6WkQ&quot;,&quot;type&quot;:&quot;image&quot;,&quot;data&quot;:{&quot;file&quot;:{&quot;url&quot;:&quot;..\\/__assets\\/T_text\\/67\\/iLfaYp6WkQ.jpeg&quot;},&quot;caption&quot;:&quot;&quot;,&quot;withBorder&quot;:false,&quot;stretched&quot;:false,&quot;withBackground&quot;:false}},{&quot;id&quot;:&quot;pcIg2VW2rk&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;xIvgavP6eO&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.&nbsp;</p>\n            <figure class=\"figure_no-caption\">\n               <img \n                  src=\"../__assets/T_text/67/iLfaYp6WkQ.jpeg\" \n                  width=\"\"\n                  data-with-border=\"false\"\n                  data-with-background=\"false\" />\n               <figcaption></figcaption>\n            </figure>\n            <p style=\"text-align: \">Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.</p><p style=\"text-align: \">Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.</p>'),
(68, '{&quot;time&quot;:1642171630789,&quot;blocks&quot;:[{&quot;id&quot;:&quot;VRvKTRTb1K&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor</p>');
INSERT INTO `jf-cms_T_text` (`id_text`, `text_value`, `text_html`) VALUES
(69, '{&quot;time&quot;:1642276073798,&quot;blocks&quot;:[{&quot;id&quot;:&quot;RTJgbULmzd&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;3uOg4WYtdt&quot;,&quot;type&quot;:&quot;image&quot;,&quot;data&quot;:{&quot;file&quot;:{&quot;url&quot;:&quot;..\\/__assets\\/T_text\\/69\\/3uOg4WYtdt.jpg&quot;},&quot;caption&quot;:&quot;\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a \\u043a\\u0430\\u0440\\u0442\\u0438\\u043d\\u043a\\u0438&quot;,&quot;withBorder&quot;:false,&quot;stretched&quot;:false,&quot;withBackground&quot;:false}},{&quot;id&quot;:&quot;pcIg2VW2rk&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;xIvgavP6eO&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.</p>\n            <figure>\n               <img \n                  src=\"../__assets/T_text/69/3uOg4WYtdt.jpg\" \n                  width=\"\"\n                  data-with-border=\"false\"\n                  data-with-background=\"false\" />\n               <figcaption>Заголовок картинки</figcaption>\n            </figure>\n            <p style=\"text-align: \">Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.</p><p style=\"text-align: \">Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.</p>'),
(70, '{&quot;time&quot;:1642334569992,&quot;blocks&quot;:[{&quot;id&quot;:&quot;SFZeJ-pSNx&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lacus in iaculis ut ut facilisi suspendisse pharetra. Scelerisque convallis ac tellus felis mauris egestas amet, aenean urna. Scelerisque egestas sed cursus at felis urna nullam. Orci neque ultrices pretium est et lectus enim vitae pellentesque.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;F28ckRlh8E&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Augue cursus massa gravida et non risus tellus hac risus. Consectetur varius integer sed at pulvinar id nunc. Pulvinar laoreet neque vulputate ultricies felis.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;AeOUUNrL5T&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Pellentesque pellentesque mattis morbi odio turpis nam. Tellus interdum scelerisque.&amp;nbsp;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \">Lacus in iaculis ut ut facilisi suspendisse pharetra. Scelerisque convallis ac tellus felis mauris egestas amet, aenean urna. Scelerisque egestas sed cursus at felis urna nullam. Orci neque ultrices pretium est et lectus enim vitae pellentesque.</p><p style=\"text-align: \">Augue cursus massa gravida et non risus tellus hac risus. Consectetur varius integer sed at pulvinar id nunc. Pulvinar laoreet neque vulputate ultricies felis.</p><p style=\"text-align: \">Pellentesque pellentesque mattis morbi odio turpis nam. Tellus interdum scelerisque.&nbsp;</p>'),
(71, '{&quot;time&quot;:1675454665365,&quot;blocks&quot;:[{&quot;id&quot;:&quot;Hp48UgxG4d&quot;,&quot;type&quot;:&quot;image&quot;,&quot;data&quot;:{&quot;file&quot;:{&quot;url&quot;:&quot;..\\/__assets\\/T_text\\/71\\/Hp48UgxG4d.png&quot;},&quot;caption&quot;:&quot;\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a \\u0438\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u044f&quot;,&quot;withBorder&quot;:false,&quot;stretched&quot;:false,&quot;withBackground&quot;:false}}],&quot;version&quot;:&quot;2.22.2&quot;}', '\n            <figure class=\"figure_no-caption\">\n               <img \n                  src=\"../__assets/T_text/71/Hp48UgxG4d.png\" \n                  width=\"\"\n                  data-with-border=\"false\"\n                  data-with-background=\"false\" />\n               <figcaption>Заголовок изображения</figcaption>\n            </figure>\n            '),
(72, '{&quot;time&quot;:1642334569992,&quot;blocks&quot;:[{&quot;id&quot;:&quot;SFZeJ-pSNx&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lacus in iaculis ut ut facilisi suspendisse pharetra. Scelerisque convallis ac tellus felis mauris egestas amet, aenean urna. Scelerisque egestas sed cursus at felis urna nullam. Orci neque ultrices pretium est et lectus enim vitae pellentesque.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;F28ckRlh8E&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Augue cursus massa gravida et non risus tellus hac risus. Consectetur varius integer sed at pulvinar id nunc. Pulvinar laoreet neque vulputate ultricies felis.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;AeOUUNrL5T&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Pellentesque pellentesque mattis morbi odio turpis nam. Tellus interdum scelerisque.&amp;nbsp;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \">Lacus in iaculis ut ut facilisi suspendisse pharetra. Scelerisque convallis ac tellus felis mauris egestas amet, aenean urna. Scelerisque egestas sed cursus at felis urna nullam. Orci neque ultrices pretium est et lectus enim vitae pellentesque.</p><p style=\"text-align: \">Augue cursus massa gravida et non risus tellus hac risus. Consectetur varius integer sed at pulvinar id nunc. Pulvinar laoreet neque vulputate ultricies felis.</p><p style=\"text-align: \">Pellentesque pellentesque mattis morbi odio turpis nam. Tellus interdum scelerisque.&nbsp;</p>'),
(73, '{&quot;time&quot;:1642200035147,&quot;blocks&quot;:[{&quot;id&quot;:&quot;zLobPqR6BZ&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;koEK8PEh1g&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Faucibus nisl tincidunt eget nullam non nisi. Pretium aenean pharetra magna ac placerat vestibulum. Tortor id aliquet lectus proin nibh nisl condimentum id. Sit amet porttitor eget dolor morbi non. Nulla facilisi cras fermentum odio eu feugiat. Aliquam nulla facilisi cras fermentum odio eu feugiat. Nisl condimentum id venenatis a condimentum vitae. Placerat duis ultricies lacus sed turpis tincidunt id. Diam quis enim lobortis scelerisque fermentum dui faucibus in. Suspendisse sed nisi lacus sed viverra tellus. Non nisi est sit amet facilisis magna etiam tempor. Porttitor lacus luctus accumsan tortor. Elementum eu facilisis sed odio morbi quis. Mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum. Sit amet justo donec enim diam vulputate ut. Vulputate mi sit amet mauris commodo quis imperdiet massa.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;G-PZtXSPwl&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Dui ut ornare lectus sit amet est placerat in egestas. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Commodo elit at imperdiet dui accumsan sit amet nulla. Fames ac turpis egestas integer eget aliquet nibh. Curabitur vitae nunc sed velit dignissim. Vitae congue eu consequat ac felis donec et odio pellentesque. Pellentesque sit amet porttitor eget dolor morbi. Porta lorem mollis aliquam ut porttitor. Pellentesque elit eget gravida cum sociis natoque penatibus et. Aliquet nibh praesent tristique magna sit amet purus. Nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Nisl suscipit adipiscing bibendum est ultricies integer. Sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Odio morbi quis commodo odio. Sed vulputate odio ut enim blandit volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Quis auctor elit sed vulputate mi sit amet mauris commodo. Quis hendrerit dolor magna eget est. Scelerisque viverra mauris in aliquam sem. Cursus metus aliquam eleifend mi in nulla.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;Hp48UgxG4d&quot;,&quot;type&quot;:&quot;image&quot;,&quot;data&quot;:{&quot;file&quot;:{&quot;url&quot;:&quot;..\\/__assets\\/T_text\\/73\\/Hp48UgxG4d.png&quot;},&quot;caption&quot;:&quot;\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a \\u0438\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u044f&quot;,&quot;withBorder&quot;:false,&quot;stretched&quot;:false,&quot;withBackground&quot;:false}},{&quot;id&quot;:&quot;wp4sDSvtop&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;DiBAMrMFaf&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.&amp;nbsp;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.</p><p style=\"text-align: \">Faucibus nisl tincidunt eget nullam non nisi. Pretium aenean pharetra magna ac placerat vestibulum. Tortor id aliquet lectus proin nibh nisl condimentum id. Sit amet porttitor eget dolor morbi non. Nulla facilisi cras fermentum odio eu feugiat. Aliquam nulla facilisi cras fermentum odio eu feugiat. Nisl condimentum id venenatis a condimentum vitae. Placerat duis ultricies lacus sed turpis tincidunt id. Diam quis enim lobortis scelerisque fermentum dui faucibus in. Suspendisse sed nisi lacus sed viverra tellus. Non nisi est sit amet facilisis magna etiam tempor. Porttitor lacus luctus accumsan tortor. Elementum eu facilisis sed odio morbi quis. Mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum. Sit amet justo donec enim diam vulputate ut. Vulputate mi sit amet mauris commodo quis imperdiet massa.</p><p style=\"text-align: \">Dui ut ornare lectus sit amet est placerat in egestas. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Commodo elit at imperdiet dui accumsan sit amet nulla. Fames ac turpis egestas integer eget aliquet nibh. Curabitur vitae nunc sed velit dignissim. Vitae congue eu consequat ac felis donec et odio pellentesque. Pellentesque sit amet porttitor eget dolor morbi. Porta lorem mollis aliquam ut porttitor. Pellentesque elit eget gravida cum sociis natoque penatibus et. Aliquet nibh praesent tristique magna sit amet purus. Nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Nisl suscipit adipiscing bibendum est ultricies integer. Sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Odio morbi quis commodo odio. Sed vulputate odio ut enim blandit volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Quis auctor elit sed vulputate mi sit amet mauris commodo. Quis hendrerit dolor magna eget est. Scelerisque viverra mauris in aliquam sem. Cursus metus aliquam eleifend mi in nulla.</p>\n            <figure>\n               <img \n                  src=\"../__assets/T_text/73/Hp48UgxG4d.png\" \n                  width=\"\"\n                  data-with-border=\"false\"\n                  data-with-background=\"false\" />\n               <figcaption>Заголовок изображения</figcaption>\n            </figure>\n            <p style=\"text-align: \">Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.</p><p style=\"text-align: \">Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.&nbsp;</p>'),
(74, '{&quot;time&quot;:1642334569992,&quot;blocks&quot;:[{&quot;id&quot;:&quot;SFZeJ-pSNx&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lacus in iaculis ut ut facilisi suspendisse pharetra. Scelerisque convallis ac tellus felis mauris egestas amet, aenean urna. Scelerisque egestas sed cursus at felis urna nullam. Orci neque ultrices pretium est et lectus enim vitae pellentesque.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;F28ckRlh8E&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Augue cursus massa gravida et non risus tellus hac risus. Consectetur varius integer sed at pulvinar id nunc. Pulvinar laoreet neque vulputate ultricies felis.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;AeOUUNrL5T&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Pellentesque pellentesque mattis morbi odio turpis nam. Tellus interdum scelerisque.&amp;nbsp;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \">Lacus in iaculis ut ut facilisi suspendisse pharetra. Scelerisque convallis ac tellus felis mauris egestas amet, aenean urna. Scelerisque egestas sed cursus at felis urna nullam. Orci neque ultrices pretium est et lectus enim vitae pellentesque.</p><p style=\"text-align: \">Augue cursus massa gravida et non risus tellus hac risus. Consectetur varius integer sed at pulvinar id nunc. Pulvinar laoreet neque vulputate ultricies felis.</p><p style=\"text-align: \">Pellentesque pellentesque mattis morbi odio turpis nam. Tellus interdum scelerisque.&nbsp;</p>'),
(75, '{&quot;time&quot;:1642200035147,&quot;blocks&quot;:[{&quot;id&quot;:&quot;zLobPqR6BZ&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;koEK8PEh1g&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Faucibus nisl tincidunt eget nullam non nisi. Pretium aenean pharetra magna ac placerat vestibulum. Tortor id aliquet lectus proin nibh nisl condimentum id. Sit amet porttitor eget dolor morbi non. Nulla facilisi cras fermentum odio eu feugiat. Aliquam nulla facilisi cras fermentum odio eu feugiat. Nisl condimentum id venenatis a condimentum vitae. Placerat duis ultricies lacus sed turpis tincidunt id. Diam quis enim lobortis scelerisque fermentum dui faucibus in. Suspendisse sed nisi lacus sed viverra tellus. Non nisi est sit amet facilisis magna etiam tempor. Porttitor lacus luctus accumsan tortor. Elementum eu facilisis sed odio morbi quis. Mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum. Sit amet justo donec enim diam vulputate ut. Vulputate mi sit amet mauris commodo quis imperdiet massa.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;G-PZtXSPwl&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Dui ut ornare lectus sit amet est placerat in egestas. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Commodo elit at imperdiet dui accumsan sit amet nulla. Fames ac turpis egestas integer eget aliquet nibh. Curabitur vitae nunc sed velit dignissim. Vitae congue eu consequat ac felis donec et odio pellentesque. Pellentesque sit amet porttitor eget dolor morbi. Porta lorem mollis aliquam ut porttitor. Pellentesque elit eget gravida cum sociis natoque penatibus et. Aliquet nibh praesent tristique magna sit amet purus. Nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Nisl suscipit adipiscing bibendum est ultricies integer. Sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Odio morbi quis commodo odio. Sed vulputate odio ut enim blandit volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Quis auctor elit sed vulputate mi sit amet mauris commodo. Quis hendrerit dolor magna eget est. Scelerisque viverra mauris in aliquam sem. Cursus metus aliquam eleifend mi in nulla.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;Hp48UgxG4d&quot;,&quot;type&quot;:&quot;image&quot;,&quot;data&quot;:{&quot;file&quot;:{&quot;url&quot;:&quot;..\\/__assets\\/T_text\\/75\\/Hp48UgxG4d.png&quot;},&quot;caption&quot;:&quot;\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a \\u0438\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u044f&quot;,&quot;withBorder&quot;:false,&quot;stretched&quot;:false,&quot;withBackground&quot;:false}},{&quot;id&quot;:&quot;wp4sDSvtop&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;DiBAMrMFaf&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.&amp;nbsp;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.</p><p style=\"text-align: \">Faucibus nisl tincidunt eget nullam non nisi. Pretium aenean pharetra magna ac placerat vestibulum. Tortor id aliquet lectus proin nibh nisl condimentum id. Sit amet porttitor eget dolor morbi non. Nulla facilisi cras fermentum odio eu feugiat. Aliquam nulla facilisi cras fermentum odio eu feugiat. Nisl condimentum id venenatis a condimentum vitae. Placerat duis ultricies lacus sed turpis tincidunt id. Diam quis enim lobortis scelerisque fermentum dui faucibus in. Suspendisse sed nisi lacus sed viverra tellus. Non nisi est sit amet facilisis magna etiam tempor. Porttitor lacus luctus accumsan tortor. Elementum eu facilisis sed odio morbi quis. Mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum. Sit amet justo donec enim diam vulputate ut. Vulputate mi sit amet mauris commodo quis imperdiet massa.</p><p style=\"text-align: \">Dui ut ornare lectus sit amet est placerat in egestas. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Commodo elit at imperdiet dui accumsan sit amet nulla. Fames ac turpis egestas integer eget aliquet nibh. Curabitur vitae nunc sed velit dignissim. Vitae congue eu consequat ac felis donec et odio pellentesque. Pellentesque sit amet porttitor eget dolor morbi. Porta lorem mollis aliquam ut porttitor. Pellentesque elit eget gravida cum sociis natoque penatibus et. Aliquet nibh praesent tristique magna sit amet purus. Nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Nisl suscipit adipiscing bibendum est ultricies integer. Sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Odio morbi quis commodo odio. Sed vulputate odio ut enim blandit volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Quis auctor elit sed vulputate mi sit amet mauris commodo. Quis hendrerit dolor magna eget est. Scelerisque viverra mauris in aliquam sem. Cursus metus aliquam eleifend mi in nulla.</p>\n            <figure>\n               <img \n                  src=\"../__assets/T_text/75/Hp48UgxG4d.png\" \n                  width=\"\"\n                  data-with-border=\"false\"\n                  data-with-background=\"false\" />\n               <figcaption>Заголовок изображения</figcaption>\n            </figure>\n            <p style=\"text-align: \">Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.</p><p style=\"text-align: \">Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.&nbsp;</p>'),
(76, '{&quot;time&quot;:1642334569992,&quot;blocks&quot;:[{&quot;id&quot;:&quot;SFZeJ-pSNx&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lacus in iaculis ut ut facilisi suspendisse pharetra. Scelerisque convallis ac tellus felis mauris egestas amet, aenean urna. Scelerisque egestas sed cursus at felis urna nullam. Orci neque ultrices pretium est et lectus enim vitae pellentesque.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;F28ckRlh8E&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Augue cursus massa gravida et non risus tellus hac risus. Consectetur varius integer sed at pulvinar id nunc. Pulvinar laoreet neque vulputate ultricies felis.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;AeOUUNrL5T&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Pellentesque pellentesque mattis morbi odio turpis nam. Tellus interdum scelerisque.&amp;nbsp;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \">Lacus in iaculis ut ut facilisi suspendisse pharetra. Scelerisque convallis ac tellus felis mauris egestas amet, aenean urna. Scelerisque egestas sed cursus at felis urna nullam. Orci neque ultrices pretium est et lectus enim vitae pellentesque.</p><p style=\"text-align: \">Augue cursus massa gravida et non risus tellus hac risus. Consectetur varius integer sed at pulvinar id nunc. Pulvinar laoreet neque vulputate ultricies felis.</p><p style=\"text-align: \">Pellentesque pellentesque mattis morbi odio turpis nam. Tellus interdum scelerisque.&nbsp;</p>'),
(77, '{&quot;time&quot;:1644259444591,&quot;blocks&quot;:[{&quot;id&quot;:&quot;zLobPqR6BZ&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;koEK8PEh1g&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Faucibus nisl tincidunt eget nullam non nisi. Pretium aenean pharetra magna ac placerat vestibulum. Tortor id aliquet lectus proin nibh nisl condimentum id. Sit amet porttitor eget dolor morbi non. Nulla facilisi cras fermentum odio eu feugiat. Aliquam nulla facilisi cras fermentum odio eu feugiat. Nisl condimentum id venenatis a condimentum vitae. Placerat duis ultricies lacus sed turpis tincidunt id. Diam quis enim lobortis scelerisque fermentum dui faucibus in. Suspendisse sed nisi lacus sed viverra tellus. Non nisi est sit amet facilisis magna etiam tempor. Porttitor lacus luctus accumsan tortor. Elementum eu facilisis sed odio morbi quis. Mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum. Sit amet justo donec enim diam vulputate ut. Vulputate mi sit amet mauris commodo quis imperdiet massa.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;G-PZtXSPwl&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Dui ut ornare lectus sit amet est placerat in egestas. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Commodo elit at imperdiet dui accumsan sit amet nulla. Fames ac turpis egestas integer eget aliquet nibh. Curabitur vitae nunc sed velit dignissim. Vitae congue eu consequat ac felis donec et odio pellentesque. Pellentesque sit amet porttitor eget dolor morbi. Porta lorem mollis aliquam ut porttitor. Pellentesque elit eget gravida cum sociis natoque penatibus et. Aliquet nibh praesent tristique magna sit amet purus. Nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Nisl suscipit adipiscing bibendum est ultricies integer. Sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Odio morbi quis commodo odio. Sed vulputate odio ut enim blandit volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Quis auctor elit sed vulputate mi sit amet mauris commodo. Quis hendrerit dolor magna eget est. Scelerisque viverra mauris in aliquam sem. Cursus metus aliquam eleifend mi in nulla.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;Hp48UgxG4d&quot;,&quot;type&quot;:&quot;image&quot;,&quot;data&quot;:{&quot;file&quot;:{&quot;url&quot;:&quot;..\\/__assets\\/T_text\\/77\\/Hp48UgxG4d.png&quot;},&quot;caption&quot;:&quot;\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a \\u0438\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u044f&quot;,&quot;withBorder&quot;:false,&quot;stretched&quot;:false,&quot;withBackground&quot;:false}},{&quot;id&quot;:&quot;wp4sDSvtop&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;DiBAMrMFaf&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.&amp;nbsp;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Nibh praesent tristique magna sit amet. Quisque egestas diam in arcu cursus euismod. Interdum consectetur libero id faucibus nisl tincidunt eget nullam non. Est sit amet facilisis magna etiam. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Justo laoreet sit amet cursus sit amet. Auctor urna nunc id cursus metus. Elit pellentesque habitant morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sed nisi lacus sed viverra tellus in. Condimentum id venenatis a condimentum vitae sapien. Diam quam nulla porttitor massa. Sagittis vitae et leo duis ut diam quam. Purus in mollis nunc sed id semper. Aliquam faucibus purus in massa tempor.</p><p style=\"text-align: \">Faucibus nisl tincidunt eget nullam non nisi. Pretium aenean pharetra magna ac placerat vestibulum. Tortor id aliquet lectus proin nibh nisl condimentum id. Sit amet porttitor eget dolor morbi non. Nulla facilisi cras fermentum odio eu feugiat. Aliquam nulla facilisi cras fermentum odio eu feugiat. Nisl condimentum id venenatis a condimentum vitae. Placerat duis ultricies lacus sed turpis tincidunt id. Diam quis enim lobortis scelerisque fermentum dui faucibus in. Suspendisse sed nisi lacus sed viverra tellus. Non nisi est sit amet facilisis magna etiam tempor. Porttitor lacus luctus accumsan tortor. Elementum eu facilisis sed odio morbi quis. Mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum. Sit amet justo donec enim diam vulputate ut. Vulputate mi sit amet mauris commodo quis imperdiet massa.</p><p style=\"text-align: \">Dui ut ornare lectus sit amet est placerat in egestas. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Commodo elit at imperdiet dui accumsan sit amet nulla. Fames ac turpis egestas integer eget aliquet nibh. Curabitur vitae nunc sed velit dignissim. Vitae congue eu consequat ac felis donec et odio pellentesque. Pellentesque sit amet porttitor eget dolor morbi. Porta lorem mollis aliquam ut porttitor. Pellentesque elit eget gravida cum sociis natoque penatibus et. Aliquet nibh praesent tristique magna sit amet purus. Nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Nisl suscipit adipiscing bibendum est ultricies integer. Sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Odio morbi quis commodo odio. Sed vulputate odio ut enim blandit volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Quis auctor elit sed vulputate mi sit amet mauris commodo. Quis hendrerit dolor magna eget est. Scelerisque viverra mauris in aliquam sem. Cursus metus aliquam eleifend mi in nulla.</p>\n            <figure class=\"figure_no-caption\">\n               <img \n                  src=\"../__assets/T_text/77/Hp48UgxG4d.png\" \n                  width=\"\"\n                  data-with-border=\"false\"\n                  data-with-background=\"false\" />\n               <figcaption>Заголовок изображения</figcaption>\n            </figure>\n            <p style=\"text-align: \">Sit amet nulla facilisi morbi tempus iaculis. In nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim ut. Id nibh tortor id aliquet. Sed pulvinar proin gravida hendrerit lectus a. Ultrices eros in cursus turpis massa tincidunt dui ut. Elementum tempus egestas sed sed. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Sapien nec sagittis aliquam malesuada bibendum arcu. Augue eget arcu dictum varius duis at consectetur. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae.</p><p style=\"text-align: \">Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Quam quisque id diam vel quam elementum pulvinar. Et egestas quis ipsum suspendisse ultrices gravida. Sagittis vitae et leo duis ut diam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Placerat duis ultricies lacus sed. Semper risus in hendrerit gravida rutrum quisque non. Ultricies lacus sed turpis tincidunt. Massa placerat duis ultricies lacus sed turpis tincidunt. Venenatis tellus in metus vulputate eu scelerisque felis. Enim eu turpis egestas pretium aenean. Adipiscing elit pellentesque habitant morbi tristique. Aenean pharetra magna ac placerat vestibulum. Vel turpis nunc eget lorem. Praesent semper feugiat nibh sed pulvinar proin gravida. Dapibus ultrices in iaculis nunc sed augue. Venenatis urna cursus eget nunc scelerisque viverra mauris. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam.&nbsp;</p>'),
(78, '{&quot;time&quot;:1642412231072,&quot;blocks&quot;:[{&quot;id&quot;:&quot;osu4SBbr5J&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;&lt;b&gt;\\u041c\\u044b&lt;\\/b&gt; \\u0432\\u044b\\u0431\\u0438\\u0440\\u0430\\u0435\\u043c \\u043d\\u0435 \\u0441\\u043b\\u0443\\u0447\\u0430\\u0439\\u043d\\u043e \\u0434\\u0440\\u0443\\u0433 \\u0434\\u0440\\u0443\\u0433\\u0430\\u2026 &lt;b&gt;\\u041c\\u044b&lt;\\/b&gt; \\u0432\\u0441\\u0442\\u0440\\u0435\\u0447\\u0430\\u0435\\u043c \\u0442\\u043e\\u043b\\u044c\\u043a\\u043e \\u0442\\u0435\\u0445, \\u043a\\u0442\\u043e \\u0443\\u0436\\u0435 \\u0441\\u0443\\u0449\\u0435\\u0441\\u0442\\u0432\\u0443\\u0435\\u0442 \\u0432 \\u043d\\u0430\\u0448\\u0435\\u043c \\u043f\\u043e\\u0434\\u0441\\u043e\\u0437\\u043d\\u0430\\u043d\\u0438\\u0438.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \"><b>Мы</b> выбираем не случайно друг друга… <b>Мы</b> встречаем только тех, кто уже существует в нашем подсознании.</p>'),
(81, '{&quot;time&quot;:1679842661691,&quot;blocks&quot;:[{&quot;id&quot;:&quot;wB-xWBOf2j&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;vvLL24kgPN&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;R4ZZHlSqdN&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \"></p><p style=\"text-align: \"></p><p style=\"text-align: \"></p>');
INSERT INTO `jf-cms_T_text` (`id_text`, `text_value`, `text_html`) VALUES
(82, '{&quot;time&quot;:1679842096106,&quot;blocks&quot;:[{&quot;id&quot;:&quot;zLobPqR6BZ&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;koEK8PEh1g&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;G-PZtXSPwl&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;Hp48UgxG4d&quot;,&quot;type&quot;:&quot;image&quot;,&quot;data&quot;:{&quot;file&quot;:{&quot;url&quot;:&quot;..\\/__assets\\/T_text\\/82\\/Hp48UgxG4d.png&quot;},&quot;caption&quot;:&quot;\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a \\u0438\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u044f&quot;,&quot;withBorder&quot;:false,&quot;stretched&quot;:false,&quot;withBackground&quot;:false}},{&quot;id&quot;:&quot;wp4sDSvtop&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;DiBAMrMFaf&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \"></p><p style=\"text-align: \"></p><p style=\"text-align: \"></p>\n            <figure class=\"figure_no-caption\">\n               <img \n                  src=\"../__assets/T_text/82/Hp48UgxG4d.png\" \n                  width=\"\"\n                  data-with-border=\"false\"\n                  data-with-background=\"false\" />\n               <figcaption>Заголовок изображения</figcaption>\n            </figure>\n            <p style=\"text-align: \"></p><p style=\"text-align: \"></p>'),
(83, '{&quot;time&quot;:1679842798101,&quot;blocks&quot;:[{&quot;id&quot;:&quot;wB-xWBOf2j&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;vvLL24kgPN&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;R4ZZHlSqdN&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \"></p><p style=\"text-align: \"></p><p style=\"text-align: \"></p>'),
(84, '{&quot;time&quot;:1679842829736,&quot;blocks&quot;:[{&quot;id&quot;:&quot;zLobPqR6BZ&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;koEK8PEh1g&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;G-PZtXSPwl&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;Hp48UgxG4d&quot;,&quot;type&quot;:&quot;image&quot;,&quot;data&quot;:{&quot;file&quot;:{&quot;url&quot;:&quot;..\\/__assets\\/T_text\\/84\\/Hp48UgxG4d.png&quot;},&quot;caption&quot;:&quot;\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a \\u0438\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u044f&quot;,&quot;withBorder&quot;:false,&quot;stretched&quot;:false,&quot;withBackground&quot;:false}},{&quot;id&quot;:&quot;wp4sDSvtop&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;DiBAMrMFaf&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \"></p><p style=\"text-align: \"></p><p style=\"text-align: \"></p>\n            <figure class=\"figure_no-caption\">\n               <img \n                  src=\"../__assets/T_text/84/Hp48UgxG4d.png\" \n                  width=\"\"\n                  data-with-border=\"false\"\n                  data-with-background=\"false\" />\n               <figcaption>Заголовок изображения</figcaption>\n            </figure>\n            <p style=\"text-align: \"></p><p style=\"text-align: \"></p>'),
(85, '{&quot;time&quot;:1642426223453,&quot;blocks&quot;:[{&quot;id&quot;:&quot;qs9RNgtWfJ&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lacus in iaculis ut ut facilisi suspendisse pharetra. Scelerisque convallis ac tellus felis mauris egestas amet, aenean urna. Scelerisque egestas sed cursus at felis urna nullam.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;e3dyR_SdmB&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Augue cursus massa gravida et non risus tellus hac risus. Consectetur varius integer&amp;nbsp;&lt;u&gt;sed at pulvinar&lt;\\/u&gt;&amp;nbsp;id nunc.&amp;nbsp;&lt;i&gt;Pulvinar&lt;\\/i&gt;&amp;nbsp;laoreet neque vulputate ultricies felis.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;ZzuFNBQHpL&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Orci neque ultrices pretium est et lectus enim vitae pellentesque.&amp;nbsp;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \">Lacus in iaculis ut ut facilisi suspendisse pharetra. Scelerisque convallis ac tellus felis mauris egestas amet, aenean urna. Scelerisque egestas sed cursus at felis urna nullam.</p><p style=\"text-align: \">Augue cursus massa gravida et non risus tellus hac risus. Consectetur varius integer&nbsp;<u>sed at pulvinar</u>&nbsp;id nunc.&nbsp;<i>Pulvinar</i>&nbsp;laoreet neque vulputate ultricies felis.</p><p style=\"text-align: \">Orci neque ultrices pretium est et lectus enim vitae pellentesque.&nbsp;</p>'),
(86, '{&quot;time&quot;:1642426223453,&quot;blocks&quot;:[{&quot;id&quot;:&quot;qs9RNgtWfJ&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lacus in iaculis ut ut facilisi suspendisse pharetra. Scelerisque convallis ac tellus felis mauris egestas amet, aenean urna. Scelerisque egestas sed cursus at felis urna nullam.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;e3dyR_SdmB&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Augue cursus massa gravida et non risus tellus hac risus. Consectetur varius integer&amp;nbsp;&lt;u&gt;sed at pulvinar&lt;\\/u&gt;&amp;nbsp;id nunc.&amp;nbsp;&lt;i&gt;Pulvinar&lt;\\/i&gt;&amp;nbsp;laoreet neque vulputate ultricies felis.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;ZzuFNBQHpL&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Orci neque ultrices pretium est et lectus enim vitae pellentesque.&amp;nbsp;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \">Lacus in iaculis ut ut facilisi suspendisse pharetra. Scelerisque convallis ac tellus felis mauris egestas amet, aenean urna. Scelerisque egestas sed cursus at felis urna nullam.</p><p style=\"text-align: \">Augue cursus massa gravida et non risus tellus hac risus. Consectetur varius integer&nbsp;<u>sed at pulvinar</u>&nbsp;id nunc.&nbsp;<i>Pulvinar</i>&nbsp;laoreet neque vulputate ultricies felis.</p><p style=\"text-align: \">Orci neque ultrices pretium est et lectus enim vitae pellentesque.&nbsp;</p>'),
(87, '{&quot;time&quot;:1642426223453,&quot;blocks&quot;:[{&quot;id&quot;:&quot;qs9RNgtWfJ&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lacus in iaculis ut ut facilisi suspendisse pharetra. Scelerisque convallis ac tellus felis mauris egestas amet, aenean urna. Scelerisque egestas sed cursus at felis urna nullam.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;e3dyR_SdmB&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Augue cursus massa gravida et non risus tellus hac risus. Consectetur varius integer&amp;nbsp;&lt;u&gt;sed at pulvinar&lt;\\/u&gt;&amp;nbsp;id nunc.&amp;nbsp;&lt;i&gt;Pulvinar&lt;\\/i&gt;&amp;nbsp;laoreet neque vulputate ultricies felis.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;ZzuFNBQHpL&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Orci neque ultrices pretium est et lectus enim vitae pellentesque.&amp;nbsp;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \">Lacus in iaculis ut ut facilisi suspendisse pharetra. Scelerisque convallis ac tellus felis mauris egestas amet, aenean urna. Scelerisque egestas sed cursus at felis urna nullam.</p><p style=\"text-align: \">Augue cursus massa gravida et non risus tellus hac risus. Consectetur varius integer&nbsp;<u>sed at pulvinar</u>&nbsp;id nunc.&nbsp;<i>Pulvinar</i>&nbsp;laoreet neque vulputate ultricies felis.</p><p style=\"text-align: \">Orci neque ultrices pretium est et lectus enim vitae pellentesque.&nbsp;</p>'),
(88, '{&quot;time&quot;:1642426223453,&quot;blocks&quot;:[{&quot;id&quot;:&quot;qs9RNgtWfJ&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lacus in iaculis ut ut facilisi suspendisse pharetra. Scelerisque convallis ac tellus felis mauris egestas amet, aenean urna. Scelerisque egestas sed cursus at felis urna nullam.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;e3dyR_SdmB&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Augue cursus massa gravida et non risus tellus hac risus. Consectetur varius integer&amp;nbsp;&lt;u&gt;sed at pulvinar&lt;\\/u&gt;&amp;nbsp;id nunc.&amp;nbsp;&lt;i&gt;Pulvinar&lt;\\/i&gt;&amp;nbsp;laoreet neque vulputate ultricies felis.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;ZzuFNBQHpL&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Orci neque ultrices pretium est et lectus enim vitae pellentesque.&amp;nbsp;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \">Lacus in iaculis ut ut facilisi suspendisse pharetra. Scelerisque convallis ac tellus felis mauris egestas amet, aenean urna. Scelerisque egestas sed cursus at felis urna nullam.</p><p style=\"text-align: \">Augue cursus massa gravida et non risus tellus hac risus. Consectetur varius integer&nbsp;<u>sed at pulvinar</u>&nbsp;id nunc.&nbsp;<i>Pulvinar</i>&nbsp;laoreet neque vulputate ultricies felis.</p><p style=\"text-align: \">Orci neque ultrices pretium est et lectus enim vitae pellentesque.&nbsp;</p>'),
(89, '{&quot;time&quot;:1642426223453,&quot;blocks&quot;:[{&quot;id&quot;:&quot;qs9RNgtWfJ&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Lacus in iaculis ut ut facilisi suspendisse pharetra. Scelerisque convallis ac tellus felis mauris egestas amet, aenean urna. Scelerisque egestas sed cursus at felis urna nullam.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;e3dyR_SdmB&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Augue cursus massa gravida et non risus tellus hac risus. Consectetur varius integer&amp;nbsp;&lt;u&gt;sed at pulvinar&lt;\\/u&gt;&amp;nbsp;id nunc.&amp;nbsp;&lt;i&gt;Pulvinar&lt;\\/i&gt;&amp;nbsp;laoreet neque vulputate ultricies felis.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;ZzuFNBQHpL&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;Orci neque ultrices pretium est et lectus enim vitae pellentesque.&amp;nbsp;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \">Lacus in iaculis ut ut facilisi suspendisse pharetra. Scelerisque convallis ac tellus felis mauris egestas amet, aenean urna. Scelerisque egestas sed cursus at felis urna nullam.</p><p style=\"text-align: \">Augue cursus massa gravida et non risus tellus hac risus. Consectetur varius integer&nbsp;<u>sed at pulvinar</u>&nbsp;id nunc.&nbsp;<i>Pulvinar</i>&nbsp;laoreet neque vulputate ultricies felis.</p><p style=\"text-align: \">Orci neque ultrices pretium est et lectus enim vitae pellentesque.&nbsp;</p>'),
(90, '', ''),
(91, '{&quot;time&quot;:1643033321719,&quot;blocks&quot;:[{&quot;id&quot;:&quot;WmOk4mk65Y&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;\\u0421 \\u043d\\u043e\\u0432\\u044b\\u043c 2022 \\u0433\\u043e\\u0434\\u043e\\u043c \\u043e\\u0442 \\&quot;\\u0428\\u043f\\u0430\\u0440\\u0433\\u0430\\u043b\\u043e\\u043a\\&quot;!!!&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \">С новым 2022 годом от \"Шпаргалок\"!!!</p>'),
(92, '{&quot;time&quot;:1643119967201,&quot;blocks&quot;:[{&quot;id&quot;:&quot;8G4zTElMcm&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;\\u0417\\u0434\\u0440\\u0430\\u0432\\u0441\\u0442\\u0432\\u0443\\u0439\\u0442\\u0435, {name}!&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;GfHqJR_LGI&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;\\u0412\\u044b \\u0443\\u043a\\u0430\\u0437\\u0430\\u043b\\u0438 \\u044d\\u0442\\u043e\\u0442 email \\u043d\\u0430 \\u0441\\u0430\\u0439\\u0442\\u0435 \\&quot;\\u0428\\u043f\\u0430\\u0440\\u0433\\u0430\\u043b\\u043a\\u0438 \\u0434\\u043b\\u044f \\u043b\\u0443\\u0447\\u0448\\u0435 \\u0436\\u0438\\u0437\\u043d\\u0438\\&quot;, \\u0432\\u043e \\u0432\\u0440\\u0435\\u043c\\u044f \\u0440\\u0435\\u0433\\u0438\\u0441\\u0442\\u0440\\u0430\\u0446\\u0438\\u0438. \\u0415\\u0441\\u043b\\u0438 \\u044d\\u0442\\u043e \\u0431\\u044b\\u043b\\u0438 \\u043d\\u0435 \\u0412\\u044b, \\u0442\\u043e \\u043f\\u0440\\u043e\\u0438\\u0433\\u043d\\u043e\\u0440\\u0438\\u0440\\u0443\\u0439\\u0442\\u0435 \\u0434\\u0430\\u043d\\u043d\\u043e\\u0435 \\u0441\\u043e\\u043e\\u0431\\u0449\\u0435\\u043d\\u0438\\u0435.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;4k5IRFJsT_&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;\\u0414\\u043b\\u044f \\u0430\\u043a\\u0442\\u0438\\u0432\\u0430\\u0446\\u0438\\u0438 \\u0430\\u043a\\u043a\\u0430\\u0443\\u043d\\u0442\\u0430 \\u043f\\u0435\\u0440\\u0435\\u0439\\u0434\\u0438\\u0442\\u0435 \\u043f\\u043e \\u0441\\u043b\\u0435\\u0434\\u0443\\u044e\\u0449\\u0435\\u0439 \\u0441\\u0441\\u044b\\u043b\\u043a\\u0435: &lt;a href=\\&quot;http:\\/\\/{activate_link}\\&quot;&gt;&lt;b&gt;\\u0430\\u043a\\u0442\\u0438\\u0432\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u044c&lt;\\/b&gt;&lt;\\/a&gt;.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;y694vrVD06&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;\\u0417\\u0430\\u0442\\u0435\\u043c, \\u0434\\u043b\\u044f \\u0432\\u0445\\u043e\\u0434\\u0430 \\u0432 &lt;a href=\\&quot;http:\\/\\/{office_link}\\&quot;&gt;\\u043b\\u0438\\u0447\\u043d\\u044b\\u0439 \\u043a\\u0430\\u0431\\u0438\\u043d\\u0435\\u0442&lt;\\/a&gt; \\u0438\\u0441\\u043f\\u043e\\u043b\\u044c\\u0437\\u0443\\u0439\\u0442\\u0435 \\u0441\\u043b\\u0435\\u0434\\u0443\\u044e\\u0449\\u0438\\u0435 \\u0434\\u0430\\u043d\\u043d\\u044b\\u0435:&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;rgepYNOwGT&quot;,&quot;type&quot;:&quot;list&quot;,&quot;data&quot;:{&quot;style&quot;:&quot;unordered&quot;,&quot;items&quot;:[&quot;Email:&amp;nbsp;&lt;b&gt;{email}&lt;\\/b&gt;&quot;,&quot;\\u041f\\u0430\\u0440\\u043e\\u043b\\u044c:&amp;nbsp;&lt;b&gt;{password}&lt;\\/b&gt;&quot;]}},{&quot;id&quot;:&quot;KMx1uOx_6M&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;\\u0412\\u044b \\u043c\\u043e\\u0436\\u0435\\u0442\\u0435 \\u0438\\u0437\\u043c\\u0435\\u043d\\u0438\\u0442\\u044c \\u043f\\u0430\\u0440\\u043e\\u043b\\u044c \\u0432 &lt;a href=\\&quot;http:\\/\\/{office_link}\\&quot;&gt;&lt;b&gt;\\u043b\\u0438\\u0447\\u043d\\u043e\\u043c \\u043a\\u0430\\u0431\\u0438\\u043d\\u0435\\u0442\\u0435&lt;\\/b&gt;&lt;\\/a&gt;.&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \">Здравствуйте, {name}!</p><p style=\"text-align: \">Вы указали этот email на сайте \"Шпаргалки для лучше жизни\", во время регистрации. Если это были не Вы, то проигнорируйте данное сообщение.</p><p style=\"text-align: \">Для активации аккаунта перейдите по следующей ссылке: <a href=\"http://{activate_link}\"><b>активировать</b></a>.</p><p style=\"text-align: \">Затем, для входа в <a href=\"http://{office_link}\">личный кабинет</a> используйте следующие данные:</p><ul><li>Email:&nbsp;<b>{email}</b></li><li>Пароль:&nbsp;<b>{password}</b></li></ul><p style=\"text-align: \">Вы можете изменить пароль в <a href=\"http://{office_link}\"><b>личном кабинете</b></a>.</p>'),
(98, '{&quot;time&quot;:1679842973455,&quot;blocks&quot;:[{&quot;id&quot;:&quot;wB-xWBOf2j&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;vvLL24kgPN&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}},{&quot;id&quot;:&quot;R4ZZHlSqdN&quot;,&quot;type&quot;:&quot;paragraph&quot;,&quot;data&quot;:{&quot;text&quot;:&quot;&quot;},&quot;tunes&quot;:{&quot;alignment&quot;:{&quot;alignment&quot;:&quot;left&quot;}}}],&quot;version&quot;:&quot;2.22.2&quot;}', '<p style=\"text-align: \"></p><p style=\"text-align: \"></p><p style=\"text-align: \"></p>'),
(99, '{&quot;time&quot;:1679843680981,&quot;blocks&quot;:[{&quot;id&quot;:&quot;Hp48UgxG4d&quot;,&quot;type&quot;:&quot;image&quot;,&quot;data&quot;:{&quot;file&quot;:{&quot;url&quot;:&quot;..\\/__assets\\/T_text\\/99\\/Hp48UgxG4d.png&quot;},&quot;caption&quot;:&quot;\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a \\u0438\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u044f&quot;,&quot;withBorder&quot;:false,&quot;stretched&quot;:false,&quot;withBackground&quot;:false}}],&quot;version&quot;:&quot;2.22.2&quot;}', '\n            <figure class=\"figure_no-caption\">\n               <img \n                  src=\"../__assets/T_text/99/Hp48UgxG4d.png\" \n                  width=\"\"\n                  data-with-border=\"false\"\n                  data-with-background=\"false\" />\n               <figcaption>Заголовок изображения</figcaption>\n            </figure>\n            ');

-- --------------------------------------------------------

--
-- Структура таблицы `jf-cms_T_video`
--

CREATE TABLE `jf-cms_T_video` (
  `id_video` int NOT NULL,
  `video_src` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `jf-cms_T_video`
--

INSERT INTO `jf-cms_T_video` (`id_video`, `video_src`) VALUES
(1, 'v1.mp4'),
(4, 'v4.mp4'),
(5, 'v5.mp4'),
(6, 'v6.mp4'),
(7, 'v7.mp4'),
(8, 'v8.mp4'),
(9, 'v9.mp4'),
(10, 'v10.mp4'),
(11, 'v11.mp4'),
(12, 'v12.mp4'),
(13, 'v13.mp4'),
(14, 'v14.mp4'),
(15, 'v15.mp4'),
(16, 'v16.mp4');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `jf-cms_account`
--
ALTER TABLE `jf-cms_account`
  ADD PRIMARY KEY (`id_account`);

--
-- Индексы таблицы `jf-cms_authorization_account`
--
ALTER TABLE `jf-cms_authorization_account`
  ADD PRIMARY KEY (`id_account`);

--
-- Индексы таблицы `jf-cms_authorization_session`
--
ALTER TABLE `jf-cms_authorization_session`
  ADD PRIMARY KEY (`id_session`);

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
-- Индексы таблицы `jf-cms_interface-translate_phrase`
--
ALTER TABLE `jf-cms_interface-translate_phrase`
  ADD PRIMARY KEY (`id_phrase`);

--
-- Индексы таблицы `jf-cms_session`
--
ALTER TABLE `jf-cms_session`
  ADD PRIMARY KEY (`id_session`);

--
-- Индексы таблицы `jf-cms_type`
--
ALTER TABLE `jf-cms_type`
  ADD PRIMARY KEY (`id_type`),
  ADD UNIQUE KEY `type_name` (`type_name`);

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
-- AUTO_INCREMENT для таблицы `jf-cms_authorization_account`
--
ALTER TABLE `jf-cms_authorization_account`
  MODIFY `id_account` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT для таблицы `jf-cms_db-access`
--
ALTER TABLE `jf-cms_db-access`
  MODIFY `id_db-access` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `jf-cms_db-item`
--
ALTER TABLE `jf-cms_db-item`
  MODIFY `id_db-item` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1262;

--
-- AUTO_INCREMENT для таблицы `jf-cms_interface-translate_phrase`
--
ALTER TABLE `jf-cms_interface-translate_phrase`
  MODIFY `id_phrase` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT для таблицы `jf-cms_type`
--
ALTER TABLE `jf-cms_type`
  MODIFY `id_type` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `jf-cms_T_audio`
--
ALTER TABLE `jf-cms_T_audio`
  MODIFY `id_audio` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `jf-cms_T_boolean`
--
ALTER TABLE `jf-cms_T_boolean`
  MODIFY `id_boolean` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT для таблицы `jf-cms_T_excel`
--
ALTER TABLE `jf-cms_T_excel`
  MODIFY `id_excel` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `jf-cms_T_field`
--
ALTER TABLE `jf-cms_T_field`
  MODIFY `id_field` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=490;

--
-- AUTO_INCREMENT для таблицы `jf-cms_T_file`
--
ALTER TABLE `jf-cms_T_file`
  MODIFY `id_file` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `jf-cms_T_image`
--
ALTER TABLE `jf-cms_T_image`
  MODIFY `id_image` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT для таблицы `jf-cms_T_space`
--
ALTER TABLE `jf-cms_T_space`
  MODIFY `id_space` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT для таблицы `jf-cms_T_text`
--
ALTER TABLE `jf-cms_T_text`
  MODIFY `id_text` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT для таблицы `jf-cms_T_video`
--
ALTER TABLE `jf-cms_T_video`
  MODIFY `id_video` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
