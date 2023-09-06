# 11.DML: вставка, обновление, удаление, выборка данных

## Задание
- Напишите запрос по своей базе с inner join
- Напишите запрос по своей базе с right join
- Напишите запрос по своей базе с left join
- Напишите запрос по своей базе с NATURAL join
- Напишите запросоы с WHERE с использованием разных операторов

## Insert
```sql
insert into Books (id, title)
values (1, 'one');

insert into Books (id, title)
values (2, 'two');

insert into Books (id, title)
values (3, 'three');

insert into Books (id, title)
values (4, 'war and rum');

insert into Books (id, title)
values (5, 'war and rum');

insert into Categories (id, name)
values (1, 'horror');

insert into Categories (id, name)
values (2, 'war');

insert into BooksCategories (books_id, categories_id)
values (1, 1);

insert into BooksCategories (books_id, categories_id)
values (2, null);

insert into BooksCategories (books_id, categories_id)
values (3, null);

insert into BooksCategories (books_id, categories_id)
values (null, 2);
```

## SELECT
```sql
SELECT * FROM Books inner join BooksCategories ON Books.id = BooksCategories.books_id;
```

```sql
SELECT * FROM Books right join BooksCategories ON Books.id = BooksCategories.books_id;
```

```sql
SELECT * FROM Books left join BooksCategories ON Books.id = BooksCategories.books_id;
```

```sql
SELECT * FROM Books NATURAL join BooksCategories ;
```

```sql
SELECT * FROM Books WHERE title = 'one';

SELECT * FROM Books WHERE title != 'one';

SELECT * FROM Books WHERE title != 'one' AND title != 'two';

SELECT * FROM Books WHERE id > 3;

SELECT COUNT(*) FROM Books WHERE title = 'war and rum';

SELECT COUNT(id), AVG(id) FROM Books WHERE  id >= 2;

SELECT * FROM Books WHERE title is not null

SELECT Books.title FROM Books GROUP BY title;

SELECT Books.title FROM Books GROUP BY title HAVING title = 'one';

SELECT * FROM Books WHERE title LIKE '%war%' ;
```