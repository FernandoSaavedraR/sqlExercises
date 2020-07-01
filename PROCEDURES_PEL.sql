


-- ######################################################
-- #########									#########
-- #########     PROCEDIMIENTOS PELICULAS       #########
-- #########									#########
-- ######################################################

-- alta pelicula
DROP PROCEDURE IF EXISTS ALTA_PELICULA;
DELIMITER //
CREATE PROCEDURE ALTA_PELICULA(NOMBRE_PELICULA_EXT CHAR(120),FECHA_ESTRENO_EXT DATE,CALIFICACION_EXT SMALLINT)
BEGIN
	DECLARE EXISTE INT;
    SET EXISTE = (SELECT COUNT(PELICULA.ID_PELICULA) FROM PELICULA WHERE NOMBRE_PELICULA = NOMBRE_PELICULA_EXT);
    IF(EXISTE > 0) THEN
		SELECT "YA EXISTE LA PELICULA" AS MENSAJE;
	ELSE
		INSERT INTO PELICULA(NOMBRE_PELICULA,FECHA_ESTRENO,CALIFICACION) VALUES (NOMBRE_PELICULA_EXT,FECHA_ESTRENO_EXT,CALIFICACION_EXT);
	END IF;
END //
DELIMITER ;


-- baja pelicula
DROP PROCEDURE IF EXISTS BAJA_PELICULA;
DELIMITER //
CREATE PROCEDURE BAJA_PELICULA(NOMBRE_PELICULA_EXT CHAR(120))
BEGIN
	DECLARE EXISTE INT;
    SET EXISTE = (SELECT PELICULA.ID_PELICULA FROM PELICULA WHERE NOMBRE_PELICULA = NOMBRE_PELICULA_EXT);
    IF(EXISTE > 0) THEN
		DELETE FROM PELICULA WHERE ID_PELICULA = EXISTE;
	ELSE
		SELECT "NO EXISTE LA PELICULA" AS MENSAJE;
	END IF;
END //
DELIMITER ;


-- cambio pelicula
DROP PROCEDURE IF EXISTS CAMBIO_PELICULA;
DELIMITER //
CREATE PROCEDURE CAMBIO_PELICULA(NOMBRE_PELICULA_EXTO CHAR(120),NOMBRE_PELICULA_EXT CHAR(120),FECHA_ESTRENO_EXT DATE,CALIFICACION_EXT SMALLINT)
BEGIN
	DECLARE EXISTE INT;
    DECLARE ID INT;
    SET ID = (SELECT PELICULA.ID_PELICULA FROM PELICULA WHERE NOMBRE_PELICULA = NOMBRE_PELICULA_EXTO);
    SET EXISTE = (SELECT COUNT(PELICULA.ID_PELICULA) FROM PELICULA WHERE NOMBRE_PELICULA = NOMBRE_PELICULA_EXT);
    IF(ID >0) THEN
		IF (EXISTE >0) THEN
			SELECT "YA EXISTE LA PELICULA" AS MENSAJE;
        ELSE
			UPDATE PELICULA
            SET NOMBRE_PELICULA = NOMBRE_PELICULA_EXT,
            FECHA_ESTRENO = FECHA_ESTRENO_EXT,
            CALIFICACION = CALIFICACION_EXT
            WHERE ID_PELICULA=ID;
		END IF;
    ELSE 
		SELECT "LA PELICULA NO EXISTE" AS MENSAJE;
	END IF;
END //

DELIMITER ;
-- consulta pelicula
DROP PROCEDURE IF EXISTS CONSULTA_PELICULA;
DELIMITER //
CREATE PROCEDURE CONSULTA_PELICULA(NOMBRE_PELICULA_EXT CHAR(120))
BEGIN
	DECLARE EXISTE INT;
    SET EXISTE = (SELECT PELICULA.ID_PELICULA FROM PELICULA WHERE NOMBRE_PELICULA = NOMBRE_PELICULA_EXT);
    IF(EXISTE > 0) THEN
		SELECT * FROM PELICULA WHERE ID_PELICULA = EXISTE;
	ELSE
		SELECT "NO EXISTE LA PELICULA" AS MENSAJE;
	END IF;
END //
DELIMITER ;
