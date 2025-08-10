-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 10-08-2025 a las 13:04:15
-- Versión del servidor: 10.11.10-MariaDB-log
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `icon_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`, `icon_url`, `created_at`, `updated_at`) VALUES
(1, 'lawyers-consultants-gestors', 'https://app.flamencos.eu/images/categories/food.png', '2025-05-17 14:42:01', '2025-07-09 12:26:04'),
(2, 'real-state', 'https://app.flamencos.eu/images/categories/fish.png', '2025-05-17 14:42:01', '2025-07-09 12:26:15'),
(3, 'home-services', 'https://app.flamencos.eu/images/categories/hiking.png', '2025-05-17 14:42:01', '2025-07-17 09:55:34'),
(4, 'education', 'https://app.flamencos.eu/images/categories/sport.png', '2025-05-17 14:42:01', '2025-07-09 12:26:36'),
(5, 'healthcare', 'https://app.flamencos.eu/images/categories/health.png', '2025-05-17 14:42:01', '2025-07-09 12:26:43'),
(6, 'insurance-banking', 'https://app.flamencos.eu/images/categories/groceries.png', '2025-05-17 14:42:01', '2025-07-17 13:20:31'),
(7, 'sports-leisure', 'https://app.flamencos.eu/images/categories/flamencos.png', '2025-05-18 12:02:07', '2025-07-09 12:27:03'),
(8, 'eating-drinking', 'https://app.flamencos.eu/images/categories/flamencos.png', '2025-05-18 12:02:07', '2025-07-09 12:27:03'),
(9, 'tourism-travel', 'https://app.flamencos.eu/images/categories/flamencos.png', '2025-05-18 12:02:07', '2025-07-09 12:27:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category_translations`
--

CREATE TABLE `category_translations` (
  `translation_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text_translation` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `category_translations`
--

INSERT INTO `category_translations` (`translation_id`, `category_id`, `language_id`, `text_translation`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Abogados, consultoría y gestoría', '2025-05-17 14:42:31', '2025-07-09 12:28:38'),
(2, 1, 2, 'Lawyers, consultants, gestors', '2025-05-17 14:42:31', '2025-07-09 12:28:45'),
(3, 1, 3, 'Nourriture et boissons', '2025-05-17 14:42:31', '2025-05-17 14:42:31'),
(4, 1, 4, 'Essen und Trinken', '2025-05-17 14:42:31', '2025-05-17 14:42:31'),
(5, 1, 5, 'Eten en drinken', '2025-05-17 14:42:31', '2025-05-17 14:42:31'),
(6, 1, 6, 'Еда и напитки', '2025-05-17 14:42:31', '2025-05-17 14:42:31'),
(7, 1, 7, 'Cibo e bevande', '2025-05-17 14:42:31', '2025-05-17 14:42:31'),
(8, 1, 8, '餐饮', '2025-05-17 14:42:31', '2025-05-17 14:42:31'),
(9, 2, 1, 'Inmobiliarias', '2025-05-17 14:42:31', '2025-07-10 13:40:56'),
(10, 2, 2, 'Real Estate', '2025-05-17 14:42:31', '2025-07-10 13:41:01'),
(11, 2, 3, 'Lieux de pêche', '2025-05-17 14:42:31', '2025-05-17 14:42:31'),
(12, 2, 4, 'Angelplätze', '2025-05-17 14:42:31', '2025-05-17 14:42:31'),
(13, 2, 5, 'Visplekken', '2025-05-17 14:42:31', '2025-05-17 14:42:31'),
(14, 2, 6, 'Места для рыбалки', '2025-05-17 14:42:31', '2025-05-17 14:42:31'),
(15, 2, 7, 'Zone di pesca', '2025-05-17 14:42:31', '2025-05-17 14:42:31'),
(16, 2, 8, '钓鱼地点', '2025-05-17 14:42:31', '2025-05-17 14:42:31'),
(17, 3, 1, 'Servicios del Hogar', '2025-05-17 14:42:31', '2025-07-17 10:01:16'),
(18, 3, 2, 'Home Services', '2025-05-17 14:42:31', '2025-07-17 10:01:22'),
(19, 3, 3, 'Itinéraires de randonnée', '2025-05-17 14:42:31', '2025-05-17 14:42:31'),
(20, 3, 4, 'Wanderwege', '2025-05-17 14:42:31', '2025-05-17 14:42:31'),
(21, 3, 5, 'Wandelroutes', '2025-05-17 14:42:31', '2025-05-17 14:42:31'),
(22, 3, 6, 'Пешеходные маршруты', '2025-05-17 14:42:31', '2025-05-17 14:42:31'),
(23, 3, 7, 'Percorsi escursionistici', '2025-05-17 14:42:31', '2025-05-17 14:42:31'),
(24, 3, 8, '徒步路线', '2025-05-17 14:42:31', '2025-05-17 14:42:31'),
(25, 4, 1, 'Educación', '2025-05-17 14:42:31', '2025-07-09 12:30:35'),
(26, 4, 2, 'Universities, International Schools, other educational centres', '2025-05-17 14:42:31', '2025-07-09 12:30:42'),
(27, 4, 3, 'Clubs de sport', '2025-05-17 14:42:31', '2025-05-17 14:42:31'),
(28, 4, 4, 'Sportvereine', '2025-05-17 14:42:31', '2025-05-17 14:42:31'),
(29, 4, 5, 'Sportclubs', '2025-05-17 14:42:31', '2025-05-17 14:42:31'),
(30, 4, 6, 'Спортивные клубы', '2025-05-17 14:42:31', '2025-05-17 14:42:31'),
(31, 4, 7, 'Club sportivi', '2025-05-17 14:42:31', '2025-05-17 14:42:31'),
(32, 4, 8, '体育俱乐部', '2025-05-17 14:42:31', '2025-05-17 14:42:31'),
(33, 5, 1, 'Centros de salud', '2025-05-17 14:42:31', '2025-05-17 14:42:31'),
(34, 5, 2, 'Healthcare', '2025-05-17 14:42:31', '2025-07-09 12:31:02'),
(35, 5, 3, 'Centres de santé', '2025-05-17 14:42:31', '2025-05-17 14:42:31'),
(36, 5, 4, 'Gesundheitszentren', '2025-05-17 14:42:31', '2025-05-17 14:42:31'),
(37, 5, 5, 'Gezondheidscentra', '2025-05-17 14:42:31', '2025-05-17 14:42:31'),
(38, 5, 6, 'Медицинские центры', '2025-05-17 14:42:31', '2025-05-17 14:42:31'),
(39, 5, 7, 'Centri sanitari', '2025-05-17 14:42:31', '2025-05-17 14:42:31'),
(40, 5, 8, '健康中心', '2025-05-17 14:42:31', '2025-05-17 14:42:31'),
(41, 6, 1, 'Impuestos, Seguros y Banca', '2025-05-17 14:42:31', '2025-07-09 12:32:36'),
(42, 6, 2, 'Tax and Legal advice, Insurances and Banks for expats', '2025-05-17 14:42:31', '2025-07-09 12:32:19'),
(43, 6, 3, 'Épiceries', '2025-05-17 14:42:31', '2025-05-17 14:42:31'),
(44, 6, 4, 'Lebensmittelgeschäfte', '2025-05-17 14:42:31', '2025-05-17 14:42:31'),
(45, 6, 5, 'Supermarkten', '2025-05-17 14:42:31', '2025-05-17 14:42:31'),
(46, 6, 6, 'Продуктовые магазины', '2025-05-17 14:42:31', '2025-05-17 14:42:31'),
(47, 6, 7, 'Negozi di alimentari', '2025-05-17 14:42:31', '2025-05-17 14:42:31'),
(48, 6, 8, '杂货店', '2025-05-17 14:42:31', '2025-05-17 14:42:31'),
(49, 7, 1, 'Deportes', '2025-05-18 12:04:26', '2025-07-09 12:32:07'),
(50, 7, 2, 'Sports & Leisure', '2025-05-18 12:04:26', '2025-07-09 12:32:26'),
(51, 7, 3, 'Flamants roses', '2025-05-18 12:04:26', '2025-05-18 12:04:26'),
(52, 7, 4, 'Flamingos', '2025-05-18 12:04:26', '2025-05-18 12:04:26'),
(53, 7, 5, 'Flamingo’s', '2025-05-18 12:04:26', '2025-05-18 12:04:26'),
(54, 7, 6, 'Фламинго', '2025-05-18 12:04:26', '2025-05-18 12:04:26'),
(55, 7, 7, 'Fenicotteri', '2025-05-18 12:04:26', '2025-05-18 12:04:26'),
(56, 7, 8, '火烈鸟', '2025-05-18 12:04:26', '2025-05-18 12:04:26'),
(57, 8, 2, 'Eating & Drinking', '2025-05-18 12:04:26', '2025-07-09 12:33:58'),
(58, 9, 2, 'Tourism & Travel', '2025-05-18 12:04:26', '2025-07-09 12:32:26'),
(59, 8, 1, 'Restaurantes y Bares', '2025-05-18 12:04:26', '2025-07-09 12:33:58'),
(60, 9, 1, 'Turismo y Viajes', '2025-05-18 12:04:26', '2025-07-09 12:32:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `description_translations`
--

CREATE TABLE `description_translations` (
  `translation_id` int(11) NOT NULL,
  `marker_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text_translation` text NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `description_translations`
--

INSERT INTO `description_translations` (`translation_id`, `marker_id`, `language_id`, `text_translation`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Buena comida y buen ambiente.', '2025-05-17 19:05:40', '2025-05-20 22:18:44'),
(2, 1, 2, 'Good food and good atmosphere.', '2025-05-17 19:05:40', '2025-05-20 22:18:55'),
(3, 1, 4, 'Ein gemütliches Restaurant mit lokaler Küche.', '2025-05-17 19:05:40', '2025-05-17 19:05:40'),
(4, 2, 1, 'Las mejores sardinas fritas.', '2025-05-17 19:05:40', '2025-05-22 16:51:39'),
(5, 2, 2, 'The best fried sardines.', '2025-05-17 19:05:40', '2025-05-22 16:51:45'),
(6, 2, 4, 'Sardinen.', '2025-05-17 19:05:40', '2025-05-22 16:51:49'),
(7, 3, 1, 'Pizzeria de barrio de toda la vida.', '2025-05-17 19:05:40', '2025-05-22 16:51:54'),
(8, 3, 2, 'Typical neighbourhood pizzeria.', '2025-05-17 19:05:40', '2025-05-22 16:51:58'),
(9, 3, 4, 'Gute pizza.', '2025-05-17 19:05:40', '2025-05-22 16:52:03'),
(16, 6, 1, 'Un lugar tranquilo ideal para la pesca.', '2025-05-17 19:05:40', '2025-05-17 19:05:40'),
(17, 6, 2, 'A quiet spot perfect for fishing.', '2025-05-17 19:05:40', '2025-05-17 19:05:40'),
(18, 6, 4, 'Ein ruhiger Ort, ideal zum Angeln.', '2025-05-17 19:05:40', '2025-05-17 19:05:40'),
(19, 7, 1, 'Un lugar tranquilo ideal para la pesca.', '2025-05-17 19:05:40', '2025-05-17 19:05:40'),
(20, 7, 2, 'A quiet spot perfect for fishing.', '2025-05-17 19:05:40', '2025-05-17 19:05:40'),
(21, 7, 4, 'Ein ruhiger Ort, ideal zum Angeln.', '2025-05-17 19:05:40', '2025-05-17 19:05:40'),
(31, 11, 1, 'Una ruta pintoresca con vistas impresionantes.', '2025-05-17 19:05:40', '2025-05-17 19:05:40'),
(32, 11, 2, 'A scenic route with stunning views.', '2025-05-17 19:05:40', '2025-05-17 19:05:40'),
(33, 11, 4, 'Eine malerische Route mit atemberaubender Aussicht.', '2025-05-17 19:05:40', '2025-05-17 19:05:40'),
(34, 12, 1, 'Una ruta pintoresca con vistas impresionantes.', '2025-05-17 19:05:40', '2025-05-17 19:05:40'),
(35, 12, 2, 'A scenic route with stunning views.', '2025-05-17 19:05:40', '2025-05-17 19:05:40'),
(36, 12, 4, 'Eine malerische Route mit atemberaubender Aussicht.', '2025-05-17 19:05:40', '2025-05-17 19:05:40'),
(37, 13, 1, 'Una ruta pintoresca con vistas impresionantes.', '2025-05-17 19:05:40', '2025-05-17 19:05:40'),
(38, 13, 2, 'A scenic route with stunning views.', '2025-05-17 19:05:40', '2025-05-17 19:05:40'),
(39, 13, 4, 'Eine malerische Route mit atemberaubender Aussicht.', '2025-05-17 19:05:40', '2025-05-17 19:05:40'),
(46, 16, 1, 'Club deportivo con actividades para todas las edades.', '2025-05-17 19:05:40', '2025-05-17 19:05:40'),
(47, 16, 2, 'Sports club with activities for all ages.', '2025-05-17 19:05:40', '2025-05-17 19:05:40'),
(48, 16, 4, 'Sportverein mit Aktivitäten für alle Altersgruppen.', '2025-05-17 19:05:40', '2025-05-17 19:05:40'),
(49, 17, 1, 'Club deportivo con actividades para todas las edades.', '2025-05-17 19:05:40', '2025-05-17 19:05:40'),
(50, 17, 2, 'Sports club with activities for all ages.', '2025-05-17 19:05:40', '2025-05-17 19:05:40'),
(51, 17, 4, 'Sportverein mit Aktivitäten für alle Altersgruppen.', '2025-05-17 19:05:40', '2025-05-17 19:05:40'),
(52, 18, 1, 'Club deportivo con actividades para todas las edades.', '2025-05-17 19:05:40', '2025-05-17 19:05:40'),
(53, 18, 2, 'Sports club with activities for all ages.', '2025-05-17 19:05:40', '2025-05-17 19:05:40'),
(54, 18, 4, 'Sportverein mit Aktivitäten für alle Altersgruppen.', '2025-05-17 19:05:40', '2025-05-17 19:05:40'),
(61, 21, 1, 'Centro de salud moderno y accesible.', '2025-05-17 19:05:40', '2025-05-17 19:05:40'),
(62, 21, 2, 'Modern and accessible health center.', '2025-05-17 19:05:40', '2025-05-17 19:05:40'),
(63, 21, 4, 'Modernes und zugängliches Gesundheitszentrum.', '2025-05-17 19:05:40', '2025-05-17 19:05:40'),
(76, 26, 1, 'Tienda de comestibles con productos locales frescos.', '2025-05-17 19:05:40', '2025-05-17 19:05:40'),
(77, 26, 2, 'Grocery shop with fresh local products.', '2025-05-17 19:05:40', '2025-05-17 19:05:40'),
(78, 26, 4, 'Lebensmittelgeschäft mit frischen lokalen Produkten.', '2025-05-17 19:05:40', '2025-05-17 19:05:40'),
(91, 31, 1, '📅 De febrero a junio. Los flamencos se alimentan y se reproducen aquí, aprovechando al máximo el entorno tranquilo.', '2025-05-18 12:15:46', '2025-05-18 22:04:17'),
(92, 32, 1, '📅 Todo el año, pico en invierno. Un destino de observación de aves de visita obligada, hogar de flamencos durante todo el año.', '2025-05-18 12:15:46', '2025-05-22 12:31:43'),
(93, 33, 1, '📅 Octubre a marzo. Un lugar de invernada clave para los flamencos, que es mejor visitarlo temprano en la mañana.', '2025-05-18 12:15:46', '2025-05-22 12:32:32'),
(94, 34, 1, '📅 Todo el año, pico en verano. Situado al pie del Peñón de Ifach, este salar ofrece una experiencia urbana de observación de aves.', '2025-05-18 12:15:46', '2025-05-22 12:31:43'),
(95, 35, 1, '📅 Abril a septiembre. Un lago salado rosado de fama mundial, donde miles de flamencos se reúnen en primavera y verano. El contraste entre el agua rosa vibrante y las delicadas siluetas de los flamencos lo convierte en una vista inolvidable, ¡y una de las favoritas absolutas de Instagram!', '2025-05-18 12:15:46', '2025-05-22 12:31:43'),
(98, 31, 2, '📅 February to June. Flamingos feed and breed here, taking full advantage of the tranquil surroundings', '2025-05-18 12:21:00', '2025-05-22 12:31:43'),
(99, 32, 2, '📅 Year-round, peak in winter. A must-visit birdwatching destination, home to flamingos all year.', '2025-05-18 12:21:00', '2025-05-22 12:31:43'),
(100, 33, 2, '📅 October to March. A key wintering ground for flamingos, best visited early in the morning.', '2025-05-18 12:21:00', '2025-05-22 12:32:32'),
(101, 34, 2, '📅 Year-round, peak in summer. Located at the foot of the Peñón de Ifach, this salt flat offers an urban birdwatching experience.', '2025-05-18 12:21:00', '2025-05-22 12:31:43'),
(102, 35, 2, '📅 April to September. A world-famous pink salt lake, where thousands of flamingos gather in spring and summer. The contrast between the vibrant pink water and the flamingos’ delicate silhouettes makes it an unforgettable sight—and an absolute Instagram favorite!', '2025-05-18 12:21:00', '2025-05-22 12:31:43'),
(103, 31, 3, '📅 Février à juin. Les flamants se nourrissent et se reproduisent ici, profitant pleinement du calme environnant.', '2025-05-18 12:34:54', '2025-05-22 12:31:43'),
(104, 32, 3, '📅 Toute l’année, pic en hiver. Un lieu incontournable pour l’observation des oiseaux, avec des flamants roses toute l’année.', '2025-05-18 12:34:54', '2025-05-22 12:31:43'),
(105, 33, 3, '📅 Octobre à mars. Un site d’hivernage clé pour les flamants, à visiter de préférence tôt le matin.', '2025-05-18 12:34:54', '2025-05-22 12:31:43'),
(106, 34, 3, '📅 Toute l’année, pic en été. Situé au pied du Peñón de Ifach, ce marais salant offre une expérience d’observation urbaine des oiseaux.', '2025-05-18 12:34:54', '2025-05-22 12:31:43'),
(107, 35, 3, '📅 Avril à septembre. Un lac rose mondialement connu où des milliers de flamants se rassemblent au printemps et en été. Le contraste entre l’eau rose éclatante et les silhouettes délicates des flamants crée un spectacle inoubliable — un favori absolu d’Instagram !', '2025-05-18 12:34:54', '2025-05-22 12:31:43'),
(108, 31, 4, '📅 Februar bis Juni. Flamingos fressen und brüten hier in aller Ruhe.', '2025-05-18 12:35:06', '2025-05-22 12:31:43'),
(109, 32, 4, '📅 Ganzjährig, Höhepunkt im Winter. Ein Muss für Vogelbeobachter – hier leben Flamingos das ganze Jahr über.', '2025-05-18 12:35:06', '2025-05-22 12:31:43'),
(110, 33, 4, '📅 Oktober bis März. Ein wichtiges Winterquartier für Flamingos, am besten früh morgens zu besuchen.', '2025-05-18 12:35:06', '2025-05-22 12:31:43'),
(111, 34, 4, '📅 Ganzjährig, Höhepunkt im Sommer. Am Fuße des Peñón de Ifach gelegen, bietet diese Saline ein städtisches Vogelbeobachtungserlebnis.', '2025-05-18 12:35:06', '2025-05-22 12:31:43'),
(112, 35, 4, '📅 April bis September. Ein weltberühmter rosa Salzsee, an dem sich im Frühling und Sommer Tausende von Flamingos versammeln. Der Kontrast zwischen dem lebhaften Rosa des Wassers und den zarten Silhouetten der Flamingos ist ein unvergesslicher Anblick – und ein absoluter Instagram-Hit!', '2025-05-18 12:35:06', '2025-05-22 12:31:43'),
(113, 31, 5, '📅 Februari tot juni. Flamingo’s voeden zich en broeden hier in alle rust.', '2025-05-18 12:35:19', '2025-05-22 12:31:43'),
(114, 32, 5, '📅 Hele jaar door, hoogtepunt in de winter. Een topbestemming voor vogelspotters met flamingo’s het hele jaar door.', '2025-05-18 12:35:19', '2025-05-22 12:31:43'),
(115, 33, 5, '📅 Oktober tot maart. Een belangrijk overwinteringsgebied voor flamingo’s, het best ’s ochtends vroeg te bezoeken.', '2025-05-18 12:35:19', '2025-05-22 12:31:43'),
(116, 34, 5, '📅 Hele jaar door, hoogtepunt in de zomer. Gelegen aan de voet van de Peñón de Ifach, biedt deze zoutvlakte een stedelijke vogelervaring.', '2025-05-18 12:35:19', '2025-05-22 12:31:43'),
(117, 35, 5, '📅 April tot september. Een wereldberoemd roze zoutmeer waar duizenden flamingo’s samenkomen in de lente en zomer. Het contrast tussen het levendige roze water en de sierlijke silhouetten van de flamingo’s is een onvergetelijk schouwspel – en een absolute Instagramfavoriet!', '2025-05-18 12:35:19', '2025-05-22 12:31:43'),
(118, 31, 6, '📅 С февраля по июнь. Фламинго кормятся и гнездятся здесь, наслаждаясь спокойной природой.', '2025-05-18 12:35:31', '2025-05-22 12:31:43'),
(119, 32, 6, '📅 Круглый год, пик — зимой. Обязательное место для наблюдения за птицами — фламинго здесь круглый год.', '2025-05-18 12:35:31', '2025-05-22 12:31:43'),
(120, 33, 6, '📅 С октября по март. Ключевое место зимовки фламинго, лучше всего приезжать рано утром.', '2025-05-18 12:35:31', '2025-05-22 12:31:43'),
(121, 34, 6, '📅 Круглый год, пик — летом. У подножия Пеньон-де-Ифач расположены солончаки с городской атмосферой для наблюдения за птицами.', '2025-05-18 12:35:31', '2025-05-22 12:31:43'),
(122, 35, 6, '📅 С апреля по сентябрь. Мирово известное розовое соленое озеро, где весной и летом собираются тысячи фламинго. Контраст между яркой розовой водой и изящными силуэтами птиц — это незабываемое зрелище и абсолютный фаворит в Instagram!', '2025-05-18 12:35:31', '2025-05-22 12:31:43'),
(123, 31, 7, '📅 Febbraio – Giugno. I fenicotteri si nutrono e si riproducono qui, approfittando della tranquillità dell’ambiente.', '2025-05-18 12:35:40', '2025-05-22 12:31:43'),
(124, 32, 7, '📅 Tutto l’anno, picco in inverno. Una meta imperdibile per il birdwatching, con fenicotteri presenti tutto l’anno.', '2025-05-18 12:35:40', '2025-05-22 12:31:43'),
(125, 33, 7, '📅 Ottobre – Marzo. Un importante sito di svernamento, ideale da visitare al mattino presto.', '2025-05-18 12:35:40', '2025-05-22 12:31:43'),
(126, 34, 7, '📅 Tutto l’anno, picco in estate. Ai piedi del Peñón de Ifach, questa salina offre un’esperienza urbana di birdwatching.', '2025-05-18 12:35:40', '2025-05-22 12:31:43'),
(127, 35, 7, '📅 Aprile – Settembre. Un famoso lago salato rosa dove migliaia di fenicotteri si radunano in primavera ed estate. Il contrasto tra l’acqua rosa brillante e le loro silhouette delicate è uno spettacolo indimenticabile — amatissimo su Instagram!', '2025-05-18 12:35:40', '2025-05-22 12:31:43'),
(128, 31, 8, '📅 2月到6月. 火烈鸟在这里觅食和繁殖，享受宁静的环境。', '2025-05-18 12:35:53', '2025-05-22 12:31:43'),
(129, 32, 8, '📅 全年可见，冬季最旺. 观鸟必去之地，一年四季都有火烈鸟。', '2025-05-18 12:35:53', '2025-05-22 12:31:43'),
(130, 33, 8, '📅 10月至3月. 火烈鸟的重要越冬地，清晨是最佳观赏时间。', '2025-05-18 12:35:53', '2025-05-22 12:31:43'),
(131, 34, 8, '📅 全年可见，夏季高峰. 位于伊法克巨岩脚下，这片盐田提供城市中的观鸟体验。', '2025-05-18 12:35:53', '2025-05-22 12:31:43'),
(132, 35, 8, '📅 4月至9月. 世界著名的粉红盐湖，每年春夏吸引成千上万只火烈鸟。粉红湖水与火烈鸟优雅身影的对比令人难忘——堪称Instagram的宠儿！', '2025-05-18 12:35:53', '2025-05-22 12:31:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `native_name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `iso2` char(2) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `languages`
--

INSERT INTO `languages` (`id`, `name`, `native_name`, `created_at`, `updated_at`, `iso2`) VALUES
(1, 'Spanish', 'Español', '2025-05-17 14:35:54', '2025-05-22 14:05:40', 'es'),
(2, 'English', 'English', '2025-05-17 14:35:54', '2025-05-22 14:05:45', 'en'),
(3, 'French', 'Français', '2025-05-17 14:35:54', '2025-05-22 14:05:47', 'fr'),
(4, 'German', 'Deutsch', '2025-05-17 14:35:54', '2025-05-22 14:05:50', 'de'),
(5, 'Dutch', 'Nederlands', '2025-05-17 14:35:54', '2025-05-22 14:05:52', 'nl'),
(6, 'Russian', 'Русский', '2025-05-17 14:35:54', '2025-05-22 14:05:56', 'ru'),
(7, 'Italian', 'Italiano', '2025-05-17 14:35:54', '2025-05-22 14:05:59', 'it'),
(8, 'Chinese', '中文', '2025-05-17 14:35:54', '2025-05-22 14:06:01', 'cn');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `markers`
--

CREATE TABLE `markers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `latitude` decimal(10,7) NOT NULL,
  `longitude` decimal(10,7) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `opening_hours` text DEFAULT NULL,
  `google_maps_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `wp_user_login` varchar(100) DEFAULT NULL,
  `region` varchar(50) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `firm` varchar(50) DEFAULT NULL,
  `specialties` varchar(255) DEFAULT NULL,
  `google_rating` varchar(5) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `contact_clicks` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `markers`
--

INSERT INTO `markers` (`id`, `name`, `address`, `latitude`, `longitude`, `subcategory_id`, `icon`, `picture`, `language`, `website`, `email`, `phone`, `opening_hours`, `google_maps_url`, `created_at`, `updated_at`, `wp_user_login`, `region`, `town`, `firm`, `specialties`, `google_rating`, `description`, `contact_clicks`) VALUES
(1, 'Restaurante Ovni', 'N-332, km 124, 03560 El Campello, Alicante', 38.4572320, -0.3612482, 801, NULL, 'https://app.flamencos.eu/images/markers/ovni.jpg', NULL, NULL, 'RESTAURANTEOVNI124@GMAIL.COM', '+34689778878123456', '09:00 - 23:00|09:00 - 23:00|09:00 - 23:00|09:00 - 23:00|09:00 - 00:00|09:00 - 00:00|09:00 - 22:00|', 'https://www.google.com/maps/dir//Restaurante+Ovni,+N-332,+km+124,+03560+El+Campello,+Alicante/@38.4574106,-0.4024909,13z/', '2025-05-17 19:05:40', '2025-07-13 18:21:50', 'restaurante_ovni', NULL, 'El Campello', NULL, 'BBQ', NULL, NULL, 10),
(2, 'Restaurante Manolete', 'Av. de Niza, 21, 03540 Alicante', 38.3737697, -0.4106161, 801, NULL, NULL, NULL, NULL, 'restaurante_manolete@flamencos.eu', '965 26 00 53', '10:00–16:30|10:00–16:30|10:00–16:30|10:00–16:30|10:00–16:30|10:00–16:30|10:00–16:30', 'https://www.google.es/maps/dir//Manolete+Restaurante,+Av.+de+Niza,+21,+03540+Alicante/@38.3737656,-0.4133198,16z/', '2025-05-17 19:05:40', '2025-07-11 18:39:51', 'restaurante_manolete', 'Alicante', 'San Juan Playa', NULL, 'Seafood', NULL, NULL, 0),
(3, 'Pizzeria Popeye', 'Av. Santander 21, 03540 Alicante', 38.3701028, -0.4143826, 801, NULL, NULL, NULL, 'http://www.pizzeriapopeyeplayadesanjuan.es/', 'pizzeria_popeye@flamencos.eu', '965154005', '-|-|-|6:30-11:30|6:30-11:30|6:30-11:30|6:30-11:30', 'https://www.google.es/maps/dir//Pizzeria+Popeye+Playa+de+San+Juan,+Av.+Santander,+Nº+21,+03540+Alicante/@38.3700892,-0.4170619,16z/', '2025-05-17 19:05:40', '2025-07-11 22:41:42', 'pizzeria_popeye', 'Alicante', 'San Juan Playa', NULL, 'Pizza', NULL, NULL, 2),
(6, 'Cala de la Palmera', 'C. Pez Espada, 9, 03540 Alicante', 38.3519952, -0.4120349, 901, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://www.google.es/maps/dir//Cala+de+la+Palmera,+C.+Pez+Espada,+9,+03540+Alicante/@38.352311,-0.4165167,904m/', '2025-05-17 19:05:40', '2025-07-11 18:54:11', 'cala_palmera', NULL, NULL, NULL, NULL, NULL, NULL, 1),
(7, 'Cala del Llop Marí', 'Av. de Cova del Llop Marí, 18, 03560 El Campello, Alicante', 38.4382933, -0.3765821, 901, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://www.google.es/maps/dir//Cala+del+Llop+Marí,+Av.+de+Cova+del+Llop+Marí,+18,+03560+El+Campello,+Alicante/@38.4385066,-0.3770333,199m/', '2025-05-17 19:05:40', '2025-07-11 18:54:14', 'cala_llop_mari', NULL, NULL, NULL, NULL, NULL, NULL, 1),
(11, 'Torre de Reixes', 'Lomas de Rejas, 03560 El Campello, Alicante', 38.4612090, -0.3397421, 902, NULL, NULL, NULL, 'https://www.elcampelloturismo.com/poi/44/3/396/folder/asc/7.-torre-de-lloma-de-reixes-o-barranc-d%27aig%C3%BCes', 'torre_reixes@flamencos.eu', '+34 96 563 72 00', NULL, 'https://www.google.com/maps/dir//Torre+de+Reixes,+Lomas+de+Rejas,+03560+El+Campello,+Alicante/@38.4609955,-0.3401871,319m/', '2025-05-17 19:05:40', '2025-07-11 23:08:41', 'torre_reixes', NULL, 'El Campello', NULL, 'Monument', NULL, NULL, 7),
(12, 'Serra Grossa', 'C. Serragrosa (Paraje), 03016 Alicante', 38.3614395, -0.4534480, 902, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://www.google.com/maps/dir//Mirador+de+la+Serra+Grossa,+C.+Serragrosa+(Paraje),+03016+Alicante/@38.3616844,-0.4546137,19z/dat', '2025-05-17 19:05:40', '2025-07-11 18:54:54', 'serra_grossa', NULL, NULL, NULL, NULL, NULL, NULL, 1),
(13, 'Cabeçó', '03111, Alicante', 38.5280627, -0.3953097, 902, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://www.google.com/maps/dir//Cabeçó+d\'Or,+38°31\'42.+0°23\'41.,+Calle+3,+1N,+03400+Villena,+Alicante/@38.5282856,-0.3966117,492m/', '2025-05-17 19:05:40', '2025-07-11 22:14:04', 'cabeco_dor', NULL, NULL, NULL, NULL, NULL, NULL, 4),
(16, 'Beach Volley Playa de San Juan', 'Av. de Niza, 25, 03540 Alicante', 38.3761164, -0.4099357, 710, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://www.google.com/maps/dir//Marito+Beach+Volley,+Av.+de+Niza,+25,+03540+Alicante/@38.3761283,-0.4110026,402m/', '2025-05-17 19:05:40', '2025-07-11 18:53:49', 'sanjuan_playa_bv', 'Alicante', 'San Juan Playa', NULL, NULL, NULL, NULL, 2),
(17, 'Hipódromo Alicante', 'Carrer Camí de Ronda, 18, 03009 Alacant, Alicante', 38.3552141, -0.4921233, 706, NULL, NULL, NULL, NULL, NULL, '+34 965246178', NULL, 'https://www.google.com/maps/dir//Hipódromo+de+Alicante,+03009+Alacant,+Alicante/@38.3560374,-0.4948551,1358a,35y,3h/', '2025-05-17 19:05:40', '2025-07-11 18:53:51', 'hipodromo_alicante', NULL, 'Alicante', NULL, 'Basketball, Football, Calisthenics, Running', NULL, NULL, 2),
(18, 'Altea Club de Golf', 'Calle Ficticia 3, Alicante', 38.6340493, -0.0376293, 701, NULL, NULL, NULL, 'http://www.alteaclubdegolf.com/', 'golf_altea@flamencos.eu', 'http://www.alteaclubdegolf.com/', NULL, 'https://www.google.com/maps/dir//Altea+Club+de+Golf,+Urbanización+Sierra+Altea+s%2Fn,+Club+de+Golf,+03695,+03599+Altea+la+Vella,+Alicante/@38.6348968,-0.0400774,759m/', '2025-05-17 19:05:40', '2025-07-11 18:53:47', 'golf_altea', 'Marina Baixa', 'Altea', NULL, NULL, NULL, NULL, 1),
(21, 'HLA Clínica Vistahermosa', 'Avinguda de Dénia, 103, 03015 Alacant, Alicante', 38.3630505, -0.4639591, 501, NULL, NULL, NULL, '', NULL, '', NULL, 'www.google.com/maps/dir//HLA+Clínica+Vistahermosa,+Avinguda+de+Dénia,+103,+03015+Alicante/@38.3633555,-0.4645622,260m/', '2025-05-17 19:05:40', '2025-07-11 18:51:15', 'clinica_vista_hermosa', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(26, 'Mercadillo El Campello', 'Avinguda Ausiàs March, 03560 El Campello, Alicante', 38.4233959, -0.3999432, 804, NULL, NULL, NULL, NULL, 'mercadillo_campello@flamencos.eu', NULL, NULL, 'https://www.google.com/maps/dir//Mercadillo+de+los+domingos+El+Campello,+Avinguda+Ausi%C3%A0s+March,+03560+El+Campello,+Alicante/@38.4235409,-0.400322,161m/', '2025-05-17 19:05:40', '2025-07-11 18:20:05', 'mercadillo_campello', NULL, 'El Campello', NULL, 'Local', NULL, NULL, 0),
(31, 'Marjal de Pego-Oliva', 'Marjal de Pego-Oliva, 46780, València', 38.8674481, -0.0485515, 903, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://www.google.com/maps/dir//Parque+Natural+de+la+Marjal+de+Pego-Oliva/@38.8675495,-0.1430646,12z/', '2025-05-18 12:15:46', '2025-07-11 18:55:01', 'marjal_pego', NULL, NULL, NULL, NULL, NULL, NULL, 2),
(32, 'Parque Natural El Hondo', '03293 Elx, Alacant', 38.1879845, -0.7912449, 903, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://www.google.com/maps/dir//Parque+Natural+El+Hondo,+03293+Elche,+Alicante/@38.1879845,-0.8102993,4002m/', '2025-05-18 12:15:46', '2025-07-11 18:54:52', 'parque_hondo', NULL, NULL, NULL, NULL, NULL, NULL, 1),
(33, 'Las Salinas - Santa Pola', 'Salines de Santa Pola, 03130, Alacant', 38.1936501, -0.6156794, 903, NULL, NULL, NULL, '', NULL, '', NULL, 'https://www.google.com/maps/dir//Salinas+de+Sta.+Pola,+03130,+Alicante/@38.1856194,-0.6290602,1001m/', '2025-05-18 12:15:46', '2025-07-11 18:54:19', 'salinas_santa_pola', NULL, NULL, NULL, NULL, NULL, NULL, 1),
(34, 'Las Salinas - Calpe', 'Av de los Ejércitos Españoles, 29-53, 03710 Calpe, Alicante', 38.6422204, 0.0657949, 903, NULL, NULL, NULL, '', NULL, '', NULL, 'www.google.com/maps/dir//Salinas+de+Calpe,+03710+Les+Salines,+Alicante/@38.6444709,0.0636361,994m/', '2025-05-18 12:15:46', '2025-07-11 18:54:16', 'salinas_calpe', NULL, NULL, NULL, NULL, NULL, NULL, 1),
(35, 'Parque Natural de Las Lagunas de La Mata y Torrevieja', 'Ctra. Nacional, s/n, 03188 Torrevieja, Alicante', 38.0244525, -0.6579908, 903, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://www.google.com/maps/dir//Parque+Natural+de+Las+Lagunas+de+La+Mata+y+Torrevieja,+Ctra.+Nacional,+s%2Fn,+03188+Torrevieja,+Alicante/@38.0244567,-0.6605657,1003m/', '2025-05-18 12:15:46', '2025-07-11 18:54:50', 'parque_lagunas_torrevieja', NULL, NULL, NULL, NULL, NULL, NULL, 1),
(38, 'Piscifactoría - Baños de La Reina', 'C. Sant Bartomeu, 177, 03560 El Campello, Alicante', 38.4314625, -0.3805236, 901, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://www.google.es/maps/dir//Piscifactor%C3%ADa+romana+de+Ba%C3%B1os+de+la+Reina,+C.+Sant+Bartomeu,+177,+03560+El+Campello,+Alicante/@38.4315845,-0.3852658,17z/data=!4m18!1m8!3m7!1s0xd623b0312c188f5:0xa6d56471c75399e0!2sPiscifactor%C3%ADa+romana+de+Ba%', '2025-05-22 16:32:42', '2025-07-11 18:54:53', 'piscifactoria_banos_reina', NULL, NULL, NULL, NULL, NULL, NULL, 1),
(40, 'María Carrasco Abogados', 'C. Valdes 8', 38.4572320, -0.4106161, 101, NULL, NULL, 'Español, English', 'https://mariacarrascoabogada.com/', 'info@mariacarrascoabogada.com', '+34626197768', NULL, NULL, '2025-07-10 20:21:49', '2025-07-11 23:07:15', 'maria_carrasco', NULL, 'Alicante', NULL, 'Real Estate, Commercial', NULL, 'Boutique law firm specializing in real estate and commercial law for local and international clients.', 18),
(41, 'Quiroga Sánchez', 'Av. Maisonnave Nº 46, 3D (03003)', 38.3434162, -0.4941276, 101, NULL, NULL, 'Español, English', 'https://legalpenal.es', 'info@legalpenal.es', '+34 965 31 38 34', NULL, 'https://www.google.com/maps/dir//Av.+Maisonnave,+46,+3-D,+03003+Alacant/', '2025-07-10 20:26:09', '2025-07-12 16:47:35', 'sebastian_ospina', NULL, 'Alicante', NULL, 'Criminal Law', NULL, 'We support our clients throughout the entire criminal process, both during the investigation phase and the trial. From the moment the complaint is filed, our team is available to assist the client.', 10),
(42, 'Maria Solana Abogados', 'Calle Tridente 12, Office 6, 03540 Alicante', 38.3599693, -0.4239164, 101, NULL, 'https://mariasolana.com/wp-content/uploads/2023/07/logo-color.svg', 'Español, English', 'https://mariasolana.com/', 'lawyer@mariasolana.com', '+34 649 55 90 22', NULL, 'https://www.google.com/maps/dir//C.+Trident,+12,+Oficina+6,+03540+Alicante/@38.3599407,-0.5063174,12z/data=!4m8!4m7!1m0!1m5!1m1!1s0xd6239ee89b118b7:0x64e29c360fd6884!2m2!1d-0.4239164!2d38.3599695?entry=ttu&g_ep=EgoyMDI1MDcwOC4wIKXMDSoASAFQAw%3D%3D', '2025-07-10 22:00:45', '2025-07-12 18:17:41', 'maria_solana', NULL, 'Alicante', 'Maria Solana Seguí', 'Real Estate, Inheritance', NULL, 'Expert in property and inheritance law, renowned for 360° legal assessment and international client service.', 22),
(43, 'Adolfo Valor Gil', 'Calle Gambo, 6, Benidorm', 38.5366784, -0.1277430, 101, NULL, NULL, 'Español, English, Français', NULL, 'adolfovalor@ctv.es', '+34 966 804 952', NULL, 'https://www.google.com/maps/dir//C.+Gambo,+6,+03503+Benidorm,+Alicante/@38.5366799,-0.1303126,17z', '2025-07-11 13:49:52', '2025-07-13 18:18:30', 'adolfo_valor', 'Marina Baixa', 'Benidorm', NULL, 'Commercial, Civil', NULL, 'Experienced in commercial and civil law, offering legal advice to companies and individuals.', 15),
(44, 'Rojano Reyes Abogados', 'Calle Benicassim, nº2-2, Entlo-3, 03202 Elche, Alicante', 38.2685602, -0.6883299, 101, NULL, NULL, 'Español, English', 'https://rojanoabogados.es/', 'info@rojanoabogados.es', '+34 966 67 45 07', NULL, 'https://www.google.com/maps/place/Rojano+Abogados/@38.2686089,-0.688595,20.41z/', '2025-07-11 14:49:48', '2025-07-12 16:46:24', 'rojano_reyes', 'Elche, Alicante, Murcia', NULL, NULL, 'Multidisciplinay', NULL, 'Banking Law, Labor and Social Security, Inheritance Law, Debtor List Disputes, Medical Negligence, Civil and Criminal Law', 7),
(45, 'Carlos Baño León', 'C/ Pintor Lorenzo Casanova, 66, 1° A 03003 Alicante', 38.3405531, -0.4934434, 101, NULL, NULL, 'Español, English', 'https://cbleon-abogados.com/', 'mail@cbleon-abogados.com', '+34965921853', NULL, 'https://www.google.com/maps/dir//C%252F+Pintor+Lorenzo+Casanova,+66,+03003+Alacant,+Alicante/', '2025-07-11 17:26:34', '2025-07-12 17:07:10', 'carlos_bano', NULL, 'Alicante', NULL, 'Real Estate, Commercial, Inheritance, Immigration', NULL, 'More than 35 years’ experience in real estate, commercial, inheritance, and immigration law. Personalized, innovative service.', 6),
(46, 'Ignacio Campos Abogados', 'Avda. Ramón y Cajal, nº 3, 3º Izqda. 03001 ALICANTE', 38.3417731, -0.4869166, 101, NULL, NULL, 'Español, English', 'https://www.icamposabogados.com/contacto.php', 'abogados@ignaciocampos.es', '+34 965212144', NULL, 'https://www.google.com/maps/dir//38.3417731,-0.4869166/', '2025-07-11 17:45:06', '2025-07-12 17:01:17', 'ignacio_campos', NULL, 'Alicante', NULL, 'Civil, Criminal, Commercial, Administrative', NULL, 'Experienced in civil, criminal, commercial, and administrative law, serving both local and international clients.', 1),
(47, 'Ayela Abogados', 'Avda. Juan Bautista Lafora 3, Entlo. - 03002 Alicante', 38.3449896, -0.4795995, 101, NULL, NULL, 'Español, English, Français', 'https://ayela-abogados.com/', 'legal@ayela-abogados.com', '+34 965 205 333', NULL, 'https://www.google.com/maps/dir//Avinguda+Juan+Bautista+Lafora,+3,+03002+Alacant,+Alicante', '2025-07-11 20:33:55', '2025-07-12 17:51:33', 'ayela_abogados', NULL, 'Alicante', NULL, 'Multidisciplinay', NULL, 'We are a professional law firm with over 40 years of experience in the legal field, made up of a multidisciplinary team highly specialized in various areas of law.', 3),
(48, 'MSG Legal', 'Calle Reyes Católicos 31, 1 st floor. A. 03003. Alicante', 38.3420433, -0.4909859, 101, NULL, NULL, 'Español, English', 'http://info@msg.legal', 'msg@flamencos.eu', '+34 965 13 03 41', NULL, 'https://www.google.com/maps/dir//MSG+LEGAL+SOLICITORS,+C.+Reyes+Cat%C3%B3licos,+31,+1%C2%BA+A,+03003+Alicante/@38.3420625,-0.4958569,17z/', '2025-07-11 20:42:05', '2025-07-12 16:51:27', 'msg_legal', NULL, NULL, NULL, 'Civil, Real Estate, Inheritance, Commercial', NULL, 'Independent solicitors with 20+ years in real estate, known for personalized, bilingual service.', 0),
(49, 'Sergi Valls', NULL, 0.0000000, 0.0000000, 0, NULL, NULL, NULL, NULL, 'flamencos.eu.sergi@gmail.com', NULL, NULL, NULL, '2025-07-12 12:39:20', '2025-07-12 12:39:20', 'Sergi Valls', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(50, 'Albir Abogados', 'Av. Comunitat Valenciana, 7, 03590 Altea', 38.6034340, -0.0486570, 101, NULL, NULL, 'Español, English, Français, Deutsch, Polski', 'https://www.albirabogados.com/', 'info@albirabogados.com', '+34 966 88 51 91', NULL, 'https://www.google.com/maps/dir//Albir+Abogados,+03581,+Alicante/@38.573831,-0.0720682,17z/', '2025-07-12 13:40:38', '2025-07-12 13:42:48', 'albir_abogados', 'Marina Baixa', 'Altea', NULL, 'Real Estate, Inheritance', NULL, 'International law firm in Altea, specializing in real estate, inheritance, and litigation, serving clients worldwide.', 1),
(51, 'Hessler & Del Cuerpo', 'Gran Vía del Escultor Francisco Salzillo, 4, Planta 8, 30004 Murcia', 37.9865611, -1.1320153, 101, NULL, NULL, 'Español, English, Deutsch', 'https://www.hesslerdelcuerpo.com/', 'info@hesslerdelcuerpo.com', '+34 968 178 158', NULL, NULL, '2025-07-12 13:49:01', '2025-07-12 13:55:20', 'hessler', 'Murcia, Torrevieja, Alicante', NULL, NULL, 'Real Estate, Inheritance', NULL, 'Law firm with nearly a decade of experience in real estate and inheritance law.', 0),
(52, 'Bataller, Ferrando & Kruithof Abogados', 'Plaza Archiduque Carlos, nº 5 - 3º pta. 10ª, Dénia', 38.8376150, 0.1059500, 101, NULL, NULL, 'Español, Nederlands, English, Deutsch, Français, Valencià', 'https://www.batalleradvocats.es', 'bfk@batalleradvocats.es', '+34 965 78 36 49', NULL, 'https://www.google.com/maps/dir//Bataller,+Ferrando+%2526+Kruithof,+Pl.+Arxiduc+Carles,+5,+3-10-11,+03700+D%C3%A9nia,+Alicante/', '2025-07-12 13:58:47', '2025-07-12 17:46:03', 'bataller', 'Marina Alta', 'Denia', NULL, 'Civil, Criminal, Family', NULL, 'Multidisciplinary firm, 20+ years advising European clients in Dutch, English, German, French, Spanish, Valencian.', 2),
(53, 'Devesa Law', 'Paseo de la Explanada de España, 1, 3º derecha 03002 · Alicante', 38.3444494, -0.4807284, 101, NULL, NULL, 'Español, English', 'https://www.devesa.law/', 'administracion@devesa.law', '+34 96 529 61 80', NULL, 'https://www.google.com/maps/dir//Devesa+Abogados,+Passeig+Esplanada+d\'Espanya,+1,+3%C2%BA+derecha,+03002+Alicante/@38.3446969,-0.4821439,16.81z/', '2025-07-12 14:44:27', '2025-07-12 17:05:20', 'devesa_law', NULL, 'Alicante', NULL, 'Commercial, Real Estate, Inheritance', NULL, 'Specialists in commercial, real estate, and inheritance law, serving businesses and individuals.', 1),
(54, 'L&A Solicitors', 'Parque del Nervión, 129 03177 San Fulgencio Alicante', 38.1337653, -0.6762642, 103, NULL, NULL, 'Español, English', 'https://www.lasolicitors.com/', 'info@lasolicitors.com', '+34 965 419 017', NULL, 'https://www.google.com/maps/dir//L%2526A+Solicitors+Lawyers+and+Accountants-+Abogados,+Asesor%C3%ADa+fiscal,+laboral+y+contable,+Parque+del+Nervi%C3%B3n+129,+03177+San+Fulgencio,+Alicante/@38.1337616,-0.6788297,17z/', '2025-07-12 15:02:14', '2025-07-13 18:19:49', 'la_solicitor', 'Vega Baja', 'San Fulgencio', NULL, 'Real Estate, Commercial', NULL, 'Provides legal services in real estate and business law, with a focus on international clients.', 3),
(55, 'Garcia Garrido Studio', 'Avda del Pla 130, 1º, Office 5, 03730 Jávea', 38.7894287, 0.1724597, 101, NULL, NULL, 'Español, Nederlands, English, Deutsch, Italiano, Français', 'https://garciagarrido.com/', 'info@garciagarrido.com', '+34 966 460 858', NULL, 'https://www.google.com/maps/dir//Garc%C3%ADa+Garrido+Abogados,+Avinguda+del+Pla,+130,+03730+X%C3%A0bia,+Alicante/@38.7894162,0.1675888,17z/', '2025-07-12 15:34:26', '2025-07-12 17:03:04', 'garcia_garrido', 'Marina Alta', 'Xabia', NULL, 'Civil, Real Estate, Inheritance', NULL, 'International law firm, multilingual team, broad expertise in property and inheritance.', 1),
(56, 'Pellicer & Heredia Abogados', 'San Fernando 46 03001 Alicante', 38.3425565, -0.4863915, 101, NULL, NULL, 'Español, English, Deutsch, Français, Nederlands, Italiano, Pусский', 'https://www.pellicerheredia.com', 'info@pellicerheredia.com', '+34 965 480 737', NULL, 'https://www.google.com/maps/dir//Pellicer+%2526+Heredia+Abogados,+C.+San+Fernando,+46,+03001+Alicante/', '2025-07-12 15:58:32', '2025-07-12 16:49:26', 'pellicer_heredia', NULL, 'Alicante', NULL, 'Immigration, Real Estate, Inheritance', NULL, 'Highly recommended for immigration, real estate, and inheritance matters, with a multilingual team.', 1),
(57, 'Miguel Angel Colombo Abogado', 'Calle Mayor, 15 - 3º A - 03140 Guardamar del Segura Alicante', 38.0909537, -0.6548855, 101, NULL, NULL, 'Español, English', 'https://www.miguelangelcolombo.com/', 'mcolombo@icaorihuela.com', '+34 965729791', NULL, 'https://www.google.com/maps/place/Solicitor,+Miguel+%C3%81ngel+Colombo/@38.0910399,-0.655199,18.95z/', '2025-07-12 16:32:49', '2025-07-12 18:57:53', 'colombo_abogado', 'Vega Baja', 'Guardamar del Segura', NULL, 'Real Estate, Inheritance', NULL, 'Specialist in inheritance and real estate law, providing personalized legal advice.', 2),
(58, 'JLC Lawyers', 'Avda. Escandinavia, 72 C.C. Altomar II, L. 6-7-8, M-E 03130 Gran Alacant', 38.2244358, -0.5200280, 101, NULL, NULL, 'Español, English', 'https://jlcalawyers.com/', 'contact@jlcalawyers.com', '+34 966 698 796', NULL, 'https://www.google.com/maps/dir//JLCA+%2526+AS+Lawyers,+Avda.+Escandinavia,+72+C.C,+L.+6-7-8,+M-E,+03130+Gran+Alacant,+Alicante/@38.224527,-0.5203625,21z/', '2025-07-12 16:39:42', '2025-07-12 16:43:28', 'jlca_lawyers', 'Bajo Vinalopó', 'Gran Alacant', NULL, 'Real Estate, Inheritance, Immigration', NULL, 'International law firm with expertise in real estate, inheritance, and immigration for expats.', 2),
(59, 'Engel & Völkers Alicante', 'C/ Girona, 28, bajo, 03001 Alacant, Alicante', 38.3440054, -0.4871816, 201, NULL, NULL, 'Español, English, Deutsch, Français, Pусский', 'https://www.engelvoelkers.com/es/en/shops/alicante', NULL, '+34966287070', NULL, 'https://maps.app.goo.gl/7ZniH5dK76Vo1NfdA', '2025-07-17 08:16:08', '2025-07-17 08:16:08', 'engel_and_volkers', 'Alicante', NULL, NULL, NULL, NULL, NULL, 0),
(60, 'Altea Invest', 'Paseo del Mediterráneo, 4 03590 Altea', 38.6019609, -0.0455594, 201, NULL, NULL, 'Español, English, Deutsch, Français, Pусский', 'https://www.alteainvest.com', 'info@alteainvest.com', '+34 966 880 233', NULL, 'https://maps.app.goo.gl/HzDBHAnxpw3kKqx89', '2025-07-17 08:25:41', '2025-07-17 08:33:37', 'altea_invest', 'Marina Alta', 'Altea', NULL, NULL, NULL, NULL, 1),
(61, 'REMAX VISTA Torrevieja y El Campello', 'Paseo de la Libertad, 6, 03181 Torrevieja', 37.9749935, -0.6787462, 201, NULL, NULL, 'Español, English', 'https://www.vista.remax.es/', 'vista@remax.es', '+34 966 700 368', NULL, 'https://maps.app.goo.gl/T6dC1Sa6SsrD6Y618', '2025-07-17 08:32:01', '2025-07-17 08:32:01', 'remax', 'Bajo Vinalopó, Alicante', 'Torrevieja, El Campello', NULL, NULL, NULL, NULL, 0),
(62, 'Universidad de Alicante', 'Carr. de San Vicente del Raspeig, s/n, 03690 San Vicente del Raspeig, Alicante', 38.3846726, -0.5139505, 402, NULL, NULL, 'Español, English', 'https://www.ua.es', NULL, '+34965903400', NULL, 'https://maps.app.goo.gl/emQhf17AUrs9sjdf8', '2025-07-17 08:51:48', '2025-07-17 09:23:07', 'ua', NULL, 'Alicante', 'University', 'Social Sciences & Law, Engineering & Technology, Health Sciences, Sciences, Humanities & Arts', NULL, NULL, 5),
(63, 'Lycée Français', 'Camí de Marco, 21, 03560 El Campello, Alicante', 38.4015411, -0.4129248, 401, NULL, NULL, 'Français', 'https://mlfalicante.org/', NULL, '+34965262508', NULL, 'https://maps.app.goo.gl/2pkQ7q4FfN3zXwyg8', '2025-07-17 09:03:06', '2025-07-17 09:23:58', 'liceo_frances', NULL, 'El Campello', NULL, NULL, NULL, NULL, 0),
(64, 'King´s College', 'Gta. del Reino Unido, 5, 03008 Alicante', 38.3140507, -0.5213166, 401, NULL, NULL, 'English', 'http://alicante.kingscollegeschools.org/', NULL, '+34965106351', NULL, 'https://maps.app.goo.gl/p1U9Pqhp5HkAGXfL8', '2025-07-17 09:07:53', '2025-07-17 09:24:13', 'kings_college', 'Alicante', NULL, NULL, NULL, NULL, NULL, 0),
(65, 'Dalago Reformas', NULL, 38.4134956, -0.4458980, 304, NULL, NULL, 'Español, English, Português', 'https://www.dalagoreformas.com', 'ventas@dalagoreformas.com', '+34 600 88 84 62', NULL, 'https://maps.app.goo.gl/2EX3S7PBiDhm3KeB7', '2025-07-17 09:52:57', '2025-07-17 10:04:09', 'dalago_reformas', 'Alicante, Murcia', 'Bathrooms, Kitchens, Locals, Houses, Shops, AC', NULL, 'Plumber, Mason, Electrician', NULL, NULL, 3),
(66, 'JOSE ANTONIO BAZAN COB GENERALI', 'C/ LOS ALMENDROS, 26 - BAJO, 03710 CALPE', 38.6462618, 0.0460673, 602, NULL, NULL, 'Español, English', 'https://www.generali.es/agente/joseantoniobazan', 'J.BAZAN@GENERALIMEDIADORES.ES', '+34965838414', NULL, 'https://maps.app.goo.gl/UyeHYj3iakZndhfPA', '2025-07-17 13:25:21', '2025-07-17 15:32:36', 'jose_bazan_generalli', 'Alicante', NULL, NULL, 'Health, Car, House, Life, Travel,', NULL, NULL, 1),
(67, 'Caja Rural Central Campello', 'Carrer del Dr. Fleming, 46, 03560 El Campello, Alicante', 38.4285414, -0.3991142, 603, NULL, NULL, 'Español, English', 'https://www.ruralcentral.es/', NULL, '+34965634366', NULL, 'https://maps.app.goo.gl/L7Z5oYcqcxFeHcPd7', '2025-07-17 15:58:26', '2025-07-17 15:58:26', 'crc_campello', 'Alicante', NULL, NULL, 'Savings Account, Credit Card, Investments Accounts, Pension Funds', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reviews`
--

CREATE TABLE `reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `wp_user_login_reviewer` varchar(100) NOT NULL,
  `wp_user_login_marker` varchar(100) NOT NULL,
  `rating` tinyint(4) NOT NULL CHECK (`rating` between 1 and 5),
  `comment` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `reviews`
--

INSERT INTO `reviews` (`id`, `wp_user_login_reviewer`, `wp_user_login_marker`, `rating`, `comment`, `created_at`, `updated_at`) VALUES
(1, 'sergio', 'restaurante_ovni', 4, 'agradable', '2025-05-21 12:42:52', '2025-05-21 12:43:23'),
(2, 'alex', 'restaurante_ovni', 5, 'Delicioso!', '2025-05-21 12:44:38', '2025-05-21 12:44:38'),
(3, 'flamencos.eu', 'restaurante_ovni', 5, 'Love the bbq, staff is friendly, and there\'s often live music or karaoke. My kind of place', '2025-05-21 13:16:18', '2025-05-22 22:03:41'),
(4, 'flamencos.eu', 'marjal_pego', 5, 'Spectacular', '2025-05-22 13:28:06', '2025-05-22 13:28:06'),
(5, 'flamencos.eu', 'torre_reixes', 4, 'Muy buenas vistas de la Costa Blanca. Pendiente moderada/alta. No hay un camino marcado.', '2025-05-22 22:06:24', '2025-05-22 22:06:24'),
(6, 'flamencos.eu', 'salinas_calpe', 4, 'Los flamencos preciosos aunque díficil el acceso', '2025-05-23 14:37:17', '2025-05-23 14:37:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `search_terms`
--

CREATE TABLE `search_terms` (
  `id` int(11) NOT NULL,
  `marker_id` int(11) NOT NULL,
  `search_term` text NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `search_terms`
--

INSERT INTO `search_terms` (`id`, `marker_id`, `search_term`, `created_at`, `updated_at`) VALUES
(1, 1, 'hamburger', '2025-05-19 18:20:26', '2025-05-19 18:20:26'),
(2, 1, 'french fries', '2025-05-19 18:20:26', '2025-05-19 18:20:26'),
(3, 1, 'bbq', '2025-05-19 18:20:26', '2025-05-19 18:20:26'),
(4, 1, 'barbeque', '2025-05-19 18:20:26', '2025-05-19 18:20:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `search_term_translations`
--

CREATE TABLE `search_term_translations` (
  `translation_id` int(11) NOT NULL,
  `search_term_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text_translation` text NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `search_term_translations`
--

INSERT INTO `search_term_translations` (`translation_id`, `search_term_id`, `language_id`, `text_translation`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'hamburguesa', '2025-05-19 18:21:57', '2025-05-19 18:21:57'),
(2, 1, 2, 'hamburger', '2025-05-19 18:21:57', '2025-05-19 18:21:57'),
(3, 1, 3, 'hamburger', '2025-05-19 18:21:57', '2025-05-19 18:21:57'),
(4, 1, 4, 'Hamburger', '2025-05-19 18:21:57', '2025-05-19 18:21:57'),
(5, 1, 5, 'hamburger', '2025-05-19 18:21:57', '2025-05-19 18:21:57'),
(6, 1, 6, 'гамбургер', '2025-05-19 18:21:57', '2025-05-19 18:21:57'),
(7, 1, 7, 'hamburger', '2025-05-19 18:21:57', '2025-05-19 18:21:57'),
(8, 1, 8, '汉堡包', '2025-05-19 18:21:57', '2025-05-19 18:21:57'),
(9, 2, 1, 'patatas fritas', '2025-05-19 18:21:57', '2025-05-19 18:21:57'),
(10, 2, 2, 'french fries', '2025-05-19 18:21:57', '2025-05-19 18:21:57'),
(11, 2, 3, 'frites', '2025-05-19 18:21:57', '2025-05-19 18:21:57'),
(12, 2, 4, 'Pommes frites', '2025-05-19 18:21:57', '2025-05-19 18:21:57'),
(13, 2, 5, 'friet', '2025-05-19 18:21:57', '2025-05-19 18:21:57'),
(14, 2, 6, 'картошка фри', '2025-05-19 18:21:57', '2025-05-19 18:21:57'),
(15, 2, 7, 'patatine fritte', '2025-05-19 18:21:57', '2025-05-19 18:21:57'),
(16, 2, 8, '薯条', '2025-05-19 18:21:57', '2025-05-19 18:21:57'),
(17, 3, 1, 'barbacoa', '2025-05-19 18:21:57', '2025-05-19 18:21:57'),
(18, 3, 2, 'bbq', '2025-05-19 18:21:57', '2025-05-19 18:21:57'),
(19, 3, 3, 'barbecue', '2025-05-19 18:21:57', '2025-05-19 18:21:57'),
(20, 3, 4, 'Grillen', '2025-05-19 18:21:57', '2025-05-19 18:21:57'),
(21, 3, 5, 'bbq', '2025-05-19 18:21:57', '2025-05-19 18:21:57'),
(22, 3, 6, 'барбекю', '2025-05-19 18:21:57', '2025-05-19 18:21:57'),
(23, 3, 7, 'bbq', '2025-05-19 18:21:57', '2025-05-19 18:21:57'),
(24, 3, 8, '烧烤', '2025-05-19 18:21:57', '2025-05-19 18:21:57'),
(25, 4, 1, 'barbacoa', '2025-05-19 18:21:57', '2025-05-19 18:21:57'),
(26, 4, 2, 'barbecue', '2025-05-19 18:21:57', '2025-05-19 18:21:57'),
(27, 4, 3, 'barbecue', '2025-05-19 18:21:57', '2025-05-19 18:21:57'),
(28, 4, 4, 'Barbecue', '2025-05-19 18:21:57', '2025-05-19 18:21:57'),
(29, 4, 5, 'barbecue', '2025-05-19 18:21:57', '2025-05-19 18:21:57'),
(30, 4, 6, 'барбекю', '2025-05-19 18:21:57', '2025-05-19 18:21:57'),
(31, 4, 7, 'barbecue', '2025-05-19 18:21:57', '2025-05-19 18:21:57'),
(32, 4, 8, '烧烤', '2025-05-19 18:21:57', '2025-05-19 18:21:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategories`
--

CREATE TABLE `subcategories` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `icon_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `subcategories`
--

INSERT INTO `subcategories` (`id`, `category_id`, `name`, `icon_url`, `created_at`, `updated_at`) VALUES
(101, 1, 'Lawyers', 'https://app.flamencos.eu/images/categories/flamencos.png', '2025-07-10 14:23:53', '2025-07-10 21:26:53'),
(102, 1, 'Consultants', 'https://app.flamencos.eu/images/categories/flamencos.png', '2025-07-10 14:23:53', '2025-07-10 21:26:56'),
(103, 1, 'Gestors', 'https://app.flamencos.eu/images/categories/flamencos.png', '2025-07-10 14:23:53', '2025-07-10 21:26:58'),
(201, 2, 'Real Estate Agencies', 'https://app.flamencos.eu/images/categories/flamencos.png', '2025-07-10 14:23:53', '2025-07-10 14:23:53'),
(202, 2, 'Property Management', 'https://app.flamencos.eu/images/categories/flamencos.png', '2025-07-10 14:23:53', '2025-07-10 14:23:53'),
(301, 3, 'Electrician', 'https://app.flamencos.eu/images/categories/flamencos.png', '2025-07-10 14:23:53', '2025-07-10 14:23:53'),
(302, 3, 'Plumber', 'https://app.flamencos.eu/images/categories/flamencos.png', '2025-07-10 14:23:53', '2025-07-10 14:23:53'),
(303, 3, 'Mason', 'https://app.flamencos.eu/images/categories/flamencos.png', '2025-07-10 14:23:53', '2025-07-10 14:23:53'),
(304, 3, 'Contractor', 'https://app.flamencos.eu/images/categories/flamencos.png', '2025-07-10 14:23:53', '2025-07-10 14:23:53'),
(401, 4, 'Schools', 'https://app.flamencos.eu/images/categories/flamencos.png', '2025-07-10 14:23:53', '2025-07-10 14:23:53'),
(402, 4, 'Universities', 'https://app.flamencos.eu/images/categories/flamencos.png', '2025-07-10 14:23:53', '2025-07-10 14:23:53'),
(501, 5, 'Hospitals', 'https://app.flamencos.eu/images/categories/flamencos.png', '2025-07-10 14:23:53', '2025-07-10 14:23:53'),
(502, 5, 'Pharmacies', 'https://app.flamencos.eu/images/categories/flamencos.png', '2025-07-10 14:23:53', '2025-07-10 14:23:53'),
(601, 6, 'Tax', 'https://app.flamencos.eu/images/categories/flamencos.png', '2025-07-10 14:23:53', '2025-07-10 14:23:53'),
(602, 6, 'Insurance', 'https://app.flamencos.eu/images/categories/flamencos.png', '2025-07-10 14:23:53', '2025-07-10 14:23:53'),
(603, 6, 'Banking', 'https://app.flamencos.eu/images/categories/flamencos.png', '2025-07-10 14:23:53', '2025-07-10 14:23:53'),
(701, 7, 'Golf', 'https://app.flamencos.eu/images/categories/flamencos.png', '2025-07-10 13:06:00', '2025-07-10 13:06:00'),
(702, 7, 'Nautic Club', 'https://app.flamencos.eu/images/categories/flamencos.png', '2025-07-10 13:06:00', '2025-07-10 13:06:00'),
(703, 7, 'Casino', 'https://app.flamencos.eu/images/categories/flamencos.png', '2025-07-10 13:06:00', '2025-07-10 13:06:00'),
(704, 7, 'Fishing', 'https://app.flamencos.eu/images/categories/flamencos.png', '2025-07-10 13:06:00', '2025-07-10 13:06:00'),
(705, 7, 'Surf', 'https://app.flamencos.eu/images/categories/flamencos.png', '2025-07-10 13:06:00', '2025-07-10 13:06:00'),
(706, 7, 'Gym/Sports Center', 'https://app.flamencos.eu/images/categories/flamencos.png', '2025-07-10 13:06:00', '2025-07-11 18:27:34'),
(707, 7, 'Tennis', 'https://app.flamencos.eu/images/categories/flamencos.png', '2025-07-10 13:06:00', '2025-07-10 13:06:00'),
(708, 7, 'Basketball', 'https://app.flamencos.eu/images/categories/flamencos.png', '2025-07-10 13:06:00', '2025-07-10 13:06:00'),
(709, 7, 'Football', 'https://app.flamencos.eu/images/categories/flamencos.png', '2025-07-10 13:06:00', '2025-07-10 13:06:00'),
(710, 7, 'Volleyball', 'https://app.flamencos.eu/images/categories/flamencos.png', '2025-07-10 13:06:00', '2025-07-10 13:06:00'),
(711, 7, 'Swimming pool', 'https://app.flamencos.eu/images/categories/flamencos.png', '2025-07-10 13:06:00', '2025-07-10 13:06:00'),
(712, 7, 'Hiking', 'https://app.flamencos.eu/images/categories/flamencos.png', '2025-07-10 13:06:00', '2025-07-10 13:06:00'),
(713, 7, 'Climbing', 'https://app.flamencos.eu/images/categories/flamencos.png', '2025-07-10 13:06:00', '2025-07-10 13:06:00'),
(801, 8, 'Restaurants', 'https://app.flamencos.eu/images/categories/flamencos.png', '2025-07-10 13:06:00', '2025-07-10 13:06:00'),
(802, 8, 'Bars', 'https://app.flamencos.eu/images/categories/flamencos.png', '2025-07-10 13:06:00', '2025-07-10 13:06:00'),
(803, 8, 'Cafes', 'https://app.flamencos.eu/images/categories/flamencos.png', '2025-07-10 13:06:00', '2025-07-10 13:06:00'),
(804, 8, 'Markets', 'https://app.flamencos.eu/images/categories/flamencos.png', '2025-07-10 13:06:00', '2025-07-10 13:06:00'),
(901, 9, 'Beaches & Coves', 'https://app.flamencos.eu/images/categories/flamencos.png', '2025-07-10 13:06:00', '2025-07-10 13:06:00'),
(902, 9, 'Cultural Landmarks & Towns', 'https://app.flamencos.eu/images/categories/flamencos.png', '2025-07-10 13:06:00', '2025-07-10 13:06:00'),
(903, 9, 'Natural Parks', 'https://app.flamencos.eu/images/categories/flamencos.png', '2025-07-10 13:06:00', '2025-07-10 13:06:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategory_translations`
--

CREATE TABLE `subcategory_translations` (
  `translation_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text_translation` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `subcategory_translations`
--

INSERT INTO `subcategory_translations` (`translation_id`, `subcategory_id`, `language_id`, `text_translation`, `created_at`, `updated_at`) VALUES
(1, 701, 1, 'Golf', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(2, 702, 1, 'Club Náutico', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(3, 703, 1, 'Casino', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(4, 704, 1, 'Pesca', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(5, 705, 1, 'Surf', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(6, 706, 1, 'Gimnasio/Polideportivo', '2025-07-10 13:21:32', '2025-07-11 18:25:48'),
(7, 707, 1, 'Tenis', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(8, 708, 1, 'Baloncesto', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(9, 709, 1, 'Fútbol', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(10, 710, 1, 'Voleibol', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(11, 711, 1, 'Piscina', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(12, 712, 1, 'Senderismo', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(13, 713, 1, 'Escalada', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(14, 801, 1, 'Restaurantes', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(15, 802, 1, 'Bares', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(16, 803, 1, 'Cafeterías', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(17, 804, 1, 'Mercados', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(18, 901, 1, 'Playas y Calas', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(19, 902, 1, 'Monumentos y Pueblos', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(20, 903, 1, 'Parques Naturales', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(21, 701, 2, 'Golf', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(22, 702, 2, 'Nautic Club', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(23, 703, 2, 'Casino', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(24, 704, 2, 'Fishing', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(25, 705, 2, 'Surf', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(26, 706, 2, 'Gym/Sports center', '2025-07-10 13:21:32', '2025-07-11 18:26:50'),
(27, 707, 2, 'Tennis', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(28, 708, 2, 'Basketball', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(29, 709, 2, 'Football', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(30, 710, 2, 'Volleyball', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(31, 711, 2, 'Swimming pool', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(32, 712, 2, 'Hiking', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(33, 713, 2, 'Climbing', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(34, 801, 2, 'Restaurants', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(35, 802, 2, 'Bars', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(36, 803, 2, 'Cafés', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(37, 804, 2, 'Markets', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(38, 901, 2, 'Beaches & Coves', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(39, 902, 2, 'Cultural Landmarks & Towns', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(40, 903, 2, 'Natural Parks', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(41, 701, 3, 'Golf', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(42, 702, 3, 'Club nautique', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(43, 703, 3, 'Casino', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(44, 704, 3, 'Pêche', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(45, 705, 3, 'Surf', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(46, 706, 3, 'Salle de sport', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(47, 707, 3, 'Tennis', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(48, 708, 3, 'Basket-ball', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(49, 709, 3, 'Football', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(50, 710, 3, 'Volley-ball', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(51, 711, 3, 'Piscine', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(52, 712, 3, 'Randonnée', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(53, 713, 3, 'Escalade', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(54, 801, 3, 'Restaurants', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(55, 802, 3, 'Bars', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(56, 803, 3, 'Cafés', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(57, 804, 3, 'Marchés', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(58, 901, 3, 'Plages et criques', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(59, 902, 3, 'Monuments et villages', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(60, 903, 3, 'Parcs naturels', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(61, 701, 4, 'Golf', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(62, 702, 4, 'Yachtclub', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(63, 703, 4, 'Kasino', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(64, 704, 4, 'Angeln', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(65, 705, 4, 'Surfen', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(66, 706, 4, 'Fitnessstudio', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(67, 707, 4, 'Tennis', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(68, 708, 4, 'Basketball', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(69, 709, 4, 'Fußball', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(70, 710, 4, 'Volleyball', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(71, 711, 4, 'Schwimmbad', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(72, 712, 4, 'Wandern', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(73, 713, 4, 'Klettern', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(74, 801, 4, 'Restaurants', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(75, 802, 4, 'Bars', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(76, 803, 4, 'Cafés', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(77, 804, 4, 'Märkte', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(78, 901, 4, 'Strände und Buchten', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(79, 902, 4, 'Sehenswürdigkeiten & Orte', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(80, 903, 4, 'Naturparks', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(81, 701, 5, 'Golf', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(82, 702, 5, 'Jachtclub', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(83, 703, 5, 'Casino', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(84, 704, 5, 'Vissen', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(85, 705, 5, 'Surfen', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(86, 706, 5, 'Sportschool', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(87, 707, 5, 'Tennis', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(88, 708, 5, 'Basketbal', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(89, 709, 5, 'Voetbal', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(90, 710, 5, 'Volleybal', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(91, 711, 5, 'Zwembad', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(92, 712, 5, 'Wandelen', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(93, 713, 5, 'Klimmen', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(94, 801, 5, 'Restaurants', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(95, 802, 5, 'Bars', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(96, 803, 5, 'Cafés', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(97, 804, 5, 'Markten', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(98, 901, 5, 'Stranden en baaien', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(99, 902, 5, 'Culturele bezienswaardigheden', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(100, 903, 5, 'Natuurparken', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(101, 701, 6, 'Гольф', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(102, 702, 6, 'Яхт-клуб', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(103, 703, 6, 'Казино', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(104, 704, 6, 'Рыбалка', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(105, 705, 6, 'Сёрфинг', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(106, 706, 6, 'Тренажёрный зал', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(107, 707, 6, 'Теннис', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(108, 708, 6, 'Баскетбол', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(109, 709, 6, 'Футбол', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(110, 710, 6, 'Волейбол', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(111, 711, 6, 'Бассейн', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(112, 712, 6, 'Пеший туризм', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(113, 713, 6, 'Скалолазание', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(114, 801, 6, 'Рестораны', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(115, 802, 6, 'Бары', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(116, 803, 6, 'Кафе', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(117, 804, 6, 'Рынки', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(118, 901, 6, 'Пляжи и бухты', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(119, 902, 6, 'Культурные памятники и города', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(120, 903, 6, 'Природные парки', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(121, 701, 7, 'Golf', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(122, 702, 7, 'Club nautico', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(123, 703, 7, 'Casinò', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(124, 704, 7, 'Pesca', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(125, 705, 7, 'Surf', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(126, 706, 7, 'Palestra', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(127, 707, 7, 'Tennis', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(128, 708, 7, 'Pallacanestro', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(129, 709, 7, 'Calcio', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(130, 710, 7, 'Pallavolo', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(131, 711, 7, 'Piscina', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(132, 712, 7, 'Escursionismo', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(133, 713, 7, 'Arrampicata', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(134, 801, 7, 'Ristoranti', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(135, 802, 7, 'Bar', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(136, 803, 7, 'Caffè', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(137, 804, 7, 'Mercati', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(138, 901, 7, 'Spiagge e calette', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(139, 902, 7, 'Monumenti e borghi storici', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(140, 903, 7, 'Parchi naturali', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(141, 701, 8, '高尔夫球', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(142, 702, 8, '游艇俱乐部', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(143, 703, 8, '赌场', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(144, 704, 8, '钓鱼', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(145, 705, 8, '冲浪', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(146, 706, 8, '健身房', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(147, 707, 8, '网球', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(148, 708, 8, '篮球', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(149, 709, 8, '足球', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(150, 710, 8, '排球', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(151, 711, 8, '游泳池', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(152, 712, 8, '徒步旅行', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(153, 713, 8, '攀岩', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(154, 801, 8, '餐馆', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(155, 802, 8, '酒吧', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(156, 803, 8, '咖啡馆', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(157, 804, 8, '市场', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(158, 901, 8, '海滩和小海湾', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(159, 902, 8, '名胜古迹和城镇', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(160, 903, 8, '自然公园', '2025-07-10 13:21:32', '2025-07-10 13:21:32'),
(161, 101, 1, 'Abogados', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(162, 102, 1, 'Consultores', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(163, 103, 1, 'Gestores', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(164, 201, 1, 'Agencias Inmobiliarias', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(165, 202, 1, 'Administración de Propiedades', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(166, 301, 1, 'Electricista', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(167, 302, 1, 'Fontanero', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(168, 303, 1, 'Albañil', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(169, 401, 1, 'Escuelas', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(170, 402, 1, 'Universidades', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(171, 501, 1, 'Hospitales', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(172, 502, 1, 'Farmacias', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(173, 601, 1, 'Impuestos', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(174, 602, 1, 'Seguros', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(175, 603, 1, 'Banca', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(176, 101, 2, 'Lawyers', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(177, 102, 2, 'Consultants', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(178, 103, 2, 'Gestors', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(179, 201, 2, 'Real Estate Agencies', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(180, 202, 2, 'Property Management', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(181, 301, 2, 'Electrician', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(182, 302, 2, 'Plumber', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(183, 303, 2, 'Mason', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(184, 401, 2, 'Schools', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(185, 402, 2, 'Universities', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(186, 501, 2, 'Hospitals', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(187, 502, 2, 'Pharmacies', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(188, 601, 2, 'Tax', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(189, 602, 2, 'Insurance', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(190, 603, 2, 'Banking', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(191, 101, 3, 'Avocats', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(192, 102, 3, 'Consultants', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(193, 103, 3, 'Gestionnaires', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(194, 201, 3, 'Agences immobilières', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(195, 202, 3, 'Gestion immobilière', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(196, 301, 3, 'Électricien', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(197, 302, 3, 'Plombier', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(198, 303, 3, 'Maçon', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(199, 401, 3, 'Écoles', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(200, 402, 3, 'Universités', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(201, 501, 3, 'Hôpitaux', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(202, 502, 3, 'Pharmacies', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(203, 601, 3, 'Impôts', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(204, 602, 3, 'Assurance', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(205, 603, 3, 'Banque', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(206, 101, 4, 'Anwälte', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(207, 102, 4, 'Berater', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(208, 103, 4, 'Verwalter', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(209, 201, 4, 'Immobilienagenturen', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(210, 202, 4, 'Immobilienverwaltung', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(211, 301, 4, 'Elektriker', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(212, 302, 4, 'Klempner', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(213, 303, 4, 'Maurer', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(214, 401, 4, 'Schulen', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(215, 402, 4, 'Universitäten', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(216, 501, 4, 'Krankenhäuser', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(217, 502, 4, 'Apotheken', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(218, 601, 4, 'Steuern', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(219, 602, 4, 'Versicherung', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(220, 603, 4, 'Bankwesen', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(221, 101, 5, 'Advocaten', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(222, 102, 5, 'Consultants', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(223, 103, 5, 'Administrateurs', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(224, 201, 5, 'Makelaars', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(225, 202, 5, 'Vastgoedbeheer', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(226, 301, 5, 'Elektricien', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(227, 302, 5, 'Loodgieter', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(228, 303, 5, 'Metselaar', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(229, 401, 5, 'Scholen', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(230, 402, 5, 'Universiteiten', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(231, 501, 5, 'Ziekenhuizen', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(232, 502, 5, 'Apotheken', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(233, 601, 5, 'Belastingen', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(234, 602, 5, 'Verzekeringen', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(235, 603, 5, 'Bankieren', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(236, 101, 6, 'Юристы', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(237, 102, 6, 'Консультанты', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(238, 103, 6, 'Гесторы', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(239, 201, 6, 'Агентства недвижимости', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(240, 202, 6, 'Управление недвижимостью', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(241, 301, 6, 'Электрик', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(242, 302, 6, 'Сантехник', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(243, 303, 6, 'Каменщик', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(244, 401, 6, 'Школы', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(245, 402, 6, 'Университеты', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(246, 501, 6, 'Больницы', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(247, 502, 6, 'Аптеки', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(248, 601, 6, 'Налоги', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(249, 602, 6, 'Страхование', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(250, 603, 6, 'Банковское дело', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(251, 101, 7, 'Avvocati', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(252, 102, 7, 'Consulenti', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(253, 103, 7, 'Gestori', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(254, 201, 7, 'Agenzie Immobiliari', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(255, 202, 7, 'Gestione Immobiliare', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(256, 301, 7, 'Elettricista', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(257, 302, 7, 'Idraulico', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(258, 303, 7, 'Muratore', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(259, 401, 7, 'Scuole', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(260, 402, 7, 'Università', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(261, 501, 7, 'Ospedali', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(262, 502, 7, 'Farmacie', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(263, 601, 7, 'Tasse', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(264, 602, 7, 'Assicurazioni', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(265, 603, 7, 'Bancario', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(266, 101, 8, '律师', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(267, 102, 8, '顾问', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(268, 103, 8, '代办人', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(269, 201, 8, '房地产中介', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(270, 202, 8, '物业管理', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(271, 301, 8, '电工', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(272, 302, 8, '水管工', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(273, 303, 8, '泥瓦工', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(274, 401, 8, '学校', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(275, 402, 8, '大学', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(276, 501, 8, '医院', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(277, 502, 8, '药房', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(278, 601, 8, '税务', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(279, 602, 8, '保险', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(280, 603, 8, '银行', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(281, 304, 1, 'Reformas', '2025-07-10 14:31:05', '2025-07-10 14:31:05'),
(282, 304, 2, 'Contractor', '2025-07-10 14:31:05', '2025-07-10 14:31:05');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `category_translations`
--
ALTER TABLE `category_translations`
  ADD PRIMARY KEY (`translation_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `language_id` (`language_id`);
ALTER TABLE `category_translations` ADD FULLTEXT KEY `text_translation` (`text_translation`);

--
-- Indices de la tabla `description_translations`
--
ALTER TABLE `description_translations`
  ADD PRIMARY KEY (`translation_id`),
  ADD KEY `marker_id` (`marker_id`),
  ADD KEY `language_id` (`language_id`);
ALTER TABLE `description_translations` ADD FULLTEXT KEY `text_translation` (`text_translation`);
ALTER TABLE `description_translations` ADD FULLTEXT KEY `text_translation_2` (`text_translation`);

--
-- Indices de la tabla `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `markers`
--
ALTER TABLE `markers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subcategory_id` (`subcategory_id`);
ALTER TABLE `markers` ADD FULLTEXT KEY `name` (`name`);
ALTER TABLE `markers` ADD FULLTEXT KEY `name_2` (`name`);

--
-- Indices de la tabla `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wp_user_login_reviewer` (`wp_user_login_reviewer`),
  ADD KEY `wp_user_login_marker` (`wp_user_login_marker`);

--
-- Indices de la tabla `search_terms`
--
ALTER TABLE `search_terms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marker_id` (`marker_id`);

--
-- Indices de la tabla `search_term_translations`
--
ALTER TABLE `search_term_translations`
  ADD PRIMARY KEY (`translation_id`),
  ADD KEY `search_term_id` (`search_term_id`);
ALTER TABLE `search_term_translations` ADD FULLTEXT KEY `text_translation` (`text_translation`);

--
-- Indices de la tabla `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_category_id` (`category_id`);

--
-- Indices de la tabla `subcategory_translations`
--
ALTER TABLE `subcategory_translations`
  ADD PRIMARY KEY (`translation_id`),
  ADD KEY `subcategory_id` (`subcategory_id`),
  ADD KEY `language_id` (`language_id`);
ALTER TABLE `subcategory_translations` ADD FULLTEXT KEY `text_translation` (`text_translation`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `category_translations`
--
ALTER TABLE `category_translations`
  MODIFY `translation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `description_translations`
--
ALTER TABLE `description_translations`
  MODIFY `translation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT de la tabla `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `markers`
--
ALTER TABLE `markers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT de la tabla `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `search_terms`
--
ALTER TABLE `search_terms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `search_term_translations`
--
ALTER TABLE `search_term_translations`
  MODIFY `translation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `subcategory_translations`
--
ALTER TABLE `subcategory_translations`
  MODIFY `translation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=283;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `category_translations`
--
ALTER TABLE `category_translations`
  ADD CONSTRAINT `category_translations_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_translations_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `description_translations`
--
ALTER TABLE `description_translations`
  ADD CONSTRAINT `description_translations_ibfk_1` FOREIGN KEY (`marker_id`) REFERENCES `markers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `description_translations_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `search_terms`
--
ALTER TABLE `search_terms`
  ADD CONSTRAINT `search_terms_ibfk_1` FOREIGN KEY (`marker_id`) REFERENCES `markers` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `search_term_translations`
--
ALTER TABLE `search_term_translations`
  ADD CONSTRAINT `search_term_translations_ibfk_1` FOREIGN KEY (`search_term_id`) REFERENCES `search_terms` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `subcategory_translations`
--
ALTER TABLE `subcategory_translations`
  ADD CONSTRAINT `subcategory_translations_ibfk_1` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subcategory_translations_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
