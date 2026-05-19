USE Collections
GO

DECLARE	@p_input_json CORE.json

SET @p_input_json = N'
[
	{  
		"name": "SCORES",
		"description": "MUSIC SCORES",
		"started": "2026-05-17",
		"keyed": "Y"
	}
]
';

EXEC COLLECTION.c_collection @p_input_json, false, true

