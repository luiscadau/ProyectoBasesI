USE [base_consorcio]
GO

/*
	En el siguiente script se crea una tabla gastonew apartir de la tabla gasto para poder comparar
	los tiempos de ejecucion de consultas entre una tabla indexada de manera columnar y otra que no.
	Se agrega el nonclustered columnstore index a todas las columnas de la tabla gastonew.
	Luego se agrega un millon de registros en ambas tablas para poder comparar tiempos de ejecucion.
*/

-- Se crea la tabla solicitada apartir de la tabla GASTO
CREATE TABLE [dbo].[gastonew](
    [idgasto] [int] IDENTITY(1,1) NOT NULL,
    [idprovincia] [int] NULL,
    [idlocalidad] [int] NULL,
    [idconsorcio] [int] NULL,
    [periodo] [int] NULL,
    [fechapago] [datetime] NULL,
    [idtipogasto] [int] NULL,
    [importe] [decimal](8, 2) NULL,
    CONSTRAINT [PK_gastonew] PRIMARY KEY CLUSTERED ([idgasto] ASC),
    CONSTRAINT [FK_gasto_consorcio_new] FOREIGN KEY ([idprovincia], [idlocalidad], [idconsorcio])
    REFERENCES [dbo].[consorcio] ([idprovincia], [idlocalidad], [idconsorcio]),
    CONSTRAINT [FK_gasto_tipo_new] FOREIGN KEY ([idtipogasto])
    REFERENCES [dbo].[tipogasto] ([idtipogasto])
);


-- Crear un �ndice columnar no agrupado 
CREATE NONCLUSTERED COLUMNSTORE INDEX IX_GASTONEW_Columnar
ON dbo.GASTONEW
(
    idprovincia,
    idlocalidad,
    idconsorcio,
    periodo,
    fechapago,
    idtipogasto,
    importe
);



-- Se inserta 1.000.000 de registros a la tabla GASTONEW

-- Deshabilita las restricciones de clave externa para un mejor rendimiento
ALTER TABLE dbo.gastonew NOCHECK CONSTRAINT ALL;

DECLARE @counter INT = 1;

WHILE @counter <= 1000000
BEGIN
    INSERT INTO dbo.gastonew (idprovincia, idlocalidad, idconsorcio, periodo, fechapago, idtipogasto, importe)
    VALUES (
        -- Valores aleatorios para cada columna
        CAST((RAND() * (5-1) + 1) AS INT), -- idprovincia (aleatorio entre 1 y 5)
        CAST((RAND() * (5-1) + 1) AS INT), -- idlocalidad (aleatorio entre 1 y 5)
        CAST((RAND() * (40-1) + 1) AS INT), -- idconsorcio (aleatorio entre 1 y 400)
        CAST((RAND() * (9-1) + 1) AS INT), -- periodo (aleatorio entre 1 y 9)
        GETDATE(), -- fechapago (fecha y hora actual)
        CAST((RAND() * (5-1) + 1) AS INT), -- idtipogasto (aleatorio entre 1 y 5)
        CAST((RAND() * (400000-55000) + 55000) AS DECIMAL(8,2)) -- importe (aleatorio entre 50000 y 300000)
    );
    
    SET @counter = @counter + 1;
END;

-- Vuelve a habilitar las restricciones de clave externa
ALTER TABLE dbo.gastonew CHECK CONSTRAINT ALL;
GO



-- Se completa a 1.000.000 de registros a la tabla GASTO

-- Deshabilita las restricciones de clave externa para un mejor rendimiento
ALTER TABLE dbo.gasto NOCHECK CONSTRAINT ALL;

DECLARE @counter INT = 1;

WHILE @counter <= 992000
BEGIN
    INSERT INTO dbo.gasto (idprovincia, idlocalidad, idconsorcio, periodo, fechapago, idtipogasto, importe)
    VALUES (
        -- Valores aleatorios para cada columna
        CAST((RAND() * (5-1) + 1) AS INT), -- idprovincia (aleatorio entre 1 y 5)
        CAST((RAND() * (5-1) + 1) AS INT), -- idlocalidad (aleatorio entre 1 y 5)
        CAST((RAND() * (40-1) + 1) AS INT), -- idconsorcio (aleatorio entre 1 y 400)
        CAST((RAND() * (9-1) + 1) AS INT), -- periodo (aleatorio entre 1 y 9)
        GETDATE(), -- fechapago (fecha y hora actual)
        CAST((RAND() * (5-1) + 1) AS INT), -- idtipogasto (aleatorio entre 1 y 5)
        CAST((RAND() * (400000-55000) + 55000) AS DECIMAL(8,2)) -- importe (aleatorio entre 50000 y 300000)
    );
    
    SET @counter = @counter + 1;
END;

-- Vuelve a habilitar las restricciones de clave externa
ALTER TABLE dbo.gasto CHECK CONSTRAINT ALL;
GO
