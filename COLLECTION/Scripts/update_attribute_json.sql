DECLARE	@json_data CORE.json

SET @json_data = N'
[
	{  
		"collection_name": "OS EXPLORER",
		"item_key_value": "EXP1022003",
		"item_attr_name": "main_settlements",
		"new_value": "Penzance|St Ives|Land''s End"
	}
]
';
--select @json_data;
EXEC CORE.ru_attribute @json_data, 1, 1


