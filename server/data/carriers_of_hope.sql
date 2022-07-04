CREATE TABLE members (
  id          SERIAL PRIMARY KEY,
  firstName   VARCHAR( 30 ) NOT NULL,
  lastName    VARCHAR( 30 ) NOT NULL,
  email       VARCHAR( 120 ) NOT NULL UNIQUE,
  address     VARCHAR( 120 ) NOT NULL,
  city        VARCHAR( 30 ) NOT NULL,
  postcode    VARCHAR( 8 ) NOT NULL,
  country     VARCHAR( 20 ) NOT NULL,
  telephone   NUMERIC NOT NULL,
  password    VARCHAR( 15 ) NOT NULL,
  isAdmin     BOOLEAN NOT NULL
);

INSERT INTO members (firstName, lastName, email, address, city, postcode, country, telephone, password, isAdmin) 
  VALUES ('John','Smith','j.smith@johnsmith.org','11 New Road','Liverpool','L10 2AB','UK',12345678910, 'johnsmith', FALSE),
         ('Selchuk','Karakus','s.karakus@johnsmith.org','12 New Road','London','L10 2AB','UK', 23456789101, 'selchukkarakus', FALSE),
         ('Helen','Rog','h.rog@johnsmith.org','13 New Road','London','L10 2AB','UK', 34567891234, 'helenrog', FALSE),
         ('Mahri','Atdayeva','m.atdayeva@johnsmith.org','14 New Road','London','L10 2AB','UK', 45678912345, 'mahriatdayeva', FALSE),
         ('Sami','Hakim','s.hakim@johnsmith.org','15 New Road','London','L10 2AB','UK', 56789012345, 'samihakim', TRUE),
         ('Hedyeh','Etemadi','h.etemedi@johnsmith.org','16 New Road','Manchester','L10 2AB','UK', 67890123456, 'hedyehetemaddi', TRUE),
         ('Olga','Olga','o.olga@johnsmith.org','17 New Road','London','L10 2AB','UK', 78901234567, 'olgaolga', TRUE);
