USE [base_consorcio]
GO

-- INSERTANDO UTILIZANDO SENTENCIA INSERT
INSERT INTO gasto (idprovincia, idlocalidad, idconsorcio, periodo, fechapago, idtipogasto, importe)
VALUES (1, 1, 4, 1, getdate(), 5, convert(decimal(8,2),rand()*10000.00))
INSERT INTO gasto (idprovincia, idlocalidad, idconsorcio, periodo, fechapago, idtipogasto, importe)
VALUES (1, 1, 5, 1, getdate(), 5, convert(decimal(8,2),rand()*10000.00))
INSERT INTO gasto (idprovincia, idlocalidad, idconsorcio, periodo, fechapago, idtipogasto, importe)
VALUES (1, 1, 6, 1, getdate(), 5, convert(decimal(8,2),rand()*10000.00))
INSERT INTO gasto (idprovincia, idlocalidad, idconsorcio, periodo, fechapago, idtipogasto, importe)
VALUES (1, 1, 7, 1, getdate(), 5, convert(decimal(8,2),rand()*10000.00))
INSERT INTO gasto (idprovincia, idlocalidad, idconsorcio, periodo, fechapago, idtipogasto, importe)
VALUES (1, 1, 8, 1, getdate(), 5, convert(decimal(8,2),rand()*10000.00))

-- INSERTANDO UTILIZANDO PROCEDIMIENTO ALMACENADO

DECLARE @exito bit
DECLARE @error varchar(200)
DECLARE @date date = GETDATE()
DECLARE @importe decimal(8,2) = convert(decimal(8,2),rand())*10000.00

EXEC dbo.InsertarGasto 1, 1, 9, 1, @date, 5, @importe, @exito out, @error out
SELECT Exito=@exito, Error=@error
SELECT @exito=NULL, @error=NULL, @importe=convert(decimal(8,2),rand())*10000.00

EXEC dbo.InsertarGasto 1, 1, 10, 1, @date, 5, @importe, @exito out, @error out
SELECT Exito=@exito, Error=@error
SELECT @exito=NULL, @error=NULL, @importe=convert(decimal(8,2),rand())*10000.00

EXEC dbo.InsertarGasto 1, 1, 11, 1, @date, 5, @importe, @exito out, @error out
SELECT Exito=@exito, Error=@error
SELECT @exito=NULL, @error=NULL, @importe=convert(decimal(8,2),rand())*10000.00

-- ELIMINANDO UTILIZANDO PROCEDIMIENTO ALMACENADO
DECLARE @exito bit
DECLARE @error varchar(200)

EXEC dbo.EliminarGasto 174, @exito out, @error out
SELECT Exito=@exito, Error=@error
SELECT @exito=NULL, @error=NULL

-- MODIFICANDO UTILIZANDO PROCEDIMIENTO ALMACENADO
DECLARE @exito bit
DECLARE @error varchar(200)
DECLARE @importe decimal(8,2) = 1540.00

EXEC dbo.CambiarImporteGasto 120, @importe, @exito out, @error out
SELECT Exito=@exito, Error=@error
SELECT @exito=NULL, @error=NULL

