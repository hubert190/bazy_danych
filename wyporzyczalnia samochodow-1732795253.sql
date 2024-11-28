CREATE TABLE IF NOT EXISTS `Samochod` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`id_model` text NOT NULL,
	`rok_produkcji` date NOT NULL,
	`id_cena_za_dzien` int NOT NULL,
	`id_rezerwacja` int NOT NULL,
	PRIMARY KEY (`id`) 
);

CREATE TABLE IF NOT EXISTS `Klient` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Imie` text NOT NULL,
	`Nazwisko` text NOT NULL,
	`Numer_telefonu` int NOT NULL,
	`Email` text NOT NULL,
	`Adres` text NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `pracownik` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`imie` text NOT NULL,
	`nazwisko` text NOT NULL,
	`czas_pracy` text NOT NULL,
	`email` text NOT NULL,
	`id_stanowisko` int NOT NULL,
	`wyplata` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `model` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nazwa` text NOT NULL,
	`numer_seryjny` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `stanowisko` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nazwa_stanowiska` text NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `rezerwacja` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`id_klient` int NOT NULL,
	`id_samochod` int NOT NULL,
	`id_pracownik` int NOT NULL,
	`status` text NOT NULL,
	`id_platnosc` int NOT NULL,
	`data_rozpoczencia` date NOT NULL,
	`data_zakonczenia` date NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `platonosc` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`kwota` int NOT NULL,
	`data_platnosci` date NOT NULL,
	`id_sposob_platnosci` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `sposob_platnosci` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nazwa_sposobu` text NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `cena_za_dzien` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`czas_wyporzyczenia` int NOT NULL,
	`cena` int NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `Samochod` ADD CONSTRAINT `Samochod_fk1` FOREIGN KEY (`id_model`) REFERENCES `model`(`id`);

ALTER TABLE `Samochod` ADD CONSTRAINT `Samochod_fk3` FOREIGN KEY (`id_cena_za_dzien`) REFERENCES `cena_za_dzien`(`id`);

ALTER TABLE `Samochod` ADD CONSTRAINT `Samochod_fk4` FOREIGN KEY (`id_rezerwacja`) REFERENCES `rezerwacja`(`id`);

ALTER TABLE `pracownik` ADD CONSTRAINT `pracownik_fk5` FOREIGN KEY (`id_stanowisko`) REFERENCES `stanowisko`(`id`);


ALTER TABLE `rezerwacja` ADD CONSTRAINT `rezerwacja_fk1` FOREIGN KEY (`id_klient`) REFERENCES `Klient`(`id`);

ALTER TABLE `rezerwacja` ADD CONSTRAINT `rezerwacja_fk2` FOREIGN KEY (`id_samochod`) REFERENCES `Samochod`(`id`);

ALTER TABLE `rezerwacja` ADD CONSTRAINT `rezerwacja_fk3` FOREIGN KEY (`id_pracownik`) REFERENCES `pracownik`(`id`);

ALTER TABLE `rezerwacja` ADD CONSTRAINT `rezerwacja_fk5` FOREIGN KEY (`id_platnosc`) REFERENCES `platonosc`(`id`);
ALTER TABLE `platonosc` ADD CONSTRAINT `platonosc_fk3` FOREIGN KEY (`id_sposob_platnosci`) REFERENCES `sposob_platnosci`(`id`);

INSERT INTO Klient(Imie) VALUES ('Piotr');
INSERT INTO Klient(Imie) VALUES ('Szymon');
INSERT INTO Klient(Imie) VALUES ('Bartek');
INSERT INTO Klient(Imie) VALUES ('Artur');
INSERT INTO Klient(Imie) VALUES ('Ania');

INSERT INTO Klient(Nazwisko) VALUES ('Kot');
INSERT INTO Klient(Nazwisko) VALUES ('Wala');
INSERT INTO Klient(Nazwisko) VALUES ('Klys');
INSERT INTO Klient(Nazwisko) VALUES ('Pasek');
INSERT INTO Klient(Nazwisko) VALUES ('Kowalska');

INSERT INTO Klient(Numer_telefonu) VALUES (777888999);
INSERT INTO Klient(Numer_telefonu) VALUES (325342534);
INSERT INTO Klient(Numer_telefonu) VALUES (576575667);
INSERT INTO Klient(Numer_telefonu) VALUES (777867659);
INSERT INTO Klient(Numer_telefonu) VALUES (776878899);

INSERT INTO Klient(email) VALUES ('piotr11@gmail.com');
INSERT INTO Klient(email) VALUES ('szymon113@gmail.com');
INSERT INTO Klient(email) VALUES ('bartek121@gmail.com');
INSERT INTO Klient(email) VALUES ('artur131@gmail.com');
INSERT INTO Klient(email) VALUES ('ania121@gmail.com');

INSERT INTO model(nazwa) VALUES ('BMW');
INSERT INTO model(nazwa) VALUES ('Opel');
INSERT INTO model(nazwa) VALUES ('Mercedes');
INSERT INTO model(nazwa) VALUES ('Audi');