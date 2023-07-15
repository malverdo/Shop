# 5. Индексы PostgreSQL
## Создать индексы на БД, которые ускорят доступ к данным.В данном задании тренируются навыки:

- определения узких мест
- написания запросов для создания индекса
- оптимизации
## Необходимо:
1. Создать индекс к какой-либо из таблиц вашей БД
2. Прислать текстом результат команды explain, в которой используется данный индекс
3. Реализовать индекс для полнотекстового поиска
4. Реализовать индекс на часть таблицы или индекс на поле с функцией
5. Создать индекс на несколько полей
6. Написать комментарии к каждому из индексов
7. Описать что и как делали и с какими проблемами
столкнулись

## Решение

1. Создать индекс к какой-либо из таблиц вашей БД
```sql
CREATE INDEX customer_1_idx ON "user".customer (nickname);
```

2. Прислать текстом результат команды explain
```sql
EXPLAIN(costs, verbose, format json, analyze) SELECT nickname FROM "user".customer WHERE nickname = 'voin';
```
```text
Index Only Scan using customer_1_idx on user.customer as customer (cost=0.13..0.35 rows=1 width=418) (actual=0.069..0.07 rows=1 loops=1)
    Index Cond: (customer.nickname = 'voin'::text)
```

3. Реализовать индекс для полнотекстового поиска
```sql
CREATE INDEX products_1_idx ON product.products using GIN (name);
```

4. Реализовать индекс на часть таблицы или индекс на поле с функцией
- Комментарий: Сделал чтобы показать, здесь не нужен частичные индекс
```sql
CREATE INDEX customer_idx ON "user".customer (created_at)
    WHERE created_at >= '2023-07-07 01:19:07.797327';
```

5. Создать индекс на несколько полей
```sql
CREATE INDEX product_name_created_idx ON product.products (name, created_at);
```

7. Описать что и как делали и с какими проблемами столкнулись
- столкнулся с проблемой что поиск по индексу не идёт если мало данных - переключал random_page_cost
