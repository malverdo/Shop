# 14.Индексы

## Задание
- сделать полнотекстовый индекс, который ищет по свойствам, названию товара и описанию.
- explain и результаты выборки без индекса и с индексом.


## полнотекстовый индекс
```sql
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
```

## explain

### С index
```sql
EXPLAIN FORMAT = TREE SELECT * FROM products WHERE MATCH (status,description) AGAINST ('серебро');

-> Filter: (match products.`status`,products.`description` against ('серебро'))
    -> Indexed full text search on products using description (description='серебро')
```

### Без index
- нельзя использовать MATCH
