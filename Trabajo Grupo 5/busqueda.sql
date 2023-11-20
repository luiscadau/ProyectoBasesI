use base_consorcio;
go

-- Declarar variables de tiempo
DECLARE @StartTime DATETIME;
DECLARE @EndTime DATETIME;
DECLARE @ValorSinColumnstore BIGINT;
DECLARE @ValorConColumnstore BIGINT;

--test 1
--parte 1
-- Ejecutar una consulta para comparar el rendimiento de ambas tablas
-- Tiempo de inicio
 
SET @StartTime = GETDATE();

-- Consulta en la tabla sin índice de Columnstore
SELECT @ValorSinColumnstore = SUM(importe) FROM gasto;

-- Tiempo de finalización
SET @EndTime = GETDATE();

-- Calcular el tiempo transcurrido
SELECT 'TEST 1) SUM(importe) sin columnstore' AS Tabla, @ValorSinColumnstore AS Cantidad, DATEDIFF(MILLISECOND, @StartTime, @EndTime) AS TiempoTranscurrido;

------------------------------------------------------------------
--parte 2
-- Tiempo de inicio
SET @StartTime = GETDATE();

-- Consulta en la tabla con índice de Columnstore

SELECT @ValorConColumnstore = SUM(importe) FROM gastonew ;

-- Tiempo de finalización
SET @EndTime = GETDATE();

-- Calcular el tiempo transcurrido
SELECT 'TEST 1) SUM(importe) con columnstore' AS Tabla, @ValorConColumnstore AS Cantidad, DATEDIFF(MILLISECOND, @StartTime, @EndTime) AS TiempoTranscurrido;

--test 2
-- Ejecutar una consulta para comparar el rendimiento de ambas tablas
-- Declarar variables de tiempo
 

-- Tiempo de inicio
SET @StartTime = GETDATE();

-- Consulta en la tabla sin índice de Columnstore
 
SELECT @ValorSinColumnstore = AVG(importe) FROM gasto  ;

-- Tiempo de finalización
SET @EndTime = GETDATE();

-- Calcular el tiempo transcurrido
SELECT 'TEST 2) AVG(importe) sin columnstore' AS Tabla, @ValorSinColumnstore AS Cantidad, DATEDIFF(MILLISECOND, @StartTime, @EndTime) AS TiempoTranscurrido;

------------------------------------------------------------------
--parte 2
 
-- Tiempo de inicio
SET @StartTime = GETDATE();

-- Consulta en la tabla con índice de Columnstore
 
SELECT @ValorConColumnstore = AVG(importe) FROM gastonew ;

-- Tiempo de finalización
SET @EndTime = GETDATE();

-- Calcular el tiempo transcurrido
SELECT 'TEST 2) AVG(importe) con columnstore' AS Tabla, @ValorConColumnstore AS Cantidad, DATEDIFF(MILLISECOND, @StartTime, @EndTime) AS TiempoTranscurrido;

--test 3
--parte 1
-- Ejecutar una consulta para comparar el rendimiento de ambas tablas
-- Declarar variables de tiempo
 

-- Tiempo de inicio
SET @StartTime = GETDATE();

-- Consulta en la tabla sin índice de Columnstore
SELECT @ValorSinColumnstore = COUNT(*) FROM gasto WHERE idconsorcio <= 250;

-- Tiempo de finalización
SET @EndTime = GETDATE();

-- Calcular el tiempo transcurrido
SELECT 'TEST 3) COUNT(*) sin columnstore' AS Tabla, @ValorSinColumnstore AS Cantidad, DATEDIFF(MILLISECOND, @StartTime, @EndTime) AS TiempoTranscurrido;

------------------------------------------------------------------
--parte 2
 
-- Tiempo de inicio
SET @StartTime = GETDATE();

-- Consulta en la tabla con índice de Columnstore
SELECT @ValorConColumnstore = COUNT(*) FROM gastonew WHERE idconsorcio <= 250;

-- Tiempo de finalización
SET @EndTime = GETDATE();

-- Calcular el tiempo transcurrido
SELECT 'TEST 3) COUNT(*) con columnstore' AS Tabla, @ValorConColumnstore AS Cantidad, DATEDIFF(MILLISECOND, @StartTime, @EndTime) AS TiempoTranscurrido;


--test 4
--parte 1 
 
-- Tiempo de inicio
SET @StartTime = GETDATE();

-- Consulta en la tabla sin índice de Columnstore
SELECT *
FROM gasto
WHERE idconsorcio <= 250

-- Tiempo de finalización
SET @EndTime = GETDATE();

-- Calcular el tiempo transcurrido
SELECT 'TEST 4) SELECT sin columnstore' AS Tabla,  DATEDIFF(MILLISECOND, @StartTime, @EndTime) AS TiempoTranscurrido;

------------------------------------------------------------------
--parte 2
 
-- Tiempo de inicio
SET @StartTime = GETDATE();

-- Consulta en la tabla con índice de Columnstore 
SELECT *
FROM gastonew
WHERE idconsorcio <= 250

-- Tiempo de finalización
SET @EndTime = GETDATE();

-- Calcular el tiempo transcurrido
SELECT 'TEST 4) SELECT con columnstore' AS Tabla,  DATEDIFF(MILLISECOND, @StartTime, @EndTime) AS TiempoTranscurrido;

 

--test 5
--parte 1

-- Calcular el tiempo transcurrido


------------------------------------------------------------------
--parte 2
-- Calcular el tiempo transcurrido

 
 
-- Tiempo de inicio
SET @StartTime = GETDATE();

-- Consulta en la tabla sin índice de Columnstore
SELECT gn.* , pro.*
FROM gasto as gn
join provincia as pro on gn.idprovincia = pro.idprovincia
WHERE idconsorcio <= 250 and pro.idprovincia = 1

-- Tiempo de finalización
SET @EndTime = GETDATE();

-- Calcular el tiempo transcurrido
SELECT 'TEST 5) SELECT/JOIN sin columnstore' AS Tabla,  DATEDIFF(MILLISECOND, @StartTime, @EndTime) AS TiempoTranscurrido;

------------------------------------------------------------------
--parte 2
 
-- Tiempo de inicio
SET @StartTime = GETDATE();

-- Consulta en la tabla con índice de Columnstore 
SELECT gn.* , pro.*
FROM gastonew as gn
join provincia as pro on gn.idprovincia = pro.idprovincia
WHERE idconsorcio <= 250 and pro.idprovincia = 1


-- Tiempo de finalización
SET @EndTime = GETDATE();

-- Calcular el tiempo transcurrido
SELECT 'TEST 5) SELECT/JOIN con columnstore' AS Tabla,  DATEDIFF(MILLISECOND, @StartTime, @EndTime) AS TiempoTranscurrido;
