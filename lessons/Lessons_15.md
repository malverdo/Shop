# 15.Оптимизация производительности. Профилирование. Мониторинг

## Задание
- постройте EXPLAIN в 3 формата


## EXPLAIN
```sql
EXPLAIN FORMAT = TREE  SELECT title FROM Books inner join BooksCategories ON Books.id = BooksCategories.books_id WHERE title = 'one' GROUP BY title;
```

```
-> Group (no aggregates)
    -> Nested loop inner join
        -> Filter: (Books.title = 'one')
            -> Table scan on Books
        -> Index lookup on BooksCategories using FK_1 (books_id=Books.id)

```


```sql
EXPLAIN FORMAT = TREE  SELECT * FROM Books inner join BooksCategories ON Books.id = BooksCategories.books_id WHERE id > 1;
```

```
-> Nested loop inner join
    -> Index range scan on BooksCategories using FK_1, with index condition: ((BooksCategories.books_id > 1) and (BooksCategories.books_id is not null))
    -> Single-row index lookup on Books using PRIMARY (id=BooksCategories.books_id)

```


```sql
EXPLAIN FORMAT = TREE  SELECT * FROM Categories inner join BooksCategories ON Categories.id = BooksCategories.categories_id ;
```

```
-> Nested loop inner join
    -> Table scan on Categories
    -> Index lookup on BooksCategories using FK_2 (categories_id=Categories.id)

```

