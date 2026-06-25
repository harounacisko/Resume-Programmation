DROP DATABASE testDb;
CREATE DATABASE testDb;
USE testDb;
CREATE TABLE kunde(
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(100),
	adresse VARCHAR(200),
	PRIMARY KEY (id)
);
CREATE TABLE auftrag(
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(100),
	kunde_id INT NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE service(
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(100),
	PRIMARY KEY (id)
);
CREATE TABLE service_preis_kunde(
	id INT NOT NULL AUTO_INCREMENT,
	service_id INT NOT NULL,
	kunde_id INT NOT NULL,
	preis INT NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE angebot(
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(100),
	kunde_id INT NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE auftrag_service(
	id INT NOT NULL AUTO_INCREMENT,
	auftrag_id INT NOT NULL,
	service_id INT NOT NULL,
	stunde INT NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE angebot_service(
	id INT NOT NULL AUTO_INCREMENT,
	angebot_id INT NOT NULL,
	service_id INT NOT NULL,
	stunde INT NOT NULL,
	PRIMARY KEY(id)
);
CREATE TABLE sonderservice(
	id INT NOT NULL,
	kunde_id INT NOT NULL,
	preis INT NOT NULL,
	PRIMARY KEY(id)
);
ALTER TABLE auftrag
ADD FOREIGN KEY(kunde_id) REFERENCES kunde(id);
ALTER TABLE angebot
ADD FOREIGN KEY(kunde_id) REFERENCES kunde(id);
ALTER TABLE auftrag_service
ADD FOREIGN KEY(auftrag_id) REFERENCES auftrag(id),
	ADD FOREIGN KEY(service_id) REFERENCES service(id);
ALTER TABLE sonderservice
ADD FOREIGN KEY(kunde_id) REFERENCES kunde(id);
ALTER TABLE service_preis_kunde
ADD FOREIGN KEY(kunde_id) REFERENCES kunde(id),
	ADD FOREIGN KEY(service_id) REFERENCES service(id);
ALTER TABLE angebot_service
ADD FOREIGN KEY(angebot_id) REFERENCES angebot(id),
	ADD FOREIGN KEY(service_id) REFERENCES service(id);
INSERT INTO service
VALUES(1, 'Support'),
	(2, 'Beartung'),
	(3, 'Schulung');
INSERT INTO kunde
VALUES(1, 'SELF', 'Adresse SELF'),
	(2, 'Kunde A', 'Adresse Kunde A'),
	(3, 'Kunde B', 'Adresse Kunde B');
INSERT INTO auftrag
VALUES(1, 'Auftrag Kunde A 1', 2),
	(2, 'Auftrag Kunde A 2', 2);
INSERT INTO auftrag
VALUES(3, 'Auftrag Kunde B 1', 3),
	(4, 'Auftrag Kunde B 2', 3);
/** INSERT INTO angebot(name,kunde_id) VALUES('Webseite erstellen',1),('Datenbank erzeugen',1);**/
INSERT INTO service_preis_kunde(service_id, kunde_id, preis)
VALUES(1, 1, 20),
	(2, 1, 30),
	(3, 1, 50);
INSERT INTO service_preis_kunde(service_id, kunde_id, preis)
VALUES(1, 2, 15),
	(2, 2, 25),
	(3, 2, 40);
INSERT INTO auftrag_service(auftrag_id, service_id, stunde)
VALUES(1, 1, 8),
	(1, 1, 8),
	(1, 2, 4);
INSERT INTO auftrag_service(auftrag_id, service_id, stunde)
VALUES(2, 3, 4),
	(2, 1, 8),
	(2, 2, 4);
INSERT INTO auftrag_service(auftrag_id, service_id, stunde)
VALUES(3, 1, 10),
	(3, 1, 20);
INSERT INTO auftrag_service(auftrag_id, service_id, stunde)
VALUES(4, 3, 5),
	(4, 1, 8),
	(4, 2, 4);
INSERT INTO sonderservice(kunde_id, preis)
VALUES (1, 230);
INSERT INTO angebot(id, kunde_id)
VALUES (1, 2);
INSERT INTO angebot(id, kunde_id)
VALUES (2, 3);
INSERT INTO angebot_service(angebot_id, service_id, stunde)
VALUES(1, 3, 5),
	(1, 1, 8),
	(1, 2, 4);
INSERT INTO angebot_service(angebot_id, service_id, stunde)
VALUES(2, 1, 12),
	(2, 2, 10);
SET @kundeid = 3;
SELECT auftrag.name,
	(
		CASE
			WHEN (
				SELECT count(service_preis_kunde.id)
				FROM service_preis_kunde
					INNER JOIN auftrag_service ON auftrag_service.service_id = service_preis_kunde.service_id
					AND service_preis_kunde.kunde_id = (
						SELECT kunde_id
						FROM auftrag
						WHERE auftrag.id = auftrag_service.auftrag_id
					)
				WHERE kunde_id = @kundeid
			) > 1 THEN SUM(
				stunde * (
					SELECT preis
					FROM service_preis_kunde
						INNER JOIN kunde ON service_preis_kunde.kunde_id = kunde.id
						AND service_preis_kunde.service_id = auftrag_service.service_id
					WHERE service_preis_kunde.kunde_id = @kundeid
				)
			)
			ELSE SUM(
				stunde * (
					SELECT preis
					FROM service_preis_kunde
						INNER JOIN kunde ON service_preis_kunde.kunde_id = kunde.id
						AND service_preis_kunde.service_id = auftrag_service.service_id
					WHERE service_preis_kunde.kunde_id = 1
				)
			)
		END
	) AS SUMME
FROM auftrag_service
	INNER JOIN auftrag ON auftrag_service.auftrag_id = auftrag.id
WHERE auftrag_id IN (
		SELECT auftrag.id
		FROM auftrag
			INNER JOIN kunde on auftrag.kunde_id = @kundeid
	)
GROUP BY auftrag_id;
/*****Angebot******/
SELECT angebot_service.id,
	angebot_service.service_id AS serviceid,
	stunde,
	(
		SELECT kunde_id
		FROM angebot
		WHERE angebot.id = angebot_service.angebot_id
	) AS kundeid,
	(
		CASE
			WHEN(
				SELECT count(service_preis_kunde.id)
				FROM service_preis_kunde INNER JOIN angebot_service ON angebot_service.service_id=service_preis_kunde.service_id AND service_preis_kunde.kunde_id=kundeid
				WHERE service_preis_kunde.kunde_id = kundeid
			) > 1 THEN (
				SELECT preis
				FROM service_preis_kunde
					INNER JOIN kunde ON service_preis_kunde.kunde_id = kunde.id
					AND service_preis_kunde.service_id = angebot_service.service_id
				WHERE service_preis_kunde.kunde_id = kundeid
			)
			ELSE (
				SELECT preis
				FROM service_preis_kunde
					INNER JOIN kunde ON service_preis_kunde.kunde_id = kunde.id
					AND service_preis_kunde.service_id = angebot_service.service_id
				WHERE service_preis_kunde.kunde_id = 1
			)
		END
	) AS preis
FROM angebot_service
WHERE angebot_id = 1