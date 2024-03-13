connect system/123

show con_name

ALTER SESSION SET CONTAINER=CDB$ROOT;
ALTER DATABASE OPEN;

DROP TABLESPACE ts_PPI INCLUDING CONTENTS and DATAFILES;
    
CREATE TABLESPACE ts_PPI LOGGING
DATAFILE 'C:\PPI_2024_1\BD_ppi\entorno_de_bd\DF_ppi.dbf' size 3M
extent management local segment space management auto; 
 
alter session set "_ORACLE_SCRIPT"=true; 
 
drop user usu_ppi cascade;
    
CREATE user usu_ppi profile default 
identified by 123
default tablespace ts_PPI
temporary tablespace temp 
account unlock;     

--privilegios
grant connect, resource,dba to usu_ppi; 

connect usu_ppi/123

show user