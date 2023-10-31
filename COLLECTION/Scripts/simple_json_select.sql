declare @p_json CORE.JSON
set @p_json = N'
{
	"items": [
		{"map_number": "193"},
		{"map_number": "208"},
		{"map_number": "209"},
		{"map_number": "392"}
	]
}
';

WITH w_list AS (
	select 
		i.map_number map_number
	FROM OPENJSON (@p_json)
	WITH
	(
		items CORE.JSON AS json
	) c
	CROSS APPLY OPENJSON (c.items)
	WITH
	(
		map_number varchar(20)
	) i
)
--select * from w_list

select 
	v.* 
from 
	COLLECTION.v_base_OS_EXPLORER v 
	inner join w_list w
	on v.map_number = w.map_number

