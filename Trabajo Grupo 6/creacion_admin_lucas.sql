--creacion de login con su contraseña
create login logLucas with password='54321'
--creacion de usuario
create user loglucas	for login logLucas


--se concede privilegio de todos los comandos solo para dos tablas
grant all on conserje to loglucas

grant all on administrador to loglucas

