CREATE TABLE Location(id SERIAL, value TEXT);
CREATE TABLE Conference(id SERIAL, value TEXT);
CREATE TABLE Paper(id SERIAL, title TEXT, conference TEXT, location TEXT);

-- https://stepik.org/lesson/344681/step/3?discussion=3420110&unit=328371
INSERT INTO conference(id,  value) VALUES (1, 'CONF14' );
INSERT INTO conference(id,  value) VALUES (2, 'CONF13' );
INSERT INTO conference(id,  value) VALUES (3, 'CONF12' );
INSERT INTO conference(id,  value) VALUES (4, 'CONF11' );


INSERT INTO "location" (id,  value) VALUES (1, 'spb' );
INSERT INTO "location" (id,  value) VALUES (2, 'msc' );
INSERT INTO "location" (id,  value) VALUES (3, 'vlg' );
INSERT INTO "location" (id,  value) VALUES (4, 'kzn' );

INSERT INTO paper  VALUES (1, 'title1', 'CONF14', 'spb' );
INSERT INTO paper  VALUES (1, 'title1', 'NOT_EXISTED', 'spb' );
INSERT INTO paper  VALUES (3, 'title1', 'CONF14', 'vlg' );
INSERT INTO paper  VALUES (3, 'title1', 'CONF13', 'spb' );
