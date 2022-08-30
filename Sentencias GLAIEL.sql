USE mysql;

/*
-- Consigna: Se deberán crear dos usuarios nuevos a los cuales se le asignará una serie de permisos, a saber:

-- Aspectos a incluir en el entregable:
Uno de los usuarios creados deberá tener permisos de sólo lectura sobre todas las tablas.
El otro usuario deberá tener permisos de Lectura, Inserción y Modificación de datos.
Ninguno de ellos podrá eliminar registros de ninguna tabla.
Cada sentencia GRANT y CREATE USER deberá estar comentada con lo que realiza la misma.*/

DROP USER IF EXISTS 'lector'@'localhost';
CREATE USER 'lector'@'localhost' IDENTIFIED BY 'prueba-user-lector';
-- creamos el usuario al que luego le otorgamos los permisos de lectura sobre todas las tablas
GRANT SELECT ON library.career_subject TO 'lector'@'localhost';
GRANT SELECT ON library.careers TO 'lector'@'localhost';
GRANT SELECT ON library.categories TO 'lector'@'localhost';
GRANT SELECT ON library.files TO 'lector'@'localhost';
GRANT SELECT ON library.log_new_files TO 'lector'@'localhost';
GRANT SELECT ON library.log_new_users TO 'lector'@'localhost';
GRANT SELECT ON library.log_updated_files TO 'lector'@'localhost';
GRANT SELECT ON library.log_updated_users TO 'lector'@'localhost';
GRANT SELECT ON library.schools TO 'lector'@'localhost';
GRANT SELECT ON library.subjects TO 'lector'@'localhost';
GRANT SELECT ON library.universities TO 'lector'@'localhost';
GRANT SELECT ON library.users TO 'lector'@'localhost';

SHOW GRANTS FOR 'lector'@'localhost';


DROP USER IF EXISTS 'editor'@'localhost';
CREATE USER 'editor'@'localhost' IDENTIFIED BY 'prueba-user-editor';
-- creamos el usuario al que luego le otorgamos permisos de lectura, inserción y modificación de datos de las tablas
GRANT SELECT, INSERT, UPDATE ON library.career_subject TO 'editor'@'localhost';
GRANT SELECT, INSERT, UPDATE ON library.careers TO 'editor'@'localhost';
GRANT SELECT, INSERT, UPDATE ON library.categories TO 'editor'@'localhost';
GRANT SELECT, INSERT, UPDATE ON library.files TO 'editor'@'localhost';
GRANT SELECT, INSERT, UPDATE ON library.log_new_files TO 'editor'@'localhost';
GRANT SELECT, INSERT, UPDATE ON library.log_new_users TO 'editor'@'localhost';
GRANT SELECT, INSERT, UPDATE ON library.log_updated_users TO 'editor'@'localhost';
GRANT SELECT, INSERT, UPDATE ON library.log_updated_files TO 'editor'@'localhost';
GRANT SELECT, INSERT, UPDATE ON library.schools TO 'editor'@'localhost';
GRANT SELECT, INSERT, UPDATE ON library.subjects TO 'editor'@'localhost';
GRANT SELECT, INSERT, UPDATE ON library.universities TO 'editor'@'localhost';
GRANT SELECT, INSERT, UPDATE ON library.users TO 'editor'@'localhost';

FLUSH PRIVILEGES;
SELECT * FROM user;