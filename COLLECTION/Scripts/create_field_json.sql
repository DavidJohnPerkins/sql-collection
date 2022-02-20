USE Collections
GO

	DECLARE @insert 	CORE.field_list,
			@json_data	CORE.json

/*
	SET @json_data = N'[{  
		"fields": [
			{"field_name": "BRAND", "attr_type_code": "V", "return_length": 50},
			{"field_name": "RANGE", "attr_type_code": "V", "return_length": 50},
			{"field_name": "CONTAINER", "attr_type_code": "V", "return_length": 50},
			{"field_name": "CONTAINER_SIZE", "attr_type_code": "V", "return_length": 50},
			{"field_name": "COLOUR", "attr_type_code": "V", "return_length": 50},
			{"field_name": "QTY_REMAINING", "attr_type_code": "I", "return_length": null},
			{"field_name": "RATING", "attr_type_code": "I", "return_length": null}
		]
	}]';
*/
	SET @json_data = N'[{  
		"fields": [
			{"field_name": "INK_NAME", "attr_type_code": "V", "return_length": 50}
		]
	}]';


	--select * from @insert

	EXEC COLLECTION.cu_field_json @json_data, true, true
