create table devices(
    id serial primary key,
    name varchar(255),
    price float
);

create table people(
    id serial primary key,
    name varchar(255)
);

create table devices_people(
    id serial primary key,
    device_id int references devices(id),
    people_id int references people(id)
);

insert into devices(name, price) values ('Nokia', 3475.5), ('Samsung', 6574.5), ('Apple', 9879.5), ('Apple3', 7679.5), ('Apple7', 10879.5);

insert into people(name) values ('Nikolay'), ('Dima'), ('Igory');

select avg(price) as СреднЦена from devices;

insert into devices_people(people_id, device_id) values (1, 1), (1, 2), (1, 3);
insert into devices_people(people_id, device_id) values (2, 1), (2, 4), (2, 3);
insert into devices_people(people_id, device_id) values (3, 1), (3, 4), (3, 5);

select*from devices_people;

select p.people_id, avg(pp.price) from devices_people p join devices pp on p.device_id=pp.id
group by p.people_id;

select p.people_id, avg(pp.price) from devices_people p join devices pp on p.device_id=pp.id
group by p.people_id having avg(pp.price) > 5000;