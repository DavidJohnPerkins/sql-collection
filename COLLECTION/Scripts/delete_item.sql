DECLARE	@p_input_json CORE.json

SET @p_input_json = N'
[{  
	"collection_name": "INK COLLECTION",
	"item_key_value": "EXP234"
}]
';

EXEC COLLECTION.d_collection_item_json @p_input_json, 0, 1

