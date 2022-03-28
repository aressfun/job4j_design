create table departments(
    id serial primary key,
	name varchar(255)
);

create table emploers(
    id serial primary key,
	name varchar(255),
	id_departaments int references departments(id)
);

insert into departments(id, name) values(1, 'Депортамент налоговой');
insert into departments(id, name) values(2, 'Депортамент экономики');
insert into departments(id, name) values(3, 'Земельных отношений');
insert into departments(id, name) values(4, 'Департамент образования');

update departments set name='Департамент земельных отношений' where id=3

insert into emploers(id, name, id_departaments) values(1, 'Александр Александров Каргин', 1);
insert into emploers(id, name, id_departaments) values(2, 'Алексей Петрович Попов', 2);
insert into emploers(id, name, id_departaments) values(3, 'Виктор Дмитриевич Мойша', 3);
insert into emploers(id, name, id_departaments) values(4, 'Виктор Дмитриевич Мойша', 3);
insert into emploers(id, name, id_departaments) values(5, 'Григорий Викторович Вахштайн', 1);
insert into emploers(id, name, id_departaments) values(6, 'Галина Дмитриевна Петрова', null);
insert into emploers(id, name, id_departaments) values(7, 'Алексей Кириллович Державин', null);


select*from emploers e left join departments d on e.id_departaments=d.id;
select*from emploers e right join departments d on e.id_departaments=d.id;
select*from emploers e full join departments d on e.id_departaments=d.id;
select*from emploers e cross join departments;

select*from departments d left join emploers e on e.id_departaments=d.id where e.id_departaments is null;

select*from emploers e left join departments d on e.id_departaments=d.id;
select e.id, e.name, e.id_departaments, d.id, d.name from departments d right join emploers e on e.id_departaments=d.id;

create table teens(
	name varchar(255),
	gender varchar(255)
);

insert into teens(name, gender) values('Александр Александров Каргин', 'муж.');
insert into teens(name, gender) values('Алексей Петрович Попов', 'муж.');
insert into teens(name, gender) values('Виктор Дмитриевич Мойша', 'муж.');
insert into teens(name, gender) values('Анна Владимировна Попова', 'жен.');
insert into teens(name, gender) values('Ксения Константиновна Брейтер', 'жен.');

select*from teens t1 cross join teens t2;