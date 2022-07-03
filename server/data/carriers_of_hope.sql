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