# 12.DML: агрегация и сортировка

## Задание
- группировки с ипользованием CASE, HAVING, ROLLUP, GROUPING
- сделать rollup с количеством товаров по категориям
- сделать выборку показывающую самый дорогой и самый дешевый товар в каждой категории
## Insert
```sql
CREATE TABLE products (
        title VARCHAR(32) NOT NULL,
        category VARCHAR(32),
        price INT,
        rating INT,
        status VARCHAR(32) NOT NULL,
        PRIMARY KEY (title)
);

INSERT INTO products
    (title, category, price, rating, status)
VALUES
    ('Агдам', 'Напитки', 150, 2, 'В наличии'),
    ('Килька', 'Консервы', 45, 4, 'Распродан'),
    ('Оливки', 'Консервы', 250, 5, 'Распродан'),
    ('Текила', 'Напитки', 3000, 5, 'В наличии'),
    ('Шмурдяк', 'Напитки', 120, 1, 'Распродан'),
    ('Арахис', 'Орехи', 250, 5, 'Распродан')
```

## SELECT

### Сделать выборку показывающую самый дорогой и самый дешевый товар в каждой категории
```sql
SELECT SUM(price) as max, (
    select SUM(products.price) as sum from products GROUP BY category ORDER BY sum ASC LIMIT 1
    ) as min FROM products  GROUP BY category ORDER BY max DESC LIMIT 1;
```

### Сделать rollup с количеством товаров по категориям
```sql
SELECT COUNT(category), category  FROM products GROUP BY category WITH ROLLUP;
```

### Группировки с ипользованием CASE, HAVING, ROLLUP, GROUPING
```sql
SELECT category, SUM(price)  as sum FROM products GROUP BY category HAVING sum > 300;
```

```sql
SELECT category,
       CASE
           WHEN price > 100
               THEN 'товар дорогой'
           ELSE 'товар  дешёвый'
           END AS title
FROM products;


SELECT category, IF(price > 100, 'товар дорогой', 'товар  дешёвый') AS title FROM products;
```

```sql
SELECT COUNT(category), category  FROM products GROUP BY category WITH ROLLUP
```
```sql
SELECT GROUPING(category), category  FROM products GROUP BY category WITH ROLLUP;
```