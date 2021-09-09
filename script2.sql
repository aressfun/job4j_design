create table bank_operation(
	id serial primary key,
	num_translation int
);

create table credit_cards(
    id serial primary key,
    name varchar(255),
	bank_operation_id int references bank_operation(id)
);

create table bank_operation__cards(
	id serial primary key,
	bank_operation_id int references bank_operation(id),
	credit_cards_id int references credit_cards(id)
);

create table user_card(
	id serial primary key,
	credit_cards_id int references credit_cards(id) unique
);

insert into bank_operation(num_translation) values (5555431);
insert into bank_operation(num_translation) values (5555433);
insert into bank_operation(num_translation) values (5555434);

insert into credit_cards(name) values ('Тинькофф');
insert into credit_cards(name) values ('Сбербанк');
insert into credit_cards(name) values ('ВТБ');

insert into bank_operation__cards(credit_cards_id, bank_operation_id) values (1, 1);
insert into bank_operation__cards(credit_cards_id, bank_operation_id) values (2, 2);
insert into bank_operation__cards(credit_cards_id, bank_operation_id) values (3, 3);

select*from bank_operation__cards;