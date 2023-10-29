USE [base_consorcio]
GO

DROP PROCEDURE IF EXISTS [CambiarResidenciaAdministrador]
GO

CREATE PROCEDURE [CambiarResidenciaAdministrador] (
	@idadmin int = null,
	@viveahi varchar(1) = null,
	@exito bit OUT,
	@error varchar(200) OUT
)
AS 
BEGIN
SET @exito = 1
BEGIN TRY
	BEGIN TRAN
	UPDATE administrador
	SET viveahi=@viveahi
	WHERE idadmin=@idadmin
	COMMIT TRAN
END TRY
BEGIN CATCH
	SET @error = CASE
					WHEN ERROR_MESSAGE() LIKE '%CK_habitante_viveahi%' THEN 'Valor incorrecto para el campo viveahi. Los valores posibles son S y N.'
					ELSE ERROR_MESSAGE()
					END
	ROLLBACK TRAN;
	SET @exito = 0
END CATCH
END