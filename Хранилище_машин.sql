create table kuzov(
	id serial primary key,
	model varchar(255),
	id_mashina int references mashina(id)
);

create table dvigatel(
	id serial primary key,
	model varchar(255),
	id_mashina int references mashina(id)
);

create table korobka_peredach(
	id serial primary key,
	model varchar(255),
	id_mashina int references mashina(id)
);

create table mashina(
	id serial primary key,
	model varchar(255)
);

insert into kuzov(id, model, id_mashina) values(1, '1 Series', 1);
insert into kuzov(id, model, id_mashina) values(2, '2 Series', 2);
insert into kuzov(id, model, id_mashina) values(3, '3 Series', 3);
insert into kuzov(id, model, id_mashina) values(4, '14 Series', null);

insert into dvigatel(id, model, id_mashina) values(1, 'Domingo', 1);
insert into dvigatel(id, model, id_mashina) values(2, 'Dias Wagon', 2);
insert into dvigatel(id, model, id_mashina) values(3, 'Dex', 3);
insert into dvigatel(id, model, id_mashina) values(4, 'Dex543', null);

insert into korobka_peredach(id, model, id_mashina) values(1, '6 Series', 1);
insert into korobka_peredach(id, model, id_mashina) values(2, '7 Series', 2);
insert into korobka_peredach(id, model, id_mashina) values(3, '8 Series', 3);

insert into mashina(id, model) values(1, 'Toyota');
insert into mashina(id, model) values(2, 'Porsche');
insert into mashina(id, model) values(3, 'BMW');
insert into mashina(id, model) values(4, 'Vaz');

select m.model Машина,
k.model Кузов,
d.model Двигатель,
k_p.model Коробка_передач
from mashina m 
left join kuzov k 
on k.id_mashina=m.id
left join dvigatel d
on d.id_mashina=m.id
left join korobka_peredach k_p
on k_p.id_mashina=m.id

select*from kuzov where id_mashina is null;
select*from dvigatel where id_mashina is null;
select*from korobka_peredach where id_mashina is null;