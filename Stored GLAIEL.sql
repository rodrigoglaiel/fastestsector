USE library;

DROP PROCEDURE IF EXISTS sp_careers_order;
-- Stored procedure para ordenar la tabla 'Careers' según parámetro a elección, en este caso según fecha de creación ascendente --
DELIMITER //
 CREATE PROCEDURE sp_careers_order (
			INOUT param_order varchar(255),
			INOUT param_asc_desc varchar(255)
									)
  BEGIN
			SET @t1 = concat('SELECT * FROM careers U ORDER BY',' ',param_order,' ',param_asc_desc);
			PREPARE param_stmt FROM @t1;
            EXECUTE param_stmt;
            DEALLOCATE PREPARE param_stmt;
 END //
DELIMITER ;

SET @param_order = 'school_id';
SET @param_asc_desc = 'asc';
CALL sp_careers_order (@param_order, @param_asc_desc);

DROP PROCEDURE IF EXISTS sp_new_files;
-- Stored procedure para la creación de new files según usuario quien lo crea, materia al que corresponde y categoría del mismo --
DELIMITER //
 CREATE PROCEDURE sp_new_files (
			INOUT param_title varchar(50),
            INOUT param_description varchar(100),
            INOUT param_category_id int,
            INOUT param_subject_id int,
            INOUT param_user_id int,
            INOUT param_created_at varchar(255),
            INOUT param_updated_at varchar(255)
								)
  BEGIN
            INSERT INTO files (
                        title,
                        description,
                        category_id,
                        subject_id,
                        user_id,
                        created_at,
                        updated_at)
			VALUES (
                        param_title,
                        param_description,
                        param_category_id,
                        param_subject_id,
                        param_user_id,
                        param_created_at,
                        param_updated_at);
 END //
DELIMITER ;
SET @param_title = 'New file from SP';
SET @param_description = 'Trying out new SP to generate new files';
SET @param_category_id = '3' ;
SET @param_subject_id = '26' ;
SET @param_user_id = '7760' ;
SET @param_created_at = now();
SET @param_updated_at = @param_created_at;
CALL sp_new_files (@param_title,@param_description,@param_category_id,@param_subject_id,@param_user_id,@param_created_at,@param_updated_at);

SELECT * FROM files
ORDER BY id desc;