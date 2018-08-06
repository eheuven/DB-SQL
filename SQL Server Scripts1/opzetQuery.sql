CREATE TABLE adres
(
  straatnaam VARCHAR(75) NOT NULL,
  postcode VARCHAR(75) NOT NULL,
  huisnummer INT NOT NULL,
  woonplaats VARCHAR(75) NOT NULL,
  adres_id INT PRIMARY KEY,
);

CREATE TABLE client
(
  voornaam VARCHAR(75) NOT NULL,
  achternaam VARCHAR(75) NOT NULL,
  client_nummer INT PRIMARY KEY,
  adres_id INT NOT NULL,
  FOREIGN KEY (adres_id) REFERENCES adres(adres_id)
);

CREATE TABLE rekening
(
  rekening_nummer INT PRIMARY KEY,
  tegoed INT NOT NULL,
  datum_open DATE NOT NULL,
  type INT NOT NULL,
  client_nummer INT NOT NULL,
  FOREIGN KEY (client_nummer) REFERENCES client(client_nummer)
);

CREATE TABLE transactie
(
  bedrag INT NOT NULL,
  beschrijving VARCHAR(255),
  datum DATE NOT NULL,
  type INT NOT NULL,
  rekening_nummer INT NOT NULL,
  FOREIGN KEY (rekening_nummer) REFERENCES rekening(rekening_nummer)
);

CREATE TABLE automatisch_overschrijving
(
  bedrag INT NOT NULL,
  dag_vd_maand INT NOT NULL,
  beschrijving INT,
  datum_aanmaak DATE NOT NULL,
  rekeningnummer_naar INT NOT NULL,
  rekening_nummer INT NOT NULL,
  FOREIGN KEY (rekening_nummer) REFERENCES rekening(rekening_nummer)
);

CREATE TABLE lening
(
  contract_datum DATE NOT NULL,
  verval_datum DATE NOT NULL,
  bedrag INT NOT NULL,
  interval INT NOT NULL,
  Lening_nummer INT PRIMARY KEY,
  rekening_nummer INT NOT NULL,
  FOREIGN KEY (rekening_nummer) REFERENCES rekening(rekening_nummer)
);

CREATE TABLE aflossing
(
  bedrag INT NOT NULL,
  beschrijving VARCHAR(255),
  datum DATE NOT NULL,
  Lening_nummer INT NOT NULL,
  FOREIGN KEY (Lening_nummer) REFERENCES lening(Lening_nummer)
);