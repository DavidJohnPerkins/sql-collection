USE Collections
GO

DECLARE	@json_data CORE.json

SET @json_data = N'
[{  
    "parent_collection": "POLYCHROMOS PENCILS",
    "item":[
{"item_key_value": "POLY101","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY101"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "101"},{"attr_name": "COLOUR_GROUP",	"attr_value": "WHITE"},		{"attr_name": "COLOUR_NAME",	"attr_value": "White"},					{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "TIN24"}]},
{"item_key_value": "POLY102","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY102"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "102"},{"attr_name": "COLOUR_GROUP",	"attr_value": "YELLOW"},	{"attr_name": "COLOUR_NAME",	"attr_value": "Cream"},					{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY104","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY104"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "104"},{"attr_name": "COLOUR_GROUP",	"attr_value": "YELLOW"},	{"attr_name": "COLOUR_NAME",	"attr_value": "Light Yellow Glaze"},	{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "TIN24"}]},
{"item_key_value": "POLY105","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY105"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "105"},{"attr_name": "COLOUR_GROUP",	"attr_value": "YELLOW"},	{"attr_name": "COLOUR_NAME",	"attr_value": "Light Cadmium Yellow"},	{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY107","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY107"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "107"},{"attr_name": "COLOUR_GROUP",	"attr_value": "YELLOW"},	{"attr_name": "COLOUR_NAME",	"attr_value": "Cadmium Yellow"},		{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "TIN24"}]},
{"item_key_value": "POLY108","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY108"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "108"},{"attr_name": "COLOUR_GROUP",	"attr_value": "YELLOW"},	{"attr_name": "COLOUR_NAME",	"attr_value": "Dark Cadmium Yellow"},	{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY109","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY109"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "109"},{"attr_name": "COLOUR_GROUP",	"attr_value": "YELLOW"},	{"attr_name": "COLOUR_NAME",	"attr_value": "Dark Chrome Yellow"},	{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "TIN24"}]},
{"item_key_value": "POLY110","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY110"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "110"},{"attr_name": "COLOUR_GROUP",	"attr_value": "BLUE"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Phthalo Blue"},			{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "TIN24"}]},
{"item_key_value": "POLY111","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY111"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "111"},{"attr_name": "COLOUR_GROUP",	"attr_value": "ORANGE"},	{"attr_name": "COLOUR_NAME",	"attr_value": "Cadmium Orange"},		{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY112","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY112"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "112"},{"attr_name": "COLOUR_GROUP",	"attr_value": "GREEN"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Leaf Green"},			{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY113","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY113"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "113"},{"attr_name": "COLOUR_GROUP",	"attr_value": "ORANGE"},	{"attr_name": "COLOUR_NAME",	"attr_value": "Orange Glaze"},			{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY115","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY115"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "115"},{"attr_name": "COLOUR_GROUP",	"attr_value": "ORANGE"},	{"attr_name": "COLOUR_NAME",	"attr_value": "Dark Cadmium Orange"},	{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "TIN24"}]},
{"item_key_value": "POLY118","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY118"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "118"},{"attr_name": "COLOUR_GROUP",	"attr_value": "RED"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Scarlet Red"},			{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY119","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY119"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "119"},{"attr_name": "COLOUR_GROUP",	"attr_value": "RED"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Light Magenta"},			{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY120","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY120"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "120"},{"attr_name": "COLOUR_GROUP",	"attr_value": "BLUE"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Ultramarine"},			{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "TIN24"}]},
{"item_key_value": "POLY121","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY121"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "121"},{"attr_name": "COLOUR_GROUP",	"attr_value": "RED"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Pale Geranium Lake"},	{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "TIN24"}]},
{"item_key_value": "POLY124","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY124"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "124"},{"attr_name": "COLOUR_GROUP",	"attr_value": "RED"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Rose Carmine"},			{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY125","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY125"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "125"},{"attr_name": "COLOUR_GROUP",	"attr_value": "PINK"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Middle Purple Pink"},	{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY126","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY126"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "126"},{"attr_name": "COLOUR_GROUP",	"attr_value": "RED"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Permanent Carmine"},		{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY127","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY127"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "127"},{"attr_name": "COLOUR_GROUP",	"attr_value": "PINK"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Pink Carmine"},			{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY131","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY131"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "131"},{"attr_name": "COLOUR_GROUP",	"attr_value": "PINK"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Medium Flesh (Coral)"},	{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY132","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY132"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "132"},{"attr_name": "COLOUR_GROUP",	"attr_value": "PINK"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Light Flesh"},			{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY133","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY133"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "133"},{"attr_name": "COLOUR_GROUP",	"attr_value": "RED"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Magenta"},				{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "TIN24"}]},
{"item_key_value": "POLY134","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY134"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "134"},{"attr_name": "COLOUR_GROUP",	"attr_value": "RED"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Crimson"},				{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY136","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY136"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "136"},{"attr_name": "COLOUR_GROUP",	"attr_value": "PURPLE"},	{"attr_name": "COLOUR_NAME",	"attr_value": "Purple Violet"},			{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY140","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY140"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "140"},{"attr_name": "COLOUR_GROUP",	"attr_value": "BLUE"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Light Ultramarine"},		{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "TIN24"}]},
{"item_key_value": "POLY141","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY141"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "141"},{"attr_name": "COLOUR_GROUP",	"attr_value": "BLUE"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Delft Blue"},			{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY142","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY142"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "142"},{"attr_name": "COLOUR_GROUP",	"attr_value": "RED"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Madder"},				{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY143","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY143"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "143"},{"attr_name": "COLOUR_GROUP",	"attr_value": "BLUE"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Cobalt Blue"},			{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY145","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY145"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "145"},{"attr_name": "COLOUR_GROUP",	"attr_value": "BLUE"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Light Phthalo Blue"},	{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY146","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY146"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "146"},{"attr_name": "COLOUR_GROUP",	"attr_value": "BLUE"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Sky Blue"},				{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY149","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY149"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "149"},{"attr_name": "COLOUR_GROUP",	"attr_value": "BLUE"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Bluish Turquoise"},		{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY151","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY151"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "151"},{"attr_name": "COLOUR_GROUP",	"attr_value": "RED"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Helioblue-Reddish"},		{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "TIN24"}]},
{"item_key_value": "POLY153","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY153"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "153"},{"attr_name": "COLOUR_GROUP",	"attr_value": "BLUE"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Cobalt Turquoise"},		{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY154","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY154"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "154"},{"attr_name": "COLOUR_GROUP",	"attr_value": "BLUE"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Light Cobalt Turquoise"},{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY155","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY155"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "155"},{"attr_name": "COLOUR_GROUP",	"attr_value": "BLUE"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Helio Turquoise"},		{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY156","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY156"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "156"},{"attr_name": "COLOUR_GROUP",	"attr_value": "GREEN"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Cobalt Green"},			{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY157","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY157"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "157"},{"attr_name": "COLOUR_GROUP",	"attr_value": "BLUE"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Dark Indigo"},			{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY158","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY158"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "158"},{"attr_name": "COLOUR_GROUP",	"attr_value": "GREEN"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Deep Cobalt Green"},		{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY159","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY159"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "159"},{"attr_name": "COLOUR_GROUP",	"attr_value": "GREEN"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Hooker''s Green"},		{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY160","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY160"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "160"},{"attr_name": "COLOUR_GROUP",	"attr_value": "PURPLE"},	{"attr_name": "COLOUR_NAME",	"attr_value": "Manganese Violet"},		{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY161","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY161"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "161"},{"attr_name": "COLOUR_GROUP",	"attr_value": "GREEN"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Phthalo Green"},			{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY163","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY163"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "163"},{"attr_name": "COLOUR_GROUP",	"attr_value": "GREEN"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Emerald Green"},			{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "TIN24"}]},
{"item_key_value": "POLY165","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY165"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "165"},{"attr_name": "COLOUR_GROUP",	"attr_value": "GREEN"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Juniper Green"},			{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY166","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY166"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "166"},{"attr_name": "COLOUR_GROUP",	"attr_value": "GREEN"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Grass Green"},			{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY168","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY168"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "168"},{"attr_name": "COLOUR_GROUP",	"attr_value": "GREEN"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Earth Green Yellowish"},	{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "TIN24"}]},
{"item_key_value": "POLY171","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY171"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "171"},{"attr_name": "COLOUR_GROUP",	"attr_value": "GREEN"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Light Green"},			{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "TIN24"}]},
{"item_key_value": "POLY172","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY172"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "172"},{"attr_name": "COLOUR_GROUP",	"attr_value": "GREEN"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Earth Green"},			{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY173","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY173"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "173"},{"attr_name": "COLOUR_GROUP",	"attr_value": "GREEN"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Olive Green Yellowish"},	{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY174","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY174"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "174"},{"attr_name": "COLOUR_GROUP",	"attr_value": "GREEN"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Chromium Green Opaque"},	{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY176","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY176"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "176"},{"attr_name": "COLOUR_GROUP",	"attr_value": "BROWN"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Van Dyck Brown"},		{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY177","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY177"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "177"},{"attr_name": "COLOUR_GROUP",	"attr_value": "BROWN"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Walnut Brown"},			{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "TIN24"}]},
{"item_key_value": "POLY180","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY180"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "180"},{"attr_name": "COLOUR_GROUP",	"attr_value": "BROWN"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Raw Umber"},				{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "TIN24"}]},
{"item_key_value": "POLY184","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY184"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "184"},{"attr_name": "COLOUR_GROUP",	"attr_value": "ORANGE"},	{"attr_name": "COLOUR_NAME",	"attr_value": "Dark Naples Ochre"},		{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY185","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY185"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "185"},{"attr_name": "COLOUR_GROUP",	"attr_value": "YELLOW"},	{"attr_name": "COLOUR_NAME",	"attr_value": "Naples Yellow"},			{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY187","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY187"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "187"},{"attr_name": "COLOUR_GROUP",	"attr_value": "YELLOW"},	{"attr_name": "COLOUR_NAME",	"attr_value": "Burnt Ochre"},			{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "TIN24"}]},
{"item_key_value": "POLY189","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY189"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "189"},{"attr_name": "COLOUR_GROUP",	"attr_value": "BROWN"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Cinnamon"},				{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY190","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY190"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "190"},{"attr_name": "COLOUR_GROUP",	"attr_value": "RED"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Venetian Red"},			{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "TIN24"}]},
{"item_key_value": "POLY191","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY191"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "191"},{"attr_name": "COLOUR_GROUP",	"attr_value": "RED"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Pompeian Red"},			{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY194","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY194"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "194"},{"attr_name": "COLOUR_GROUP",	"attr_value": "RED"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Red-Violet"},			{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY199","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY199"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "199"},{"attr_name": "COLOUR_GROUP",	"attr_value": "BLACK"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Black"},					{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "TIN24"}]},
{"item_key_value": "POLY205","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY205"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "205"},{"attr_name": "COLOUR_GROUP",	"attr_value": "YELLOW"},	{"attr_name": "COLOUR_NAME",	"attr_value": "Cadmium Yellow Lemon"},	{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY217","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY217"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "217"},{"attr_name": "COLOUR_GROUP",	"attr_value": "RED"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Middle Cadmium Red"},	{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY219","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY219"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "219"},{"attr_name": "COLOUR_GROUP",	"attr_value": "RED"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Deep Scarlet Red"},		{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "TIN24"}]},
{"item_key_value": "POLY223","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY223"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "223"},{"attr_name": "COLOUR_GROUP",	"attr_value": "RED"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Deep Red"},				{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY225","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY225"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "225"},{"attr_name": "COLOUR_GROUP",	"attr_value": "RED"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Dark Red"},				{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "TIN24"}]},
{"item_key_value": "POLY231","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY231"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "231"},{"attr_name": "COLOUR_GROUP",	"attr_value": "GREY"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Cold Grey II"},			{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY233","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY233"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "233"},{"attr_name": "COLOUR_GROUP",	"attr_value": "GREY"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Cold Grey IV"},			{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY246","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY246"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "246"},{"attr_name": "COLOUR_GROUP",	"attr_value": "BLUE"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Prussian Blue"},			{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY247","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY247"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "247"},{"attr_name": "COLOUR_GROUP",	"attr_value": "BLUE"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Indanthrene Blue"},		{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY249","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY249"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "249"},{"attr_name": "COLOUR_GROUP",	"attr_value": "PURPLE"},	{"attr_name": "COLOUR_NAME",	"attr_value": "Mauve"},					{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY264","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY264"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "264"},{"attr_name": "COLOUR_GROUP",	"attr_value": "GREEN"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Dark Phthalo Green"},	{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "TIN24"}]},
{"item_key_value": "POLY266","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY266"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "266"},{"attr_name": "COLOUR_GROUP",	"attr_value": "GREEN"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Permanent Green"},		{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY267","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY267"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "267"},{"attr_name": "COLOUR_GROUP",	"attr_value": "GREEN"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Pine Green"},			{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY268","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY268"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "268"},{"attr_name": "COLOUR_GROUP",	"attr_value": "GREEN"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Green Gold"},			{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]},
{"item_key_value": "POLY271","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY271"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "271"},{"attr_name": "COLOUR_GROUP",	"attr_value": "GREY"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Warm Grey II"},			{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "TIN24"}]},
{"item_key_value": "POLY274","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY274"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "274"},{"attr_name": "COLOUR_GROUP",	"attr_value": "GREY"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Warm Grey V"},			{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "TIN24"}]},
{"item_key_value": "POLY283","item_attribute": [{"attr_name": "KEY_VALUE",	"attr_value": "POLY283"},{"attr_name": "COLOUR_NUMBER",	"attr_value": "283"},{"attr_name": "COLOUR_GROUP",	"attr_value": "BROWN"},		{"attr_name": "COLOUR_NAME",	"attr_value": "Burnt Siena"},			{"attr_name": "LENGTH",	"attr_value": "162"}, {"attr_name": "LOCATION",	"attr_value": "LOOSE"}]}
]}]';
--select @json_data
EXEC COLLECTION.c_collection_item @json_data, 0, 1