SET echo off
SET feedback off
SET term off
SET verify off
SET pagesize 0
SET linesize 4
SET newpage 0
SET space 0
col name format a120
spool .\passwords\password_list_&1..txt
select password from (
    select password, row_number() over (order by password) rowNumber 
    from view_producto_cartesiano
) where rowNumber between &2 and &3;
SPOOL OFF
exit
