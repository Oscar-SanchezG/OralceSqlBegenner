define userstore=universidad

alter session set "_ORACLE_SCRIPT"=true;

-- ASEGURATE QUE ESTE DIRECTORIO EXISTA !!!!!
def db_df_base='C:\Users\oscar\Documents\SqlOracle\Udemy\Oracle SQL domina lo necesario para el trabajo\Database\Oracle'

def phy_df1_store= '&db_df_base.\&userstore._DATA.dbf'
def phy_df2_store= '&db_df_base.\&userstore._DATA2.dbf'
def phy_idx_store= '&db_df_base.\&userstore._IDX'


declare 
cnt number(10);
begin
 select count(username) into cnt
   from dba_users 
 where username = upper('&userstore');
 
 if cnt > 0 then 
  dbms_output.put_line('cnt'||cnt);
  execute IMMEDIATE 'DROP USER &userstore CASCADE';
  execute IMMEDIATE 'drop tablespace &userstore._DATA INCLUDING CONTENTS AND DATAFILES';
 end if;
end;
/

CREATE TABLESPACE &userstore._DATA  
    DATAFILE '&phy_df1_store' SIZE 262144000 AUTOEXTEND ON NEXT 262144000 MAXSIZE 5368709120
    NOLOGGING 
    DEFAULT NOCOMPRESS 
    ONLINE 
    EXTENT MANAGEMENT LOCAL AUTOALLOCATE;

--    DATAFILE '&phy_df_store' SIZE 2097152000 AUTOEXTEND ON NEXT 524288000 MAXSIZE 10485760000 
	
-- Prompt creating RIS database STORE user &userstore	
CREATE USER &userstore IDENTIFIED BY &userstore DEFAULT TABLESPACE &userstore._DATA  TEMPORARY TABLESPACE TEMP QUOTA 1000M ON &userstore._DATA ;
GRANT CONNECT TO &userstore;
GRANT RESOURCE TO &userstore;
GRANT CREATE SESSION TO &userstore;
GRANT CREATE SEQUENCE TO &userstore;
GRANT CREATE VIEW TO &userstore;
GRANT CREATE MATERIALIZED VIEW TO &userstore;
GRANT CREATE SYNONYM TO &userstore;
GRANT GATHER_SYSTEM_STATISTICS TO &userstore ;
GRANT SELECT ANY DICTIONARY TO &userstore ;
GRANT DEBUG CONNECT SESSION TO &userstore ;
GRANT DEBUG ANY PROCEDURE TO &userstore ;