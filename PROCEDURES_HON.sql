

-- ######################################################
-- #########									#########
-- #########     PROCEDIMIENTOS HONORIFICOS     #########
-- #########									#########
-- ######################################################

-- ALTA HONORIFICO
	DROP PROCEDURE IF EXISTS ALTA_HONORIFICO;
    DELIMITER //
	CREATE PROCEDURE ALTA_HONORIFICO(HONORIFICO_EXT CHAR(5),OUT HONF INT)
    BEGIN
        SET HONF = (SELECT HONORIFICO.ID_HONORIFICO FROM HONORIFICO WHERE HONORIFICO = HONORIFICO_EXT);
        IF (HONF >0) THEN
			SELECT @HONF;
		ELSE
			INSERT INTO HONORIFICO(HONORIFICO) VALUES(HONORIFICO_EXT);
             SET HONF = (SELECT HONORIFICO.ID_HONORIFICO FROM HONORIFICO WHERE HONORIFICO = HONORIFICO_EXT);
            SELECT @HONF;
		END IF;
    END //
    DELIMITER ;
    
    
-- BAJA HONORIFICO
	DROP PROCEDURE IF EXISTS BAJA_HONORIFICO;
	DELIMITER //
	CREATE PROCEDURE BAJA_HONORIFICO(HONORIFICO_EXT CHAR(5))
    BEGIN
		DECLARE EXISTE INT;
        SET EXISTE = (SELECT HONORIFICO.ID_HONORIFICO FROM HONORIFICO WHERE HONORIFICO = HONORIFICO_EXT);
        IF (EXISTE >0) THEN
			DELETE FROM HONORIFICO WHERE ID_HONORIFICO = EXISTE;
            SELECT "HONORIFICO ELIMINADO" AS MENSAJE;
		ELSE
			SELECT "NO EXISTE EL HONORIFICO" AS MENSAJE;
		END IF;
    END //
    DELIMITER ;
    
    
-- CAMBIO HONORIFICO
	DROP PROCEDURE IF EXISTS CAMBIO_HONORIFICO;
	DELIMITER //
	CREATE PROCEDURE CAMBIO_HONORIFICO(HONORIFICO_EXT CHAR(5),HONORIFICO_NEW CHAR(5),OUT HONF INT)
    BEGIN	
		DECLARE EXISTE INT;
        DECLARE ID INT;
        SET ID = (SELECT HONORIFICO.ID_HONORIFICO FROM  HONORIFICO WHERE HONORIFICO = HONORIFICO_EXT);
        IF (ID >0) THEN
			SET EXISTE = (SELECT ID_HONORIFICO FROM  HONORIFICO WHERE HONORIFICO = HONORIFICO_NEW);
			IF (EXISTE >0) THEN
				SET HONF = EXISTE;
				SELECT @HONF;
			ELSE
				UPDATE HONORIFICO
				SET HONORIFICO = HONORIFICO_NEW WHERE ID_HONORIFICO=ID;

			END IF;
		END IF;
    
    END //
    DELIMITER ;
    
    
-- CONSULTA HONORIFICO
	DROP PROCEDURE IF EXISTS CONSULTA_HONORIFICO;
	DELIMITER //
	CREATE PROCEDURE CONSULTA_HONORIFICO(HONORIFICO_EXT CHAR(5))
    BEGIN
		DECLARE EXISTE INT;
        SET EXISTE = (SELECT HONORIFICO.ID_HONORIFICO FROM HONORIFICO WHERE HONORIFICO = HONORIFICO_EXT);
        IF (EXISTE >0) THEN
			SELECT * FROM HONORIFICO WHERE ID_HONORIFICO = EXISTE;
		ELSE
			SELECT "NO EXISTE EL HONORIFICO" AS MENSAJE;
		END IF;
    END //
    DELIMITER ;