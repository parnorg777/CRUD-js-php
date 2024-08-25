-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Авг 15 2024 г., 10:30
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `CRUD`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `title`) VALUES
(1, 'База'),
(2, 'Антибаза');

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_text` text COLLATE utf8mb4_unicode_ci,
  `likes` int UNSIGNED DEFAULT '0',
  `category_id` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `title`, `post_text`, `likes`, `category_id`) VALUES
(379, 'Пост 70', 'ocvx6k847wfn93sejzhgbd1irmy2lu', 50, 2),
(380, 'Пост 71', 'sw2x8fvdlk90tep71munbzyj5rcqg4', 95, 1),
(381, 'Пост 72', 'i6hqt0e85ksrwym2jzd19cgvn3fubSSDSDFSDFSDFSDFSD', 100, 1),
(382, 'Пост 73', 'hnc1jsbqr39mpxedwto7a6ik4f5gl2', 55, 2),
(383, 'Пост 74', 'terli7v1aguj5cqhd3mw4zp0fn9o82', 95, 1),
(411, 'Пост 3.14', 'Текст, просто текст', 23, 2),
(412, 'RG456GGFHG', '652626262849/7849/789/*-/-*', 415, 2),
(413, '1dff3wwww', 'wsdsdsdsdsdsddsdsd', 13, 2),
(414, 'grejhkejh', 'grejhkejher34r34r34', 45, 2),
(423, 'Пост 17', 'x1jvh5np4du97qobgstwzya80mki23', 20, 1),
(424, 'Пост 18', 'klfx427eozypvu960rbimt3s5achjn', 99, 1),
(425, 'Пост 19', 'nmvyrit2a7pw6fgk4hzxus93bl8o05', 79, 1),
(426, 'Пост 20', '0ubwyhl3r8ifx491ojpegat6mcqkvz', 57, 1),
(427, 'Пост 21', 'gk4ze5svdfymwipj6x1o7b3ahucq02', 71, 1),
(428, 'Пост 22', '8n3jcl45tf7pwaq01dkheub9xiyro6', 92, 1),
(429, 'Пост 23', 'bhwui2en4z6ly1t7xdac0qmg8pj5ok', 73, 2),
(430, 'Пост 24', 'wym19ngphjuc4f3ra78qekosb506zd', 48, 1),
(431, 'Пост 25', 'n2zpby7tqdvc5168gixe9uw4rmh3of', 59, 1),
(432, 'Пост 26', 'x6rpocwa4q971fbknl0u5m2d8gshyj', 86, 1),
(433, 'Пост 27', 'bihv43atszlne6k2xd90qu5fojry8w', 28, 2),
(434, 'Пост 28', '65xojv7n8dahw1pizr29fl4sqm0tkg', 45, 1),
(435, 'Пост 29', 'fcv4q6tkpizl05by9aordn28guhwem', 84, 1),
(436, 'Пост 30', 'lrnwht2vbq579z8okdm4ypjfgc1a03', 14, 1),
(437, 'Пост 31', '1o3s6vjlqzebnwu5cdtaph9i4278yr', 96, 1),
(438, 'Пост 32', '8nv75wiucbms3zjel9ryqk0x61pthd', 31, 1),
(439, 'Пост 33', 'h2vwfk87cm94jxzbdn3ou1pte5l0is', 69, 1),
(440, 'Пост 34', 'zbucnl6tif87pygqj9ox4khmrdas3w', 100, 1),
(441, 'Пост 35', 'tmy04q2exgd8uolvbz3sikjrf9n5wc', 83, 1),
(442, 'Пост 36', '5womygurnj2fbhz30p7l1eq9c4d68i', 72, 1),
(443, 'Пост 37', 'n6is4oyzr9quvl0kfgedm35cth1jxa', 97, 1),
(444, 'Пост 38', 'uw0ax613g8q7pvey5tsnmhjk42lcio', 12, 1),
(445, 'Пост 39', 'py2n3xv1iuh5dm0beatzkcfl6so9j8', 62, 1),
(446, 'Пост 40', 'mg2pfhc8z95d73ivqujtns04kryow1', 36, 1),
(447, 'Пост 41', 'encxaws987jgvqlidomr5hptz2k013', 35, 1),
(448, 'Пост 42', 'lvf9koxirjqgp1mewn7bd40z356ac2', 86, 1),
(449, 'Пост 43', 'cr4mybphksn72tzag5wdjio90xqe1l', 77, 1),
(634, 'Пост 220', '3kzi6gcb420tsfa5x91pnv7rdoemwy', 0, 1),
(635, 'Пост 221', '0apn3dcg2e1m6jflthskowbruz8i57', 8, 1),
(636, 'Пост 222', 'irud2p4j31x07kvtblnhwfmqa9z5g8', 83, 1),
(637, 'Пост 223', 'n2q0jvg98ofsizml7rbx6u3akhw1cy', 10, 1),
(638, 'Пост 224', 'oeludsw653bnt9fxiqkh024g81vcjz', 61, 1),
(639, 'Пост 225', '01ie2rdnm5j9cu8yvbpfo3qltg7a6z', 35, 1),
(640, 'Пост 226', 'a0siqp7utmnx2hfco895yb41vl3ker', 32, 1),
(641, 'Пост 227', 'oi6prasvj3kdnxgew0f9ytl4cu1qm8', 53, 1),
(642, 'Пост 228', 'u32mgjbq8otifrc57w09snh4lkx1az', 42, 1),
(643, 'Пост 229', 'mfl5rty2x0gun81wedkiapsq76v4oz', 57, 1),
(644, 'Пост 230', 'ul84bchzgw96resindtm2yx3fp71aj', 98, 1),
(645, 'Пост 231', 'r4smbki1foczwg9juned23708a5tyq', 89, 1),
(646, 'Пост 232', 'dg20b5h9jplwq7x84uonmi3avrzes1', 65, 1),
(647, 'Пост 233', 'dt052lqm67zckwurb418i9agsfojne', 18, 1),
(785, 'Пост 371', 'urnexohdv419ij7c6slqf3a0m5tbyz', 66, 1),
(786, 'Пост 372', 'w3lyz1xa2e9tfkrvcjdo5n407bphsi', 20, 1),
(787, 'Пост 373', '7y6rxgvdhn9czi83jf5pteomlak01b', 84, 1),
(788, 'Пост 374', 'caurlzfkeo6qnj3y4v8spmbg20wh9t', 96, 1),
(814, 'Пост 400', '5wf4z26tb8pyxnc3jh1o7mgresvkad', 80, 1),
(815, 'Пост 401', 'avmgfstkjxohw3540re27y9bn6ldcp', 100, 1),
(816, 'Пост 402', 'pzlvbot13hgi86dfeycnk950qsxwu2', 99, 1),
(817, 'Пост 403', 'aibk6n49c8pq1rev0mwhtu3f7dyjgo', 36, 1),
(818, 'Пост 404', '8pub10rve76m3taofizk9jsxhnlcgy', 44, 1),
(819, 'Пост 405', 'yzpfu53hcv6wn8947oa0xbegqsjm2i', 77, 1),
(820, 'Пост 406', 'mnasx8hyz4192lpwto5e60kdrfbc73', 78, 1),
(821, 'Пост 407', 'qx7fay0j1pvgwr2um63zk5sleinc8o', 2, 1),
(822, 'Пост 408', 'fe9srdc1yg5j2imbp7nw4ohlxtva08', 64, 1),
(823, 'Пост 409', 'vknr8pm4gdfbja9e25tcwu3zhs1iyx', 74, 1),
(824, 'Пост 410', '869huksejt2bxvyna05zg7icprd31o', 51, 1),
(825, 'Пост 411', 'r5t7p98ujh03gdzvbflo4i1qxc6ksa', 1, 1),
(826, 'Пост 412', 'bvm25fhgk3wzac4qeu0nl8i6xjdtpr', 82, 1),
(827, 'Пост 413', 'uwolv9nb87xdpmjygcirfe13kah64s', 53, 1),
(828, 'Пост 414', 'bl9t7roh4503qavukeys6gm1wcfij8', 70, 1),
(829, 'Пост 415', '3cwnrq2z8xt7yvs4bjelfimhpog1k5', 10, 1),
(830, 'Пост 416', 'th0oq4lzjype95vxmngsc26bkru8d1', 80, 1),
(831, 'Пост 417', 'd6gsal34r580poxunvym7bcez2ti9w', 44, 1),
(1013, 'Пост 599', 'hnd4jbu9zreyp2otqvgms0kc5f8w13', 5, 1),
(1014, 'Пост 600', 'osiukbjvcnlympfdw12e8q497r6ght', 42, 1),
(1015, 'Пост 601', 'q95jhbwcruogk0e136itlv782dynza', 43, 1),
(1016, 'Пост 602', 'onwujq3x7lmtrpfz0e9d256k8by1hs', 31, 1),
(1017, 'Пост 603', '8frjkzm5q9atd7nyhlecxbi0vs4pg2', 31, 1),
(1018, 'Пост 604', 'hanlox2v0t5cm7yb6u1ewp84fg3j9d', 44, 1),
(1019, 'Пост 605', 'vke9bjqo5apgwt1lnxuc8dhz6s74ry', 89, 1),
(1020, 'Пост 606', 'kyeb0gtaplzmuvxqwr48fihn5c3d91', 72, 2),
(1021, 'Пост 607', 'vhlwn2p14jqarzgeu90fm5xkostid3', 48, 1),
(1022, 'Пост 608', '4qipdzrh32o1feat8x7c50bsl6mvn9', 89, 1),
(1023, 'Пост 609', 'wxb82vur4pfekn59zhlqjmcoiat017', 22, 1),
(1024, 'Пост 610', '8sm0hvgecuw359nixfk2y1z6d4qarp', 60, 1),
(1025, 'Пост 611', 'vth46z7f8jd3ga2sc0bqyuio5wlrmk', 80, 2),
(1026, 'Пост 612', '95q4s7vodt120cl8gmxwk6urei3bzj', 54, 1),
(1027, 'Пост 613', 'pfn4axiju51gm3crbklseqdh06278o', 32, 1),
(1028, 'Пост 614', 'hopjx9negqtk5au3dbyslfcw268miz', 85, 1),
(1029, 'Новый пост 45', 'Текст нового поста', 45, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `posts_tags`
--

CREATE TABLE `posts_tags` (
  `post_id` int UNSIGNED NOT NULL,
  `tag_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `posts_tags`
--

INSERT INTO `posts_tags` (`post_id`, `tag_id`) VALUES
(411, 1),
(411, 3),
(411, 4),
(381, 3),
(382, 3),
(379, 1),
(379, 2),
(379, 3),
(379, 4),
(414, 2),
(433, 2),
(433, 3),
(413, 1),
(413, 3),
(1021, 1),
(1021, 2),
(1021, 3),
(412, 1),
(412, 2),
(412, 4),
(1020, 2),
(1027, 2),
(1025, 4),
(826, 1),
(423, 4),
(1029, 2),
(1029, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `tags`
--

CREATE TABLE `tags` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `tags`
--

INSERT INTO `tags` (`id`, `title`) VALUES
(1, 'Коты'),
(2, 'Собаки'),
(3, 'Путешествия'),
(4, 'Статьи');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `posts_tags`
--
ALTER TABLE `posts_tags`
  ADD KEY `post_id` (`post_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Индексы таблицы `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1030;

--
-- AUTO_INCREMENT для таблицы `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Ограничения внешнего ключа таблицы `posts_tags`
--
ALTER TABLE `posts_tags`
  ADD CONSTRAINT `posts_tags_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `posts_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
