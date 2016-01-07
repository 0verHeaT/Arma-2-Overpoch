private ["_search","_istoomany","_pos","_boxtype","_flag","_flag2","_box","_wpnlist","_weapon","_getMag"];
if (dayz_instance == 11) exitWith {};
if ((random 1) > 0.75) exitWith {};

_pos = [[8000,6360,0],0,WAI_MISSION_AREA,50,0,5000,0] call BIS_fnc_findSafePos;

_boxtype = ["GuerillaCacheBox","RULaunchersBox","RUBasicAmmunitionBox","RUOrdnanceBox","USBasicAmmunitionBox","USLaunchersBox","USOrdnanceBox","USOrdnanceBox_EP1","USLaunchers_EP1","USBasicWeapons_EP1","USBasicAmmunitionBox_EP1","UNBasicAmmunitionBox_EP1","TKOrdnanceBox_EP1","TKLaunchers_EP1","TKBasicAmmunitionBox_EP1","GuerillaCacheBox_EP1","GERBasicWeapons_EP1"] call BIS_fnc_selectRandom;

_box = createVehicle [_boxtype,_pos,[],0,"CAN_COLLIDE"];
_box setDir round(random 360);
_box setPos _pos;
_box setVectorUp surfaceNormal _pos;
_box setVariable ["ObjectID","1",true];
_box setVariable ["permaLoot",true];
clearWeaponCargoGlobal _box;clearMagazineCargoGlobal _box;

_flag = createVehicle ["FlagCarrierBIS_EP1",[(_pos select 0) + 2,(_pos select 1) + 2,0],[],0,"CAN_COLLIDE"];
_flag setDir 180;
_flag setPos [(_pos select 0) + 2,(_pos select 1) + 2,0];
_flag setVehicleInit "this setFlagTexture 'overheat\gui\logo.paa';";

_flag2 = createVehicle ["FlagCarrierBIS_EP1",[(_pos select 0) - 2,(_pos select 1) - 2,0],[],0,"CAN_COLLIDE"];
_flag2 setDir 360;
_flag2 setPos [(_pos select 0) - 2,(_pos select 1) - 2,0];
_flag2 setVehicleInit "this setFlagTexture 'overheat\gui\logo.paa';";

processInitCommands;

_wpnlist = ["RH_hk417sdsp","vil_SR25SD","vil_M110sd","RH_m1stsp","DMR_DZ","USSR_cheytacM200","FHQ_MSR_SD_DESERT","FHQ_XM2010_SD_DESERT","vil_Mg3","KSVK_DZE","BAF_LRR_scoped"];
_weapon = _wpnlist call BIS_fnc_selectRandom;

_getMag = 
{
	private ["_mags","_mag"];
	_mags = getArray (configFile >> "CfgWeapons" >> _this >> "magazines");
	_mag = _mags select 0;
	_mag
};

_box addWeaponCargoGlobal [_weapon,1];
_box addMagazineCargoGlobal [(_weapon call _getMag),4];

diag_log format ["EVENT: Created a weapon rearm drop %1 on %2 @%3",_boxtype,_pos,mapGridposition _pos];

[_pos] spawn 
{
	while {true} do
	{
		private ["_smoke","_close"];
		_smoke = "SmokeShellRed" createVehicle (_this select 0);
		_close = (_this select 0) nearEntities ["CAManBase",15];
		if ((count _close) > 0) exitWith {};
		uiSleep 30;
		deleteVehicle _smoke;
	};
};