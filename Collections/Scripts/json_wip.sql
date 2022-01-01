--select * from COLLECTION.item_attribute_field
--delete from COLLECTION.item where item_id in (94,95)

declare @sql nvarchar(max),
		@sql2 nvarchar(MAX),
		@collection varchar(50) = 'OS EXPLORER'
				--@json nvarchar(max), -- = '[{"MAP NUMBER":"129","MAP TITLE":"Yeovil and Sherborne","PUBLISH DATE":"2015","MAIN SETTLEMENTS":"Yeovil|Sherborne|Somerton|Wincanton"}]',
DROP TABLE IF EXISTS #json_result
CREATE TABLE #json_result (json_data nvarchar(MAX))
/*
DECLARE @json nvarchar(max)
SET @sql = CORE.r_collection_sql(@collection, 'MAP NAME')

SET @sql2 = '
	SELECT
		x.* 
	FROM OPENJSON(~json)
	WITH (
		~table_def
	) x;'

SET @sql2 = REPLACE(@sql2, '~json', @sql)

SET @sql2 = REPLACE(@sql2, '~table_def', COLLECTION.child_column_list(@collection, 1))
SET @sql2 = REPLACE(@sql2, '^', '''')

print @sql2
EXEC (@sql2)
*/

EXEC COLLECTION.r_collection_sql 'OS EXPLORER', 'MAP NUMBER', 0
