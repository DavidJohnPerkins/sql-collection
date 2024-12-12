DECLARE	@p_input_json CORE.json

SET @p_input_json = N'
[
	{  
		"name": "OS 1 TO 25K",
		"description": "ORDNANCE SURVEY 1:25000 FIRST SERIES MAPS",
		"started": "2024-12-08",
		"keyed": "Y"
	}
]
';

EXEC COLLECTION.c_collection @p_input_json, false, true

