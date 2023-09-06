# 10. Типы данных в MySQL

## Задание
- добавить тип JSON в структуру. Проанализировать какие данные могли бы там хранится. привести примеры SQL для добавления записей и выборки.


## Insert
```sql
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
```

## SELECT
```sql
SELECT JSON_TYPE(auto.model) FROM auto ;
```

```sql
SELECT JSON_ARRAY(auto.model) FROM auto ;
```

```sql
SELECT JSON_MERGE_PRESERVE(auto.model, '{"x9": "bmw"}') FROM auto ;
```

```sql
SELECT auto.model->"$.ASUS" FROM auto;
```

```sql
SELECT JSON_SEARCH(auto.model, 'all', 'mers') FROM auto;
```