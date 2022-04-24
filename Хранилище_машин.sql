create table kuzov(
	id serial primary key,
	model varchar(255)
);

create table dvigatel(
	id serial primary key,
	model varchar(255)
);

create table korobka_peredach(
	id serial primary key,
	model varchar(255)
);

create table mashina(
	id serial primary key,
	model varchar(255),
	id_korobka_peredach int references korobka_peredach(id),
	id_kuzov int references kuzov(id),
	id_dvigatel int references dvigatel(id)
);


insert into kuzov(id, model) values(1, '1 Series');
insert into kuzov(id, model) values(2, '2 Series');
insert into kuzov(id, model) values(3, '3 Series');
insert into kuzov(id, model) values(4, '14 Series');
insert into kuzov(id, model) values(5, '18 Series');

insert into dvigatel(id, model) values(1, 'Domingo');
insert into dvigatel(id, model) values(2, 'Dias Wagon');
insert into dvigatel(id, model) values(3, 'Dex');
insert into dvigatel(id, model) values(4, 'Dex543');

insert into korobka_peredach(id, model) values(1, '6 Series');
insert into korobka_peredach(id, model) values(2, '7 Series');
insert into korobka_peredach(id, model) values(3, '8 Series');

insert into mashina(id, model, id_korobka_peredach, id_kuzov, id_dvigatel) values(1, 'Toyota', 1, 1, 1);
insert into mashina(id, model, id_korobka_peredach, id_kuzov, id_dvigatel) values(2, 'Porsche', 2, 2, 2);
insert into mashina(id, model, id_korobka_peredach, id_kuzov, id_dvigatel) values(3, 'BMW', 3, 3, 3);
insert into mashina(id, model, id_korobka_peredach, id_kuzov, id_dvigatel) values(4, 'Vaz', null, null, null);

select m.model Машина,
k.model Кузов,
d.model Двигатель,
k_p.model Коробка_передач
from mashina m 
left join kuzov k 
on m.id_kuzov=k.id
left join dvigatel d
on m.id_dvigatel=d.id
left join korobka_peredach k_p
on m.id_korobka_peredach=k_p.id

select*from kuzov k
left join mashina m
on m.id_kuzov=k.id
where m.id_kuzov is null;


select*from dvigatel d
left join mashina m
on m.id_dvigatel=d.id
where m.id_dvigatel is null;

select*from korobka_peredach kb
left join mashina m
on m.id_korobka_peredach=kb.id
where m.id_korobka_peredach is null;

