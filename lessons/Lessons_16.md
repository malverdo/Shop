# 16.Хранимые процедуры и триггеры

## Задание
- Создать пользователей client, manager.
- Создать процедуру выборки товаров с использованием  различные дополнительные параметры  Также в качестве параметров передавать по какому полю сортировать выборку, и параметры постраничной выдачи
- дать права на запуск процедуры пользователю client
- Создать процедуру get_orders - которая позволяет просматривать отчет по продажам за определенный период (час, день, неделя)
- Права дать пользователю manager




## Создать пользователей client, manager.
```sql
CREATE USER 'client'@'localhost' IDENTIFIED BY '12345';
CREATE USER 'manager'@'localhost' IDENTIFIED BY '12345';
```

## Дать права на пользование процедурой
```sql
GRANT EXECUTE ON product TO client;
GRANT EXECUTE ON get_orders TO manager
```

## Создать процедуру выборки товаров с использованием рразличные дополнительные параметры  Также в качестве параметров передавать по какому полю сортировать выборку, и параметры постраничной выдачи
```sql
CREATE PROCEDURE product(IN `category`  VARCHAR(10), IN total INT, IN amt INT, in `order` INT)
BEGIN
SELECT * FROM products WHERE products.category = category ORDER BY (case `order`
                                                                        when 1 then price
                                                                        when 2 then rating
    end) LIMIT amt, total;
END

CALL product('напитки', 5, 0, 1);
```

## Создать процедуру get_orders - которая позволяет просматривать отчет по продажам за определенный период (час, день, неделя)
```sql
CREATE PROCEDURE get_orders(IN `interval`  VARCHAR(10))
BEGIN
    if(`interval` = 'HOUR')
        THEN
SELECT * FROM products WHERE products.date >= NOW() - INTERVAL 1 HOUR ;
end IF;

    if(`interval` = 'DAY')
    THEN
SELECT * FROM products WHERE products.date >= NOW() - INTERVAL 1 DAY ;
end IF;

    if(`interval` = 'WEEK')
    THEN
SELECT * FROM products WHERE products.date >= NOW() - INTERVAL 1 WEEK ;
end IF;
END


CALL get_orders('WEEK');
```