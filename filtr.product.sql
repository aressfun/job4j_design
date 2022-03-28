create table product(
	id serial primary key,
	name varchar(255),
	type_id int references type(id), 
	expired_date date,
	price int
);

create table type(
	id serial primary key,
	name varchar(255)
);

insert into type(id, name) values (1, 'СЫР');
insert into type(id, name) values (2, 'МОЛОКО');
insert into type(id, name) values (3, 'ДЕСЕРТ');

insert into product(name, type_id, expired_date, price) values('Российский сыр', 1, '2022-05-03', 113);
insert into product(name, type_id, expired_date, price) values('Сыр моцарелла', 1, '2022-04-14', 145);
insert into product(name, type_id, expired_date, price) values('Сыр плавленный', 1, '2022-06-03', 94);

insert into product(name, type_id, expired_date, price) values('Кубанская бурёнка', 2, '2022-04-03', 45);
insert into product(name, type_id, expired_date, price) values('Матвейка', 2, '2022-04-07', 54);
insert into product(name, type_id, expired_date, price) values('Весёлый молочник', 2, '2022-04-13', 73);

insert into product(name, type_id, expired_date, price) values('Мороженное ''Большой папа''', 3, '2022-04-13', 73);
insert into product(name, type_id, expired_date, price) values('Шоколад Milka', 3, '2022-04-13', 73);
insert into product(name, type_id, expired_date, price) values('Сырок Б.Ю. Александров', 3, '2022-04-13', 73);

select*from product
select*from type
delete from product

select*from product
join type
on type.id=product.type_id
where type.Name='СЫР'

select*from product
where Name LIKE '%Мороженное%'

select*from product
where expired_date<NOW()

select*from product
where price in (select max(price) from product)

select type.name, product.name
from product
join type
on type.id=product.type_id

select*from product
join type
on type.id=product.type_id
where type.name='СЫР' OR type.name='МОЛОКО'

select type.name,
count(type_id)
from type
join product
on type.id=product.type_id
group by type.name
HAVING count(type_id) < 10

select product.name, product.type_id, product.expired_date, product.price, type.name
from product
join type
on type.id=product.type_id


