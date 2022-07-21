--DDL Data Definition LANGUAGE
CREATE TABLE customer(
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    address VARCHAR(150),
    email VARCHAR(50)
);

SELECT * FROM customer;

CREATE TABLE tickets(
    ticket_id SERIAL PRIMARY KEY,
    price NUMERIC(10,2),
    movie_id VARCHAR(100),
    customer_id SERIAL,
    staff_id SERIAL
);

CREATE TABLE movies(
    movies_id SERIAL PRIMARY KEY,
    release_date DATE,
    movie_type VARCHAR(50),
    length VARCHAR(50),
    rating VARCHAR(10),
    title VARCHAR(10),
    ticket_id SERIAL,
    store_id INTEGER,
    FOREIGN KEY (ticket_id) REFERENCES ticket(ticket_id)
);

CREATE TABLE staff(
    staff_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    address VARCHAR(150),
    store_id INTEGER,
    active VARCHAR(50)
);
CREATE TABLE theater(
    store_id INTEGER PRIMARY KEY,
    address VARCHAR(150),
    manager_staff_id SERIAL,
    staff_id SERIAL, 
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);

CREATE TABLE concessions(
    item_id SERIAL PRIMARY KEY,
    inventory_id SERIAL,
    staff_id SERIAL,
    customer_id SERIAL,
    store_id INTEGER
);


CREATE TABLE inventory(
    inventory_id SERIAL PRIMARY KEY,
    movie_id SERIAL,
    store_id INTEGER,
    item_id SERIAL
);

--fix staff_id table to add FK CONSTRAINTS
ALTER TABLE tickets
ADD FOREIGN KEY (movie_id) REFERENCES movies(movie_id);
ADD FOREIGN KEY (staff_id) REFERENCES staff(staff_id);

ALTER TABLE staff
ADD FOREIGN KEY (store_id) REFERENCES theater(store_id);

ALTER TABLE movies
ADD FOREIGN KEY (store_id) REFERENCES theater(store_id);

ALTER TABLE concessions
ADD FOREIGN KEY (inventory_id) REFERENCES inventory(inventory_id);
