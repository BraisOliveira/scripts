
/* como borrar una base de datos SI existe */

use master;
go
create database mytest;
go


--nuevo bloque---------------------------------------------------------------------------

drop database if exists mytest;  --borra la mytest si existe y es una base de datos
go

-----------------------------------------------------------------------------------------
use master;
go
if DB_ID ('mytest') is not null --si el identificador no es vacio -osea, si existe- borra la BD mytest
	drop database mytest;
go

-----------------------------------------------------------------------------------------

select *
from sys.databases;
go

-----------------------------------------------------------------------------------------

if exists (select name 
			from sys.databases
			where name = 'mytest')
			drop database mytest

/* SI existe mytest que tiene que estar en sys.databases , borralo */