private ["_spawnRoll","_spawnChance","_player", "_markerRadius", "_wait_time", "_start_time", "_position", "_event_marker", "_pos", "_combination", "_eventsafe", "_vault_bplist", "_msg","_inventory","_i","_objectID","_uid"];
_spawnChance = 0.05;
_markerRadius = 500;
_wait_time = 1800;
_start_time = time;

_spawnRoll = random 1;
if (_spawnRoll > _spawnChance) exitWith {};

_position = [getMarkerPos "center",0,(dayz_MapArea * 0.4),10,0,2000,0] call BIS_fnc_findSafePos;
 
_event_marker = createMarker [ format ["loot_event_marker_%1", _start_time], _position];
_event_marker setMarkerShape "ELLIPSE";
_event_marker setMarkerColor "ColorPink";
_event_marker setMarkerAlpha 0.5;
_event_marker setMarkerSize [(_markerRadius + 100), (_markerRadius + 100)];
 
_pos = [_position,0,(_markerRadius - 100),10,0,2000,0] call BIS_fnc_findSafePos;

_eventsafe = createVehicle ['VaultStorageLocked',_pos,[],0,'CAN_COLLIDE'];
	
_combi_1 = floor(random 10);
_combi_2 = floor(random 10);
_combi_3 = floor(random 10);
_combi_4 = floor(random 10);
	
_combination = format["%1%2%3%4",_combi_1,_combi_2,_combi_3,_combi_4];
_eventsafe setVariable ["CharacterID",_combination,true];
_eventsafe setVariable ["ownerPUID","12345678",true];

[_combination,_eventsafe,[(random 360),_pos,"12345678"],"VaultStorageLocked"] call server_publishObj;

_i = floor(random 5);
switch (_i) do 
{
	case 0: 
	{
		_vault_wpnlist = [[],[]];
		_vault_mglist = 
		[
			[
				"ItemObsidian","ItemTopaz","ItemRuby","ItemSapphire","ItemEmerald"
			],
			[1,1,1,1,1,1]
		];
	};
	case 1: {_vault_wpnlist = [["BAF_AS50_scoped"],[1]];_vault_mglist = [["5Rnd_127x99_as50"],[4]];};
	case 2: {_vault_wpnlist = [["USSR_cheytacM200_sd"],[1]];_vault_mglist = [["USSR_5Rnd_408"],[4]];};
	case 4: {_vault_wpnlist = [[],[]];_vault_mglist = [["ItemHotwireKit","ItemCitrine"],[1,2]];};
	case 5: {_vault_wpnlist = [[],[]];_vault_mglist = [["ItemBriefcase_Base","ItemAmathyst"],[1,1]];};
};

_vault_bplist = [['DZ_LargeGunBag_EP1'],[1]];

_eventsafe setVariable["WeaponCargo",_vault_wpnlist,true];
_eventsafe setVariable["MagazineCargo",_vault_mglist,true];
_eventsafe setVariable["BackpackCargo",_vault_bplist,true];

uiSleep 2;

_inventory = [_vault_wpnlist,_vault_mglist,_vault_bplist];
_objectID = _eventsafe getVariable ["ObjectID","0"];
_uid = _eventsafe getVariable ["ObjectUID","0"];
	
if (_objectID == "0") then {
	_key = format["CHILD:309:%1:%2:",_uid,_inventory];
} else {
	_key = format["CHILD:303:%1:%2:",_objectID,_inventory];
};
[_key,""+server_var+"HIVE"] call server_hiveWrite;

diag_log format["SECRET EVENT: Creating Vault at %1 with Combo %2",_pos,_combination];

_msg = format ["
	<br/><t size='0.6' color='#999999' align='left'>[Event] </t>
	<t size='0.6' color='#FF00FF' align='left'>Secret Task</t><br/>
	<t size='0.3' color='#FFFFFF' align='left'>̚</t><br/>
	<t size='0.55' color='#CCCCCC' align='left'>Some VG Admins have set up a secret Vault! Check your Map for the Location. Combination is %1.</t><br/>",
	_combination
];
[[""+server_var+"","all"],"rMsg",_msg] call server_sendremoteExe;

diag_log "SECRET EVENT: Loot event setup, waiting for 1800 seconds";

// Wait
sleep 1800;
 
// Clean up
deleteVehicle _eventsafe;
[_objectID,_uid,"","infistar"] call server_deleteObj;
deleteMarker _event_marker;