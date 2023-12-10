# Сущности

1. **Таблица: `card_percent`**
    - `number`: varchar(255)
    - `count`: integer
    - `discount`: numeric(5,2)
    - `id`: integer

2. **Таблица: `action_amount`**
    - `title`: varchar(255)
    - `serial`: varchar(50)
    - `amount`: numeric(10,2)
    - `id`: integer

3. **Таблица: `delivery`**
    - `status`: varchar(255)
    - `delivery_date`: date
    - `id`: integer

4. **Таблица: `order`**
    - `status`: varchar(255)
    - `article`: varchar(255)
    - `sum`: numeric(10,2)
    - `discounted_sum`: numeric(10,2)
    - `customer_id`: integer
    - `delivery_id`: integer
    - `card_percent_id`: integer
    - `action_amount_id`: integer
    - `action_percent_id`: integer
    - `id`: integer

5. **Таблица: `customer`**
    - `nickname`: varchar(255)
    - `email`: varchar(255)
    - `phone`: varchar(15)
    - `avatar`: varchar(255)
    - `role`: varchar(50)
    - `id`: integer

6. **Таблица: `region`**
    - `title`: varchar(255)
    - `serial`: integer
    - `id`: integer

7. **Таблица: `shop`**
    - `title`: varchar(255)
    - `city`: varchar(255)
    - `street`: varchar(255)
    - `address`: varchar(255)
    - `region_id`: integer
    - `id`: integer

8. **Таблица: `category`**
    - `title`: varchar(255)
    - `parent_id`: integer
    - `parent_path`: varchar(255)
    - `id`: integer

9. **Таблица: `thing`**
    - `title`: varchar(255)
    - `price`: numeric(10,2)
    - `count`: integer
    - `stock`: integer
    - `status`: integer
    - `collection`: integer
    - `block`: boolean
    - `category_id`: integer
    - `region_id`: integer
    - `shop_id`: integer
    - `id`: integer

10. **Таблица: `action_percent`**
    - `title`: varchar(50)
    - `serial`: varchar(50)
    - `sale`: integer
    - `percent`: numeric(5,2)
    - `id`: integer

11. **Таблица: `fashion`**
    - `title`: varchar(255)
    - `fashion_category_id`: integer
    - `id`: integer

12. **Таблица: `chosen`**
    - `thing_id`: integer
    - `customer_id`: integer
    - `date_start`: date
    - `date_end`: date
    - `id`: integer

13. **Таблица: `reserve`**
    - `date_start`: date
    - `date_end`: date
    - `thing_id`: integer
    - `customer_id`: integer
    - `id`: integer

14. **Таблица: `reviews`**
    - `thing_id`: integer
    - `customer_id`: integer
    - `description`: text
    - `stars`: integer
    - `id`: integer

15. **Таблица: `thing_fashion`**
    - `thing_id`: integer
    - `fashion_id`: integer

16. **Таблица: `purchase`**
    - `status`: varchar(255)
    - `article`: varchar(255)
    - `sum`: numeric(10,2)
    - `payment`: varchar(255)
    - `customer_id`: integer
    - `order_id`: integer
    - `action_amount_id`: integer
    - `action_percent_id`: integer
    - `id`: integer

## Схема в PNG
![chema.png](..%2Fimages%2Fchema.png)