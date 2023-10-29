USE [base_consorcio]
GO

DROP PROCEDURE IF EXISTS [EliminarAdministrador]
GO

CREATE PROCEDURE [EliminarAdministrador] (
	@idadmin int = null,
	@exito bit OUT,
	@error varchar(200) OUT
)
AS 
BEGIN
SET @exito = 1
BEGIN TRY
	IF NOT EXISTS (SELECT * FROM administrador WHERE idadmin=@idadmin)
	BEGIN
		SET @exito = 0
		SET @error = 'Administrador inexistente'
		RETURN
	END
	BEGIN TRAN
	DELETE FROM administrador
	WHERE idadmin=@idadmin
	COMMIT TRAN
END TRY
BEGIN CATCH
	ROLLBACK TRAN;
	SET @error = ERROR_MESSAGE()
	SET @exito = 0
END CATCH
END