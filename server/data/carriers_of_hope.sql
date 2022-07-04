
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


