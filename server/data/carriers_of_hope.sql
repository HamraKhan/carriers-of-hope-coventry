drop table if exists products;

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

CREATE TABLE orders (
    id              SERIAL PRIMARY KEY,
    order_date      DATE NOT NULL,
    order_ref       VARCHAR(10) NOT NULL,
    quantity        INT NOT NULL,
    customer_id     INT REFERENCES customers(id)
    product_id      INT REFERENCES products(id)
);

CREATE TABLE products(
    id SERIAL PRIMARY KEY,
    product_name     VARCHAR(30) NOT NULL ,
    category_name    VARCHAR(30) NOT NULL ,
);

INSERT INTO members (firstName, lastName, email, address, city, postcode, country, telephone, password, isAdmin) 
  VALUES ('John','Smith','j.smith@johnsmith.org','11 New Road','Liverpool','L10 2AB','UK',12345678910, 'johnsmith', FALSE),
         ('Selchuk','Karakus','s.karakus@johnsmith.org','12 New Road','London','L10 2AB','UK', 23456789101, 'selchukkarakus', FALSE),
         ('Helen','Rog','h.rog@johnsmith.org','13 New Road','London','L10 2AB','UK', 34567891234, 'helenrog', FALSE),
         ('Mahri','Atdayeva','m.atdayeva@johnsmith.org','14 New Road','London','L10 2AB','UK', 45678912345, 'mahriatdayeva', FALSE),
         ('Sami','Hakim','s.hakim@johnsmith.org','15 New Road','London','L10 2AB','UK', 56789012345, 'samihakim', TRUE),
         ('Hedyeh','Etemadi','h.etemedi@johnsmith.org','16 New Road','Manchester','L10 2AB','UK', 67890123456, 'hedyehetemaddi', TRUE),
         ('Olga','Olga','o.olga@johnsmith.org','17 New Road','London','L10 2AB','UK', 78901234567, 'olgaolga', TRUE);


INSERT INTO products (product_name, category_name) VALUES ('Toaster', 'Kitchen and Utility');
INSERT INTO products (product_name, category_name) VALUES ('Bed Double', 'Furniture and Beds');
INSERT INTO products (product_name, category_name) VALUES ('Bath Mat', 'Bath');
INSERT INTO products (product_name, category_name) VALUES ("Kid's Rug", 'Rugs');
INSERT INTO products (product_name, category_name) VALUES ('Dinner Set(4Person', 'Kitchen and Utility');
INSERT INTO products (product_name, category_name) VALUES ('Towel(2big and 2 small)', 'Bath');
INSERT INTO products (product_name, category_name) VALUES ('Sofa', 'Furniture and Beds');
INSERT INTO products (product_name, category_name) VALUES ('Wardrobe', 'Furniture and Beds');
INSERT INTO products (product_name, category_name) VALUES ('Nappies', 'Baby and Kids');
INSERT INTO products (product_name, category_name) VALUES ('Window Curtain(grey, 2pair)', 'Curtains');
INSERT INTO products (product_name, category_name) VALUES ('Dining table', 'Kitchen and Utility');
INSERT INTO products (product_name, category_name) VALUES ('Mattress', 'Bath');



INSERT INTO orders (order_date, order_ref, quantity, customer_id, product_id) VALUES 
('2019-08-01', 'ORD001', 1, 1, 1),
('2019-07-15', 'ORD001', 1, 2, 2),
('2019-07-11', 'ORD001', 1, 3, 3),
('2019-05-01', 'ORD001', 1, 4, 4),
('2019-05-29', 'ORD001', 1, 5, 5),
('2019-04-01', 'ORD001', 1, 6, 6),
('2019-04-01', 'ORD001', 1, 7, 7);

