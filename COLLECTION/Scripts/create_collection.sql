DECLARE	@p_input_json CORE.json

SET @p_input_json = N'
[
	{  
		"name": "OS ROAD",
		"description": "ORDNANCE SURVEY ROAD SERIES MAPS",
		"started": "2024-07-06",
		"keyed": "Y"
	}
]
';

EXEC COLLECTION.c_collection @p_input_json, false, true

