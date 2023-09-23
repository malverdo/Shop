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