# 19. MongoDB

## Задание
- установить MongoDB одним из способов: ВМ, докер;
- заполнить данными;
- написать несколько запросов на выборку и обновление данных
- Сдача ДЗ осуществляется в виде миниотчета.

## Решение
# Создание БД
```js
use shop
```


#  Добавление данных
```js
db.products.insert({ name: "Example Product", price: 9.99 })
db.products.insert({ name: "Example Product 2", price: 9.99 })
db.products.insert({ name: "Example Product 3", price: 9.99 })
db.products.insert({ name: "Example Product 4", price: 9.99, "userId": ObjectId("507f191e810c19729de860ea") })
db.products.insert({ name: "Example Product 5", price: 9.99, "userId": ObjectId("507f191e810c19729de860eb") })

db.users.insert({ name: "igor", _id: ObjectId("507f191e810c19729de860ea") })
db.users.insert({ name: "Vasa", _id: ObjectId("507f191e810c19729de860eb") })
```


# Поиск ссылок
```js
db.products.aggregate([
    {
        $lookup: {
            from: "users", // соединяем с коллекцией users
            localField: "userId", // поле в коллекции products, содержащее ссылку на _id пользователя
            foreignField: "_id", // _id в коллекции users
            as: "userDetails" // результат соединения будет помещён в это поле
        }
    },
    {
        $match: { "userDetails.name": "igor" }  // Фильтрация результатов, чтобы найти заказы пользователя с именем igor
    }
]);
```


# Поиск обычный
```js
db.products.find({ "name": "Example Product 2" })
db.products.find({ "name": "Example Product 2" })
```


# Обновление данных
```js
db.products.updateOne(
    { name: "Example Product" },
    { $set: { price: 222 } }
)
```

# Индекс

```js
// Скрипт для добавления 25,000 рандомных продуктов в MongoDB shell
dbauth = db.getSiblingDB('admin');
dbauth.auth('root', 'root'); // Аутентификация с учетными данными, указанными в Docker Compose
db = db.getSiblingDB('shop');

function getRandomProductName() {
    const adjectives = ["Amazing", "Incredible", "Fantastic", "Superb", "Stellar"];
    const nouns = ["Gadget", "Thing", "Item", "Product", "Object"];
    return adjectives[Math.floor(Math.random() * adjectives.length)] +
        " " +
        nouns[Math.floor(Math.random() * nouns.length)] +
        " " +
        Math.floor(Math.random() * 1000);
}

function getRandomPrice() {
    return (Math.random() * 100).toFixed(2);
}

for (let i = 0; i < 25000; i++) {
    db.products.insertOne({
        name: getRandomProductName(),
        price: getRandomPrice()
    });
}
```

## До индекса
```js
//"executionTimeMillisEstimate": new NumberInt("7")
db.products.find({ name: "Fantastic Product 703" }).explain("executionStats")
```

## Add index
```js
db.products.createIndex({ name: 1 })
```

## После индекса
```js
//"executionTimeMillisEstimate": new NumberInt("0")
db.products.find({ name: "Fantastic Product 703" }).explain("executionStats")
```