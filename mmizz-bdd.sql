-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Client :  localhost:3306
-- Généré le :  Dim 02 Avril 2017 à 18:53
-- Version du serveur :  5.5.42
-- Version de PHP :  7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `mmi_quizz`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Développement web'),
(2, 'Graphisme'),
(3, 'Audiovisuel');

-- --------------------------------------------------------

--
-- Structure de la table `iut`
--

CREATE TABLE `iut` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(500) NOT NULL,
  `coordinates` varchar(255) NOT NULL,
  `score` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `iut`
--

INSERT INTO `iut` (`id`, `name`, `location`, `coordinates`, `score`) VALUES
(1, 'IUT de Champs-Sur-Marne', '2 Rue Albert Einstein, 77420 Champs-sur-Marne', '[48.8370221, 2.5847406999999976]', 0),
(2, 'IUT d''Allier', '1 avenue des célestins, 03200 Vichy', '[46.1190308, 3.42490250000003]', 0),
(3, 'IUT de Troyes', '9 rue de Québec, 10026 Troyes', '[48.2683218, 4.079674599999976]', 0),
(4, 'IUT d’Aix Marseille', '2 rue Raoul Follereau, 13637 Arles', '[43.6723587, 4.639763000000016]', 0),
(5, 'IUT d''Angoulême', '4 avenue de Varsovie, 16000 Angoulême', '[45.6487759, 0.14047319999997399]', 0),
(6, 'IUT de Corse', 'Quartier Grossetti, 20250 Corte', '[42.301373, 9.158908999999994]', 0),
(7, 'IUT de Dijon', '5 Boulevard Dr Petitjean, 21000 Dijon', '[47.3110404, 5.068396699999994]', 0),
(8, 'IUT de Montbéliard', '4 place Tharradin, 25200 Montbéliard', '[47.49553479999999, 6.805264999999963]', 0),
(9, 'IUT de Bordeaux Montaigne\r\n', '1 rue Jacques Ellul, place Renaudel, 33080 Bordeaux', '[44.830625, -0.5621267999999873]', 0),
(10, 'IUT de Béziers', '3 place du 14 juillet, 34505 Béziers', '[43.3465791, 3.222162600000047]', 0),
(11, 'IUT de Blois', '15 Rue de la Chocolaterie, 41000 Blois', '[47.5836213, 1.3242509000000382]', 0),
(12, 'IUT de Grenoble Alpes', '151 rue de la Papeterie, 38 402 Saint-Martin-D''Hères', '[45.199518, 5.774710000000027]', 0),
(13, 'IUT de Clermond-Ferrand', '8 rue Jean-Baptiste Fabre, 43009 Le Puy-en-Velay', '[45.0401804, 3.8813774000000194]', 0),
(14, 'IUT Cherbourg-Manche', '20 Rue de l''exode, 50000 Saint-Lô', '[49.110714, -1.0900994999999511]', 0),
(15, 'IUT de Laval', '52 rue des Docteurs Calmette et Guérin, 53000 Laval', '[48.085762, -0.7570580000000291]', 0),
(16, 'IUT de Nancy-Charlemagne', '2 ter boulevard Charlemagne, 54052 Nancy', '[48.6824164, 6.161771300000055]', 0),
(17, 'IUT de Lens', 'Rue de l''Université, 62307 Lens', '[50.437776, 2.8100875000000087]', 0),
(18, 'IUT de Tarbes', '57 Avenue d''Azereix, 65000 Tarbes', '[43.22296499999999, 0.04913609999994151]', 0),
(19, 'IUT de Haguenau', '30 Rue du Maire André Traband, 67500 Haguenau\r\n', '[48.81649069999999, 7.786105099999986]', 0),
(20, 'IUT de Mulhouse', '61 Rue Albert Camus, 68200 Mulhouse', '[47.73165189999999, 7.300021900000047]', 0),
(21, 'IUT de Meaux', '17 rue Jablinot, 77100 Meaux', '[48.95509200000001, 2.878238300000021]', 0),
(22, 'IUT de Chambery', '28 avenue du lac d''Annecy, 73370 Le Bourget-du-Lac', '[45.6423347, 5.870946900000035]', 0),
(23, 'IUT d''Elbeuf', '24 Cours Gambetta, 76500 Elbeuf', '[49.2848526, 1.005471899999975]', 0),
(24, 'IUT de Vélizy', '10/12 avenue de l''Europe, 78140 Vélizy', '[48.7819122, 2.2176942999999483]', 0),
(25, 'IUT de Toulon', '70 avenue Roger Devoucoux, 83000 Toulon', '[43.12112080000001, 5.93989769999996]', 0),
(26, 'IUT de Limousin', '12 Allée André Maurois, 87065 Limoge', '[45.83568349999999, 1.2297634000000244]', 0),
(27, 'IUT de Saint-Dié-des-Vosges', '11 Rue de l''Université, 88100 Saint-Dié-des-Vosges', '[48.2901105, 6.942051799999945]', 0),
(28, 'IUT de Bobigny', '1 Rue de Chablis, 93000 Bobigny', '[48.9148297, 2.4177062999999634]', 0),
(29, 'IUT de Sarcelles', '34 Bis Boulevard Henri Bergson, 95200 Sarcelles', '[48.9746743, 2.3764737000000196]', 0),
(30, 'IUT de Saint-Claude', '166 rue des Officiers, 97120 Saint-Claude', '[16.028631, -61.69592990000001]', 0);

-- --------------------------------------------------------

--
-- Structure de la table `level`
--

CREATE TABLE `level` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `level`
--

INSERT INTO `level` (`id`, `name`) VALUES
(1, 'Facile'),
(2, 'Moyen'),
(3, 'Difficile');

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `question`
--

INSERT INTO `question` (`id`, `name`, `img`, `category_id`, `level_id`) VALUES
(1, 'Que signifie HTML ?', NULL, 1, 1),
(2, 'Qui est le fondateur d''HTML ?', NULL, 1, 1),
(3, 'À quoi sert la balise <br> ?', NULL, 1, 1),
(4, 'Que signifie CSS ?', NULL, 1, 1),
(5, 'Avec quelle propriété CSS peut-on arrondir les coins d''un bloc HTML ?', NULL, 1, 1),
(6, 'Où est-il préférable d''écrire du CSS ? ', NULL, 1, 1),
(7, 'Qu''est-ce qu''un array en PHP ?', NULL, 1, 1),
(8, 'Quelle code affichera correctement "Coucou" ?', NULL, 1, 1),
(9, 'JavaScript est un langage....', NULL, 1, 1),
(10, 'Qu''est ce que la POO ?', NULL, 1, 1),
(11, 'Quelle est la version actuelle d''HTML ?', NULL, 1, 2),
(12, 'Qu''est ce qu''Ajax ? ', NULL, 1, 2),
(13, 'En SEO, que signifie RSS ?', NULL, 1, 2),
(14, 'En SEO, qu''est ce qu''un Backlink ?', NULL, 1, 2),
(15, 'Qu''est ce qu''un script asynchrone ? ', NULL, 1, 2),
(16, 'Bootstrap est..', NULL, 1, 2),
(17, 'Avec Bootstrap, quel préfixe permet de gérer l''affichage sur un écran de 998px de large ?', NULL, 1, 2),
(18, 'A quoi sert un framework ?', NULL, 1, 2),
(19, 'Que signigie MVC ?', NULL, 1, 2),
(20, 'En CSS, laquelle de ces propositions n''est pas une valeur de la propriété "display" ?', NULL, 1, 2),
(21, 'Peut-on remplacer l''extension .html par .htm pour un fichier HTML ?', NULL, 1, 3),
(22, 'Quelle fonction en PHP permet d''obtenir la date de création et la date de modification d''un fichier ?', NULL, 1, 3),
(23, 'Dans le DOM-2, quelle est la bonne méthode qui permet l''ajout de gestionnaires d''évènements', NULL, 1, 3),
(24, 'Dans quel ordre de priorité sont affectées les variables envoyées par HTTP ?', NULL, 1, 3),
(25, 'Une base de donnée est dite cohérente si...', NULL, 1, 3),
(26, 'Qu''est-ce qu''un SSO ? ', NULL, 1, 3),
(27, 'En CSS, comment mettre du style uniquement sur les éléments qui sont juste après les éléments ?', NULL, 1, 3);

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
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;

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
(22, 'Dans la balise de l''élément à styliser', NULL, 0, 6),
(23, 'Dans le <head>', NULL, 0, 6),
(24, 'Dans une feuille CSS externe', NULL, 1, 6),
(25, 'Un champs pour écrire des données', NULL, 0, 7),
(26, 'Un tableau', NULL, 1, 7),
(27, 'Une fonction', NULL, 0, 7),
(28, 'Une méthode', NULL, 0, 7),
(29, 'print(''Coucou'')', NULL, 0, 8),
(30, 'var_dump Coucou;', NULL, 0, 8),
(31, 'echo(Coucou);', NULL, 0, 8),
(32, 'echo ''Coucou'';', NULL, 1, 8),
(33, 'précompilé', NULL, 0, 9),
(34, 'compilé', NULL, 0, 9),
(35, 'interprété', NULL, 1, 9),
(36, 'pour les malentendants', NULL, 0, 9),
(42, 'La création d''entités', NULL, 0, 10),
(43, 'La manipulation d''objets', NULL, 1, 10),
(44, 'La mise à jour de programmes', NULL, 0, 10),
(45, 'Une programmation procédurale', NULL, 0, 10),
(46, 'HTML 3.2', NULL, 0, 11),
(47, 'HTML 4.0', NULL, 0, 11),
(48, 'HTML 5.1', NULL, 1, 11),
(49, 'HTML 5', NULL, 0, 11),
(50, 'Un produit nettoyant', NULL, 0, 12),
(51, 'Un ensemble de technologies afin de réaliser des mises à jour rapide sur le site', NULL, 1, 12),
(52, 'Une bibliothèque Javascript', NULL, 0, 12),
(53, 'Une extension d''HTML', NULL, 0, 12),
(54, 'Really Simple Syndication', NULL, 1, 13),
(55, 'Real Site Summary ', NULL, 0, 13),
(56, 'Relay Spam Stopper ', NULL, 0, 13),
(57, 'Remote Sensing Systems', NULL, 0, 13),
(58, 'Un lien qui permet de revenir en arrière', NULL, 0, 14),
(59, 'Un lien sortant vers un site', NULL, 0, 14),
(60, 'Un lien entrant vers votre site', NULL, 1, 14),
(61, 'Un lien important', NULL, 0, 14),
(62, 'Charger/exécuter les scripts en même temps', NULL, 0, 15),
(63, 'Charger/exécuter les scripts de façon asynchrone', NULL, 1, 15),
(64, 'Un script qui se synchronise tout seul', NULL, 0, 15),
(65, 'Un script qui danse en synchronisé', NULL, 0, 15),
(66, 'Un framework PHP', NULL, 0, 16),
(67, 'Un framework HTML CSS', NULL, 0, 16),
(68, 'Un framework HTML CSS JS', NULL, 1, 16),
(69, 'Un CMS', NULL, 0, 16),
(70, 'xs', NULL, 0, 17),
(71, 'sm', NULL, 0, 17),
(72, 'md', NULL, 1, 17),
(73, 'lg', NULL, 0, 17),
(74, 'Créer/Modeler la structure d''un programme, d''un logiciel', NULL, 1, 18),
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
(103, 'Toutes les contraintes d''intégrité sont respectées', NULL, 1, 25),
(104, 'Toutes les contraintes d''intégrité référentielles sont respectées', NULL, 0, 25),
(105, 'Toutes les contraintes d''intégrité sont optimisées', NULL, 0, 25),
(106, 'Un service d''identification', NULL, 0, 26),
(107, 'Un service d''autorisation', NULL, 0, 26),
(108, 'Un service d''authentification', NULL, 1, 26),
(109, 'Un service de confidentialité', NULL, 0, 26),
(110, 'h2 > p', NULL, 0, 27),
(111, 'h2:after(p)', NULL, 0, 27),
(112, 'h2 + p', NULL, 1, 27),
(113, 'h2 < p', NULL, 0, 27);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `login` varchar(45) NOT NULL,
  `score` int(11) NOT NULL,
  `iut_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `iut`
--
ALTER TABLE `iut`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `level_id` (`level_id`);

--
-- Index pour la table `response`
--
ALTER TABLE `response`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`question_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `iut_id` (`iut_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `iut`
--
ALTER TABLE `iut`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT pour la table `level`
--
ALTER TABLE `level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT pour la table `response`
--
ALTER TABLE `response`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=114;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=159;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `question_ibfk_2` FOREIGN KEY (`level_id`) REFERENCES `level` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `response`
--
ALTER TABLE `response`
  ADD CONSTRAINT `response_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`iut_id`) REFERENCES `iut` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
