-- Таблица Category
CREATE TABLE category (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    parent_id INT REFERENCES category(id),
    parent_path VARCHAR(255)
);

-- Таблица Region
CREATE TABLE region (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    serial INT NOT NULL
);

-- Таблица Shop
CREATE TABLE shop (
    id SERIAL PRIMARY KEY,
    city VARCHAR(255) NOT NULL,
    street VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    region_id INT REFERENCES region(id)
);

-- Таблица Thing
CREATE TABLE thing (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    count INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    characteristics JSONB,
    stock INTEGER,
    status INT,
    collection INT,
    block BOOL,
    category_id INT REFERENCES category(id),
    region_id INT REFERENCES region(id),
    shop_id INT REFERENCES shop(id)
);

-- Таблица Card_Percent
CREATE TABLE card_percent (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    number INT NOT NULL,
    discount DECIMAL(5,2) NOT NULL
);

CREATE TABLE customer (
    id SERIAL PRIMARY KEY,
    nickname VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    phone VARCHAR(15),
    avatar VARCHAR(255),
    role VARCHAR(50),
    birth DATE,
    address JSONB,
    notifications_sms BOOLEAN,
    notifications_email BOOLEAN,
    notifications_viber BOOLEAN,
    card_percent_id INT REFERENCES card_percent(id)
);



-- Таблица Action_Percent
CREATE TABLE action_percent (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    serial VARCHAR(50),
    sale BOOLEAN,
    percent NUMERIC(5, 2)
);


-- Таблица Action_Amount
CREATE TABLE action_amount (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    serial VARCHAR(50),
    amount NUMERIC(10, 2)
);

-- Таблица Доставки (Delivery)
CREATE TABLE delivery (
    id SERIAL PRIMARY KEY,
    status VARCHAR(255) NOT NULL,
    delivery_date DATE NOT NULL
);

-- Таблица Категории Одежды (Fashion_Category)
CREATE TABLE fashion_category (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL
);

-- Таблица Одежда (Fashion)
CREATE TABLE fashion (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    fashion_category_id INT REFERENCES fashion_category(id)
);

-- Таблица Связи Вещи и Одежды (Thing_Fashion)
CREATE TABLE thing_fashion (
    thing_id INT REFERENCES thing(id) ,
    fashion_id INT REFERENCES fashion(id) ,
    PRIMARY KEY (thing_id, fashion_id)
);


-- Таблица Заказов (Order)
CREATE TABLE "order" (
    id SERIAL PRIMARY KEY,
    status VARCHAR(255) NOT NULL,
    article VARCHAR(255) UNIQUE NOT NULL,
    sum NUMERIC(10, 2) NOT NULL,
    discounted_sum NUMERIC(10, 2),
    things JSONB,
    customer_id INT REFERENCES customer(id) ,
    delivery_id INT REFERENCES delivery(id),
    card_percent_id INT REFERENCES card_percent(id),
    action_amount_id INT REFERENCES action_amount(id),
    action_percent_id INT REFERENCES action_percent(id)
);






-- Таблица Покупок (Purchase)
CREATE TABLE purchase (
    id SERIAL PRIMARY KEY,
    status VARCHAR(255) NOT NULL,
    article VARCHAR(255) UNIQUE NOT NULL,
    sum NUMERIC(10, 2) NOT NULL,
    payment VARCHAR(255) NOT NULL,
    customer_id INT REFERENCES customer(id),
    order_id INT REFERENCES "order"(id),
    action_amount_id INT REFERENCES action_amount(id),
    action_percent_id INT REFERENCES action_percent(id)
);





-- Таблица Бронирования (Reserve)
CREATE TABLE reserve (
    id SERIAL PRIMARY KEY,
    date_start DATE NOT NULL,
    date_end DATE NOT NULL,
    customer_id INT REFERENCES customer(id),
    thing_id INT REFERENCES thing(id)
);

-- Таблица Отзывов (Reviews)
CREATE TABLE reviews (
    id SERIAL PRIMARY KEY,
    thing_id INT REFERENCES thing(id),
    customer_id INT REFERENCES customer(id),
    description TEXT,
    stars INT
);

-- Таблица Избранного (Chosen)
CREATE TABLE chosen (
    thing_id INT REFERENCES thing(id),
    customer_id INT REFERENCES customer(id),
    PRIMARY KEY (thing_id, customer_id)
);






