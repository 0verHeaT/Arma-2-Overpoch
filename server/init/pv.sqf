"PVDZE_bank_Save" addPublicVariableEventHandler 
{
	_playerObj = ((_this select 1) select 0);
	_playerID = getPlayerUID _playerObj;
	_bankMoney = _playerObj getVariable ["bankMoney",0];
	
	if(_playerID != "") then 
	{
		_key = format["CHILD:299:%1:%2:",_playerID,_bankMoney];
		[_key,""+server_var+"HIVE"] call server_hiveReadWrite;
	};
};

"PVDZE_donator" addPublicVariableEventHandler 
{
	private ["_type","_object","_loottype","_wpn","_mag","_bp","_inventory","_objectID","_uid","_key"];
	_type = (_this select 1) select 0;
	_object = (_this select 1) select 1;
	_loottype = (_this select 1) select 2;
	_wpn = [];_mag = [];_bp = [];
	if (_loottype == 1) then 
	{
		_wpn = [['ItemSledge','ItemKeyKit','ItemToolbox','ItemEtool','ItemCrowbar'],[1,1,4,2,2]];
		_mag = 
		[
			[
				'PartPlywoodPack','PartPlankPack','sun_shade_kit','bulk_PartGeneric','bulk_ItemTankTrap',
				'bulk_ItemSodaPepsi','bulk_FoodbaconCooked','forest_large_net_kit','CinderBlocks','MortarBucket','workbench_kit','ItemFireBarrel_kit'
			],
			[6,12,2,2,2,4,4,1,32,8,2,2]
		];
		_bp = [['DZ_Backpack_EP1'],[1]];
	};

	_object setVariable["WeaponCargo",_wpn,true];
	_object setVariable["MagazineCargo",_mag,true];
	_object setVariable["BackpackCargo",_bp,true];

	_inventory = [_wpn,_mag,_bp];
	_objectID = _object getVariable ["ObjectID","0"];
	_uid = _object getVariable ["ObjectUID","0"];
	
	if (_objectID == "0") then 
	{
		_key = format["CHILD:309:%1:%2:",_uid,_inventory];
	} 
	else 
	{
		_key = format["CHILD:303:%1:%2:",_objectID,_inventory];
	};
	[_key,""+server_var+"HIVE"] call server_hiveWrite;
};

[] spawn 
{
	while {1 == 1} do 
	{
		waitUntil {!isNil "currentInvites"};
		_currentInvites = str(currentInvites);
		publicVariable "currentInvites";
		waitUntil {(_currentInvites) != str(currentInvites)};
	};
};

PV_DeathBoard = [];
publicVariable "PV_DeathBoard";

currentInvites = [];
publicVariable "currentInvites";

PV_weather = floor(random 10);
publicVariable "PV_weather";

publicVariable "VGServerStats";

twp_loadGear = compile preprocessFileLineNumbers "\z\addons\dayz_server\TradeWithPlayers\twp_loadGear.sqf"; publicVariable "twp_loadGear";
twp_loadItems = compile preprocessFileLineNumbers "\z\addons\dayz_server\TradeWithPlayers\twp_loadItems.sqf"; publicVariable "twp_loadItems";
twp_loadTargetItems = compile preprocessFileLineNumbers "\z\addons\dayz_server\TradeWithPlayers\twp_loadTargetItems.sqf"; publicVariable "twp_loadTargetItems";
twp_remove = compile preprocessFileLineNumbers "\z\addons\dayz_server\TradeWithPlayers\twp_remove.sqf"; publicVariable "twp_remove";
twp_showInfo = compile preprocessFileLineNumbers "\z\addons\dayz_server\TradeWithPlayers\twp_showInfo.sqf"; publicVariable "twp_showInfo";
twp_init = compile preprocessFileLineNumbers "\z\addons\dayz_server\TradeWithPlayers\twp_init.sqf"; publicVariable "twp_init";
twp_add = compile preprocessFileLineNumbers "\z\addons\dayz_server\TradeWithPlayers\twp_add.sqf"; publicVariable "twp_add";
twp_buy = compile preprocessFileLineNumbers "\z\addons\dayz_server\TradeWithPlayers\twp_buy.sqf"; publicVariable "twp_buy";