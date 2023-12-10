-- индексы для таблицы category
CREATE INDEX idx_category_parent_id ON category(parent_id);
CREATE INDEX idx_category_title ON category(title);

-- индексы для таблицы shop
CREATE INDEX idx_shop_region_id ON shop(region_id);

-- индексы для таблицы thing
CREATE INDEX idx_thing_category_id ON thing(category_id);
CREATE INDEX idx_thing_region_id ON thing(region_id);
CREATE INDEX idx_thing_shop_id ON thing(shop_id);

-- индексы для таблицы customer
CREATE INDEX idx_customer_card_percent_id ON customer(card_percent_id);

-- индексы для таблицы "order"
CREATE INDEX idx_order_customer_id ON "order"(customer_id);
CREATE INDEX idx_order_delivery_id ON "order"(delivery_id);
CREATE INDEX idx_order_card_percent_id ON "order"(card_percent_id);
CREATE INDEX idx_order_action_amount_id ON "order"(action_amount_id);
CREATE INDEX idx_order_action_percent_id ON "order"(action_percent_id);

-- индексы для таблицы purchase
CREATE INDEX idx_purchase_customer_id ON purchase(customer_id);
CREATE INDEX idx_purchase_order_id ON purchase(order_id);
CREATE INDEX idx_purchase_action_amount_id ON purchase(action_amount_id);
CREATE INDEX idx_purchase_action_percent_id ON purchase(action_percent_id);

-- индексы для таблицы reserve
CREATE INDEX idx_reserve_customer_id ON reserve(customer_id);
CREATE INDEX idx_reserve_thing_id ON reserve(thing_id);

-- Добавим индексы для таблицы reviews
CREATE INDEX idx_reviews_thing_id ON reviews(thing_id);
CREATE INDEX idx_reviews_customer_id ON reviews(customer_id);

-- индексы для таблицы chosen
CREATE INDEX idx_chosen_thing_id ON chosen(thing_id);
CREATE INDEX idx_chosen_customer_id ON chosen(customer_id);
