/*** Created by 0verHeaT ***/
private ["_index"];
_index = _this select 0;
if (_index < 0) exitWith {cutText ["\n\nNo item selected!","PLAIN DOWN"];};
_item = BuildingItemList select _index;
[((_item select 0) select 0),((_item select 0) select 1),(_item select 1),"buy",(_item select 4),(_item select 5)] spawn player_tradebuildings;
BuildingItemList = -1;