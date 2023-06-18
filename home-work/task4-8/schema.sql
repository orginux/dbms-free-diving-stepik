CREATE TABLE Spacecraft(
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE,
  service_life INT DEFAULT 1000,
  birth_year INT CHECK(birth_year > 0)
);

CREATE TABLE Planet(
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE,
  distance NUMERIC(5,2)
);

CREATE TABLE Commander(
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE Flight(
  id INT PRIMARY KEY,
  spacecraft_id INT REFERENCES Spacecraft,
  planet_id INT REFERENCES Planet,
  commander_id INT REFERENCES Commander,
  start_date DATE,
  UNIQUE(spacecraft_id, start_date),
  UNIQUE(commander_id, start_date)
);

insert into Spacecraft values
(1, 'Spacecraft 1', 1000, 1000),
(2, 'Spacecraft 2', 2000, 1001),
(3, 'Spacecraft 3', 3000, 1002),
(4, 'Spacecraft 4', 4000, 1003),
(5, 'Spacecraft 5', 5000, 1004);

insert into Planet values
(1, 'Planet 1', 1),
(2, 'Planet 2', 2),
(3, 'Planet 3', 3),
(4, 'Planet 4', 4),
(5, 'Planet 5', 5);

insert into Commander values
(1, 'Commander 1'),
(2, 'Commander 2'),
(3, 'Commander 3'),
(4, 'Commander 4'),
(5, 'Commander 5');

insert into Flight values
(1, 1, 2, 3, '2020-02-01'),
(2, 1, 2, 4, '2020-04-01'),
(3, 1, 2, 5, '2020-06-01'),
(4, 2, 2, 5, '2020-08-01'),
(5, 3, 2, 5, '2020-10-01');
