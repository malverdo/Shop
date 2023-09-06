# 9. Внутренняя архитектура СУБД MySQL

## Задание
- прописать sql скрипт для создания своей БД в init.sql
- проверить запуск и работу контейнера с


## Упаковка скриптов создания БД в контейнер

![Снимок экрана от 2023-09-06 11-32-31.png](..%2Fimages%2Flessons_9%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%20%D0%BE%D1%82%202023-09-06%2011-32-31.png)

## Docker
```
  otusdb:
    image: mysql:8.0.15
    environment:
      - MYSQL_ROOT_PASSWORD=12345
    command:
      --init-file /init.sql
    volumes:
      - ./Deployment/data/otusdb:/var/lib/mysql
      - ./Deployment/DataBaseInit/MySQL/init.sql:/init.sql
      - ./Deployment/Docker/Dev/MySQL/conf:/etc/mysql/conf.d
    expose:
      - "3306"
    ports:
      - "3309:3306"
```

## [Commit](https://github.com/malverdo/Shop/commit/4d45238bc272d523e7e92dd7282d16afb795d5bf)
