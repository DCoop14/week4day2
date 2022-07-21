-- insert info into our TABLES
SELECT *
FROM customer;

INSERT INTO customer (
    first_name,
    last_name,
    address,
    email
) 
VALUES(
    'Dara',
    'Cooper',
    '424 Mercury Way',
    'daracoop@walking.com'
);

-- you don't need ALL field
INSERT INTO customer(
    first_name
)
VALUES(
    'Jason'
);

--although Serial auto increments, you are allowed to sepcify
INSERT INTO customer(
    customer_id,
    first_name,
    last_name
)
VALUES(
    10,
    'Peter',
    'Pan'
);

-- insert into staff
INSERT INTO staff(
    first_name,
    last_name
)
VALUES(
    'Jean',
    'Grey'
),(
    'Scott',
    'Summers'
);

SELECT * FROM staff;