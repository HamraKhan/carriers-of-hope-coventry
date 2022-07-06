DROP TABLE if exists products CASCADE;
DROP TABLE if exists members CASCADE;
DROP TABLE if exists orders CASCADE;
DROP TABLE if exists order_item CASCADE;
DROP TABLE if exists cart CASCADE;
DROP TABLE if exists cart_item CASCADE;


CREATE TABLE members (
  id           SERIAL PRIMARY KEY,
  first_name   VARCHAR( 30 ) NOT NULL,
  last_name    VARCHAR( 30 ) NOT NULL,
  email        VARCHAR( 120 ) NOT NULL UNIQUE,
  address      VARCHAR( 120 ) NOT NULL,
  city         VARCHAR( 30 ) NOT NULL,
  postcode     VARCHAR( 8 ) NOT NULL,
  country      VARCHAR( 20 ) NOT NULL,
  telephone    NUMERIC NOT NULL,
  password     VARCHAR( 15 ) NOT NULL,
  isAdmin      BOOLEAN NOT NULL
);

CREATE TABLE products (
    id               SERIAL PRIMARY KEY,
    product_name     VARCHAR(30) NOT NULL,
    category_name    VARCHAR(30) NOT NULL,
    quantity         INT NOT NULL
);

CREATE TABLE orders (
    id              SERIAL PRIMARY KEY,
    order_date      DATE NOT NULL,
    order_ref       VARCHAR(10) NOT NULL,
    member_id       INT REFERENCES members(id),
    product_id      INT REFERENCES products(id),
);

CREATE TABLE order_item (
    id              SERIAL PRIMARY KEY,
    quantity        INT NOT NULL,
    order_id        INT REFERENCES orders(id),
    product_id      INT REFERENCES products(id),
);

CREATE TABLE cart (
    id              SERIAL PRIMARY KEY,
    member_id       INT REFERENCES members(id),
);

CREATE TABLE cart_item (
    id              SERIAL PRIMARY KEY,
    cart_id         INT REFERENCES cart(id)
    product_id      INT REFERENCES products(id),
    created_at      TIMESTAMP DEFAULT NULL,
    quantity        INT NOT NULL
);

INSERT INTO members (first_name, last_name, email, address, city, postcode, country, telephone, password, isAdmin) 
  VALUES ('John','Smith','j.smith@johnsmith.org','11 New Road','Liverpool','L10 2AB','UK',12345678910, 'johnsmith', FALSE),
         ('Selchuk','Karakus','s.karakus@johnsmith.org','12 New Road','London','L10 2AB','UK', 23456789101, 'selchukkarakus', FALSE),
         ('Helen','Rog','h.rog@johnsmith.org','13 New Road','London','L10 2AB','UK', 34567891234, 'helenrog', FALSE),
         ('Mahri','Atdayeva','m.atdayeva@johnsmith.org','14 New Road','London','L10 2AB','UK', 45678912345, 'mahriatdayeva', FALSE),
         ('Sami','Hakim','s.hakim@johnsmith.org','15 New Road','London','L10 2AB','UK', 56789012345, 'samihakim', TRUE),
         ('Hedyeh','Etemadi','h.etemedi@johnsmith.org','16 New Road','Manchester','L10 2AB','UK', 67890123456, 'hedyehetemaddi', TRUE),
         ('Olga','Olga','o.olga@johnsmith.org','17 New Road','London','L10 2AB','UK', 78901234567, 'olgaolga', TRUE);


INSERT INTO products (product_name, category_name)
    VALUES   ('Toaster', 'Kitchen and Utility'),
            ('Bed Double', 'Furniture and Beds'),
            ('Bath Mat', 'Bath'),
            ('Kids Rug', 'Rugs'),
            ('Dinner Set(4Person', 'Kitchen and Utility'),
            ('Towel(2big and 2 small)' ,'Bath'),
            ('Sofa', 'Furniture and Beds'),
            ('Wardrobe', 'Furniture and Beds'),
            ('Nappies', 'Baby and Kids'),
            ('Window Curtain(grey, 2pair)','Curtains'),
            ('Dining table', 'Kitchen and Utility'),
            ('Mattress', 'Bath');


INSERT INTO orders (order_date, order_ref, member_id, product_id) VALUES 
('2019-08-01', 'ORD001', 1, 1),
('2019-07-15', 'ORD001', 2, 2),
('2019-07-11', 'ORD001', 3, 3),
('2019-05-01', 'ORD001', 4, 4),
('2019-05-29', 'ORD001', 5, 5),
('2019-04-01', 'ORD001', 6, 6),
('2019-04-02', 'ORD001', 7, 7);


INSERT INTO order_item (quantity, order_id, product_id) 
  VALUES  (1, 1, 6),
  VALUES  (1, 2, 2),
  VALUES  (1, 3, 5),
  VALUES  (1, 4, 3),
  VALUES  (1, 5, 1);


INSERT INTO cart (member_id) 
  VALUES  (1),
  VALUES  (2),
  VALUES  (3),
  VALUES  (4),
  VALUES  (5);
  VALUES  (6);


INSERT INTO cart_item (member_id) 
  VALUES  (1),
  VALUES  (2),
  VALUES  (3),
  VALUES  (4),
  VALUES  (5);
  VALUES  (6);


CREATE TABLE cart (
    id              SERIAL PRIMARY KEY,
    member_id       INT REFERENCES members(id),
);

INSERT INTO cart_item (cart_id, product_id, created_at, quantity) 
VALUES (1, 2, NULL, 1),
VALUES (2, 3, NULL, 1),
VALUES (3, 4, NULL, 1),
VALUES (4, 1, NULL, 1);