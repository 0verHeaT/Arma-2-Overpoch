/***
	infistar.de Addons
***/

vg_givecoins = {
	{
		if (name _x == _this select 0) then {
			_cash = _x getVariable['cashMoney',0];
			_x setVariable['cashMoney',_cash+100000,true];
			PVDZE_plr_Save = [_x,(magazines _x),true,true] ;
			publicVariableServer "PVDZE_plr_Save";
			hint format['Gave %1 100,000 Gold Coins!',_this select 0];
				
			_sl = format['%1 plus 100,000 Gold Coins to %2',name player,_this select 0];
			PVAH_WriteLogReq = [player,toArray _sl];
			publicVariableServer 'PVAH_WriteLogReq';
		};
	} forEach playableUnits;
};

vg_removecoins = {
	{
		if (name _x == _this select 0) then {
			_x setVariable['cashMoney',0,true];
			PVDZE_plr_Save = [_x,(magazines _x),true,true] ;
			publicVariableServer "PVDZE_plr_Save";
			hint format['Removed all Gold Coins from %1!',_this select 0];
				
			_sl = format['%1 removed all Gold Coins from %2',name player,_this select 0];
			PVAH_WriteLogReq = [player,toArray _sl];
			publicVariableServer 'PVAH_WriteLogReq';
		};
	} forEach playableUnits;
};

vg_bankcoins = {
	{
		if (name _x == _this select 0) then {
			_x setVariable['bankMoney',0,true];
			PVDZE_plr_Save = [_x,(magazines _x),true,true] ;
			publicVariableServer "PVDZE_plr_Save";
			hint format['Removed all Gold Coins (Bank) from %1!',_this select 0];
				
			_sl = format['%1 removed all Gold Coins (Bank) from %2',name player,_this select 0];
			PVAH_WriteLogReq = [player,toArray _sl];
			publicVariableServer 'PVAH_WriteLogReq';
		};
	} forEach playableUnits;
};

vg_box1 = {
	_dir = getDir player;
	_pos = getPosATL player;
	_pos = [(_pos select 0)+2*sin(_dir),(_pos select 1)+2*cos(_dir),(_pos select 2)];
	
	_donorbox = createVehicle ['VaultStorageLocked',_pos,[],0,'CAN_COLLIDE'];
	_donorbox setdir _dir;
	_donorbox setpos _pos;
	
	_combi_1 = floor(random 10);
	_combi_2 = floor(random 10);
	_combi_3 = floor(random 10);
	_combi_4 = floor(random 10);
	
	_combination = format["%1%2%3%4",_combi_1,_combi_2,_combi_3,_combi_4];
	_donorbox setVariable ["CharacterID",_combination,true];
	_donorbox setVariable ["ownerPUID",(getPlayerUID player),true];
	
	PVDZE_obj_Publish = [_combination,_donorbox,[_dir,_pos,(getPlayerUID player)],'VaultStorageLocked'];
	publicVariableServer "PVDZE_obj_Publish";
	
	hint format['Spawned a Donator Vault (Level 1) with code %1.',_combination];
	
	_sl = format['%1: Donator Vault (Level 1) with combination %2',(name player),_combination];
	PVAH_WriteLogReq = [player,_sl];
	publicVariableServer 'PVAH_WriteLogReq';

	PVDZE_donator = ['vault',_donorbox,1];
	publicVariableServer 'PVDZE_donator';
};

vg_box2 = {hint 'Coming Soon!';};

vg_box3 = {hint 'Coming Soon!';};

vg_rndpaint = {
	_name = _this select 0;
	if (_name == "") then {_name = name player;};
	{
		if (name _x == _name) then
		{
			_vehicle = vehicle _x;
			_color = format ['%1,%2,%3,1',((floor(random 10))/10),((floor(random 10))/10),((floor(random 10))/10)];
			_color2 = format ['%1,%2,%3,1',((floor(random 10))/10),((floor(random 10))/10),((floor(random 10))/10)];
			PVDZE_veh_Colour = [_vehicle,_color,_color2];
			publicVariableServer 'PVDZE_veh_Colour';
			
			hint format['Retexturing Vehicle of %1',_name];
			
			_sl = format['%1 Retextured %2(%3)',(name player),_name,(typeOf _vehicle)];
			PVAH_WriteLogReq = [player,toArray _sl];
			publicVariableServer 'PVAH_WriteLogReq';
		};
	} forEach playableUnits;
};

vg_removepaint = {
	_name = _this select 0;
	if (_name == "") then {_name = name player;};
	{
		if (name _x == _name) then
		{
			_vehicle = vehicle _x;
			
			_vehicle setVariable["Colour",'0',true];
			_vehicle setVariable["Colour2",'0',true];
			
			hint format['Removing texture of %1 Vehicle',_name];
			
			_sl = format['%1 removed texture %2(%3)',(name player),_name,(typeOf _vehicle)];
			PVAH_WriteLogReq = [player,toArray _sl];
			publicVariableServer 'PVAH_WriteLogReq';
		};
	} forEach playableUnits;
};
/*
vg_spawn_ai = {
	_dir = getDir player;
	_pos = getPosATL player;
	_pos = [(_pos select 0)+2*sin(_dir),(_pos select 1)+2*cos(_dir),(_pos select 2)];
	_unitGroup = createGroup east;
	_unit = _unitGroup createUnit ['SFSG_wdl_tl', _pos, [], 10, 'PRIVATE'];
	[_unit] joinSilent _unitGroup;
	
	_unit enableAI "TARGET";
	_unit enableAI "AUTOTARGET";
	_unit enableAI "MOVE";
	_unit enableAI "ANIM";
	_unit enableAI "FSM";
	_unit setCombatMode "BLUE";
	_unit setBehaviour "SAFE";
	removeAllWeapons _unit;
	removeAllItems _unit;
	_unit addweapon 'vil_SR25SD';
	for '_i' from 1 to 4 do {_unit addMagazine '20Rnd_762x51_DMR';};
	_unit addBackpack 'DZ_Backpack_EP1';
	{_unit addMagazine _x} forEach ['ItemBandage','ItemBandage','ItemBandage','ItemBandage','ItemPainkiller','15Rnd_9x19_M9SD','15Rnd_9x19_M9SD','15Rnd_9x19_M9SD','15Rnd_9x19_M9SD'];
	{_unit addweapon _x} forEach ['ItemKnife','ItemFlashlight','RH_m9csd'];
	
	hint 'Spawned an AI!';
	
	_sl = format ['%1 Spawned an AI',(name player)];
	PVAH_WriteLogReq = [player,_sl];
	publicVariableServer 'PVAH_WriteLogReq';
};
*/
vg_adminGARAGE =
{
	if !(('ItemGPS' in items player) || ('ItemMap' in items player)) then
	{
		_config = ["ItemGPS"];
		_isOK = [player,_config] call BIS_fnc_invAdd;
	};
	adminGARAGE =
	{
		while {markadGARAGE == 1} do
		{
			ADMIN_GARAGE_LIST = [] + (allMissionObjects "Land_MBG_Garage_Single_A"+allMissionObjects "Land_MBG_Garage_Single_B"+allMissionObjects "Land_MBG_Garage_Single_C"+allMissionObjects "Land_MBG_Garage_Single_D");
			
			if !(markadGARAGE == 1) exitWith {
				for "_i" from 0 to 8888 do {deleteMarkerLocal ("adminGARAGE" + (str _i));};
			};
			for "_i" from 0 to (count ADMIN_GARAGE_LIST)-1 do
			{
				deleteMarkerLocal ("adminGARAGE" + (str _i));
				_selected = ADMIN_GARAGE_LIST select _i;
				_vm = createMarkerLocal [("adminGARAGE" + (str _i)), getPos _selected];
				_vm setMarkerTypeLocal "Camp";
				_vm setMarkerSizeLocal [0.5, 0.5];
				_vm setMarkerTextLocal "GARAGE";
				_vm setMarkerColorLocal ("ColorOrange");
			};
			uiSleep 5;
		};
		for "_i" from 0 to 8888 do {deleteMarkerLocal ("adminGARAGE" + (str _i));};
	};
	if (isNil "markadGARAGE") then {markadGARAGE = 0;};
	if (markadGARAGE == 0) then
	{
		markadGARAGE = 1;
		hint "2D Map GARAGEMarker Activated";
		[] spawn adminGARAGE;
		
		_sl = format["%1 GARAGEMarker Activated",name player];
		PVAH_WriteLogReq = [player,toArray _sl];
		publicVariableServer 'PVAH_WriteLogReq';
	}
	else
	{
		markadGARAGE = 0;
		hint "2D Map GARAGEMarker Disabled";
		
		for "_i" from 0 to 8888 do {deleteMarkerLocal ("adminGARAGE" + (str _i));};
		
		_sl = format["%1 GARAGEMarker Disabled",name player];
		PVAH_WriteLogReq = [player,toArray _sl];
		publicVariableServer 'PVAH_WriteLogReq';
	};
};
vg_adminESPBOX =
{
	if !(('ItemGPS' in items player) || ('ItemMap' in items player)) then
	{
		_config = ["ItemGPS"];
		_isOK = [player,_config] call BIS_fnc_invAdd;
	};
	adminESPBOX =
	{
		while {markadESPBOX == 1} do
		{
			ADMIN_ESPBOX_LIST = nearestObjects [player,["USVehicleBox","RUVehicleBox","TKVehicleBox_EP1","USBasicWeaponsBox","RUBasicWeaponsBox","USSpecialWeaponsBox","USSpecialWeapons_EP1","RUSpecialWeaponsBox","SpecialWeaponsBox","TKSpecialWeapons_EP1","CZBasicWeapons_EP1","UNBasicWeapons_EP1","GuerillaCacheBox","RULaunchersBox","RUBasicAmmunitionBox","RUOrdnanceBox","USBasicAmmunitionBox","USLaunchersBox","USOrdnanceBox","USOrdnanceBox_EP1","USLaunchers_EP1","USBasicWeapons_EP1","USBasicAmmunitionBox_EP1","UNBasicAmmunitionBox_EP1","TKOrdnanceBox_EP1","TKLaunchers_EP1","TKBasicAmmunitionBox_EP1","GuerillaCacheBox_EP1","GERBasicWeapons_EP1"],20000];
			if !(markadESPBOX == 1) exitWith {
				for "_i" from 0 to 8888 do {deleteMarkerLocal ("adminESPBOX" + (str _i));};
			};
			for "_i" from 0 to (count ADMIN_ESPBOX_LIST)-1 do
			{
				deleteMarkerLocal ("adminESPBOX" + (str _i));
				_selected = ADMIN_ESPBOX_LIST select _i;
				_vm = createMarkerLocal [("adminESPBOX" + (str _i)), getPos _selected];
				_vm setMarkerTypeLocal "Camp";
				_vm setMarkerSizeLocal [0.5, 0.5];
				_vm setMarkerTextLocal (typeOf _selected);
				_vm setMarkerColorLocal ("ColorPink");
			};
			uiSleep 5;
		};
		for "_i" from 0 to 8888 do {deleteMarkerLocal ("adminESPBOX" + (str _i));};
	};
	if (isNil "markadESPBOX") then {markadESPBOX = 0;};
	if (markadESPBOX == 0) then
	{
		markadESPBOX = 1;
		hint "2D Map BOXMarker Activated";
		[] spawn adminESPBOX;
		
		_sl = format["%1 BOXMarker Activated",name player];
		PVAH_WriteLogReq = [player,toArray _sl];
		publicVariableServer 'PVAH_WriteLogReq';
	}
	else
	{
		markadESPBOX = 0;
		hint "2D Map BOXMarker Disabled";
		
		for "_i" from 0 to 8888 do {deleteMarkerLocal ("adminESPBOX" + (str _i));};
		
		_sl = format["%1 BOXMarker Disabled",name player];
		PVAH_WriteLogReq = [player,toArray _sl];
		publicVariableServer 'PVAH_WriteLogReq';
	};
};
vg_adminskin = 
{
hint "Unable to find any admin skins.";
/*
	PVDZE_deb = ["adminskin",player];
	publicVariableServer "PVDZE_deb";
	
	hint 'Changed to Adminskin!';
	systemChat "Relog to remove the texture!";

	_sl = format ['%1 Changed to Adminskin!',(name player)];
	PVAH_WriteLogReq = [player,toArray _sl];
	publicVariableServer 'PVAH_WriteLogReq';
*/
};

vg_bm1 = {
	PVDZE_ex_server = [player,'build_base',false,['build_base',0,'box_b_small']];
	publicVariableServer 'PVDZE_ex_server';
	
	hint 'Started a Mission!';

	_sl = format ['%1 started a Mission',(name player)];
	PVAH_WriteLogReq = [player,toArray _sl];
	publicVariableServer 'PVAH_WriteLogReq';
};
vg_bm2 = {
	PVDZE_ex_server = [player,'build_ural',false,['build_ural',0,'box_b_medium']];
	publicVariableServer 'PVDZE_ex_server';
	
	hint 'Started a Mission!';

	_sl = format ['%1 started a Mission',(name player)];
	PVAH_WriteLogReq = [player,toArray _sl];
	publicVariableServer 'PVAH_WriteLogReq';
};
vg_bm3 = {
	PVDZE_ex_server = [player,'build_convoy',false,['build_convoy',0,'box_b_large']];
	publicVariableServer 'PVDZE_ex_server';
	
	hint 'Started a Mission!';

	_sl = format ['%1 started a Mission',(name player)];
	PVAH_WriteLogReq = [player,toArray _sl];
	publicVariableServer 'PVAH_WriteLogReq';
};
vg_gen = {
	PVDZE_ex_server = [player,'general_supplies',false,['general_supplies',0,'box_general']];
	publicVariableServer 'PVDZE_ex_server';
	
	hint 'Started a Mission!';

	_sl = format ['%1 started a Mission',(name player)];
	PVAH_WriteLogReq = [player,toArray _sl];
	publicVariableServer 'PVAH_WriteLogReq';
};
vg_vehar = {
	PVDZE_ex_server = [player,'vehicle_armed',false,['vehicle_armed',0,'']];
	publicVariableServer 'PVDZE_ex_server';
	
	hint 'Started a Mission!';

	_sl = format ['%1 started a Mission',(name player)];
	PVAH_WriteLogReq = [player,toArray _sl];
	publicVariableServer 'PVAH_WriteLogReq';
};
vg_sas = {
	PVDZE_ex_server = [player,'sas_crash',false,['sas_crash',0,'box_chain']];
	publicVariableServer 'PVDZE_ex_server';
	
	hint 'Started a Mission!';

	_sl = format ['%1 started a Mission',(name player)];
	PVAH_WriteLogReq = [player,toArray _sl];
	publicVariableServer 'PVAH_WriteLogReq';
};
vg_wpn = {
	PVDZE_ex_server = [player,'weapon_cache',false,['weapon_cache',0,'box_cache']];
	publicVariableServer 'PVDZE_ex_server';
	
	hint 'Started a Mission!';

	_sl = format ['%1 started a Mission',(name player)];
	PVAH_WriteLogReq = [player,toArray _sl];
	publicVariableServer 'PVAH_WriteLogReq';
};
vg_tre = {
	PVDZE_ex_server = [player,'treasure',false,['treasure',0,'box_treasure']];
	publicVariableServer 'PVDZE_ex_server';
	
	hint 'Started a Mission!';

	_sl = format ['%1 started a Mission',(name player)];
	PVAH_WriteLogReq = [player,toArray _sl];
	publicVariableServer 'PVAH_WriteLogReq';
};
vg_nato = {
	PVDZE_ex_server = [player,'NATO_cache',false,['NATO_cache',0,'box_nato']];
	publicVariableServer 'PVDZE_ex_server';
	
	hint 'Started a Mission!';

	_sl = format ['%1 started a Mission',(name player)];
	PVAH_WriteLogReq = [player,toArray _sl];
	publicVariableServer 'PVAH_WriteLogReq';
};
vg_vehciv = {
	PVDZE_ex_server = [player,'vehicle_civ',false,['vehicle_civ',0,'']];
	publicVariableServer 'PVDZE_ex_server';
	
	hint 'Started a Mission!';

	_sl = format ['%1 started a Mission',(name player)];
	PVAH_WriteLogReq = [player,toArray _sl];
	publicVariableServer 'PVAH_WriteLogReq';
};

vg_cc01 = {//Clear contrast 
	_hndl = ppEffectCreate ["colorCorrections", 1501];
	_hndl ppEffectEnable true;
	_hndl ppEffectAdjust [ 1, 1, 0, [0, 0, 0, -0.31],[1.9, 1.9, 1.73, 0.7],[0.2, 1.1, -1.5, 1.14]];
	_hndl ppEffectCommit 0;
	
	hint 'Changed Color Correction!';

	_sl = format ['%1 Changed Color Correction!',(name player)];
	PVAH_WriteLogReq = [player,toArray _sl];
	publicVariableServer 'PVAH_WriteLogReq';
};
vg_cc04 = {//Sandy
	_hndl = ppEffectCreate ["colorCorrections", 1501];
	_hndl ppEffectEnable true;
	_hndl ppEffectAdjust [ 1, 1, 0, [1.01, -2.46, -1.23, 0],[2.11, 1.6, 0.71, 0.8],[1.43, 0.56, 3.69, 0.31]];
	_hndl ppEffectCommit 0;
	
	hint 'Changed Color Correction!';

	_sl = format ['%1 Changed Color Correction!',(name player)];
	PVAH_WriteLogReq = [player,toArray _sl];
	publicVariableServer 'PVAH_WriteLogReq';
};
vg_cc05 = {//Sumer Chernarus 
	_hndl = ppEffectCreate ["colorCorrections", 1501];
	_hndl ppEffectEnable true;
	_hndl ppEffectAdjust [1,1,0,[0,0,0,0],[2,0,0,1.25],[2.5,-2.5,0,0]];
	_hndl ppEffectCommit 0;
	
	hint 'Changed Color Correction!';

	_sl = format ['%1 Changed Color Correction!',(name player)];
	PVAH_WriteLogReq = [player,toArray _sl];
	publicVariableServer 'PVAH_WriteLogReq';
};
vg_cc06 = {//Tropical
	_hndl = ppEffectCreate ["colorCorrections", 1501];
	_hndl ppEffectEnable true;
	_hndl ppEffectAdjust [ 1, 1, 0.01, [-0.11, -0.65, -0.76, 0.015],[-5, 2.74, 0.09, 0.95],[-1.14, -0.73, 1.14, -0.09]];
	_hndl ppEffectCommit 0;
	
	hint 'Changed Color Correction!';

	_sl = format ['%1 Changed Color Correction!',(name player)];
	PVAH_WriteLogReq = [player,toArray _sl];
	publicVariableServer 'PVAH_WriteLogReq';
};
vg_cc07 = {//WarZone
	_hndl = ppEffectCreate ["colorCorrections", 1501];
	_hndl ppEffectEnable true;
	_hndl ppEffectAdjust [ .079990001, 7, 0.055, [1.320, 1.57, 1.31, -.022],[2.05, 1.8611, 1.62, .6807],[-1.954, 3.95553, 4.898, 5.19]];
	_hndl ppEffectCommit 0;
	
	hint 'Changed Color Correction!';

	_sl = format ['%1 Changed Color Correction!',(name player)];
	PVAH_WriteLogReq = [player,toArray _sl];
	publicVariableServer 'PVAH_WriteLogReq';	
};
vg_cc08 = {//Africa 
	_hndl = ppEffectCreate ["colorCorrections", 1501];
	_hndl ppEffectEnable true;
	_hndl ppEffectAdjust [ 1, 1.3, 0.001, [-0.11, -0.65, -0.76, 0.015],[-5, -1.74, 0.09, 0.86],[-1.14, -0.73, 1.14, -0.09]];
	_hndl ppEffectCommit 0;
	
	hint 'Changed Color Correction!';

	_sl = format ['%1 Changed Color Correction!',(name player)];
	PVAH_WriteLogReq = [player,toArray _sl];
	publicVariableServer 'PVAH_WriteLogReq';	
};
vg_cc09 = { //Movie
	_hndl = ppEffectCreate ["colorCorrections", 1501];
	_hndl ppEffectEnable true;
	_hndl ppEffectAdjust[1,1,0,[0.0,0.0,0.0,0.0],[0.6,0.6,1.8,0.7],[0.199,0.587,0.114,0.0]];
	_hndl ppEffectCommit 0;
	
	hint 'Changed Color Correction!';

	_sl = format ['%1 Changed Color Correction!',(name player)];
	PVAH_WriteLogReq = [player,toArray _sl];
	publicVariableServer 'PVAH_WriteLogReq';	
};
vg_loot_pos = {
	_building = nearestObject [player,"Building"];
	if (isNull _building) exitWith {hint 'No building found!'};
	_relPos = _building worldToModel (getPosATL player);
	_getBuildingName = typeOf _building;

	x = _relPos select 0;
	y = _relPos select 1;
	z = _relPos select 2;

	//hint parsetext format ["<t align='center' size='1.5' color='#FFFFFF'>%4</t><br/><t align='center' color='#FFFFFF'>(%1|%2|%3)</t>",x,y,z,_getBuildingName];
	systemChat format["%4 :: {%1,%2,%3}",x,y,z,_getBuildingName];
	
	PVDZE_deb = [player,(format["%4 :: {%1,%2,%3}",x,y,z,_getBuildingName]),"buildingloot"];
	publicVariableServer "PVDZE_deb";
};
vg_fireinsafe = {
	if (isNil "ocgFireinSafezone") then {ocgFireinSafezone = 0;};
	if (ocgFireinSafezone == 0) then {
		ocgFireinSafezone = 1;
		hint "Gun Fire in Safezone enabled!";
		while {ocgFireinSafezone == 1} do {
			player_fired = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_fired.sqf";
			uiSleep 0.1;
		};
	} else {
		ocgFireinSafezone = 0;
		hint "Gun Fire in Safezone disabled!";
	};
	
	_sl = format["%1 Fire in Safezone %2",name player,ocgFireinSafezone];
	PVAH_WriteLogReq = [player,toArray _sl];
	publicVariableServer 'PVAH_WriteLogReq';
};
vg_sendMsg = 
{
	disableSerialization;
	private ["_display","_chat","_txt"];
	_display = findDisplay 24;
	if (isNull _display) exitWith {cutText ["First open the chat and type in the message you want to send, then try again","PLAIN DOWN"]};
	_chat = _display displayCtrl 101;
	_txt = ctrlText _chat;
	if (_txt == "") exitWith {cutText ["First open the chat and type in the message you want to send, then try again","PLAIN DOWN"]};
	
	PVDZE_deb = ["allmsg",_txt];
	publicVariableServer "PVDZE_deb";
	
	hint format ["Send <%1> to all players!",_txt];
	
	_sl = format ['%1 Send <%2> to all players!',(name player),_txt];
	PVAH_WriteLogReq = [player,toArray _sl];
	publicVariableServer 'PVAH_WriteLogReq';
};
vg_fireworks = {
	_fn_firework = {
		private ["_position", "_type", "_ball", "_smoke1", "_smoke2", "_smoke3", "_dir"];
		_position = _this select 0;
		_dir = _this select 1;
		_position = [(_position select 0)+4*sin(_dir),(_position select 1)+4*cos(_dir),(_position select 2)];
		_type = _this select 2;
		_ball = createVehicle ["Baseball", [0,0,0], [], 0, "CAN_COLLIDE"];
		_smoke1 = createVehicle ["SmokeShell", [0,0,0], [], 0, "CAN_COLLIDE"];
		_smoke2 = createVehicle ["SmokeShell", [0,0,0], [], 0, "CAN_COLLIDE"];
		_smoke3 = createVehicle ["SmokeShell", [0,0,0], [], 0, "CAN_COLLIDE"];
		_smoke1 attachTo [_ball, [0,0,0]];
		_smoke2 attachTo [_ball, [0,0,0]];
		_smoke3 attachTo [_ball, [0,0,0]];
		_ball setPos _position;
		uiSleep 4;
		_ball setVelocity [5 - (random 10),5 - (random 10),50 + (floor random 10)];
		uiSleep 2;
		_position = getPos _ball;
		deleteVehicle _ball;
		deleteVehicle _smoke1;
		deleteVehicle _smoke2;
		deleteVehicle _smoke3;
		[_position, _type] spawn {
			private ["_position", "_type", "_charge"];
			_position = _this select 0;
			_type = _this select 1;
			_charge = _type createVehicle _position;
			_charge setPos _position;
			uiSleep 1;
			deleteVehicle _charge;
		};
	};
	[getPos player,getDir player,"HelicopterExploSmall"] spawn _fn_firework;
	hint 'Started Firework!';
	_sl = format['%1 Started a Firework',name player];
	PVAH_WriteLogReq = [player,toArray _sl];
	publicVariableServer 'PVAH_WriteLogReq';
};
vg_attachsmoke = {
	if (isNil "ocgSmoke") then {ocgSmoke = 0;};
	if (ocgSmoke == 0) then {
		hint "Smoke attached!";
		ocgSmoke = 1;
		while {ocgSmoke == 1} do {
			//_rndsmoke = ["SmokeShell","SmokeShellGreen","SmokeShellRed","SmokeShellYellow","SmokeShellOrange","SmokeShellPurple","SmokeShellBlue"] call BIS_fnc_selectRandom;
			_smoke1 = createVehicle ["SmokeShellBlue",[0,0,0],[],0,"CAN_COLLIDE"];
			_smoke2 = createVehicle ["SmokeShellBlue",[0,0,0],[],0,"CAN_COLLIDE"];
			_smoke3 = createVehicle ["SmokeShellGreen",[0,0,0],[],0,"CAN_COLLIDE"];
			_smoke4 = createVehicle ["SmokeShellYellow",[0,0,0],[],0,"CAN_COLLIDE"];
			_smoke1 attachTo [(vehicle player),[0,0,0]];
			_smoke2 attachTo [(vehicle player),[0,0,0]];
			_smoke3 attachTo [(vehicle player),[0,0,0]];
			_smoke4 attachTo [(vehicle player),[0,0,0]];
			uiSleep 40;
			deleteVehicle _smoke1;
			deleteVehicle _smoke2;
			deleteVehicle _smoke3;
			deleteVehicle _smoke4;
		};
	} else {
		hint "Smoke deleted!";
		ocgSmoke = 0;
	};
	_sl = format["%1 Smoke attached %2",name player,ocgSmoke];
	PVAH_WriteLogReq = [player,toArray _sl];
	publicVariableServer 'PVAH_WriteLogReq';
};