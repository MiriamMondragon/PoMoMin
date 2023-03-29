SELECT
    IC.COLUMN_NAME,
    IC.Data_TYPE,
	IC.CHARACTER_MAXIMUM_LENGTH AS 'LENGHT',
    ITC.CONSTRAINT_TYPE,
    IKU.CONSTRAINT_NAME, 
    IC.IS_NULLABLE,
	IC.TABLE_NAME
 FROM
    INFORMATION_SCHEMA.COLUMNS IC
    INNER JOIN sys.columns sc ON OBJECT_ID(QUOTENAME(IC.TABLE_SCHEMA) + '.' + QUOTENAME(IC.TABLE_NAME)) = sc.[object_id] AND IC.COLUMN_NAME = sc.name
    LEFT OUTER JOIN sys.extended_properties EP ON sc.[object_id] = EP.major_id AND sc.[column_id] = EP.minor_id AND EP.name = 'MS_Description' AND EP.class = 1 
    LEFT OUTER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE IKU ON IKU.COLUMN_NAME = IC.COLUMN_NAME and IKU.TABLE_NAME = IC.TABLE_NAME and IKU.TABLE_CATALOG = IC.TABLE_CATALOG
    LEFT OUTER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS ITC ON ITC.TABLE_NAME = IKU.TABLE_NAME and ITC.CONSTRAINT_NAME = IKU.CONSTRAINT_NAME
WHERE IC.TABLE_CATALOG = 'PoMoMin'
  and IC.TABLE_SCHEMA = 'dbo'
  and IC.TABLE_NAME = 'Bitacora'
ORDER BY IC.ORDINAL_POSITION