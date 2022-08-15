use library;

-- 1era funcion. Ingresar user_id con retorno de carrerar asignada --
DELIMITER //
CREATE FUNCTION fn_career_from_user_id (p_users_id int)
RETURNS VARCHAR (255)
DETERMINISTIC
BEGIN

DECLARE career VARCHAR (255);
SET career = (
					SELECT library.careers.short_name as career
					FROM library.users
					JOIN library.careers on library.careers.id = library.users.career_id
                    WHERE library.users.id = p_users_id);
RETURN career;
END //
DELIMITER ;

SELECT fn_career_from_id (8160);

-- 2da funcion. Ingresar user_id con retorno de cantidad de aportes que ha cargado --
DELIMITER //
CREATE FUNCTION fn_files_by_user (p_users_id int)
RETURNS int
DETERMINISTIC
BEGIN
DECLARE files_by_user int;
SET files_by_user = (
					SELECT count(library.files.id) as files_by_user
					FROM library.files
					WHERE library.files.user_id = p_users_id);
RETURNS files_by_user;
END;
DELIMITER //

SELECT fn_files_by_user (7760);

-- 3era funcion. Ingresar categoria de files con retorno de cantidad de aportes de la misma --
DELIMITER //
CREATE FUNCTION fn_files_by_category (p_categories_id int)
RETURNS int
DETERMINISTIC
BEGIN
DECLARE files_by_category int;
SET files_by_category = (
						SELECT count(library.files.id) as files_by_category
						FROM library.files
						WHERE library.files.category_id = p_categories_id);
RETURN files_by_category;
END;
DELIMITER //

SELECT fn_files_by_category (5);

-- 4ta funcion. Ingresar año para ver cantidad de usuarios creados en ese año --
DELIMITER //
CREATE FUNCTION fn_users_by_year (p_created_at year)
RETURNS int
DETERMINISTIC
BEGIN
DECLARE count_users int;
SET count_users = (
					SELECT count(library.users.id) as count_users
					FROM library.users
                    WHERE year(library.users.created_at) = p_created_at);
RETURN count_users;
END;
DELIMITER //

SELECT fn_users_by_year (2021);