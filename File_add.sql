ALTER DATABASE SalesDB ADD FILE
(
NAME='P_2023', -- logical file name,
FILENAME='C:\SQLDATA\CTAS.ndf'
)TO FILEGROUP FG_2023

--- check where it is exist

select
fg.name as filename,
mf.name,
mf.physical_name,
mf.size/128 size
from sys.filegroups fg
join sys.master_files mf on
fg.data_space_id=mf.data_space_id
where mf.database_id=DB_ID('SalesDB')