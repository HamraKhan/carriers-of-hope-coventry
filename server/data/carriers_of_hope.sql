
drop table if exists products;

-- create products table 
CREATE TABLE products(
    id SERIAL PRIMARY KEY,
    product_name     VARCHAR(30) NOT NULL ,
    category_name    VARCHAR(30) NOT NULL ,

);


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


CREATE TABLE orders (
    id              SERIAL PRIMARY KEY,
    order_date      DATE NOT NULL,
    order_ref       VARCHAR(10) NOT NULL,
    quantity        INT NOT NULL,
    customer_id     INT REFERENCES customers(id)
    product_id      INT REFERENCES products(id)
);

INSERT INTO orders (order_date, order_ref, quantity, customer_id, product_id) VALUES 
('2019-08-01', 'ORD001', 1, 1, 1),
('2019-07-15', 'ORD001', 1, 2, 2),
('2019-07-11', 'ORD001', 1, 3, 3),
('2019-05-01', 'ORD001', 1, 4, 4),
('2019-05-29', 'ORD001', 1, 5, 5),
('2019-04-01', 'ORD001', 1, 6, 6),
('2019-04-01', 'ORD001', 1, 7, 7);
