--creamos un login  con una contraseña
create login logJulio	with password='1234'

--cambiamos a la base de datos en donde se va a implementar los permisos
use base_consorcio

--ccreamos un usuario para la instancia de logJulio
create user uJulio for login logJulio

--Le otorgamos privilegios con el con Grant

grant select on  zona to uJulio

grant select on administrador to uJulio

--asimismo se le puede quitar privilegio con revoke

--con el siguiente codigo se le quita todos los privilegios para los comandos al usuarios

revoke all on zona from uJulio cascade

select count(*) from zona

