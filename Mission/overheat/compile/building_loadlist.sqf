/*** Created by 0verHeaT ***/
private ["_index","_category","_cfgBuildingCategory","_class","_name","_type","_description","_buy","_sell","_data","_item_list","_offset"];
BuildingItemList = -1;
_index = _this select 0;
if ((_index < 0) || (CurrentCatIndex == _index)) exitWith {};
CurrentCatIndex = _index;
_category = BuildingsCatList select _index;

lbClear 72001;
ctrlSetText [72002, ""];
ctrlSetText [72003, ""];

_cfgBuildingCategory = (missionConfigFile >> "CfgBuildingCategory" >> _category);

PlayerBuildingMenuResult = [];
for "_i" from 0 to ((count _cfgBuildingCategory) - 1) do {
	_class = configName(_cfgBuildingCategory select _i);
	_name = getText((_cfgBuildingCategory select _i) >> "name");	
	_type  = getText((_cfgBuildingCategory select _i) >> "type");	
	_description = getText((_cfgBuildingCategory select _i) >> "description");
	_offset = getArray((_cfgBuildingCategory select _i) >> "offset");
	_buy  = getArray((_cfgBuildingCategory select _i) >> "buy");	
	_sell = getArray((_cfgBuildingCategory select _i) >> "sell");

	_data = [[_class,_name,_description],_buy,_sell,_type,_offset];
	PlayerBuildingMenuResult set [count PlayerBuildingMenuResult, _data];
}; 
lbClear 72001;

_item_list = [];
{
	private ["_item","_class","_name","_buy","_sell","_type","_index","_image","_description","_isVehicle","_offset"];
	_item = _x select 0;
	_class = _item select 0;
	_name = _item select 1;
	_description = _item select 2;
	_buy = _x select 1;
	_sell = _x select 2;
	_type = _x select 3;
	_offset = _x select 4;
	if (_type == "CfgVehicles") then {_isVehicle = true;} else {_isVehicle = false;};
	_index = lbAdd [72001, format["%1 (%2)",_name,_class]];
	_nobject = nearestObjects [(getPosATL player),[_class],5];
	if ((count _nobject) >= 1) then {
		lbSetColor [72001,_index,[0,1,0,1]];
	};
	if (isClass(configFile >> _type >> _class >> "picture")) then {
		_image = getText(configFile >> _type >> _class >> "picture");
	} else {
		_image = '';
	};
	lbSetPicture [72001,_index,_image];
	_item_list set [count _item_list,[[_class,_name,_description,_image],_buy,_sell,_type,_isVehicle,_offset]];
} forEach PlayerBuildingMenuResult;
BuildingItemList = _item_list;