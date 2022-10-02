use library;

-- trigger para la creación de un nuevo usuario (a partir de tabla users) AFTER
DROP TABLE IF EXISTS log_new_users;
CREATE TABLE IF NOT EXISTS log_new_users (
id_log int auto_increment,
nombre_accion varchar (50),
nombre_tabla varchar (50),
campo_nuevo varchar (255),
usuario varchar (100),
fecha_upd_ins_del date,
PRIMARY KEY (id_log)
);

DROP TRIGGER IF EXISTS trg_new_users;
DELIMITER $$
CREATE TRIGGER trg_new_users 
AFTER INSERT ON users
FOR EACH ROW 
BEGIN 
INSERT INTO log_new_users (nombre_accion, nombre_tabla, campo_nuevo, usuario, fecha_upd_ins_del)
VALUES ('INSERT','USERS',NEW.id,CURRENT_USER(),NOW());
END$$
DELIMITER ;

SELECT * FROM USERS;
INSERT INTO USERS(
name,
last_name,
email,
career_id,
career_verified_at,
created_at,
updated_at
)
VALUES ('Rodrigo','Glaiel','rodrigoglaiel@gmail.com','194',now(),now(),now());
SELECT * FROM log_new_users;

-- trigger para la creación de un nuevo archivo (a partir de tabla files) AFTER
DROP TABLE IF EXISTS log_new_files;
CREATE TABLE IF NOT EXISTS log_new_files (
id_log int auto_increment,
nombre_accion varchar (50),
nombre_tabla varchar (50),
campo_nuevo varchar (255),
usuario varchar (100),
fecha_upd_ins_del date,
PRIMARY KEY (id_log)
);

DROP TRIGGER IF EXISTS trg_new_files;
DELIMITER $$
CREATE TRIGGER trg_new_files 
AFTER INSERT ON files
FOR EACH ROW 
BEGIN 
INSERT INTO log_new_files (nombre_accion, nombre_tabla, campo_nuevo, usuario, fecha_upd_ins_del)
VALUES ('INSERT','FILES',NEW.id,CURRENT_USER(),NOW());
END$$
DELIMITER ;

SELECT * FROM FILES;
INSERT INTO FILES(
title,
description,
category_id,
subject_id,
user_id,
created_at,
updated_at
)
VALUES ('Triggers file','Probando trigger para nuevos files','5','26','7760',now(),now());
SELECT * FROM log_new_files;

-- trigger para el update de un usuario (a partir de tabla users) BEFORE
DROP TABLE IF EXISTS log_updated_users;
CREATE TABLE IF NOT EXISTS log_updated_users (
id_log int auto_increment,
nombre_accion varchar (50),
nombre_tabla varchar (50),
campo_viejo varchar (255),
campo_nuevo varchar (255),
usuario varchar (100),
fecha_upd_ins_del date,
PRIMARY KEY (id_log)
);

DROP TRIGGER IF EXISTS trg_updated_users;
DELIMITER $$
CREATE TRIGGER trg_updated_users 
BEFORE UPDATE ON users
FOR EACH ROW 
BEGIN 
INSERT INTO log_updated_users (nombre_accion, nombre_tabla, campo_viejo, campo_nuevo, usuario, fecha_upd_ins_del)
VALUES ('UPDATE','USERS', OLD.career_id, NEW.career_id,CURRENT_USER(),NOW());
END$$
DELIMITER ;

SELECT * FROM USERS;

UPDATE users
SET career_id = 2
WHERE id = 497988;

SELECT * FROM log_updated_users;

-- trigger para el update de un documento (a partir de tabla files) BEFORE
DROP TABLE IF EXISTS log_updated_files;
CREATE TABLE IF NOT EXISTS log_updated_files (
id_log int auto_increment,
nombre_accion varchar (50),
nombre_tabla varchar (50),
campo_viejo varchar (255),
campo_nuevo varchar (255),
usuario varchar (100),
fecha_upd_ins_del date,
PRIMARY KEY (id_log)
);

DROP TRIGGER IF EXISTS trg_updated_files;
DELIMITER $$
CREATE TRIGGER trg_updated_files
BEFORE UPDATE ON files
FOR EACH ROW 
BEGIN 
INSERT INTO log_updated_files (nombre_accion, nombre_tabla, campo_viejo, campo_nuevo, usuario, fecha_upd_ins_del)
VALUES ('UPDATE','FILES', OLD.title, NEW.title,CURRENT_USER(),NOW());
END$$
DELIMITER ;

SELECT * FROM FILES;

UPDATE files
SET title = 'Modificacion 2 titulo documento para trigger'
WHERE id = 39169;

SELECT * FROM log_updated_files;
