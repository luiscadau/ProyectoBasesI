USE [base_consorcio]
GO

DROP PROCEDURE IF EXISTS [CambiarImporteGasto]
GO

CREATE PROCEDURE [CambiarImporteGasto] (
	@idgasto int = null,
	@importe decimal(8,2) = null,
	@exito bit OUT,
	@error varchar(200) OUT
)
AS 
BEGIN
SET @exito = 1
BEGIN TRY
	BEGIN TRAN
	UPDATE gasto
	SET importe=@importe
	WHERE idgasto=@idgasto
	COMMIT TRAN
END TRY
BEGIN CATCH
	SET @error = ERROR_MESSAGE()
	ROLLBACK TRAN;
	SET @exito = 0
END CATCH
END