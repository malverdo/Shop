CREATE TABLE auto
(
    id INT,
    model JSON
);

CREATE TABLE Books
(
    id    INT,
    title varchar(150),
    CONSTRAINT PK_1 PRIMARY KEY (id)
);


CREATE TABLE Categories
(
    id    INT ,
    name varchar(60),
    CONSTRAINT PK_1 PRIMARY KEY (id)
);


CREATE TABLE BooksCategories
(
    books_id  INT,
    categories_id  INT,
    CONSTRAINT FK_1 FOREIGN KEY (books_id) REFERENCES Books (id),
    CONSTRAINT FK_2 FOREIGN KEY (categories_id) REFERENCES Categories (id)
);

CREATE TABLE products (
                          title VARCHAR(32) NOT NULL,
                          category VARCHAR(32),
                          price INT,
                          rating INT,
                          status VARCHAR(32) NOT NULL,
                          PRIMARY KEY (title),
                          description TEXT,
                          FULLTEXT (description,status)
);


CREATE TABLE fashion (
    Handle VARCHAR(255)
);

INSERT INTO products
(title, category, price, rating, status, description)
VALUES
    ('Агдам', 'Напитки', 150, 2, 'В наличии', 'золото молчание'),
    ('Килька', 'Консервы', 45, 4, 'Распродан', 'серебро молчание'),
    ('Оливки', 'Консервы', 250, 5, 'Распродан', 'медь молчание'),
    ('Текила', 'Напитки', 3000, 5, 'В наличии', 'цинк молчание'),
    ('Шмурдяк', 'Напитки', 120, 1, 'Распродан', 'серебро говорение'),
    ('Арахис', 'Орехи', 250, 5, 'Распродан', 'платина молчание');


insert into auto (id, model)
values (1, '{
  "x5": "bmw",
  "x3": "bmw",
  "x4": "bmw",
  "x7": "bmw",
  "ASUS": "mers",
  "AXE": "mers",
  "VINT": "mers"
}') ;