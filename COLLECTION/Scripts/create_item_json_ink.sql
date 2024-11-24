USE Collections
GO

DECLARE	@json_data CORE.json

SET @json_data = N'
[{  
    "parent_collection": "INK COLLECTION",
    "item":[
		{
			"item_key_value": "JH022",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "JH022"},
					{"attr_name": "BRAND",			"attr_value": "Jacques Herbin"},
					{"attr_name": "RANGE",			"attr_value": "L''encre 350"},
					{"attr_name": "INK_NAME", 		"attr_value": "Vert Atlantide"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "50ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Green"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 50},
					{"attr_name": "RATING", 		"attr_value": 5}
			]
		},
		{
			"item_key_value": "JH023",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "JH023"},
					{"attr_name": "BRAND",			"attr_value": "Jacques Herbin"},
					{"attr_name": "RANGE",			"attr_value": "Les encres essentielles"},
					{"attr_name": "INK_NAME", 		"attr_value": "Vert Amazone"},
					{"attr_name": "CONTAINER", 		"attr_value": "Cartridge"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "Long"},
					{"attr_name": "COLOUR", 		"attr_value": "Green"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 7},
					{"attr_name": "RATING", 		"attr_value": 5}
			]
		}
	]
}]
';
select @json_data;

EXEC COLLECTION.c_collection_item @json_data,0,1
