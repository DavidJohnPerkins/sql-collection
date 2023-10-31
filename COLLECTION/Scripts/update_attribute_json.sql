DECLARE	@json_data CORE.json

SET @json_data = N'
[
	{  
		"collection_name": "INK COLLECTION",
		"item_key_value": "MB028",
		"item_attr_name": "QTY_REMAINING",
		"new_value": "12"
	}
]
';
--select @json_data;
EXEC CORE.ru_attribute @json_data, 1, 1


