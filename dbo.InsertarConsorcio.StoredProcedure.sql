USE [base_consorcio]
GO

DROP PROCEDURE IF EXISTS [InsertarConsorcio]
GO

CREATE PROCEDURE [InsertarConsorcio] (
	@idprovincia int = null,
	@idlocalidad int = null,
	@idconsorcio int = null,
	@nombre varchar(50) = null,
	@direccion varchar(250)  = null,
	@idzona int = null,
	@idconserje int = null,
	@idadmin int = null,
	@exito bit OUT,
	@error varchar(200) OUT
)
AS 
BEGIN
SET @exito = 1
BEGIN TRY
	BEGIN TRAN
	INSERT INTO consorcio (idprovincia, idlocalidad, idconsorcio, nombre, direccion, idzona, idconserje, idadmin)
	VALUES (@idprovincia, @idlocalidad, @idconsorcio, @nombre, @direccion, @idzona, @idconserje, @idadmin)
	COMMIT TRAN
END TRY
BEGIN CATCH
	SET @error = ERROR_MESSAGE()
	ROLLBACK TRAN;
	SET @exito = 0
END CATCH
END