private ["_pos","_deploy","_position","_sign"];
closeDialog 106;
if (dayz_combat == 1) exitwith { cutText ["\n\nYou are in combat and cannot perform that action!", "PLAIN DOWN"] };
if !(isNil "VehicleBuild") exitWith {cutText ["\n\nYou can only deploy one vehicle per sever cycle!","PLAIN DOWN"]};

_pos = (getPosATL player);
_dir = (getDir player);
_position = [(_pos select 0)+2*sin(_dir),(_pos select 1)+2*cos(_dir),0];
_sign = "Sign_arrow_down_large_EP1" createVehicleLocal _position;

player playActionNow "Medic";
r_interrupt = false;

[player,"repair",0,false,10] call dayz_zombieSpeak;
[player,10,true,(getPosATL player)] spawn player_alertZombies;

sleep 6;

_deploy = "MMT_Civ" createVehicle _position;
_deploy setPosATL _position;
deleteVehicle _sign;

_deploy setVariable ["ObjectID",str(random 10000),true];
_deploy setVariable ["ObjectUID",str(random 1000000),true];
_deploy setVariable ["Deploy",true,true];
clearWeaponCargoGlobal _deploy;
clearMagazineCargoGlobal _deploy;
_deploy setVehicleAmmo 0;
player reveal _deploy;

cutText ["\n\nYou've built a vehicle!", "PLAIN DOWN"];

player switchMove "";
player playActionNow "stop";

player removeWeapon "ItemToolbox";
VehicleBuild = true;

sleep 15;
cutText ["\n\nWARNING: This vehicle will disappear on server restart!","PLAIN DOWN"];

