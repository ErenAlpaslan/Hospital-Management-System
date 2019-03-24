-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 24 Mar 2019, 17:09:02
-- Sunucu sürümü: 10.1.38-MariaDB
-- PHP Sürümü: 7.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `hastane_proje`
--

DELIMITER $$
--
-- Yordamlar
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertInspection` (IN `Pa_ID` INT, IN `Do_ID` INT, IN `I_Date` DATE, IN `I_Clock` TIME, IN `I_Department` VARCHAR(50))  NO SQL
INSERT INTO `inspections`(`P_ID`, `D_ID`, `Date`, `Clock`, `department`) VALUES (Pa_ID,Do_ID,I_Date,I_Clock,I_Department)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertPatient` (IN `Pa_Name` VARCHAR(50), IN `Pa_Surname` VARCHAR(50), IN `Pa_B_Date` DATE, IN `Pa_Gender` VARCHAR(50), IN `Pa_Adress` TEXT, IN `Pa_Phone_Number` BIGINT)  NO SQL
INSERT INTO `patients`(`P_Name`, `P_Surname`, `B_Date`, `Gender`, `Adress`, `Phone_Number`) VALUES (Pa_Name,Pa_Surname,Pa_B_Date,Pa_Gender,Pa_Adress,Pa_Phone_Number)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `searchPatient` (IN `Pa_ID` INT)  NO SQL
select*from patients where P_ID=Pa_ID$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateInspectionDetail` (IN `In_InspDetail_ID` INT, IN `In_Recipte_Code` VARCHAR(5), IN `In_Decision` TEXT)  NO SQL
UPDATE `inspections_detail` SET 
`Recipe_Code`=In_Recipte_Code,`Decision`=In_Decision WHERE InspDetail_ID=In_InspDetail_ID$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `doctors`
--

CREATE TABLE `doctors` (
  `D_ID` int(11) NOT NULL,
  `D_Name` varchar(50) COLLATE utf32_turkish_ci NOT NULL,
  `D_Surname` varchar(50) COLLATE utf32_turkish_ci NOT NULL,
  `B_Date` date NOT NULL,
  `Gender` varchar(50) COLLATE utf32_turkish_ci NOT NULL,
  `Adress` text COLLATE utf32_turkish_ci NOT NULL,
  `Phone_Number` bigint(20) NOT NULL,
  `Expertise` varchar(50) COLLATE utf32_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

--
-- Tablo döküm verisi `doctors`
--

INSERT INTO `doctors` (`D_ID`, `D_Name`, `D_Surname`, `B_Date`, `Gender`, `Adress`, `Phone_Number`, `Expertise`) VALUES
(1, 'Mertcan', 'Tütüncü', '1990-03-02', 'Male', 'Cennet  Yavuz Selim Cd .37 / A  34290 Küçükçekmece / İstanbul', 5354382562, 'Urolog'),
(2, 'Burak', 'Çitak', '1938-02-15', 'Male', 'Cennet,\r\n     Atatürk Mahallesi - İkitelli Caddesi Ikitelli Cd No: 39 34307 Küçükçekmece ', 5426224535, 'Brain Surgery'),
(3, 'Eren', 'Alparslan', '1952-03-01', 'Male', 'Şirinevler Mahallesi, Fetih Cd. No:12, 34188 Bahçelievler/İstanbul ', 5385489696, 'Heart Surgeon'),
(4, 'Oğuzhan', 'Uzunay', '1996-10-16', 'Male', 'Yenidoğan Mahallesi, Atışalanı Cd. No:3/1, 34040 Bayrampaşa/İstanbul ', 5548964789, 'Plastic Surgery'),
(5, 'Serhat ', 'Selçuk', '1931-03-31', 'Male', 'Merkez Mahallesi, Çiğdem Cd. No:41, 34310 Avcılar/İstanbul ', 5426223596, 'Urolog'),
(6, 'Melih', 'Gülhan', '1976-07-15', 'Male', 'Hürriyet Mahallesi, bbudak Sokak No:1, 34188 Bahçelievler/İstanbul', 5316223131, 'internal medicine specialis'),
(7, 'Berkay', 'Bıyık', '1928-08-10', 'Male', 'Yeşilpınar Mahallesi, Şht. Metin Kaya Sk. Vialand, 34065 Eyüp/İstanbul', 5316223131, 'Thoracic Surgery');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `doctor_availability`
--

CREATE TABLE `doctor_availability` (
  `D_ID` int(11) NOT NULL,
  `D_Name` varchar(50) COLLATE utf32_turkish_ci NOT NULL,
  `D_Surname` varchar(50) COLLATE utf32_turkish_ci NOT NULL,
  `Availability` varchar(3) COLLATE utf32_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

--
-- Tablo döküm verisi `doctor_availability`
--

INSERT INTO `doctor_availability` (`D_ID`, `D_Name`, `D_Surname`, `Availability`) VALUES
(2, 'Burak', 'Çitak', 'NO'),
(7, 'Berkay', 'Bıyık', 'NO'),
(1, 'Mertcan', 'Tütüncü', 'YES'),
(3, 'Eren', 'Alparslan', 'YES'),
(4, 'Oğuzhan', 'Uzunay', 'YES'),
(5, 'Serhat', 'Selçuk', 'YES'),
(6, 'Melih', 'Gülhan', 'YES');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `inspections`
--

CREATE TABLE `inspections` (
  `I_ID` int(11) NOT NULL,
  `P_ID` int(11) NOT NULL,
  `D_ID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Clock` time NOT NULL,
  `department` varchar(50) COLLATE utf32_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

--
-- Tablo döküm verisi `inspections`
--

INSERT INTO `inspections` (`I_ID`, `P_ID`, `D_ID`, `Date`, `Clock`, `department`) VALUES
(1, 7, 2, '2019-03-25', '12:00:00', 'Brain Surgery'),
(2, 8, 7, '2019-03-28', '16:30:00', 'Thoracic Surgery'),
(17, 2, 2, '2019-03-26', '16:00:00', 'SSS');

--
-- Tetikleyiciler `inspections`
--
DELIMITER $$
CREATE TRIGGER `ADD` AFTER INSERT ON `inspections` FOR EACH ROW INSERT INTO `inspections_detail`(`I_ID`, `Recipe_Code`, `Decision`) 
VALUES (new.I_ID,NULL,NULL)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `inspections_detail`
--

CREATE TABLE `inspections_detail` (
  `InspDetail_ID` int(11) NOT NULL,
  `I_ID` int(11) NOT NULL,
  `Recipe_Code` varchar(5) COLLATE utf32_turkish_ci DEFAULT NULL,
  `Decision` text COLLATE utf32_turkish_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

--
-- Tablo döküm verisi `inspections_detail`
--

INSERT INTO `inspections_detail` (`InspDetail_ID`, `I_ID`, `Recipe_Code`, `Decision`) VALUES
(1, 1, '#5468', 'He had a gunshot from the left side of the patient\'s head.\r\nSkull fractures are found and surgery is required for removal.'),
(2, 2, '#8569', 'The patient underwent enlargement of her breasts by aesthetic operation. Two 35 cc implants were implanted into the patient.'),
(3, 1, '#0000', 'BG'),
(4, 2, '#6464', 'ss');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `patients`
--

CREATE TABLE `patients` (
  `P_ID` int(11) NOT NULL,
  `P_Name` varchar(50) COLLATE utf32_turkish_ci NOT NULL,
  `P_Surname` varchar(50) COLLATE utf32_turkish_ci NOT NULL,
  `B_Date` date NOT NULL,
  `Gender` varchar(50) COLLATE utf32_turkish_ci NOT NULL,
  `Adress` text COLLATE utf32_turkish_ci NOT NULL,
  `Phone_Number` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

--
-- Tablo döküm verisi `patients`
--

INSERT INTO `patients` (`P_ID`, `P_Name`, `P_Surname`, `B_Date`, `Gender`, `Adress`, `Phone_Number`) VALUES
(1, 'Abraham', 'Linkoln', '0000-00-00', 'Female', 'Dikilitaş Mah., Ayazmadere Cad. 14/A, 34349 Beşiktaş/İstanbul', 8502226528),
(2, 'Buket', 'Duru', '1990-02-06', 'Female', 'Dudullu O.S.B mah. Des-101 Sokak A-2 Blok No:42 Ümraniye/İstanbul ', 5546228565),
(3, 'Tolunay', 'Öztürk', '1996-08-05', 'Male', 'Şehit Muhtar Mahallesi, Zambak Sk. No:13, 34435 Beyoğlu/İstanbul', 5356558889),
(4, 'Yunus İdris', 'Yeşil', '1989-06-07', 'Male', 'Mehmet Akif Mahallesi, Turgut Özal Blv Mertay Konutları Palmiye Apt. No:55/1, 34774 Ümraniye/İstanbul', 5488899695),
(5, 'Hatice', 'Menteşe', '1962-02-12', 'Female', 'Ortaköy Mh., Dereboyu Cd. 1 86, 34347 Beşiktaş/Europe', 5266455256),
(6, 'Semi', 'Üstüntürk', '1925-05-09', 'Male', 'çınar mallesi m.k. atatürk caddesi can sokak no 6/b, küçükyalı, 34841 maltepe/İstanbul', 5554856575),
(7, 'İbrahim', 'Tatlıses', '1945-05-06', 'Male', 'Büyükdere Caddesi, No: 62 Lale İş Merkezi K:4 Mecidiyeköy, 34394 Şişli/İstanbul', 5548965646),
(8, 'İlayda', 'Şimşek', '1998-05-06', 'Female', 'Çakmak Mahallesi, Akdağ Cd., 34774 Dudullu Osb/Ümraniye/İstanbul', 5456333332),
(9, 'Günay', 'Çitak', '1945-05-12', 'Male', 'Masko Sanayi Sitesi Yolu 11 A, 34490 İkitelli Osb/Başakşehir/İstanbul', 5354654656);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`D_ID`);

--
-- Tablo için indeksler `doctor_availability`
--
ALTER TABLE `doctor_availability`
  ADD KEY `D_ID` (`D_ID`);

--
-- Tablo için indeksler `inspections`
--
ALTER TABLE `inspections`
  ADD PRIMARY KEY (`I_ID`),
  ADD KEY `P_ID` (`P_ID`),
  ADD KEY `D_ID` (`D_ID`);

--
-- Tablo için indeksler `inspections_detail`
--
ALTER TABLE `inspections_detail`
  ADD PRIMARY KEY (`InspDetail_ID`),
  ADD KEY `I_ID` (`I_ID`);

--
-- Tablo için indeksler `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`P_ID`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `doctors`
--
ALTER TABLE `doctors`
  MODIFY `D_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `inspections`
--
ALTER TABLE `inspections`
  MODIFY `I_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Tablo için AUTO_INCREMENT değeri `inspections_detail`
--
ALTER TABLE `inspections_detail`
  MODIFY `InspDetail_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `patients`
--
ALTER TABLE `patients`
  MODIFY `P_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `doctor_availability`
--
ALTER TABLE `doctor_availability`
  ADD CONSTRAINT `doctor_availability_ibfk_1` FOREIGN KEY (`D_ID`) REFERENCES `doctors` (`D_ID`);

--
-- Tablo kısıtlamaları `inspections`
--
ALTER TABLE `inspections`
  ADD CONSTRAINT `inspections_ibfk_1` FOREIGN KEY (`P_ID`) REFERENCES `patients` (`P_ID`),
  ADD CONSTRAINT `inspections_ibfk_2` FOREIGN KEY (`D_ID`) REFERENCES `doctors` (`D_ID`);

--
-- Tablo kısıtlamaları `inspections_detail`
--
ALTER TABLE `inspections_detail`
  ADD CONSTRAINT `inspections_detail_ibfk_1` FOREIGN KEY (`I_ID`) REFERENCES `inspections` (`I_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
