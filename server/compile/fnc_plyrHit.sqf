private ["_victim","_killer","_damage","_vehicle","_weapon_dmg","_weapon_img","_distance"];
_victim = _this select 0;
_killer = _this select 1;
_damage = _this select 2;

if (!(_victim isKindOf "Man") || !(_killer isKindOf "Man")) exitWith {};
if (!(isPlayer _victim) && !(isPlayer _killer)) exitWith {};

_vehicle = typeOf (vehicle _killer); 
if ((getText (configFile >> "CfgVehicles" >> _vehicle >> "vehicleClass")) in ["CarW","Car","CarD","Armored","Ship","Support","Air","ArmouredW","ArmouredD","SupportWoodland_ACR"]) then {
	_weapon_dmg = _vehicle;
	_weapon_img = gettext(configFile >> 'CfgVehicles' >> _vehicle >> 'picture');
} else {
	_weapon_dmg = (currentWeapon _killer);
	_weapon_img = gettext(configFile >> 'cfgWeapons' >> (currentWeapon _killer) >> 'picture');
};
_distance = _victim distance _killer;

if (isPlayer _victim) then {
	if (isPlayer _killer) then {
		_victim setVariable["CollisonKilled",[[_victim,name _victim],[_killer,name _killer],_weapon_dmg,_weapon_img,_distance,serverTime,true],true];
	} else {
		_victim setVariable["CollisonKilled",[[_victim,name _victim],["NPC","NPC"],_weapon_dmg,_weapon_img,_distance,serverTime,false],true];
	};
} else {
	if (isPlayer _killer) then {
		_victim setVariable["CollisonKilled",[["NPC","NPC"],[_killer,name _killer],_weapon_dmg,_weapon_img,_distance,serverTime,false],true];
	};
};