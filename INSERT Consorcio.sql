USE [base_consorcio]
GO

-- INSERTANDO UTILIZANDO SENTENCIA INSERT
INSERT INTO consorcio (idprovincia, idlocalidad, idconsorcio, nombre, direccion, idzona, idconserje, idadmin)
VALUES (1, 1,  5,  'EDIFICIO-115',  'CALLE FALSA 115', 5, 100, 1)
INSERT INTO consorcio (idprovincia, idlocalidad, idconsorcio, nombre, direccion, idzona, idconserje, idadmin)
VALUES (1, 1,  6,  'EDIFICIO-116',  'CALLE FALSA 116', 5, 100, 1)
INSERT INTO consorcio (idprovincia, idlocalidad, idconsorcio, nombre, direccion, idzona, idconserje, idadmin)
VALUES (1, 1,  8,  'EDIFICIO-118',  'CALLE FALSA 118', 5, 100, 1)
INSERT INTO consorcio (idprovincia, idlocalidad, idconsorcio, nombre, direccion, idzona, idconserje, idadmin)
VALUES (1, 1,  9,  'EDIFICIO-119',  'CALLE FALSA 119', 5, 100, 1)
INSERT INTO consorcio (idprovincia, idlocalidad, idconsorcio, nombre, direccion, idzona, idconserje, idadmin)
VALUES (1, 1, 11, 'EDIFICIO-1111', 'CALLE FALSA 1111', 5, 100, 1)
INSERT INTO consorcio (idprovincia, idlocalidad, idconsorcio, nombre, direccion, idzona, idconserje, idadmin)
VALUES (1, 1, 12, 'EDIFICIO-1112', 'CALLE FALSA 1112', 5, 100, 1)
INSERT INTO consorcio (idprovincia, idlocalidad, idconsorcio, nombre, direccion, idzona, idconserje, idadmin)
VALUES (1, 1, 13, 'EDIFICIO-1113', 'CALLE FALSA 1113', 5, 100, 1)

-- INSERTANDO UTILIZANDO PROCEDIMIENTO ALMACENADO
DECLARE @exito bit
DECLARE @error varchar(200)

EXEC dbo.InsertarConsorcio 1, 1,  114,  'EDIFICIO-114',  'CALLE FALSA 11114', 5, 100, 1, @exito out, @error out
SELECT Exito=@exito, Error=@error
SELECT @exito=NULL, @error=NULL

EXEC dbo.InsertarConsorcio 1, 1,  7,  'EDIFICIO-117',  'CALLE FALSA 117', 5, 100, 1, @exito out, @error out
SELECT Exito=@exito, Error=@error
SELECT @exito=NULL, @error=NULL

EXEC dbo.InsertarConsorcio 1, 1, 200, 'EDIFICIO-1110', 'CALLE FALSA 11200', 5, 100, 1, @exito out, @error out
SELECT Exito=@exito, Error=@error
SELECT @exito=NULL, @error=NULL

-- ELIMINANDO UTILIZANDO PROCEDIMIENTO ALMACENADO
DECLARE @exito bit
DECLARE @error varchar(200)

EXEC dbo.EliminarConsorcio 1, 1, 15, @exito out, @error out
SELECT Exito=@exito, Error=@error
SELECT @exito=NULL, @error=NULL

-- MODIFICANDO UTILIZANDO PROCEDIMIENTO ALMACENADO
DECLARE @exito bit
DECLARE @error varchar(200)

EXEC dbo.CambiarDireccionConsorcio 1, 1, 5, 'ESTA ES UNA DIRECCION MODIFICADA', @exito out, @error out
SELECT Exito=@exito, Error=@error
SELECT @exito=NULL, @error=NULL
	