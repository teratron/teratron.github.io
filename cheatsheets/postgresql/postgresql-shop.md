# PostgreSQL - Shop

← [Назад][back]

---

```
create database shop;
```

	\c shop
	\d

```sh
create table customer(
	id serial primary key,
	name varchar(255),
	phone varchar(30),
	email varchar(255)
);
```

	\d customer

```sh
create table product(
	id serial primary key,
	name varchar(255),
	description text,
	price money
);
```

	\d product

```sh
create table product_photo(
	id serial primary key,
	url varchar(255),
	product_id integer references product(id)
);
```

	\d product_photo

```sh
create table cart(
	id serial primary key,
	customer_id integer references customer(id)
);
```

	\d cart

```sh
create table cart_product(
	cart_id integer references cart(id),
	product_id integer references product(id)
);
```

	\d cart_product
	\d
	\d customer

```sh
insert into customer(name, phone, email) values ('Piter', '0123', 'pit@gmail.com');
insert into customer(name, phone, email) values ('John', '3210', 'jon@gmail.com');
select * from customer;
```

| id | name  | phone | email         |
|---:|-------|-------|---------------|
|  1 | Piter | 0123  | pit@gmail.com |
|  2 | John  | 3210  | jon@gmail.com |

	\d product

```sh
insert into product (name, description, price) values ('iPhone', 'Bad phone', 100000);
insert into product (name, description, price) values ('Xiaomi', 'Good phone', 50000);
select * from product;
```

| id | name   | description |      price |
|---:|--------|-------------|-----------:|
|  1 | iPhone | Bad phone   | 1000000,00 |
|  2 | Xiaomi | Good phone  |  500000,00 |

	\d product_photo

```sh
insert into product_photo (url, product_id) values ('iphone_photo', 1);
insert into product_photo (url, product_id) values ('xiaomi_photo', 2);
select * from product_photo;
```

| id | url          | product_id |
|---:|--------------|-----------:|
|  1 | iphone_photo |          1 |
|  2 | xiaomi_photo |          2 |

```sh
select url from product_photo;
```

| id | url          |
|---:|--------------|
|  1 | iphone_photo |
|  2 | xiaomi_photo |

```sh
select url, product_id from product_photo;
select * from product_photo pp;  # pp - alias
```

	\l
	\l *

## Объединяем 2 таблицы

```sh
select pp.*, p.name from product_photo pp left join product p on p.id=pp.product_id;
```

| id | url            | product_id | name   |
|---:|----------------|-----------:|--------|
|  2 | xiaomi_photo   |          2 | Xiaomi |
|  1 | iphone_image_2 |          1 | iPhone |

	\d product_photo

## Удалим foreign key

```sh
alter table product_photo drop constraint product_photo_product_id_fkey;
```

	\d product_photo

```sh
select * from product;
select * from product_photo;
insert into product_photo (url, product_id) values ('unknown_photo', 100);
select * from product_photo;
```

```sh
select pp.*, p.name from product_photo pp left join product p on p.id=pp.product_id;
```

| id | url           | product_id | name   |
|---:|---------------|-----------:|--------|
|  1 | iphone_photo  |          1 | iPhone |
|  2 | xiaomi_photo  |          2 | Xiaomi |
|  3 | unknown_photo |        100 |        |

```sh
select pp.*, p.name from product_photo pp right join product p on p.id=pp.product_id;
```

| id | url          | product_id | name   |
|---:|--------------|-----------:|--------|
|  1 | iphone_photo |          1 | iPhone |
|  2 | xiaomi_photo |          2 | Xiaomi |

```sh
select pp.*, p.name from product_photo pp inner join product p on p.id=pp.product_id;
```

| id | url          | product_id | name   |
|---:|--------------|-----------:|--------|
|  1 | iphone_photo |          1 | iPhone |
|  2 | xiaomi_photo |          2 | Xiaomi |

```sh
select * from product_photo;
```

| id | url           | product_id |
|---:|---------------|-----------:|
|  1 | iphone_photo  |          1 |
|  2 | xiaomi_photo  |          2 |
|  3 | unknown_photo |        100 |

## Удаляем строку

```sh
delete from product_photo where id=3;
select * from product_photo;
```

| id | url          | product_id |
|---:|--------------|-----------:|
|  1 | iphone_photo |          1 |
|  2 | xiaomi_photo |          2 |

## Обновляем строку

```sh
update product_photo set url='ipnone_image_2' where id=1;
select * from product_photo;
```

| id | url            | product_id |
|---:|----------------|-----------:|
|  2 | xiaomi_photo   |          2 |
|  1 | iphone_image_2 |          1 |

	\d cart

```sh
select * from customer;
```

| id | name  | phone | email        |
|---:|-------|-------|--------------|
|  1 | Piter | 0123  | pit@mail.com |
|  2 | John  | 3210  | jon@mail.com |

```sh
insert into cart (customer_id) values (1);
select * from cart;
```

| id | customer_id |
|---:|------------:|
|  1 |           1 |

```sh
select * from product;
```

| id | name   | description |      price |
|---:|--------|-------------|-----------:|
|  1 | iPhone | Bad phone   | 1000000,00 |
|  2 | Xiaomi | Good phone  |  500000,00 |

	\d cart_product

```sh
insert into cart_product (cart_id, product_id) values (1, 1), (1, 2);
select * from cart_product;
```

| cart_id | product_id |
|--------:|-----------:|
|       1 |          1 |
|       1 |          2 |

## Достаём имена клиентов с общей суммой их заказов

```sh
select * from customer;
```

| id | name  | phone | email        |
|---:|-------|-------|--------------|
|  1 | Piter | 0123  | pit@mail.com |
|  2 | John  | 3210  | jon@mail.com |

```sh
select c.name from customer c;
```

| name  |
|-------|
| Piter |
| John  |

```sh
select c.name from customer c left join cart on cart.customer_id=c.id;
```

| name  |
|-------|
| Piter |
| John  |

```sh
select c.name, cart.id from customer c left join cart on cart.customer_id=c.id;
```

| name  | id |
|-------|---:|
| Piter |  1 |
| John  |    |

```sh
select c.name, cart.id as card_id from customer c left join cart on cart.customer_id=c.id;
```

| name  | card_id |
|-------|--------:|
| Piter |       1 |
| John  |         |

```sh
select c.name, cart.id as card_id from customer c left join cart on cart.customer_id=c.id left join cart_product cp on cp.cart_id=cart.id;
```

| name  | card_id |
|-------|--------:|
| Piter |       1 |
| Piter |       1 |
| John  |         |

```sh
select c.name, cart.id as card_id, cp.product_id from customer c left join cart on cart.customer_id=c.id left join cart_product cp on cp.cart_id=cart.id;
```

| name  | card_id | product_id |
|-------|--------:|-----------:|
| Piter |       1 |          1 |
| Piter |       1 |          2 |
| John  |         |

```sh
select c.name, cart.id as card_id, cp.product_id, p.price from customer c left join cart on cart.customer_id=c.id left join cart_product cp on cp.cart_id=cart.id left join product p on p.id=cp.product_id;
```

| name  | card_id | product_id |      price |
|-------|--------:|-----------:|-----------:|
| Piter |       1 |          1 | 1000000,00 |
| Piter |       1 |          2 |  500000,00 |
| John  |         |            |

```sh
select c.name, p.price from customer c left join cart on cart.customer_id=c.id left join cart_product cp on cp.cart_id=cart.id left join product p on p.id=cp.product_id;
```

| name  |      price |
|-------|-----------:|
| Piter | 1000000,00 |
| John  |  500000,00 |

```sh
select c.name, sum(p.price) from customer c left join cart on cart.customer_id=c.id left join cart_product cp on cp.cart_id=cart.id left join product p on p.id=cp.product_id group by c.name;
```

| name  |        sum |
|-------|-----------:|
| Piter | 1500000,00 |
| John  |            |

```sh
select * from product;
```

| id | name   | description |      price |
|---:|--------|-------------|-----------:|
|  1 | iPhone | Bad phone   | 1000000,00 |
|  2 | Xiaomi | Good phone  |  500000,00 |

## У John `NULL`, заменяем на `0`

```sh
select c.name, coalesce(sum(p.price), money(0)) as orders_sum from customer c left join cart on cart.customer_id=c.id left join cart_product cp on cp.cart_id=cart.id left join product p on p.id=cp.product_id group by c.name;
```

| name  | orders_sum |
|-------|-----------:|
| Piter | 1500000,00 |
| John  |       0,00 |

## Отсортируем клиентов по значимости

```sh
select c.name, coalesce(sum(p.price), money(0)) as orders_sum from customer c left join cart on cart.customer_id=c.id left join cart_product cp on cp.cart_id=cart.id left join product p on p.id=cp.product_id group by c.name order by orders_sum;
```

| name  | orders_sum |
|-------|-----------:|
| John  |       0,00 |
| Piter | 1500000,00 |

```sh
select c.name, coalesce(sum(p.price), money(0)) as orders_sum from customer c left join cart on cart.customer_id=c.id left join cart_product cp on cp.cart_id=cart.id left join product p on p.id=cp.product_id group by c.name order by orders_sum desc;
```

| name  | orders_sum |
|-------|-----------:|
| Piter | 1500000,00 |
| John  |       0,00 |

## Достать тех клиентов, которые что-то купили, т.е. `orders_sum > 0`

```sh
select c.name, coalesce(sum(p.price), money(0)) as orders_sum from customer c left join cart on cart.customer_id=c.id left join cart_product cp on cp.cart_id=cart.id left join product p on p.id=cp.product_id group by c.name having sum(p.price)>money(0);
```

| name  | orders_sum |
|-------|-----------:|
| Piter | 1500000,00 |

## limit

```sh
select * from customer;
```

| id | name  | phone | email        |
|---:|-------|-------|--------------|
|  1 | Piter | 0123  | pit@mail.com |
|  2 | John  | 3210  | jon@mail.com |

```sh
select * from customer order by name;
```

| id | name  | phone | email        |
|---:|-------|-------|--------------|
|  2 | John  | 3210  | jon@mail.com |
|  1 | Piter | 0123  | pit@mail.com |

Проблемы с кодировкой  `using ~<~`, если например кириллица.

```sh
select * from customer order by name using ~<~;
```

| id | name  | phone | email        |
|---:|-------|-------|--------------|
|  2 | John  | 3210  | jon@mail.com |
|  1 | Piter | 0123  | pit@mail.com |

```sh
select * from customer order by name using ~<~ limit 1;
```

| id | name | phone | email        |
|---:|------|-------|--------------|
|  2 | John | 3210  | jon@mail.com |

```sh
select * from customer order by name using ~<~ limit 2;
```

| id | name  | phone | email        |
|---:|-------|-------|--------------|
|  2 | John  | 3210  | jon@mail.com |
|  1 | Piter | 0123  | pit@mail.com |

```sh
select * from customer order by name using ~<~ limit 1 offset 1;
```

| id | name  | phone | email        |
|---:|-------|-------|--------------|
|  1 | Piter | 0123  | pit@mail.com |

---

← [Назад][back]

[back]: <.> "Назад к оглавлению"