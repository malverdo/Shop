# 13.Транзакции, MVCC, ACID

## Задание
- Описать пример транзакции из своего проекта с изменением данных в нескольких таблицах. Реализовать в виде хранимой процедуры.
- Загрузить данные из приложенных в материалах csv. Реализовать LOAD DATA
## транзакция
```sql
START TRANSACTION;
SELECT * FROM products WHERE category = 'напитки' AND status = 'В наличии' ;
UPDATE products SET status = 'Распродан' WHERE category = 'напитки' AND status = 'В наличии' ;
insert into auto (id, model)
values (2, '{
  "x5": "bmw"
}') ;
COMMIT;
```

## LOAD DATA

```sql
LOAD DATA LOCAL INFILE '/tmp/Fashion.csv' INTO TABLE otus.fashion (Handle);
```
