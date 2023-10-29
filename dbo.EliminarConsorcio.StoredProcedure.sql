USE [base_consorcio]
GO

DROP PROCEDURE IF EXISTS [EliminarConsorcio]
GO

CREATE PROCEDURE [EliminarConsorcio] (
	@idprovincia int = null,
	@idlocalidad int = null,
	@idconsorcio int = null,
	@exito bit OUT,
	@error varchar(200) OUT
)
AS 
BEGIN
SET @exito = 1
BEGIN TRY
	IF NOT EXISTS (SELECT * FROM consorcio WHERE idprovincia=@idprovincia and idlocalidad=@idlocalidad and idconsorcio=@idconsorcio)
	BEGIN
		SET @exito = 0
		SET @error = 'Consorcio inexistente'
		RETURN
	END
	BEGIN TRAN
	DELETE FROM consorcio
	WHERE idprovincia=@idprovincia and idlocalidad=@idlocalidad and idconsorcio=@idconsorcio
	COMMIT TRAN
END TRY
BEGIN CATCH
	ROLLBACK TRAN;
	SET @error = ERROR_MESSAGE()
	SET @exito = 0
END CATCH
END