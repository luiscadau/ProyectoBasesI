USE [base_consorcio]
GO

-- INSERTANDO UTILIZANDO SENTENCIA INSERT
INSERT INTO administrador (apeynom, sexo, fechnac) VALUES ('CANDELA BUONANOTTE', 'F', '1990-01-13')
INSERT INTO administrador (apeynom, sexo, fechnac) VALUES ('JUAN ALVAREZ', 'M', '1988-08-28')
INSERT INTO administrador (apeynom, sexo, fechnac) VALUES ('CAROLINA GARNACHO', 'S', '1975-06-15')
INSERT INTO administrador (apeynom, sexo, fechnac) VALUES ('MARIELA OTAMENDI', 'F', '1984-04-21')
INSERT INTO administrador (apeynom, sexo, fechnac) VALUES ('CLAUDIA PERRONE', 'F', '1977-02-19')
INSERT INTO administrador (apeynom, sexo, fechnac) VALUES ('FERNANDA CORREA', 'F', '1966-03-06')
INSERT INTO administrador (apeynom, sexo, fechnac) VALUES ('GASTON DE PAUL', 'M', '1956-05-24')
INSERT INTO administrador (apeynom, sexo, fechnac) VALUES ('JORGE MARTINEZ', 'M', '1989-07-04')
INSERT INTO administrador (apeynom, sexo, fechnac) VALUES ('LUIS OTAMENDI', 'M', '1986-09-17')
INSERT INTO administrador (apeynom, sexo, fechnac) VALUES ('AGUSTIN ROMERO', 'M', '1968-11-03')

-- INSERTANDO UTILIZANDO PROCEDIMIENTO ALMACENADO
DECLARE @exito bit
DECLARE @error varchar(200)

EXEC dbo.InsertarAdministrador 'CAROLINA GARNACHO', 'S', '3794123456', 'S', '1975-06-15', @exito out, @error out
SELECT Exito=@exito, Error=@error
SELECT @exito=NULL, @error=NULL

EXEC dbo.InsertarAdministrador 'FERNANDA CORREA', 'N', '3794654987', 'F', '1966-03-06', @exito out, @error out
SELECT Exito=@exito, Error=@error
SELECT @exito=NULL, @error=NULL

EXEC dbo.InsertarAdministrador 'GASTON DE PAUL', 'N', '3795456123', 'M', '1956-05-24', @exito out, @error out
SELECT Exito=@exito, Error=@error
SELECT @exito=NULL, @error=NULL

-- ELIMINANDO UTILIZANDO PROCEDIMIENTO ALMACENADO
DECLARE @exito bit
DECLARE @error varchar(200)

EXEC dbo.EliminarAdministrador 15, @exito out, @error out
SELECT Exito=@exito, Error=@error
SELECT @exito=NULL, @error=NULL

-- MODIFICANDO UTILIZANDO PROCEDIMIENTO ALMACENADO
DECLARE @exito bit
DECLARE @error varchar(200)

EXEC dbo.CambiarResidenciaAdministrador 15, 'G', @exito out, @error out
SELECT Exito=@exito, Error=@error
SELECT @exito=NULL, @error=NULL

EXEC dbo.CambiarResidenciaAdministrador 15, 'S', @exito out, @error out
SELECT Exito=@exito, Error=@error
SELECT @exito=NULL, @error=NULL

-- UTILIZANDO FUNCION PARA CALCULAR EDAD

SELECT [Nombre y Apellido]=apeynom, [Edad]=dbo.[CalcularEdad](fechnac) FROM administrador 


