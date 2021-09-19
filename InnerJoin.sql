create table musicians(
	id serial primary key,
	name varchar(100),
    age int
);

create table songs(
	id serial primary key,
	name varchar(100),
	year_of_creation int,
	musicians_id int references musicians(id)
);

insert into musicians(name, age) values('Ivan', 33);
insert into musicians(name, age) values('Petr', 45);
insert into musicians(name, age) values('Kirill', 36);
insert into musicians(name, age) values('Anna', 54);

insert into songs(name, year_of_creation, musicians_id) values('suite1', 2010, 1);
insert into songs(name, year_of_creation, musicians_id) values('suite3', 2017, 2);
insert into songs(name, year_of_creation, musicians_id) values('suite4', 2014, 3);
insert into songs(name, year_of_creation, musicians_id) values('suite5', 2013, 4);

select*from songs pp join musicians p on pp.musicians_id=p.id;
select pp.name, p.name from musicians as p join songs as pp on pp.musicians_id=p.id;
select pp.name as Сюита, p.name as Исполнитель, pp.year_of_creation as ГодСоздания from musicians as p join songs as pp on pp.musicians_id=p.id;
