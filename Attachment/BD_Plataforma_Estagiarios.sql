-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 15, 2025 at 05:31 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Estagio`
--

-- --------------------------------------------------------

--
-- Table structure for table `AreaDificuldade`
--

CREATE TABLE `AreaDificuldade` (
  `AreaDificuldadeID` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `HabilidadeComportamental`
--

CREATE TABLE `HabilidadeComportamental` (
  `HabilidadeComportamentalID` int(11) NOT NULL,
  `Nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `HabilidadeTecnica`
--

CREATE TABLE `HabilidadeTecnica` (
  `HabilidadeID` int(11) NOT NULL,
  `Nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `MotivoComunicacao`
--

CREATE TABLE `MotivoComunicacao` (
  `MotivoComunicacaoID` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Perguntas`
--

CREATE TABLE `Perguntas` (
  `PerguntaID` int(11) NOT NULL,
  `TipoQuestionario` enum('DiarioEstagiario','FeedbackEstagiario','DiarioTutor') NOT NULL,
  `TextoPergunta` varchar(500) NOT NULL,
  `Obrigatorio` tinyint(1) NOT NULL,
  `Opcoes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Respostas`
--

CREATE TABLE `Respostas` (
  `RespostaID` int(11) NOT NULL,
  `UsuarioID` int(11) NOT NULL,
  `PerguntaID` int(11) NOT NULL,
  `RespostaTexto` varchar(300) DEFAULT NULL,
  `RespostaLikert` int(11) DEFAULT NULL,
  `RespostaBoolean` tinyint(1) DEFAULT NULL,
  `RespostaTempo` int(11) DEFAULT NULL,
  `RespostaTarefa` int(11) DEFAULT NULL,
  `DataPreenchimento` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Usuarios`
--

CREATE TABLE `Usuarios` (
  `UsuarioID` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Tipo` enum('Estagiário','Tutor','Admin') NOT NULL,
  `Projecto` varchar(100) NOT NULL,
  `Password` varchar(30) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `DataNascimento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `HabilidadeComportamental`
--
ALTER TABLE `HabilidadeComportamental`
  ADD PRIMARY KEY (`HabilidadeComportamentalID`);

--
-- Indexes for table `HabilidadeTecnica`
--
ALTER TABLE `HabilidadeTecnica`
  ADD PRIMARY KEY (`HabilidadeID`);

--
-- Indexes for table `MotivoComunicacao`
--
ALTER TABLE `MotivoComunicacao`
  ADD PRIMARY KEY (`MotivoComunicacaoID`);

--
-- Indexes for table `Perguntas`
--
ALTER TABLE `Perguntas`
  ADD PRIMARY KEY (`PerguntaID`);

--
-- Indexes for table `Respostas`
--
ALTER TABLE `Respostas`
  ADD PRIMARY KEY (`RespostaID`),
  ADD KEY `PerguntaID` (`PerguntaID`),
  ADD KEY `UsuarioID` (`UsuarioID`);

--
-- Indexes for table `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD PRIMARY KEY (`UsuarioID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `HabilidadeComportamental`
--
ALTER TABLE `HabilidadeComportamental`
  MODIFY `HabilidadeComportamentalID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `HabilidadeTecnica`
--
ALTER TABLE `HabilidadeTecnica`
  MODIFY `HabilidadeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `MotivoComunicacao`
--
ALTER TABLE `MotivoComunicacao`
  MODIFY `MotivoComunicacaoID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Perguntas`
--
ALTER TABLE `Perguntas`
  MODIFY `PerguntaID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Respostas`
--
ALTER TABLE `Respostas`
  MODIFY `RespostaID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Usuarios`
--
ALTER TABLE `Usuarios`
  MODIFY `UsuarioID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Respostas`
--
ALTER TABLE `Respostas`
  ADD CONSTRAINT `respostas_ibfk_1` FOREIGN KEY (`PerguntaID`) REFERENCES `Perguntas` (`PerguntaID`),
  ADD CONSTRAINT `respostas_ibfk_2` FOREIGN KEY (`UsuarioID`) REFERENCES `Usuarios` (`UsuarioID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
