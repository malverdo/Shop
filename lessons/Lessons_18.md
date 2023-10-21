# 18.MySQL - InnoDB Cluster

## Задание
Задача: реализовать модель данных БД, определить сущности, построить связи, выполнить декомпозицию и нормализацию
За основу берем практическую структуру данных с заказчиками интернет магазина (файл some_customers.csv.gz).
Текущая структура данных неоптимальна:

нет типизации - почти все поля хранятся как строки
данные не нормализованы - данные о адресе и человеке хранятся в одной таблице, на одного человека может приходится несколько адресов
Попытаться выделить следующие сущности:
страны
города
улицы
дома
и другие которые посчитаете нужными
Описанные сущности не являются полным и конечным ТЗ (как это и бывает в жизни). Вы как архитектор должны предусмотреть необходимые атрибуты и дополнительные сущности по необходимости. И четко представлять бизнес-задачу которую будет решать эта структура данных.
делаем декомпозицию и нормализацию
в качестве сделанной ДЗ принимается pdf с начальной и конечной моделью
Решая данное ДЗ вы тренируете навык проектирования БД, выделения сущностей и их атрибутов, построения связей, нормализации данных

### Поля в CVS
```sql
title	first_name	last_name	
correspondence_language	birth_date	gender
marital_status	country	postal_code	region
city	street	building_number
```

## Новые поля и сущности

```sql
-- Создание таблицы Country
CREATE TABLE Country
(
    id   SERIAL PRIMARY KEY,
    country_name VARCHAR(100) UNIQUE NOT NULL
);

-- Создание таблицы Region
CREATE TABLE Region
(
    id   SERIAL PRIMARY KEY,
    country_id  INTEGER      NOT NULL,
    region_name VARCHAR(100) NOT NULL,
    FOREIGN KEY (country_id) REFERENCES Country (id)
);

-- Создание таблицы Address
CREATE TABLE Address
(
    id      SERIAL PRIMARY KEY,
    country_id      INTEGER      NOT NULL,
    postal_code     VARCHAR(20),
    region_id       INTEGER      NOT NULL,
    city            VARCHAR(100) NOT NULL,
    street          VARCHAR(200),
    building_number VARCHAR(10),
    FOREIGN KEY (country_id) REFERENCES Country (id),
    FOREIGN KEY (region_id) REFERENCES Region (id)
);

-- Создание таблицы Customer
CREATE TABLE Customer
(
    id             SERIAL PRIMARY KEY,
    title                   VARCHAR(50),
    first_name              VARCHAR(100) NOT NULL,
    last_name               VARCHAR(100) NOT NULL,
    correspondence_language VARCHAR(50),
    birth_date              DATE,
    gender                  CHAR(1),
    marital_status          VARCHAR(50),
    address_id              INTEGER,
    FOREIGN KEY (address_id) REFERENCES Address (id) ON DELETE SET NULL
);

```

## Документация

1. **Country**:
    - **id (SERIAL PRIMARY KEY)**: Уникальный идентификатор страны. SERIAL означает, что он будет автоматически увеличиваться при каждой новой записи.
    - **country_name (VARCHAR(100) UNIQUE NOT NULL)**: Название страны. Поле уникальное, чтобы избежать дублирования стран.

2. **Region**:
    - **id (SERIAL PRIMARY KEY)**: Уникальный идентификатор региона.
    - **country_id (INTEGER NOT NULL)**: Внешний ключ, который связывает регион со страной. Гарантирует, что каждый регион относится к определенной стране.
    - **region_name (VARCHAR(100) NOT NULL)**: Название региона.

3. **Address**:
    - **id (SERIAL PRIMARY KEY)**: Уникальный идентификатор адреса.
    - **country_id (INTEGER NOT NULL)**: Внешний ключ, который связывает адрес со страной. Это поле дает нам знание о стране, к которой принадлежит данный адрес.
    - **postal_code (VARCHAR(20))**: Почтовый индекс адреса.
    - **region_id (INTEGER NOT NULL)**: Внешний ключ, который связывает адрес с регионом.
    - **city (VARCHAR(100) NOT NULL)**: Город.
    - **street (VARCHAR(200))**: Улица.
    - **building_number (VARCHAR(10))**: Номер дома.

4. **Customer**:
    - **id (SERIAL PRIMARY KEY)**: Уникальный идентификатор клиента.
    - **title (VARCHAR(50))**: Титул или обращение к клиенту (например, Mr., Mrs., Dr.).
    - **first_name (VARCHAR(100) NOT NULL)**: Имя клиента.
    - **last_name (VARCHAR(100) NOT NULL)**: Фамилия клиента.
    - **correspondence_language (VARCHAR(50))**: Язык, на котором клиент предпочитает общаться.
    - **birth_date (DATE)**: Дата рождения клиента.
    - **gender (CHAR(1))**: Пол клиента (например, "M" для мужского, "F" для женского).
    - **marital_status (VARCHAR(50))**: Семейное положение клиента (например, "женат" или "не женат").
    - **address_id (INTEGER)**: Внешний ключ, который связывает клиента с его адресом.

### Почему именно такая структура?

- Сущность "Country" позволяет нам централизованно управлять странами, без дублирования данных в разных частях БД.
- Аналогично сущность "Region" позволяет управлять регионами в контексте стран.
- "Address" объединяет различные компоненты адреса, позволяя нам иметь чистую и структурированную информацию о местоположении клиента.
- "Customer" — это центральная сущность, содержащая личные данные клиента. Выделение адреса в отдельную таблицу позволяет клиенту иметь несколько адресов и делает структуру данных более гибкой.
