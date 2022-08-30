use library;

/*
>>Aspectos a incluir en el entregable:
En la primera tabla, si tiene registros, deberás eliminar algunos de ellos iniciando previamente una transacción. Si no tiene registros la tabla, reemplaza eliminación por inserción.
Deja en una línea siguiente, comentado la sentencia Rollback, y en una línea posterior, la sentencia Commit.
Si eliminas registros importantes, deja comenzado las sentencias para re-insertarlos.*/

select @@autocommit;
set @@autocommit = 1;
set @@autocommit = 0;
-- seteo foreign keys en 0 para poder eliminar registros vinculados con otras tablas, luego vuelvo a setear en 1
set foreign_key_checks = 0;
select * from universities;

start transaction;
delete from universities where id = 1;
delete from universities where id = 4;
-- rollback;
commit;

start transaction;
insert into universities values (1,'Universidad Nacional de Cordoba','UNC','AR','2017-05-31 14:24:15','2020-03-30 14:49:36');
insert into universities values (4,'Universidad Catolica de Cordoba','UCC','AR','2017-07-26 16:06:58','2020-03-30 14:49:36');
commit;

set foreign_key_checks = 1;

/*En la segunda tabla, inserta ocho nuevos registros iniciando también una transacción. 
Agrega un savepoint a posteriori de la inserción del registro #4 y otro savepoint a posteriori del registro #8
Agrega en una línea comentada la sentencia de eliminación del savepoint de los primeros 4 registros insertados*/

select * from categories;

-- vamos a insertar nuevas categorias de documentos
start transaction;
insert into categories values (6,'Monografía',now(),now());
insert into categories values (7,'Ensayo',now(),now());
insert into categories values (8,'Libro',now(),now());
insert into categories values (9,'Trabajo científico',now(),now());
savepoint primer_tanda;
insert into categories values (10,'Tesis',now(),now());
insert into categories values (11,'Tesina',now(),now());
insert into categories values (12,'Ejercicios prácticos',now(),now());
insert into categories values (13,'Paper',now(),now());
savepoint segunda_tanda;
-- release savepoint primer_tanda;
commit;

set @@autocommit = 1;