DROP TABLE IF EXISTS PaperSubmission;
DROP TABLE IF EXISTS Venue;
DROP TABLE IF EXISTS Conference;

CREATE TABLE Conference(
    name TEXT,
    description TEXT,
    PRIMARY KEY (name)
);

CREATE TABLE Venue(
    id INTEGER,
    name TEXT,
    city TEXT,
    country TEXT,
    lat NUMERIC(7,5),
    lon NUMERIC(8,5),
    UNIQUE (lat, lon),
    PRIMARY KEY (id)
);

CREATE TABLE PaperSubmission(
  id INTEGER PRIMARY KEY,
  conference TEXT,
  year INTEGER,
  title TEXT,
  isbn TEXT,
  page INTEGER NOT NULL,
  venue_id INTEGER,
  UNIQUE (conference, venue_id, isbn),
  UNIQUE (conference, year, title),
  FOREIGN KEY(conference) REFERENCES Conference(name),
  FOREIGN KEY(venue_id) REFERENCES Venue(id)
);
