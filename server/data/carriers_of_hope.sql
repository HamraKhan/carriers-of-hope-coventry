
drop table if exists products;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- create products table 
CREATE TABLE products(
   --  id SERIAL PRIMARY KEY,
     id              uuid DEFAULT uuid_generate_v4 (),
    product_name     VARCHAR(30) NOT NULL ,
    category_name    VARCHAR(30) NOT NULL ,
    PRIMARY KEY (id)

);


INSERT INTO videos (product_name, category_name,) VALUES ('Toaster', 'Kitchen and Utility');
INSERT INTO videos (product_name, category_name,) VALUES ('Bed Double', 'Furniture and Beds');
INSERT INTO videos (product_name, category_name,) VALUES ('Bath Mat', 'Bath');
INSERT INTO videos (product_name, category_name,) VALUES ("Kid's Rug", 'Rugs');
INSERT INTO videos (product_name, category_name,) VALUES ('Dinner Set(4Person', 'Kitchen and Utility');
INSERT INTO videos (product_name, category_name,) VALUES ('Towel(2big and 2 small)', 'Bath');
INSERT INTO videos (product_name, category_name,) VALUES ('Sofa', 'Furniture and Beds');
INSERT INTO videos (product_name, category_name,) VALUES ('Wardrobe', 'Furniture and Beds');
INSERT INTO videos (product_name, category_name,) VALUES ('Nappies', 'Baby and Kids');
INSERT INTO videos (product_name, category_name,) VALUES ('Window Curtain(grey, 2pair)', 'Curtains');
INSERT INTO videos (product_name, category_name,) VALUES ('Dining table', 'Kitchen and Utility');
INSERT INTO videos (product_name, category_name,) VALUES ('Mattress', 'Bath');


