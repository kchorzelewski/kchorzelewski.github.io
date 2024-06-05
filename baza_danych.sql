-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 05 Cze 2024, 22:31
-- Wersja serwera: 10.4.25-MariaDB
-- Wersja PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `psi`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `danie`
--

CREATE TABLE `danie` (
  `idDania` int(11) NOT NULL,
  `nazwa` varchar(45) NOT NULL,
  `cena` double NOT NULL,
  `opis` varchar(300) NOT NULL,
  `idRestauracji` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `danie`
--

INSERT INTO `danie` (`idDania`, `nazwa`, `cena`, `opis`, `idRestauracji`) VALUES
(1, 'Big mac', 10.99, 'Big Mac to ikoniczny burger McDonald\'s z trzema warstwami bułki z sezamem, dwoma kotletami wołowymi, serem, sałatą, kiszonymi ogórkami, cebulą i charakterystycznym sosem.', 1),
(2, 'Coca-cola', 5.99, 'Coca-Cola to gazowany napój bezalkoholowy o charakterystycznym, słodkim smaku i ciemnobrązowym kolorze. ', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dostawca`
--

CREATE TABLE `dostawca` (
  `idDostawcy` int(11) NOT NULL,
  `imie` varchar(45) NOT NULL,
  `nazwisko` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `haslo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `dostawca`
--

INSERT INTO `dostawca` (`idDostawcy`, `imie`, `nazwisko`, `email`, `haslo`) VALUES
(1, 'Jan', 'Kowalski', 'jan_kowalski@gmail.com', '123456');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klient`
--

CREATE TABLE `klient` (
  `idKlienta` int(11) NOT NULL,
  `imie` varchar(45) NOT NULL,
  `nazwisko` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `haslo` varchar(45) NOT NULL,
  `adres` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `klient`
--

INSERT INTO `klient` (`idKlienta`, `imie`, `nazwisko`, `email`, `haslo`, `adres`) VALUES
(1, 'Adam', 'Nowak', 'Adam_Nowak@gmail.com', '123456', 'Olsztyńska 3/4');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pozycja_zamowienia`
--

CREATE TABLE `pozycja_zamowienia` (
  `idPozycji` int(11) NOT NULL,
  `idZamowienia` int(11) NOT NULL,
  `idDania` int(11) NOT NULL,
  `ilosc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `pozycja_zamowienia`
--

INSERT INTO `pozycja_zamowienia` (`idPozycji`, `idZamowienia`, `idDania`, `ilosc`) VALUES
(1, 1, 1, 2),
(2, 1, 2, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `restauracja`
--

CREATE TABLE `restauracja` (
  `idRestauracji` int(11) NOT NULL,
  `nazwa` varchar(45) NOT NULL,
  `adres` varchar(45) NOT NULL,
  `haslo` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `restauracja`
--

INSERT INTO `restauracja` (`idRestauracji`, `nazwa`, `adres`, `haslo`, `email`) VALUES
(1, 'McDonalds', 'Roosevelta 1', '123456', 'mcdonalds@gmail.com');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienie`
--

CREATE TABLE `zamowienie` (
  `idZamowienia` int(11) NOT NULL,
  `godzinaZamowienia` time DEFAULT NULL,
  `godzinaDostawy` time DEFAULT NULL,
  `dataZamowienia` date NOT NULL,
  `stanZamowienia` enum('Nieopłacone','Opłacone','Anulowane','W drodze','Dostarczone') NOT NULL,
  `idDostawcy` int(11) NOT NULL,
  `idKlienta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `zamowienie`
--

INSERT INTO `zamowienie` (`idZamowienia`, `godzinaZamowienia`, `godzinaDostawy`, `dataZamowienia`, `stanZamowienia`, `idDostawcy`, `idKlienta`) VALUES
(1, '12:30:00', '00:00:00', '2024-06-05', 'W drodze', 1, 1);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `danie`
--
ALTER TABLE `danie`
  ADD PRIMARY KEY (`idDania`);

--
-- Indeksy dla tabeli `dostawca`
--
ALTER TABLE `dostawca`
  ADD PRIMARY KEY (`idDostawcy`);

--
-- Indeksy dla tabeli `klient`
--
ALTER TABLE `klient`
  ADD PRIMARY KEY (`idKlienta`);

--
-- Indeksy dla tabeli `pozycja_zamowienia`
--
ALTER TABLE `pozycja_zamowienia`
  ADD PRIMARY KEY (`idPozycji`);

--
-- Indeksy dla tabeli `restauracja`
--
ALTER TABLE `restauracja`
  ADD PRIMARY KEY (`idRestauracji`);

--
-- Indeksy dla tabeli `zamowienie`
--
ALTER TABLE `zamowienie`
  ADD PRIMARY KEY (`idZamowienia`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `danie`
--
ALTER TABLE `danie`
  MODIFY `idDania` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `dostawca`
--
ALTER TABLE `dostawca`
  MODIFY `idDostawcy` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `klient`
--
ALTER TABLE `klient`
  MODIFY `idKlienta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `pozycja_zamowienia`
--
ALTER TABLE `pozycja_zamowienia`
  MODIFY `idPozycji` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `restauracja`
--
ALTER TABLE `restauracja`
  MODIFY `idRestauracji` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `zamowienie`
--
ALTER TABLE `zamowienie`
  MODIFY `idZamowienia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
