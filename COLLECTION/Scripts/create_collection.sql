DECLARE	@p_input_json CORE.json

SET @p_input_json = N'
[
	{  
		"name": "BARTHOLOMEW HALF-INCH",
		"description": "BARTHOLOMEW HALF-INCH CONTOURED MAPS",
		"started": "2024-12-06",
		"keyed": "Y"
	}
]
';

EXEC COLLECTION.c_collection @p_input_json, false, true

