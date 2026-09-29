--exec COLLECTION.r_collection_filter_values '{"collection_name": "POLYCHROMOS PENCILS", "dimension_col": "[COLOUR_GROUP]"}'

--select * from COLLECTION.child_column_list_base('POLYCHROMOS PENCILS')

DECLARE @p_input_json CORE.json = '
{
	"collection_name": "POLYCHROMOS_PENCILS",
	"searches": [
		{
			"dimension": "LOCATION", 
			"search_values": [
				"PROMISED"
			]
		},
		{
			"dimension": "COLOUR_GROUP", 
			"search_values": [
				"BROWN"
			]
		}
	]
}'

DECLARE @v_collection_name  CORE.collection_name = (SELECT JSON_VALUE(@p_input_json, '$.collection_name')),
		@v_dimension        varchar(50) = (SELECT JSON_VALUE(@p_input_json, '$.dimension')),
		@v_list				varchar(255)
--select @v_collection_name, @v_dimension
;WITH w_values AS (
	SELECT
		f.value	AS search_value
	FROM 
		OPENJSON (@p_input_json, '$.search_values') f
)
select @v_list = STRING_AGG(QUOTENAME(search_value, ''''''), ',') from w_values

DECLARE @sql_var CORE.sql_var = '
			SELECT * FROM COLLECTION.v_base_~coll WHERE ~dim IN (~list)'

SET @sql_var = REPLACE(@sql_var, '~coll', @v_collection_name)
SET @sql_var = REPLACE(@sql_var, '~dim', @v_dimension)
SET @sql_var = REPLACE(@sql_var, '~list', @v_list)

print @sql_var

EXEC (@sql_var)

