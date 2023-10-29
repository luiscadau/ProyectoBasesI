USE [base_consorcio]
GO

DROP PROCEDURE IF EXISTS [InsertarGasto]
GO

CREATE PROCEDURE [InsertarGasto] (
	@idprovincia int = null,
	@idlocalidad int = null,
	@idconsorcio int = null,
	@periodo int = null,
	@fechapago datetime  = null,
	@idtipogasto int = null,
	@importe decimal(8,2) = null,
	@exito bit OUT,
	@error varchar(200) OUT
)
AS 
BEGIN
SET @exito = 1
BEGIN TRY
	BEGIN TRAN
	INSERT INTO gasto (idprovincia, idlocalidad, idconsorcio, periodo, fechapago, idtipogasto, importe)
	VALUES (@idprovincia, @idlocalidad, @idconsorcio, @periodo, @fechapago, @idtipogasto, @importe)
	COMMIT TRAN
END TRY
BEGIN CATCH
	SET @error = ERROR_MESSAGE()
	ROLLBACK TRAN;
	SET @exito = 0
END CATCH
END