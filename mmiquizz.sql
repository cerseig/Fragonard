-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:8889
-- Généré le :  Mer 08 Mars 2017 à 14:06
-- Version du serveur :  5.6.33
-- Version de PHP :  7.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `mmi_quizz`
--

-- --------------------------------------------------------

--
-- Structure de la table `response`
--

CREATE TABLE `response` (
  `id` int(11) NOT NULL,
  `name` varchar(500) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `correct` tinyint(1) NOT NULL,
  `question_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `response`
--

INSERT INTO `response` (`id`, `name`, `img`, `correct`, `question_id`) VALUES
(1, 'High Text Markup Language', NULL, 0, 1),
(2, 'Hyper Text Making Language', NULL, 0, 1),
(3, 'Hyper Text Markup Language', NULL, 1, 1),
(4, 'High Textual Markup Language', NULL, 0, 1),
(5, 'Tim Berners-Lee', NULL, 1, 2),
(6, 'Rasmus Lerdorf', NULL, 0, 2),
(7, 'Steve Jobs', NULL, 0, 2),
(8, 'Marc Andreessen', NULL, 0, 2),
(9, 'Mettre en gras un élément', NULL, 0, 3),
(10, 'Mettre en avant un titre', NULL, 0, 3),
(11, 'Ajouter un retour à la ligne', NULL, 1, 3),
(12, 'Faire un tableau', NULL, 0, 3),
(13, 'Constitution of Sensitive Sheets', NULL, 0, 4),
(14, 'Cascading Send Style', NULL, 0, 4),
(15, 'Create Simple Samples', NULL, 0, 4),
(16, 'Cascading Style Sheets', NULL, 1, 4),
(17, 'Border-round', NULL, 0, 5),
(18, 'Border-radius', NULL, 1, 5),
(19, 'Border-arround', NULL, 0, 5),
(20, 'Border-crop', NULL, 0, 5),
(21, 'Dans le <body>', NULL, 0, 6),
(22, 'Dans la balise de l\'élément à styliser', NULL, 0, 6),
(23, 'Dans le <head>', NULL, 0, 6),
(24, 'Dans une feuille CSS externe', NULL, 1, 6),
(25, 'Un champs pour écrire des données', NULL, 0, 7),
(26, 'Un tableau', NULL, 1, 7),
(27, 'Une fonction', NULL, 0, 7),
(28, 'Une méthode', NULL, 0, 7),
(29, NULL, 'dev/l1-q8-r1.png', 0, 8),
(30, NULL, 'dev/l1-q8-r2.png', 0, 8),
(31, NULL, 'dev/l1-q8-r3.png', 0, 8),
(32, NULL, 'dev/l1-q8-r4.png', 1, 8),
(33, 'précompilé', NULL, 0, 9),
(34, 'compilé', NULL, 0, 9),
(35, 'interprété', NULL, 1, 9),
(36, 'pour les malentendants', NULL, 0, 9),
(42, 'La création d\'entités', NULL, 0, 10),
(43, 'La manipulation d\'objets', NULL, 1, 10),
(44, 'La mise à jour de programmes', NULL, 0, 10),
(45, 'Une programmation procédurale', NULL, 0, 10),
(46, 'HTML 3.2', NULL, 0, 11),
(47, 'HTML 4.0', NULL, 0, 11),
(48, 'HTML 5.1', NULL, 1, 11),
(49, 'HTML 5', NULL, 0, 11),
(50, 'Un produit nettoyant', NULL, 0, 12),
(51, 'Un ensemble de technologies afin de réaliser des mises à jour rapide sur le site', NULL, 1, 12),
(52, 'Une bibliothèque Javascript', NULL, 0, 12),
(53, 'Une extension d\'HTML', NULL, 0, 12),
(54, 'Really Simple Syndication', NULL, 1, 13),
(55, 'Real Site Summary ', NULL, 0, 13),
(56, 'Relay Spam Stopper ', NULL, 0, 13),
(57, 'Remote Sensing Systems', NULL, 0, 13),
(58, 'Un lien qui permet de revenir en arrière', NULL, 0, 14),
(59, 'Un lien sortant vers un site', NULL, 0, 14),
(60, 'Un lien entrant vers votre site', NULL, 1, 14),
(61, 'Un lien important', NULL, 0, 14),
(62, 'Charger/exécuter les scripts en même temps', NULL, 0, 15),
(63, '', NULL, 1, 15),
(64, 'Un script qui se synchronise tout seul', NULL, 0, 15),
(65, NULL, NULL, 0, 15),
(66, 'Un framework PHP', NULL, 0, 16),
(67, 'Un framework HTML CSS', NULL, 0, 16),
(68, 'Un framework HTML CSS JS', NULL, 1, 16),
(69, 'Un CMS', NULL, 0, 16),
(70, 'xs', NULL, 0, 17),
(71, 'sm', NULL, 0, 17),
(72, 'md', NULL, 1, 17),
(73, 'lg', NULL, 0, 17),
(74, 'Créer/Modeler la structure d\'un programme, d\'un logiciel, d\'une application...', NULL, 1, 18),
(75, 'Permettre aux développeurs de dynamiser un site web', NULL, 0, 18),
(76, 'Coder plus vite', NULL, 0, 18),
(77, 'Créer un site web de A à Z sans toucher au code.', NULL, 0, 18),
(78, 'Mode Valeur Contenu', NULL, 0, 19),
(79, 'Model View Controller', NULL, 1, 19),
(80, 'Model Value Container', NULL, 0, 19),
(81, 'Modal View Controller', NULL, 0, 19),
(82, 'list-item', NULL, 0, 20),
(83, 'table-legend', NULL, 1, 20),
(84, 'inline-block', NULL, 0, 20),
(85, 'none', NULL, 0, 20),
(86, 'Impossible, sinon cela ne fonctionne pas', NULL, 0, 21),
(87, 'Oui, nous pouvons', NULL, 1, 21),
(88, 'Cela dépend de la version HTML', NULL, 0, 21),
(89, 'Cela dépend des hébergeurs', NULL, 0, 21),
(90, 'filetime()', NULL, 0, 22),
(91, 'fileconnect()', NULL, 0, 22),
(92, 'stat()', NULL, 1, 22),
(93, 'statfile()', NULL, 0, 22),
(94, 'addListen', NULL, 0, 23),
(95, 'addEventListener', NULL, 1, 23),
(96, 'attachEventListener', NULL, 0, 23),
(97, 'addEventListening', NULL, 0, 23),
(98, 'post,cookie, get', NULL, 0, 24),
(99, 'post, get, cookie', NULL, 0, 24),
(100, 'get, cookie, post', NULL, 0, 24),
(101, 'get, post, cookie', NULL, 1, 24),
(102, 'Les données saisies ne sont pas contradictoires', NULL, 0, 25),
(103, 'Toutes les contraintes d\'intégrité sont respectées', NULL, 1, 25),
(104, 'Toutes les contraintes d\'intégrité référentielles sont respectées', NULL, 0, 25),
(105, 'Toutes les contraintes d\'intégrité sont optimisées', NULL, 0, 25),
(106, 'Un service d\'identification', NULL, 0, 26),
(107, 'Un service d\'autorisation', NULL, 0, 26),
(108, 'Un service d\'authentification', NULL, 1, 26),
(109, 'Un service de confidentialité', NULL, 0, 26),
(110, 'h2 > p', NULL, 0, 27),
(111, 'h2:after(p)', NULL, 0, 27),
(112, 'h2 + p', NULL, 1, 27),
(113, 'h2 < p', NULL, 0, 27);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `response`
--
ALTER TABLE `response`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`question_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `response`
--
ALTER TABLE `response`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `response`
--
ALTER TABLE `response`
  ADD CONSTRAINT `response_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
