USE [base_consorcio]
GO

DROP PROCEDURE IF EXISTS [CambiarDireccionConsorcio]
GO

CREATE PROCEDURE [CambiarDireccionConsorcio] (
	@idprovincia int = null,
	@idlocalidad int = null,
	@idconsorcio int = null,
	@direccion varchar(250) = null,
	@exito bit OUT,
	@error varchar(200) OUT
)
AS 
BEGIN
SET @exito = 1
BEGIN TRY
	BEGIN TRAN
	UPDATE consorcio
	SET direccion=@direccion
	WHERE idprovincia=@idprovincia and idlocalidad=@idlocalidad and idconsorcio=@idconsorcio
	COMMIT TRAN
END TRY
BEGIN CATCH
	SET @error = ERROR_MESSAGE()
	ROLLBACK TRAN;
	SET @exito = 0
END CATCH
END