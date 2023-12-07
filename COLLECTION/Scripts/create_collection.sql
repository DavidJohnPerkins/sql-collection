DECLARE	@p_input_json CORE.json

SET @p_input_json = N'
[
	{  
		"name": "POLYCHROMOS PENCILS",
		"description": "FABER-CASTELL POLYCHROMOS PENCILS",
		"started": "2023-12-06",
		"keyed": "Y"
	}
]
';

EXEC COLLECTION.c_collection @p_input_json, false, true

