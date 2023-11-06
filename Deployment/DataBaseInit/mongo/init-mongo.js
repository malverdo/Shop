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