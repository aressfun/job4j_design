create table office(
    id serial primary key,
	speciality varchar,
	age smallint,
	salary int 
);
insert into office(speciality, age, salary) values('programmer', 22, 150000);
select*from office;
update office set speciality='System Administrator';
select*from office;
delete from office; 
select*from office;