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
                          PRIMARY KEY (title)
);
