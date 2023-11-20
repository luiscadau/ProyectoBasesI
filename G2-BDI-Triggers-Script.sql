--Creaci�n de la tabla auditoriaConsorcio
CREATE TABLE auditoriaConsorcio
(idprovincia       int, 
 idlocalidad       int, 
 idconsorcio       int, 
 nombre			   VARCHAR(50), 
 direccion		   VARCHAR(250), 
 idzona			   int, 
 idconserje		   int,
 idadmin		   int,
 fechayhora		   date,
 usuario		   varchar(50),
 tipoOperacion	   varchar(50)
);
GO

--Trigger para la operaci�n de UPDATE en la tabla consorcio
CREATE TRIGGER trg_auditConsorcio_update
ON consorcio
AFTER UPDATE
AS
BEGIN
        -- Registrar los valores antes de la modificaci�n en una tabla auxiliar
        INSERT INTO auditoriaConsorcio
        SELECT * , GETDATE(), SUSER_NAME(), 'Update'
        FROM deleted;
END;
GO

--Trigger para la operaci�n de DELETE en la tabla consorcio
CREATE TRIGGER trg_auditConsorcio_delete
ON consorcio
AFTER DELETE
AS
BEGIN
        -- Registrar los valores antes de la eliminaci�n en una tabla auxiliar
        INSERT INTO auditoriaConsorcio
        SELECT * , GETDATE(), SUSER_NAME(), 'Delete'
        FROM deleted;
END;
GO

--Creaci�n de la tabla auditoriaGasto
CREATE TABLE auditoriaGasto
(idgasto                INT, 
 idprovincia			INT, 
 idlocalidad			int, 
 idconsorcio			int, 
 periodo				int, 
 fechapago				DATE, 
 idtipogasto			int,
 importe				decimal(8,2),
 fechayhora				date,
 usuario				varchar(50),
 tipoOperacion			varchar(50)
);
GO

--Trigger para la operaci�n de UPDATE en la tabla gasto
CREATE TRIGGER trg_auditGasto_update
ON gasto
AFTER UPDATE
AS
BEGIN
        -- Registrar los valores antes de la modificaci�n en una tabla auxiliar
        INSERT INTO auditoriaGasto
        SELECT  * , GETDATE(), SUSER_NAME(), 'Update'
        FROM deleted;
END;
GO


--Trigger para la operaci�n de DELETE en la tabla gasto
CREATE TRIGGER trg_auditGasto_delete
ON gasto
AFTER DELETE
AS
BEGIN
    -- Registrar los valores antes de la eliminaci�n en una tabla auxiliar
    INSERT INTO auditoriaGasto
    SELECT * , GETDATE(),SUSER_NAME(), 'Delete'
    FROM deleted;
END
GO

--Creaci�n de la tabla auditoriaAdministrador
CREATE TABLE auditoriaAdministrador
(idadmin                INT, 
 apeynom				VARCHAR(50), 
 viveahi				VARCHAR(1), 
 tel					VARCHAR(20), 
 sexo					VARCHAR(1), 
 fechanac				DATETIME,
 fechayhora				DATE,
 usuario				VARCHAR(50),
 tipoOperacion			VARCHAR(50)
);
GO

--Trigger para la operaci�n de UPDATE en la tabla administraci�n
CREATE TRIGGER trg_auditAdmin_update
ON administrador
AFTER UPDATE
AS
BEGIN
        -- Registrar los valores antes de la modificaci�n en una tabla auxiliar
        INSERT INTO auditoriaAdministrador
        SELECT  * , GETDATE(), SUSER_NAME(), 'Update'
        FROM deleted;
END;
GO

--Trigger para la operaci�n de DELETE en la tabla administraci�n
CREATE TRIGGER trg_auditAdmin_delete
ON administrador
AFTER DELETE
AS
BEGIN
    -- Emite un mensaje y prevenir la operaci�n de eliminaci�n
    RAISERROR('La eliminaci�n de registros en la tabla Administrador no est� permitida.', 16, 1);
    ROLLBACK;
END
GO

--C�digos de prueba para la prueba de los triggers

-----TABLA CONSORCIO-----
/*
--Se inserta un nuevo consorcio
INSERT INTO consorcio VALUES ( 1,3,1,'edificio-123', 'rioja N�648',NULL,NULL,1);

--Se modifica el consorcio ingresado anteriormente
UPDATE consorcio SET nombre = 'EDIFICIO-123' WHERE idprovincia = 1 AND idlocalidad = 3 AND idconsorcio = 1;

--Se elimina el consorcio
DELETE FROM consorcio WHERE idprovincia = 1 AND idlocalidad = 3 AND idconsorcio = 1 

-----TABLA GASTO-----

--Se inserta un nuevo gasto (posici�n 8001)
INSERT INTO gasto VALUES (1,1,1,2,GETDATE(), 1 , 156215.20);

--Se modifica el gasto ingresado anteriormente
UPDATE gasto SET importe = 100000 WHERE  idgasto = 8001;

--Se elimina el gasto
DELETE FROM gasto WHERE idgasto = 8001; 

-----ADMINISTRADOR-----

--Se inserta dos nuevos administradores (posici�n 175-176)
INSERT INTO administrador VALUES ('Gomez Mar�a', 'N', '3794568542', 'F', '19900615');
INSERT INTO administrador VALUES ('Gomez Mar�a', 'N', '3794568542', 'F', '19900615');

--Se modifica el administrador ingresado anteriormente
UPDATE administrador 
SET apeynom = 'Fernandez Laura', tel = '3794611462', fechnac = '19840418'
WHERE idadmin = 176;

--Se elimina el administrador
DELETE FROM administrador WHERE idadmin = 176;
*/

select * from auditoriaConsorcio
