-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : ven. 13 sep. 2024 à 23:15
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `pharmacie`
--

-- --------------------------------------------------------

--
-- Structure de la table `medicament`
--

CREATE TABLE `medicament` (
  `id` int(11) NOT NULL,
  `nom_medoc` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(255) NOT NULL,
  `disponible` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `medicament`
--

INSERT INTO `medicament` (`id`, `nom_medoc`, `description`, `image`, `disponible`) VALUES
(14, 'Kaissane Said', 'hj', '66d78fdea9bee.png', 1),
(15, 'Kaissane Said', 'jjhg', '66d7baab240e5.png', 1),
(19, 'Vitamine C®  500mg', 'La vitamine C (acide ascorbique) est un antioxydant essentiel qui renforce le système immunitaire, stimule la production de collagène et protège les cellules des radicaux libres. Ce comprimé de 500 mg soutient le bon fonctionnement de l\'organisme\r\n				', '66d99fa05b98f.jpg', 0),
(20, 'Doliprane® 120mg', 'Le Doliprane 120 mg est un médicament à base de paracétamol spécialement formulé pour les nourrissons et les jeunes enfants. Il est utilisé pour soulager la douleur légère à modérée (comme les maux de tête, douleurs dentaires, ou douleurs post-vaccinales) et pour faire baisser la fièvre.', '66d9a1efb8f05.jpg', 0),
(21, 'Fervex® 8cp', 'Fervex est un médicament pour traiter les symptômes du rhume et de la grippe, combinant paracétamol (contre la douleur et la fièvre), antihistaminique (pour les symptômes allergiques) et décongestionnant (pour la congestion nasale).', '66d9a31a0c580.png', 0),
(22, 'Amoxiline® 500mg', 'L\'Amoxiciline est un antibiotique à large spectre utilisé pour traiter diverses infections bactériennes, telles que les infections respiratoires, urinaires, et de l\'oreille. Elle agit en inhibant la croissance des bactéries.', '66d9a6537d685.webp', 1),
(23, 'Dafalgan® 500mg', 'Dafalgan est un médicament contenant du paracétamol, utilisé pour soulager la douleur légère à modérée (comme les maux de tête, douleurs dentaires, douleurs musculaires) et pour réduire la fièvre.\r\n				', '66d9a7753f9df.jpg', 1),
(24, 'Doliprane® 1000mg', 'Doliprane 1000 mg est un médicament à base de paracétamol, utilisé pour soulager les douleurs légères à modérées, telles que les maux de tête, les douleurs musculaires, et les douleurs dentaires, ainsi que pour réduire la fièvre.', '66d9aca326417.jpg', 1),
(25, 'Fervex® 500mg 4cp', 'Fervex 400 mg traite les symptômes du rhume et de la grippe avec du paracétamol (pour la douleur et la fièvre), un antihistaminique (pour les symptômes allergiques), et un décongestionnant (pour la congestion nasale).', '66d9ae9662fb0.jpg', 1),
(26, 'Metformine® 850mg', 'La Metformine 850 mg est un médicament utilisé pour traiter le diabète de type 2. Elle aide à contrôler la glycémie en améliorant la sensibilité à l\'insuline et en réduisant la production de glucose par le foie.', '66d9b1ea310da.webp', 1),
(27, 'Efferalgan® 500mg', 'L\'Efferalgan 500 mg est un médicament à base de paracétamol utilisé pour soulager les douleurs légères à modérées, telles que les maux de tête, douleurs musculaires, et douleurs dentaires, ainsi que pour réduire la fièvre.', '66d9b2bc4428e.jpg', 0),
(28, 'Amoxiline® 500mg', 'L\'Amoxiciline 500 mg est un antibiotique utilisé pour traiter diverses infections bactériennes, telles que les infections respiratoires, urinaires, et des voies digestives. Elle agit en inhibant la croissance des bactéries.', '66d9b568a4c73.webp', 0),
(29, 'Smecta® 1g', 'Smecta 1 g est un médicament pour traiter les diarrhées aiguës et chroniques, ainsi que les troubles digestifs, grâce à la diosmectite, un agent adsorbant qui protège la muqueuse intestinale et absorbe les toxines.', '66d9bd3336fee.webp', 1),
(30, 'Vitamine C® 500mg', 'La vitamine C (acide ascorbique) est un antioxydant essentiel qui renforce le système immunitaire, stimule la production de collagène et protège les cellules des radicaux libres. Ce comprimé de 500 mg soutient le bon fonctionnement de l\'organisme.', '66d9bd9211b05.jpg', 0),
(31, 'Doliprane® 120mg', 'Le Doliprane 120 mg est un médicament à base de paracétamol spécialement formulé pour les nourrissons et les jeunes enfants. Il est utilisé pour soulager la douleur légère à modérée (comme les maux de tête, douleurs dentaires, ou douleurs post-vaccinales) et pour faire baisser la fièvre.', '66d9be2a6e1ef.jpg', 1),
(32, 'Amoxiline® 1000mg', 'L\'Amoxiciline est un antibiotique à large spectre utilisé pour traiter diverses infections bactériennes, telles que les infections respiratoires, urinaires, et de l\'oreille. Elle agit en inhibant la croissance des bactéries.', '66d9bf7b768ea.jpg', 1),
(33, 'Dafalgan® 1mg', 'Dafalgan est un médicament contenant du paracétamol, utilisé pour soulager la douleur légère à modérée (comme les maux de tête, douleurs dentaires, douleurs musculaires) et pour réduire la fièvre.', '66d9bfd25a87e.jpg', 1),
(34, 'Amoxiline® 1000mg', 'L\'Amoxiciline est un antibiotique à large spectre utilisé pour traiter diverses infections bactériennes, telles que les infections respiratoires, urinaires, et de l\'oreille. Elle agit en inhibant la croissance des bactéries.', '66d9c05e8b14b.jpg', 0),
(35, 'Panadol', 'Panadol est un médicament contenant du paracétamol, utilisé pour soulager la douleur légère à modérée et réduire la fièvre. Il est efficace pour traiter les maux de tête, les douleurs musculaires, les douleurs dentaires et les symptômes fébriles.', '66d9c18e2cba5.avif', 0),
(36, 'Metformine® 1000mg', 'La Metformine 1000 mg est un médicament utilisé pour traiter le diabète de type 2. Elle aide à réguler les niveaux de sucre dans le sang en améliorant la sensibilité à l\'insuline et en réduisant la production de glucose par le foie.', '66d9c21b65486.webp', 1),
(37, 'locapharma_123', 'uhpuih', '66dfed4d219b0.jpg', 1);

-- --------------------------------------------------------

--
-- Structure de la table `medicament_pharmacie`
--

CREATE TABLE `medicament_pharmacie` (
  `medicament_id` int(11) NOT NULL,
  `pharmacie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `medicament_pharmacie`
--

INSERT INTO `medicament_pharmacie` (`medicament_id`, `pharmacie_id`) VALUES
(19, 32),
(20, 32),
(21, 32),
(22, 32),
(23, 32),
(24, 34),
(25, 34),
(26, 36),
(27, 36),
(28, 43),
(29, 43),
(30, 42),
(31, 42),
(34, 38),
(35, 37),
(36, 37),
(37, 32);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `body` longtext DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `notification`
--

INSERT INTO `notification` (`id`, `title`, `body`, `created_at`) VALUES
(7, 'Changement de Programme de Garde pour la Pharmacie des Oasis', 'Chers clients,\r\n\r\nNous souhaitons vous informer qu\'il y a eu un changement dans le programme de garde de la Pharmacie Oasis. Veuillez noter que les horaires de garde ont été ajustés pour mieux répondre à vos besoins.', '2024-09-12 10:21:44');

-- --------------------------------------------------------

--
-- Structure de la table `pharmacie`
--

CREATE TABLE `pharmacie` (
  `id` int(11) NOT NULL,
  `nom_pharma` varchar(255) NOT NULL,
  `addpharma` varchar(255) NOT NULL,
  `tel` varchar(255) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `addmaps` longtext NOT NULL,
  `email` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `heureouvert` time DEFAULT NULL,
  `heureferme` time DEFAULT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`roles`)),
  `phonewh` varchar(255) DEFAULT NULL,
  `linkfac` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `pharmacie`
--

INSERT INTO `pharmacie` (`id`, `nom_pharma`, `addpharma`, `tel`, `mdp`, `description`, `addmaps`, `email`, `image`, `heureouvert`, `heureferme`, `latitude`, `longitude`, `roles`, `phonewh`, `linkfac`) VALUES
(32, 'Pharmacie Yassine', 'Moroni Ambasadeur', '3655332', '$2y$10$2olsyWwzBbkarYbouJ0Rbe38XJ.7.uaqPxl3s0SiDrgK4gRD0OWQy', 'La Pharmacie Yassine est un établissement de santé situé dans un quartier dynamique, offrant une gamme complète de services pharmaceutiques. Elle se distingue par son engagement à fournir des médicaments de haute qualité et des conseils personnalisés à ses clients. La pharmacie est dotée d\'un personnel compétent et attentionné, prêt à répondre aux besoins des patients, qu\'il s\'agisse de prescriptions médicales, de conseils sur les médicaments en vente libre, ou de soins de santé généraux.', 'https://www.openstreetmap.org/export/embed.html?bbox=43.2479967,-11.7005936,43.2579967,-11.6905936&amp;layer=mapnik&amp;marker=-11.6955936,43.2529967&amp;zoom=15', 'pharmacieyassine2@gmail.com', '66d8b4e5049d3.jpg', NULL, NULL, -11.6955936, 43.2529967, '[\"USER_PHARMACIEN\"]', '3324567', ''),
(34, 'Pharmacie Traleni', 'Moroni gobadjou', '7730121', '$2y$10$LtwQaBrRKdNlAr7leMli2ebhDgaAvVyQYl1oy1HrXsLcJi3o7s26G', 'La Pharmacie Traleni est un acteur essentiel de la santé dans sa région, offrant un large éventail de médicaments et de produits de soins. Avec un engagement envers l\'excellence et le bien-être de ses clients, la pharmacie se distingue par son personnel compétent et accueillant, toujours prêt à fournir des conseils personnalisés. En plus des médicaments sur ordonnance et des produits de santé courants, la Pharmacie Traleni propose également des services de conseil en santé et de gestion de la médication. Son atmosphère professionnelle et chaleureuse en fait un choix privilégié pour les besoins pharmaceutiques de la communauté locale.', 'https://www.openstreetmap.org/export/embed.html?bbox=43.2470601,-11.7106121,43.2570601,-11.7006121&amp;layer=mapnik&amp;marker=-11.7056121,43.2520601&amp;zoom=15', 'pharmacietraleni@gmail.com', '66d8b99a7f492.jpg', NULL, NULL, -11.7056121, 43.2520601, '[\"USER_PHARMACIEN\"]', NULL, NULL),
(36, 'Pharmacie Mangani', 'Moroni Mangani', '3355015', '$2y$10$hRk46wG3YBlsN9D02JjXuuYfSFq2K33NY4lqPkW/lMwuKYXoQWuRG', 'La Pharmacie Mangani est un établissement bien implanté dans le quartier, offrant une gamme étendue de services pharmaceutiques. Elle se distingue par son équipe professionnelle et attentionnée, toujours prête à fournir des conseils médicaux de qualité et à répondre aux besoins de santé de ses clients. Avec une organisation soignée, la pharmacie permet un accès facile aux médicaments et produits de parapharmacie, garantissant une expérience fluide et agréable pour les visiteurs.', 'https://www.openstreetmap.org/export/embed.html?bbox=43.2456401,-11.7109749,43.2656401,-11.6909749&amp;layer=mapnik&amp;marker=-11.7009749,43.2556401&amp;zoom=15', 'pharmaciemangani@gmail.com', '66d93d88de3ed.jpg', NULL, NULL, -11.7009749, 43.2556401, '[\"USER_PHARMACIEN\"]', NULL, NULL),
(37, 'Pharmacie de la corniche ', 'Moroni Ambassadeur,hadoudja', '4499553', '$2y$10$/nFlnPwhgzDJFgiMZlealeqRgPmJPbEUpCqAtcqaYKKcOn/KWw6YW', 'La Pharmacie de la Corniche est un établissement moderne et bien situé, offrant un service de santé complet aux résidents et aux visiteurs du quartier. Avec une vue imprenable sur la mer, cette pharmacie se distingue non seulement par son emplacement idéal, mais aussi par la qualité de ses services. Elle propose un large éventail de médicaments, de produits de parapharmacie, ainsi que des articles de soin et de bien-être adaptés aux besoins quotidiens de sa clientèle.\r\n\r\n', 'https://www.openstreetmap.org/export/embed.html?bbox=43.2455274,-11.7049657,43.2655274,-11.6849657&amp;layer=mapnik&amp;marker=-11.6949657,43.2555274&amp;zoom=15', 'pharmaciecorniche@gmail.com', NULL, NULL, NULL, -11.6949657, 43.2555274, '[\"USER_PHARMACIEN\"]', NULL, NULL),
(38, 'Pharmacie Ibn Sina ', 'Moroni', '7739197', '$2y$10$xYFk.7wl0D/.O7NaUDKlXOCNNYgIrxY4.2hMIm8dHsCkYKGCpi47G', 'La Pharmacie Ibn Sina est un établissement reconnu pour la qualité de son service et son engagement envers la santé de ses clients. Située dans un quartier dynamique, elle offre une large gamme de médicaments et de produits de parapharmacie, tout en veillant à fournir des conseils avisés et personnalisés. Le personnel, composé de professionnels compétents, est toujours disponible pour répondre aux questions et accompagner les patients dans leur parcours de soin.', 'https://www.openstreetmap.org/export/embed.html?bbox=43.2427375,-11.7170440,43.2627375,-11.6970440&amp;layer=mapnik&amp;marker=-11.7070440,43.2527375&amp;zoom=15', 'pharmacieibnsina@gmail.com', NULL, NULL, NULL, -11.707044, 43.2527375, '[\"USER_PHARMACIEN\"]', NULL, NULL),
(42, 'Pharmacie Oasis', 'Moroni Oasis', '7634597', '$2y$10$ZI0Om5IHe//BkZ57ifkYv.4zHViMY7mMz00GfAFevGEUD0gtpItAO', 'La Pharmacie Oasis est un établissement réputé, situé au cœur du quartier, offrant une large gamme de produits pharmaceutiques et de parapharmacie. Avec son cadre moderne et accueillant, elle se distingue par son service de qualité et son engagement à fournir des soins personnalisés à chaque client. Que ce soit pour des médicaments, des conseils médicaux ou des produits de bien-être, la pharmacie veille à répondre à tous les besoins avec professionnalisme.\r\n\r\n', 'https://www.openstreetmap.org/export/embed.html?bbox=43.2483742,-11.6982692,43.2683742,-11.6782692&amp;layer=mapnik&amp;marker=-11.6882692,43.2583742&amp;zoom=15', 'pharmacieoasis@gmail.com', '66d9962dc0f1f.jpg', NULL, NULL, -11.6882692, 43.2583742, '[\"USER_PHARMACIEN\"]', NULL, NULL),
(43, 'Pharmacie de l\'archpel', 'Moroni Hamraba', '7739834', '$2y$10$ga8z0d8FRDrk0R/kcwOQGOB49DwnNtznZtii6SYSALtJGUXfUaMZe', 'La Pharmacie de l\'Archipel est un établissement reconnu pour son service attentionné et la qualité des soins qu’elle offre à ses clients. Située dans un quartier animé, cette pharmacie propose un éventail complet de médicaments, ainsi que des produits de parapharmacie, de santé et de bien-être, répondant ainsi aux attentes de la communauté locale.', 'https://www.openstreetmap.org/export/embed.html?bbox=43.2358113,-11.7243068,43.2558113,-11.7043068&amp;layer=mapnik&amp;marker=-11.7143068,43.2458113&amp;zoom=15', 'pharmaciearchipel@gmail.com', '66d998ddf37da.jpg', NULL, NULL, -11.7143068, 43.2458113, '[\"USER_PHARMACIEN\"]', NULL, NULL),
(45, 'Pharmacie Al-Camar', 'Moroni Al-Camar', '7732112', '$2y$10$LjcKOEDuPe6gXBn1m0fqJO7JC7BlKd0RodmP7ujmzjPfmZGdDPJoG', 'Pharmacie Al-Camar est un établissement réputé pour la qualité de son service et son engagement envers ses clients. Elle propose une gamme complète de médicaments et de produits de parapharmacie, avec un personnel attentif qui offre des conseils personnalisés et un accompagnement de qualité.', 'https://www.openstreetmap.org/export/embed.html?bbox=43.2371130,-11.7103293,43.2571130,-11.6903293&amp;layer=mapnik&amp;marker=-11.6903293,43.2571130&amp;zoom=15', 'pharmaciealcamar@gmail.com', NULL, NULL, NULL, -11.6903293, 43.257113, '[\"USER_PHARMACIEN\"]', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `planning_garde`
--

CREATE TABLE `planning_garde` (
  `id` int(11) NOT NULL,
  `date_debut` time NOT NULL,
  `date_fin` time NOT NULL,
  `id_pharmacie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `planning_garde`
--

INSERT INTO `planning_garde` (`id`, `date_debut`, `date_fin`, `id_pharmacie_id`) VALUES
(15, '14:01:00', '14:03:00', 32),
(18, '14:04:00', '14:06:00', 37);

-- --------------------------------------------------------

--
-- Structure de la table `useradmingen`
--

CREATE TABLE `useradmingen` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`roles`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `useradmingen`
--

INSERT INTO `useradmingen` (`id`, `username`, `email`, `mdp`, `roles`) VALUES
(1, 'bachar', 'bachar22@gmail.com', 'papa', '[\"ROLE_ADMIN\"]');

-- --------------------------------------------------------

--
-- Structure de la table `user_ordre_pharma`
--

CREATE TABLE `user_ordre_pharma` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`roles`)),
  `tel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_ordre_pharma`
--

INSERT INTO `user_ordre_pharma` (`id`, `username`, `email`, `mdp`, `roles`, `tel`) VALUES
(9, 'bachar', 'bachar@gmail.com', '$2y$10$/LmTrN./7jtmQq2aPB0pzuhOfzcVOop8UX.ALQNRZ/eQrbxQ42Gz.', '[\"USER_ORDERPHARM\"]', 4621263),
(10, 'administrateur', 'admin@gmail.com', '$2y$10$RQW/EoVq532xzNZ2KLpsEu6kBlkEkZDDqGgZ1qwCq/ONS6TJzSHc2', '[\"USER_ORDERPHARM\"]', 3230754);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `medicament`
--
ALTER TABLE `medicament`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `medicament_pharmacie`
--
ALTER TABLE `medicament_pharmacie`
  ADD PRIMARY KEY (`medicament_id`,`pharmacie_id`),
  ADD KEY `IDX_804E4447AB0D61F7` (`medicament_id`),
  ADD KEY `IDX_804E4447BC6D351B` (`pharmacie_id`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pharmacie`
--
ALTER TABLE `pharmacie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `planning_garde`
--
ALTER TABLE `planning_garde`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_943AF1F39FAC4069` (`id_pharmacie_id`);

--
-- Index pour la table `useradmingen`
--
ALTER TABLE `useradmingen`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user_ordre_pharma`
--
ALTER TABLE `user_ordre_pharma`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `medicament`
--
ALTER TABLE `medicament`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `pharmacie`
--
ALTER TABLE `pharmacie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT pour la table `planning_garde`
--
ALTER TABLE `planning_garde`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `useradmingen`
--
ALTER TABLE `useradmingen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `user_ordre_pharma`
--
ALTER TABLE `user_ordre_pharma`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `medicament_pharmacie`
--
ALTER TABLE `medicament_pharmacie`
  ADD CONSTRAINT `FK_804E4447AB0D61F7` FOREIGN KEY (`medicament_id`) REFERENCES `medicament` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_804E4447BC6D351B` FOREIGN KEY (`pharmacie_id`) REFERENCES `pharmacie` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `planning_garde`
--
ALTER TABLE `planning_garde`
  ADD CONSTRAINT `FK_943AF1F39FAC4069` FOREIGN KEY (`id_pharmacie_id`) REFERENCES `pharmacie` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
