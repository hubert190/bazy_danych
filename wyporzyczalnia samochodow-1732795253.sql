CREATE TABLE IF NOT EXISTS `samochod` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`id_model` int NOT NULL,
	`rok_produkcji` text NOT NULL,
	`id_cena_za_dzien` int NOT NULL,
	`id_rezerwacja` int NOT NULL,
	PRIMARY KEY (`id`) 
);

INSERT INTO samochod (id, `id_model`,`rok_produkcji`,`id_cena_za_dzien`,`id_rezerwacja`) VALUES
(1, 1, '2023-3-22', 1, 1),
(2, 2,'2023-3-4', 2, 2),
(3, 3,'2023-8-8', 3, 3),
(4, 4,'2023-1-5' , 4, 4),
(5,5,'2023-12-2' ,5,5);

CREATE TABLE IF NOT EXISTS `Klient` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Imie` text NOT NULL,
	`Nazwisko` text NOT NULL,
	`Numer_telefonu` text NOT NULL,
	`Email` text NOT NULL,
	`Adres` text NOT NULL,
	PRIMARY KEY (`id`)
);

INSERT INTO klient (id,`Imie`,`Nazwisko`,`Numer_telefonu`,`Email`,`Adres`) VALUES
(1, `Piotr`,`Kot`,`777888999`,'piotr11@gmail.com', `Kielce 28a`),
(2, 'Szymon', 'Wala', `325342534`, 'szymon113@gmail.com', 'Kielce 65'),
(3, 'Bartek', 'Parkita', `576575667`, 'bartek121@gmail.com', 'Cedzyna 55'),
(4, 'Artur', 'Pasek', `777867659`, 'artur131@gmail.com', 'Konskie 23'),
(5, 'Ania', 'Kowalska', `776878899`, 'ania121@gmail.com', 'Kielce 22a');

CREATE TABLE IF NOT EXISTS `pracownik` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`imie` text NOT NULL,
	`nazwisko` text NOT NULL,
	`czas_pracy` text NOT NULL,
	`email` text NOT NULL,
	`id_stanowisko` int NOT NULL,
	`wyplata` text NOT NULL,
	PRIMARY KEY (`id`)
);

INSERT INTO pracownik (id,`Imie`,`Nazwisko`,`czas_pracy`,`email`,`id_stanowisko`,`wyplata`) VALUES
(1, 'Piotr', 'Kot', 'Full-time', 'piotr.kot@wypozyczalnia.com', 1, `4500.00`),
(2, 'Szymon', 'Wala', 'Full-time', 'szymon.wala@wypozyczalnia.com', 2, `3500.00`),
(3, 'Bartek', 'Parkita', 'Part-time', 'bartek.parkita@wypozyczalnia.com', 3, `3000.00`),
(4, 'Artur', 'Pasek', 'Full-time', 'artur.pasek@wypozyczalnia.com', 4, `4000.00`),
(5, 'Ania', 'Kowalska', 'Full-time', 'ania.kowalska@wypozyczalnia.com', 5, `3800.00`);

CREATE TABLE IF NOT EXISTS `model` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nazwa` text NOT NULL,
	`numer_seryjny` text NOT NULL,
	PRIMARY KEY (`id`)
);

INSERT INTO model (id,`nazwa`,`numer_seryjny`) VALUES
(1, 'Ferrari', 'A123456789'),
(2, 'Audi', 'B987654321'),
(3, 'Opel', 'C192837465'),
(4, 'Mercedes', 'D564738291'),
(5, 'BMW', 'E102938475');


CREATE TABLE IF NOT EXISTS `stanowisko` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nazwa_stanowiska` text NOT NULL,
	PRIMARY KEY (`id`)
);

INSERT INTO stanowisko (id,`nazwa_stanowiska`) VALUES
(1, 'Kierownik Wypożyczalni'),
(2, 'Pracownik Obsługi Klienta'),
(3, 'Mechanik'),
(4, 'Doradca ds. Wynajmu'),
(5, 'Kierowca Transportowy');

CREATE TABLE IF NOT EXISTS `rezerwacja` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`id_klient` int NOT NULL,
	`id_samochod` int NOT NULL,
	`id_pracownik` int NOT NULL,
	`status` text NOT NULL,
	`id_platnosc` int NOT NULL,
	`data_rozpoczencia` text NOT NULL,
	`data_zakonczenia` text NOT NULL,
	PRIMARY KEY (`id`)
);

INSERT INTO rezerwacja (id,`id_klient`,`id_samochod`,`id_pracownik`,`status`,`id_platnosc`,`data_rozpoczencia`,`data_zakonczenia`) VALUES
(1, 1, 2, 3, 'Zrealizowana', 1, '2024-12-01', '2024-12-07'),
(2, 2, 3, 4, 'Zrealizowana', 2, '2024-12-03', '2024-12-10'),
(3, 3, 4, 5, 'Oczekująca', 3, '2024-12-05', '2024-12-12'),
(4, 4, 5, 6, 'Zrealizowana', 4, '2024-12-07', '2024-12-14'),
(5, 5, 1, 7, 'Anulowana', 5, '2024-12-09', '2024-12-16');

CREATE TABLE IF NOT EXISTS `platonosc` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`kwota` text NOT NULL,
	`data_platnosci` text NOT NULL,
	`id_sposob_platnosci` int NOT NULL,
	PRIMARY KEY (`id`)
);

INSERT INTO platnosc (id,`kwota`,`data_platnosci`,`id_sposob_platnosci`) VALUES
(1, `350.00`, '2024-12-01', 1),
(2,` 450.00`, '2024-12-03', 2),
(3, `600.00`, '2024-12-05', 3),
(4,` 200.00`, '2024-12-07', 1),
(5, `750.00`, '2024-12-09', 2);

CREATE TABLE IF NOT EXISTS `sposob_platnosci` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nazwa_sposobu` text NOT NULL,
	PRIMARY KEY (`id`)
);

INSERT INTO sposob_platnosci (id,`nazwa_sposobu`) VALUES
(1, 'Gotówka'),
(2, 'Karta kredytowa'),
(3, 'Przelew bankowy'),
(4, 'Płatność online'),
(5, 'PayPal');


CREATE TABLE IF NOT EXISTS `cena_za_dzien` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`czas_wyporzyczenia` text NOT NULL,
	`cena` int NOT NULL,
	PRIMARY KEY (`id`)
);

INSERT INTO cena_za_dzien (id,`czas_wyporzyczenia`,`cena`) VALUES
(1, '1 dzień', 100.00),
(2, '1 dzień', 120.00),
(3, '7 dni', 700.00),
(4, '7 dni', 750.00),
(5, '1 dzień', 110.00);

ALTER TABLE `Samochod` ADD CONSTRAINT `Samochod_fk1` FOREIGN KEY (`id_model`) REFERENCES `model`(`id`);

ALTER TABLE `Samochod` ADD CONSTRAINT `Samochod_fk3` FOREIGN KEY (`id_cena_za_dzien`) REFERENCES `cena_za_dzien`(`id`);

ALTER TABLE `Samochod` ADD CONSTRAINT `Samochod_fk4` FOREIGN KEY (`id_rezerwacja`) REFERENCES `rezerwacja`(`id`);

ALTER TABLE `pracownik` ADD CONSTRAINT `pracownik_fk5` FOREIGN KEY (`id_stanowisko`) REFERENCES `stanowisko`(`id`);


ALTER TABLE `rezerwacja` ADD CONSTRAINT `rezerwacja_fk1` FOREIGN KEY (`id_klient`) REFERENCES `Klient`(`id`);

ALTER TABLE `rezerwacja` ADD CONSTRAINT `rezerwacja_fk2` FOREIGN KEY (`id_samochod`) REFERENCES `Samochod`(`id`);

ALTER TABLE `rezerwacja` ADD CONSTRAINT `rezerwacja_fk3` FOREIGN KEY (`id_pracownik`) REFERENCES `pracownik`(`id`);

ALTER TABLE `rezerwacja` ADD CONSTRAINT `rezerwacja_fk5` FOREIGN KEY (`id_platnosc`) REFERENCES `platonosc`(`id`);
ALTER TABLE `platonosc` ADD CONSTRAINT `platonosc_fk3` FOREIGN KEY (`id_sposob_platnosci`) REFERENCES `sposob_platnosci`(`id`);
