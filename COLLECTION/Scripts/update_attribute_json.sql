DECLARE	@json_data CORE.json

SET @json_data = N'
[
	{  
		"collection_name": "POLYCHROMOS PENCILS",
		"item_key_value": "POLY134",
		"item_attr_name": "LOCATION",
		"new_value": "PROMISED"
	}
]
';
--select @json_data;
EXEC CORE.ru_attribute @json_data, 1, 1


