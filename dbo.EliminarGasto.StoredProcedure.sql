USE [base_consorcio]
GO

DROP PROCEDURE IF EXISTS [EliminarGasto]
GO

CREATE PROCEDURE [EliminarGasto] (
	@idgasto int = null,
	@exito bit OUT,
	@error varchar(200) OUT
)
AS 
BEGIN
SET @exito = 1
BEGIN TRY
	IF NOT EXISTS (SELECT * FROM gasto WHERE idgasto=@idgasto)
	BEGIN
		SET @exito = 0
		SET @error = 'Gasto inexistente'
		RETURN
	END
	BEGIN TRAN
	DELETE FROM gasto
	WHERE idgasto=@idgasto
	COMMIT TRAN
END TRY
BEGIN CATCH
	ROLLBACK TRAN;
	SET @error = ERROR_MESSAGE()
	SET @exito = 0
END CATCH
END