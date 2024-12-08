USE Collections
GO

DECLARE @insert CORE.item_list,
		@json_data CORE.json

SET @json_data = N'[{  
	"parent_collection": "OS LANDRANGER",
	"item":[
		{"item_key_value": "LR0971987",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR0971987"},
				{"attr_name": "map_number",	"attr_value": "97"},
				{"attr_name": "map_title",	"attr_value": "Kendal to Morecambe"},
				{"attr_name": "publish_date", "attr_value": "1987"},
				{"attr_name": "main_settlements", "attr_value": "Kendal|Morecambe|Lancaster"}]},
		{"item_key_value": "LR0521989",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR0521989"},
				{"attr_name": "map_number",	"attr_value": "52"},
				{"attr_name": "map_title",	"attr_value": "Pitlochry to Crieff"},
				{"attr_name": "publish_date", "attr_value": "1989"},
				{"attr_name": "main_settlements", "attr_value": "Pitlochry|Aberfeldy"}]},
		{"item_key_value": "LR0501989",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR0501989"},
				{"attr_name": "map_number",	"attr_value": "50"},
				{"attr_name": "map_title",	"attr_value": "Glen Orchy and Surrounding Area"},
				{"attr_name": "publish_date", "attr_value": "1989"},
				{"attr_name": "main_settlements", "attr_value": "Glen Orchy"}]},
		{"item_key_value": "LR0161976",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR0161976"},
				{"attr_name": "map_number",	"attr_value": "16"},
				{"attr_name": "map_title",	"attr_value": "Lairg and Loch Shin"},
				{"attr_name": "publish_date", "attr_value": "1976"},
				{"attr_name": "main_settlements", "attr_value": "Lairg|Loch Shin"}]},
		{"item_key_value": "LR0101988",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR0101988"},
				{"attr_name": "map_number",	"attr_value": "10"},
				{"attr_name": "map_title",	"attr_value": "Strathnaver"},
				{"attr_name": "publish_date", "attr_value": "1988"},
				{"attr_name": "main_settlements", "attr_value": "Strathnaver"}]},
		{"item_key_value": "LR0241985",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR0241985"},
				{"attr_name": "map_number",	"attr_value": "24"},
				{"attr_name": "map_title",	"attr_value": "Raasay, Applecross and Loch Torridon"},
				{"attr_name": "publish_date", "attr_value": "1985"},
				{"attr_name": "main_settlements", "attr_value": "Raasay|Loch Torridon"}]},
		{"item_key_value": "LR0251988",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR0251988"},
				{"attr_name": "map_number",	"attr_value": "25"},
				{"attr_name": "map_title",	"attr_value": "Glen Carron and Surrounding Area"},
				{"attr_name": "publish_date", "attr_value": "1988"},
				{"attr_name": "main_settlements", "attr_value": "Glen Carron"}]},
		{"item_key_value": "LR1561981",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1561981"},
				{"attr_name": "map_number",	"attr_value": "156"},
				{"attr_name": "map_title",	"attr_value": "Saxmundham and Aldeburgh"},
				{"attr_name": "publish_date", "attr_value": "1981"},
				{"attr_name": "main_settlements", "attr_value": "Saxmundham|Aldeburgh|Southwold|Beccles|Halesworth|Bungay"}]},
		{"item_key_value": "LR0091984",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR0091984"},
				{"attr_name": "map_number",	"attr_value": "9"},
				{"attr_name": "map_title",	"attr_value": "Cape Wrath"},
				{"attr_name": "publish_date", "attr_value": "1984"},
				{"attr_name": "main_settlements", "attr_value": "Cape Wrath|Ben Hope|Foinaven"}]},
		{"item_key_value": "LR1971984",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1971984"},
				{"attr_name": "map_number",	"attr_value": "197"},
				{"attr_name": "map_title",	"attr_value": "Chichester and The Downs"},
				{"attr_name": "publish_date", "attr_value": "1984"},
				{"attr_name": "main_settlements", "attr_value": "Chichester|Bognor Regis|Petersfield|Midhurst"}]},
		{"item_key_value": "LR1771982",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1771982"},
				{"attr_name": "map_number",	"attr_value": "177"},
				{"attr_name": "map_title",	"attr_value": "East London"},
				{"attr_name": "publish_date", "attr_value": "1982"},
				{"attr_name": "main_settlements", "attr_value": "Greenwich|Lewisham|Dartford|Gravesend|Barking|Hackney|Havering|Brentwood|Enfield|Croydon"}]},
		{"item_key_value": "LR1761981",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1761981"},
				{"attr_name": "map_number",	"attr_value": "176"},
				{"attr_name": "map_title",	"attr_value": "West London"},
				{"attr_name": "publish_date", "attr_value": "1981"},
				{"attr_name": "main_settlements", "attr_value": "Hammersmith|Hounslow|Harrow|Kingston upon Thames|Staines|Lambeth|Slough|Barnet|Islington|Watford"}]},
		{"item_key_value": "LR1291996",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1291996"},
				{"attr_name": "map_number",	"attr_value": "129"},
				{"attr_name": "map_title",	"attr_value": "Nottingham and Loughborough Area"},
				{"attr_name": "publish_date", "attr_value": "1996"},
				{"attr_name": "main_settlements", "attr_value": "Nottingham|Loughborough|Melton Mowbray"}]},
		{"item_key_value": "LR1292004",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1292004"},
				{"attr_name": "map_number",	"attr_value": "129"},
				{"attr_name": "map_title",	"attr_value": "Nottingham and Loughborough"},
				{"attr_name": "publish_date", "attr_value": "2004"},
				{"attr_name": "main_settlements", "attr_value": "Nottingham|Loughborough|Melton Mowbray"}]},
		{"item_key_value": "LR1411996",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1411996"},
				{"attr_name": "map_number",	"attr_value": "141"},
				{"attr_name": "map_title",	"attr_value": "Kettering, Corby and Surrounding Area"},
				{"attr_name": "publish_date", "attr_value": "1996"},
				{"attr_name": "main_settlements", "attr_value": "Kettering|Corby|Market Harborough"}]},
		{"item_key_value": "LR1132001",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1132001"},
				{"attr_name": "map_number",	"attr_value": "113"},
				{"attr_name": "map_title",	"attr_value": "Grimsby, Louth and Market Rasen"},
				{"attr_name": "publish_date", "attr_value": "2001"},
				{"attr_name": "main_settlements", "attr_value": "Grimsby|Louth|Market Rasen"}]},
		{"item_key_value": "LR1151986",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1151986"},
				{"attr_name": "map_number",	"attr_value": "115"},
				{"attr_name": "map_title",	"attr_value": "Snowdon and Surrounding Area (Yr Wyddfa)"},
				{"attr_name": "publish_date", "attr_value": "1986"},
				{"attr_name": "main_settlements", "attr_value": "Snowdon|Caernarfon|Bangor|Llandudno"}]},
		{"item_key_value": "LR1791982",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1791982"},
				{"attr_name": "map_number",	"attr_value": "179"},
				{"attr_name": "map_title",	"attr_value": "Canterbury and East Kent"},
				{"attr_name": "publish_date", "attr_value": "1982"},
				{"attr_name": "main_settlements", "attr_value": "Canterbury|Margate|Ramsgate|Deal|Dover|Folkestone|Herne Bay|Whitstable"}]},
		{"item_key_value": "LR1611980",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1611980"},
				{"attr_name": "map_number",	"attr_value": "161"},
				{"attr_name": "map_title",	"attr_value": "Abergavenney and The Black Moutains"},
				{"attr_name": "publish_date", "attr_value": "1980"},
				{"attr_name": "main_settlements", "attr_value": "Abergavenny|Ebbw Vale|Black Mountains"}]},
		{"item_key_value": "LR1681980",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1681980"},
				{"attr_name": "map_number",	"attr_value": "168"},
				{"attr_name": "map_title",	"attr_value": "Colchester and The Blackwater"},
				{"attr_name": "publish_date", "attr_value": "1980"},
				{"attr_name": "main_settlements", "attr_value": "Colchester|Clacton-on-Sea"}]},
		{"item_key_value": "LR1651981",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1651981"},
				{"attr_name": "map_number",	"attr_value": "165"},
				{"attr_name": "map_title",	"attr_value": "Aylesbury and Leighton Buzzard"},
				{"attr_name": "publish_date", "attr_value": "1981"},
				{"attr_name": "main_settlements", "attr_value": "Aylesbury|Leighton Buzzard|Bletchley|Buckingham|Thame"}]},
		{"item_key_value": "LR1781981",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1781981"},
				{"attr_name": "map_number",	"attr_value": "178"},
				{"attr_name": "map_title",	"attr_value": "The Thames Estuary"},
				{"attr_name": "publish_date", "attr_value": "1981"},
				{"attr_name": "main_settlements", "attr_value": "Southend-on-Sea|Basildon|Rochester|Gillingham|Chatham|Maidstone|Sittingbourne"}]},
		{"item_key_value": "LR1731981",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1731981"},
				{"attr_name": "map_number",	"attr_value": "173"},
				{"attr_name": "map_title",	"attr_value": "Swindon and Devizes"},
				{"attr_name": "publish_date", "attr_value": "1981"},
				{"attr_name": "main_settlements", "attr_value": "Swindon|Devizes|Malmesbury|Marlborough"}]},
		{"item_key_value": "LR1191986",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1191986"},
				{"attr_name": "map_number",	"attr_value": "119"},
				{"attr_name": "map_title",	"attr_value": "Buxton, Matlock and Dove Dale Area"},
				{"attr_name": "publish_date", "attr_value": "1986"},
				{"attr_name": "main_settlements", "attr_value": "Matlock|Buxton|Bakewell|Ashbourne"}]},
		{"item_key_value": "LR1191995",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1191995"},
				{"attr_name": "map_number",	"attr_value": "119"},
				{"attr_name": "map_title",	"attr_value": "Buxton, Matlock and Dove Dale Area"},
				{"attr_name": "publish_date", "attr_value": "1995"},
				{"attr_name": "main_settlements", "attr_value": "Matlock|Buxton|Bakewell|Ashbourne"}]},
		{"item_key_value": "LR1111994",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1111994"},
				{"attr_name": "map_number",	"attr_value": "111"},
				{"attr_name": "map_title",	"attr_value": "Sheffield and Doncaster Area"},
				{"attr_name": "publish_date", "attr_value": "1994"},
				{"attr_name": "main_settlements", "attr_value": "Sheffield|Doncaster|Rotherham|Barnsley"}]},
		{"item_key_value": "LR0331984",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR0331984"},
				{"attr_name": "map_number",	"attr_value": "33"},
				{"attr_name": "map_title",	"attr_value": "Loch Alsh, Glen Shiel and Surrounding Area"},
				{"attr_name": "publish_date", "attr_value": "1984"},
				{"attr_name": "main_settlements", "attr_value": "Loch Alsh|Glen Shiel"}]},
		{"item_key_value": "LR1211994",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1211994"},
				{"attr_name": "map_number",	"attr_value": "121"},
				{"attr_name": "map_title",	"attr_value": "Lincoln and Surrounding Area"},
				{"attr_name": "publish_date", "attr_value": "1994"},
				{"attr_name": "main_settlements", "attr_value": "Lincoln|Gainsborough|Market Rasen|Newark-on-Trent"}]},
		{"item_key_value": "LR1211999",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1211999"},
				{"attr_name": "map_number",	"attr_value": "121"},
				{"attr_name": "map_title",	"attr_value": "Lincoln and Newark-on-Trent"},
				{"attr_name": "publish_date", "attr_value": "1999"},
				{"attr_name": "main_settlements", "attr_value": "Lincoln|Gainsborough|Market Rasen|Newark-on-Trent"}]},
		{"item_key_value": "LR1081988",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1081988"},
				{"attr_name": "map_number",	"attr_value": "108"},
				{"attr_name": "map_title",	"attr_value": "Liverpool and Surrounding Area"},
				{"attr_name": "publish_date", "attr_value": "1988"},
				{"attr_name": "main_settlements", "attr_value": "Liverpool|Southport|Birkenhead|St Helens|Skelmersdale|Wigan|Ormskirk|Runcorn"}]},
		{"item_key_value": "LR1281987",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1281987"},
				{"attr_name": "map_number",	"attr_value": "128"},
				{"attr_name": "map_title",	"attr_value": "Derby and Burton upon Trent Area"},
				{"attr_name": "publish_date", "attr_value": "1987"},
				{"attr_name": "main_settlements", "attr_value": "Derby|Burton upon Trent|Rugeley|Uttoxeter|Lichfield"}]},
		{"item_key_value": "LR1131992",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1131992"},
				{"attr_name": "map_number",	"attr_value": "113"},
				{"attr_name": "map_title",	"attr_value": "Grimsby and Surrounding Area"},
				{"attr_name": "publish_date", "attr_value": "1992"},
				{"attr_name": "main_settlements", "attr_value": "Grimsby|Cleethorpes|Louth|Immingham|Market Rasen"}]},
		{"item_key_value": "LR1311996",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1311996"},
				{"attr_name": "map_number",	"attr_value": "131"},
				{"attr_name": "map_title",	"attr_value": "Boston and Spalding Area"},
				{"attr_name": "publish_date", "attr_value": "1996"},
				{"attr_name": "main_settlements", "attr_value": "Boston|Spalding|Holbeach"}]},
		{"item_key_value": "LR1801980",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1801980"},
				{"attr_name": "map_number",	"attr_value": "180"},
				{"attr_name": "map_title",	"attr_value": "Barnstaple and Ilfracombe"},
				{"attr_name": "publish_date", "attr_value": "1980"},
				{"attr_name": "main_settlements", "attr_value": "Barnstaple|Ilfracombe|Lynton|Lundy|Bideford|Great Torrington"}]},
		{"item_key_value": "LR1201988",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1201988"},
				{"attr_name": "map_number",	"attr_value": "120"},
				{"attr_name": "map_title",	"attr_value": "Mansfield, Worksop and Surrounding Area"},
				{"attr_name": "publish_date", "attr_value": "1988"},
				{"attr_name": "main_settlements", "attr_value": "Mansfield|Worksop|Bolsover|Retford|Southwell|Kirkby-in-Ashfield|Market Warsop"}]},
		{"item_key_value": "LR1201995",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1201995"},
				{"attr_name": "map_number",	"attr_value": "120"},
				{"attr_name": "map_title",	"attr_value": "Mansfield, Worksop and Surrounding Area"},
				{"attr_name": "publish_date", "attr_value": "1995"},
				{"attr_name": "main_settlements", "attr_value": "Mansfield|Worksop|Bolsover|Retford|Southwell|Kirkby-in-Ashfield|Market Warsop"}]},
		{"item_key_value": "LR1202002",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1202002"},
				{"attr_name": "map_number",	"attr_value": "120"},
				{"attr_name": "map_title",	"attr_value": "Mansfield and Worksop"},
				{"attr_name": "publish_date", "attr_value": "2002"},
				{"attr_name": "main_settlements", "attr_value": "Mansfield|Worksop|Bolsover|Retford|Southwell|Kirkby-in-Ashfield|Market Warsop"}]},
		{"item_key_value": "LR1361974",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1361974"},
				{"attr_name": "map_number",	"attr_value": "136"},
				{"attr_name": "map_title",	"attr_value": "Newtown and LLanidloes"},
				{"attr_name": "publish_date", "attr_value": "1974"},
				{"attr_name": "main_settlements", "attr_value": "Newtown|Llanidloes"}]},
		{"item_key_value": "LR1351974",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1351974"},
				{"attr_name": "map_number",	"attr_value": "135"},
				{"attr_name": "map_title",	"attr_value": "Aberystwyth"},
				{"attr_name": "publish_date", "attr_value": "1974"},
				{"attr_name": "main_settlements", "attr_value": "Aberystwyth|Machynlleth|Devil''s Bridge"}]},
		{"item_key_value": "LR1661984",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1661984"},
				{"attr_name": "map_number",	"attr_value": "166"},
				{"attr_name": "map_title",	"attr_value": "Luton and Hertford"},
				{"attr_name": "publish_date", "attr_value": "1984"},
				{"attr_name": "main_settlements", "attr_value": "Luton|Hertford|Welwyn Garden City|Hitchin|Letchworth|St Albans|Dunstable|Watford|Cheshunt|Hemel Hempstead|Stevenage"}]},
		{"item_key_value": "LR1222002",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1222002"},
				{"attr_name": "map_number",	"attr_value": "122"},
				{"attr_name": "map_title",	"attr_value": "Skegness and Horncastle"},
				{"attr_name": "publish_date", "attr_value": "2002"},
				{"attr_name": "main_settlements", "attr_value": "Skegness|Horncastle|Woodhall Spa|Louth|Mablethorpe|Spilsby"}]},
		{"item_key_value": "LR1441981",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1441981"},
				{"attr_name": "map_number",	"attr_value": "144"},
				{"attr_name": "map_title",	"attr_value": "Thetford and Breckland"},
				{"attr_name": "publish_date", "attr_value": "1981"},
				{"attr_name": "main_settlements", "attr_value": "Thetford|Breckland|Wymondham|Swaffham"}]},
		{"item_key_value": "LR0811984",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR0811984"},
				{"attr_name": "map_number",	"attr_value": "81"},
				{"attr_name": "map_title",	"attr_value": "Alnwick, Morpeth and Surrounding Area"},
				{"attr_name": "publish_date", "attr_value": "1984"},
				{"attr_name": "main_settlements", "attr_value": "Alnwick|Rothbury|Ashington|Morpeth|Bedlington|Blyth"}]},
		{"item_key_value": "LR1121994",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1121994"},
				{"attr_name": "map_number",	"attr_value": "112"},
				{"attr_name": "map_title",	"attr_value": "Scunthorpe and Surrounding Area"},
				{"attr_name": "publish_date", "attr_value": "1994"},
				{"attr_name": "main_settlements", "attr_value": "Scunthorpe|Gainsborough|Barton-upon-Humber|Goole"}]},
		{"item_key_value": "LR1121999",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1121999"},
				{"attr_name": "map_number",	"attr_value": "112"},
				{"attr_name": "map_title",	"attr_value": "Scunthorpe and Gainsborough"},
				{"attr_name": "publish_date", "attr_value": "1999"},
				{"attr_name": "main_settlements", "attr_value": "Scunthorpe|Gainsborough|Barton-upon-Humber|Goole"}]},
		{"item_key_value": "LR1122006",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1122006"},
				{"attr_name": "map_number",	"attr_value": "112"},
				{"attr_name": "map_title",	"attr_value": "Scunthorpe and Gainsborough"},
				{"attr_name": "publish_date", "attr_value": "2006"},
				{"attr_name": "main_settlements", "attr_value": "Scunthorpe|Gainsborough|Barton-upon-Humber|Goole"}]},
		{"item_key_value": "LR1631990",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1631990"},
				{"attr_name": "map_number",	"attr_value": "163"},
				{"attr_name": "map_title",	"attr_value": "Cheltenham and Cirencester Area"},
				{"attr_name": "publish_date", "attr_value": "1990"},
				{"attr_name": "main_settlements", "attr_value": "Cheltenham|Cirencester|Stow-on-the-Wold"}]},
		{"item_key_value": "LR0751991",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR0751991"},
				{"attr_name": "map_number",	"attr_value": "75"},
				{"attr_name": "map_title",	"attr_value": "Berwick-upon-Tweed and Surrounding Area"},
				{"attr_name": "publish_date", "attr_value": "1991"},
				{"attr_name": "main_settlements", "attr_value": "Berwick-upon-Tweed|Holy Island|Farne Islands|Lowick"}]},
		{"item_key_value": "LR1321996",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1321996"},
				{"attr_name": "map_number",	"attr_value": "132"},
				{"attr_name": "map_title",	"attr_value": "North West Norfolk"},
				{"attr_name": "publish_date", "attr_value": "1996"},
				{"attr_name": "main_settlements", "attr_value": "King''s Lynn|Fakenham|Hunstanton|East Dereham"}]},
		{"item_key_value": "LR1171990",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1171990"},
				{"attr_name": "map_number",	"attr_value": "117"},
				{"attr_name": "map_title",	"attr_value": "Chester, Wrexham and Surrounding Area"},
				{"attr_name": "publish_date", "attr_value": "1990"},
				{"attr_name": "main_settlements", "attr_value": "Chester|Wrexham|Ellesmere Port|Mold|Whitchurch"}]},
		{"item_key_value": "LR1042006",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1042006"},
				{"attr_name": "map_number",	"attr_value": "104"},
				{"attr_name": "map_title",	"attr_value": "Leeds and Bradford"},
				{"attr_name": "publish_date", "attr_value": "2006"},
				{"attr_name": "main_settlements", "attr_value": "Leeds|Bradford|Harrogate|Ilkley|Wakefield|Halifax|Keighley|Knaresborough|Dewsbury"}]},
		{"item_key_value": "LR0511993",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR0511993"},
				{"attr_name": "map_number",	"attr_value": "51"},
				{"attr_name": "map_title",	"attr_value": "Loch Tay and Surrounding Area"},
				{"attr_name": "publish_date", "attr_value": "1993"},
				{"attr_name": "main_settlements", "attr_value": "Loch Tay|Loch Rannoch"}]},
		{"item_key_value": "LR1671983",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1671983"},
				{"attr_name": "map_number",	"attr_value": "167"},
				{"attr_name": "map_title",	"attr_value": "Chelmsford and Harlow"},
				{"attr_name": "publish_date", "attr_value": "1983"},
				{"attr_name": "main_settlements", "attr_value": "Chelmsford|Harlow|Bishop''s Stortford|Braintree|Epping"}]},
		{"item_key_value": "LR1101999",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1101999"},
				{"attr_name": "map_number",	"attr_value": "110"},
				{"attr_name": "map_title",	"attr_value": "Sheffield and Huddersfield"},
				{"attr_name": "publish_date", "attr_value": "1999"},
				{"attr_name": "main_settlements", "attr_value": "Sheffield|Huddersfield|Barnsley|Holmfirth|Glossop"}]},
		{"item_key_value": "LR1181979",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1181979"},
				{"attr_name": "map_number",	"attr_value": "118"},
				{"attr_name": "map_title",	"attr_value": "The Potteries"},
				{"attr_name": "publish_date", "attr_value": "1979"},
				{"attr_name": "main_settlements", "attr_value": "Stoke-on-Trent|Newcastle-under-Lyme|Crewe|Macclesfield|Leek|Kidsgrove"}]},
		{"item_key_value": "LR1691981",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1691981"},
				{"attr_name": "map_number",	"attr_value": "169"},
				{"attr_name": "map_title",	"attr_value": "Ipswich and The Naze"},
				{"attr_name": "publish_date", "attr_value": "1981"},
				{"attr_name": "main_settlements", "attr_value": "Ipswich|Clacton-on-Sea|The Naze|Felixstowe|Harwich|Woodbridge"}]}
	]
}]';
select @json_data
EXEC COLLECTION.c_collection_item @json_data, 0, 1