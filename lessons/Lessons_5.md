# 5. DML: вставка, обновление, удаление, выборка данных
- Написать запрос с конструкциями SELECT, JOIN
- Написать запрос с добавлением данных INSERT INTO
- Написать запрос с обновлением данных с UPDATE FROM
- Использовать using для оператора DELETE

## Загрузка данных
```sql
insert into category.categories ( name, created_at, update_at)
values ('мясо', now(), now());
insert into category.categories ( name, created_at, update_at)
values ('овощи', now(), now());

insert into provider.providers (name, created_at, update_at)
values ('кул-клувер', now(), now());
insert into provider.providers (name, created_at, update_at)
values ('кул-ловер', now(), now());

insert into delivery.delivery (status, created_at, update_at)
values (0, now(), now());

insert into discount.discount (percent, name, created_at, update_at)
values (20, 'удача', now(), now());

insert into "user".customer (nickname, remote_id, email, phone, avatar, role, discount_id, created_at, update_at)
values ('voin', '21343452345', 'malverdo@yandex.ru', '+89524408777', 'https://cas.com/image/123324', '{"ROLE":["ADMIN"]}', 1, now(), now());

insert into "user".customer (nickname, remote_id, email, phone, avatar, role, discount_id, created_at, update_at)
values ('valid', '1234234123', 'qwerty@yandex.ru', '+89524408123', 'https://cas.com/image/44444', '{"ROLE":["MODERATOR"]}', NULL, now(), now());

insert into product.products (name, "count", cost, category_id, provider_id, created_at, update_at)
values ('морковь', 228, 12.33, 2, 1, now(), now());
insert into product.products (name, "count", cost, category_id, provider_id, created_at, update_at)
values ('свекла', 123, 5.33, 2, 1, now(), now());
insert into product.products (name, "count", cost, category_id, provider_id, created_at, update_at)
values ('говядина', 54, 1111.33, 1, 1, now(), now());

insert into purchase.purchase (price, "count", customer_id, discount_id, product_id, created_at, update_at)
values (24.66, 2, 1, 1, 1, now(), now());
insert into purchase.purchase (price, "count", customer_id, discount_id, product_id, created_at, update_at)
values (28.66, 2, 2, 1, 2, now(), now());

insert into "order"."order" (status, price, delivery_id, product_id, customer_id, purchase_id, created_at, update_at)
values (5,24.66, 1, 1, 1, 1, now(), now());
insert into "order"."order" (status, price, delivery_id, product_id, customer_id, purchase_id, created_at, update_at)
values (5,24.66, 1, 1, 1, 2, now(), now());
```

## 1. Напишите запрос по своей базе с регулярным выражением, добавьте пояснение, что вы хотите найти.
```sql
-- Компании бывают одни , а поставщики разные , мы забрали всех поставщиков одной компании
select * from provider.providers WHERE name LIKE 'кул%' ;
```

## 2. Напишите запрос по своей базе с использованием LEFT JOIN и INNER JOIN, как порядок соединений в FROM влияет на результат? Почему?
```sql
-- при LEFT JOIN - все строки из левой , и совпадающие правые
-- при INNER JOIN - все совпадающие строки
select * from "user".customer
                  inner join discount.discount ON customer.discount_id = discount.id;
select * from "user".customer
                  LEFT join discount.discount ON customer.discount_id = discount.id;
```

## 3. Напишите запрос на добавление данных с выводом информации о добавленных строках.
```sql
insert into discount.discount (percent, name, created_at, update_at)
values (20, 'сверх удача', now(), now()) RETURNING *;
```

## 4. Напишите запрос с обновлением данные используя UPDATE FROM.
```sql
update discount.discount SET percent = 15 WHERE  id = 2;
```

## 5. Напишите запрос для удаления данных с оператором DELETE используя join с другой таблицей с помощью using.
```sql
-- Напишите запрос для удаления данных с оператором DELETE используя join с другой таблицей с помощью using.
insert into provider.providers (name, created_at, update_at)
values ('test', now(), now());
insert into category.categories ( name, created_at, update_at)
values ('test', now(), now());

DELETE FROM category.categories USING provider.providers  WHERE categories.name = 'test' ;
```


