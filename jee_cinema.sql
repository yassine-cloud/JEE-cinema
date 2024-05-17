-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 18 mai 2024 à 01:23
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
-- Base de données : `jee_cinema`
--

-- --------------------------------------------------------

--
-- Structure de la table `film`
--

CREATE TABLE `film` (
  `id_film` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `duration` int(11) NOT NULL,
  `genre` varchar(50) NOT NULL,
  `directeur` varchar(100) NOT NULL,
  `img` varchar(255) NOT NULL DEFAULT 'https://picsum.photos/200/300'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `film`
--

INSERT INTO `film` (`id_film`, `title`, `description`, `duration`, `genre`, `directeur`, `img`) VALUES
(1, 'Inception', 'Un film de science-fiction sur les rêves et la réalité', 148, 'Science-fiction', 'Christopher Nolan', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRb6Nu1D1ztRR_pAwO0Bv9XOLvsagFFXVWhkzZpT6Uab67kmG-zOMiFhRa0oDmpdMJUXfw&usqp=CAU'),
(2, 'The Dark Knight', 'Un film d\'action basé sur le personnage de Batman', 152, 'Action', 'Christopher Nolan', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWNehPx9hyIahvjK2l26zyx34g0_LKDR_GsS9VXeE0TQ&s'),
(6, 'Pulp Fiction', 'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.', 154, 'Crime, Drama', 'Quentin Tarantino', 'https://www.looper.com/img/gallery/pulp-fiction-2-will-it-ever-happen-upgrade/intro-1685472872.jpg'),
(7, 'The Godfather', 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.', 175, 'Crime, Drama', 'Francis Ford Coppola', 'https://i.ebayimg.com/images/g/x54AAOSwCzdklKmz/s-l1200.jpg'),
(8, 'Forrest Gump', 'The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold from the perspective of an Alabama man with an IQ of 75, whose only desire is to be reunited with his childhood sweetheart.', 142, 'Drama, Romance', 'Robert Zemeckis', 'https://www.timeart.co.uk/images/cache/forrest-gump-45-2000-nw.jpg'),
(9, 'The Matrix', 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.', 136, 'Action, Sci-Fi', 'Lana Wachowski, Lilly Wachowski', 'https://www.ourquadcities.com/wp-content/uploads/sites/19/2021/12/matrix.jpg?w=1280'),
(10, 'Titanic', 'A seventeen-year-old aristocrat falls in love with a kind but poor artist aboard the luxurious, ill-fated R.M.S. Titanic.', 195, 'Drama, Romance', 'James Cameron', 'https://www.stuff.co.nz/media/images/9Tzi8ywRz924XE3uHaD6DfGZQfjEdZd7oKlsiR53VLF3Mqfk4hrKlb19ysdt4TG2fxUEOV1kDpWjKA4Tju912h8QJXUf7phQEmgZwHMpAyxfKWYUdVVMVQy2eG+4U5EDj4X4WcCHhYOcZ93abonXDw==?resolution=1240x700');

-- --------------------------------------------------------

--
-- Structure de la table `hall`
--

CREATE TABLE `hall` (
  `id_hall` int(11) NOT NULL,
  `num_hall` int(11) NOT NULL,
  `capacity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `hall`
--

INSERT INTO `hall` (`id_hall`, `num_hall`, `capacity`) VALUES
(1, 1, 50),
(2, 2, 50),
(3, 11, 155),
(4, 12, 255),
(6, 100, 60),
(8, 90, 500);

-- --------------------------------------------------------

--
-- Structure de la table `projection`
--

CREATE TABLE `projection` (
  `id_projection` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `id_film` int(11) NOT NULL,
  `id_hall` int(11) NOT NULL,
  `prix` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `projection`
--

INSERT INTO `projection` (`id_projection`, `date`, `id_film`, `id_hall`, `prix`) VALUES
(1, '2024-05-12 00:00:00', 1, 2, 13),
(5, '2024-05-19 00:50:00', 2, 8, 25),
(7, '2024-05-22 02:52:00', 2, 4, 30),
(8, '2024-05-04 01:16:00', 10, 3, 20),
(9, '2024-05-14 04:14:00', 10, 1, 60),
(10, '2024-05-26 14:14:00', 9, 8, 12),
(11, '2024-05-23 18:14:00', 9, 6, 16),
(12, '2024-05-18 18:15:00', 8, 3, 20),
(13, '2024-06-02 13:18:00', 8, 1, 30),
(14, '2024-06-09 15:16:00', 7, 2, 25),
(15, '2024-05-30 01:16:00', 7, 6, 40),
(16, '2024-05-26 15:17:00', 6, 3, 13),
(17, '2024-05-23 05:17:00', 6, 4, 10),
(18, '2024-05-19 16:17:00', 2, 1, 20);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `nom`, `prenom`, `email`, `password`, `role`) VALUES
(1, 'super', 'admin', 'admin@gmail.com', 'admin', 'admin'),
(2, 'saadaoui', 'yassine', 'yassine@gmail.com', 'pass', 'client'),
(3, 'SAADAOUI', 'Yassine', 'saadaouiy51@gmail.com', 'pass', 'client'),
(4, 'Saadaoui', 'Khaled', 'khaledsaadaoui@gmail.com', 'pass', 'client');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id_film`);

--
-- Index pour la table `hall`
--
ALTER TABLE `hall`
  ADD PRIMARY KEY (`id_hall`);

--
-- Index pour la table `projection`
--
ALTER TABLE `projection`
  ADD PRIMARY KEY (`id_projection`),
  ADD KEY `FK_proj_film` (`id_film`),
  ADD KEY `FK_proj_hall` (`id_hall`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `one_email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `film`
--
ALTER TABLE `film`
  MODIFY `id_film` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `hall`
--
ALTER TABLE `hall`
  MODIFY `id_hall` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `projection`
--
ALTER TABLE `projection`
  MODIFY `id_projection` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `projection`
--
ALTER TABLE `projection`
  ADD CONSTRAINT `FK_proj_film` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_proj_hall` FOREIGN KEY (`id_hall`) REFERENCES `hall` (`id_hall`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
