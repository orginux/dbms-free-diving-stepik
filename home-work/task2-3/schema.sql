CREATE TABLE Conference(
    name TEXT,
    description TEXT
);

CREATE TABLE Venue(
    id INTEGER PRIMARY KEY,
    name TEXT,
    city TEXT,
    country TEXT,
    lat NUMERIC(7,5),
    lon NUMERIC(8,5)
);

CREATE TABLE PaperSubmission(
  id INTEGER PRIMARY KEY,
  conference TEXT,
  year INTEGER,
  title TEXT,
  isbn TEXT,
  page INTEGER,
  venue_id INTEGER
);
