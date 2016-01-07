private ["_charID","_playerPos","_playerGear","_playerBackp","_medical","_currentWpn","_currentAnim","_config","_onLadder","_isTerminal","_currentModel","_muzzles","_temp","_currentState","_key"];
_charID = _this select 0;

if ((_charID == "0") || (isNull player) || (getPlayerUID player == "") || !(isPlayer player)) exitWith 
{
	profilenamespace setVariable ["vgsync",true]; saveProfilenamespace;
};

_playerPos = [];
_playerGear = [];
_playerBackp = [];
_medical = [];

_playerPos = [round(getDir player),getPosATL player];

_playerGear = [weapons player,magazines player];
_playerBackp = [typeOf (unitBackpack player),getWeaponCargo (unitBackpack player),getMagazineCargo (unitBackpack player)];

if (!(player getVariable["USEC_isDead",false])) then 
{
	_medical = player call player_sumMedical;
};

_currentWpn = currentMuzzle player;
_currentAnim = animationState player;
_config = configFile >> "CfgMovesMaleSdr" >> "States" >> _currentAnim;
_onLadder = (getNumber (_config >> "onLadder")) == 1;
_isTerminal = (getNumber (_config >> "terminal")) == 1;
_currentModel = typeOf player;

if (_onLadder || (vehicle player != player) || _isTerminal) then 
{
	_currentAnim = "";
	_currentWpn = "";
}
else 
{
	if ( typeName(_currentWpn) == "STRING" ) then 
	{
		_muzzles = getArray(configFile >> "cfgWeapons" >> _currentWpn >> "muzzles");
		if (count _muzzles > 1) then 
		{
			_currentWpn = currentMuzzle player;
		};	
	} 
	else 
	{
		_currentWpn = "";
	};
};

_temp = round(player getVariable ["temperature",100]);

_currentState = [_currentWpn,_currentAnim,_temp];

_key = format["%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11:%12:%13:%14:%15:%16:%17:",_charID,_playerPos,_playerGear,_playerBackp,_medical,false,false,0,0,0,0,_currentState,0,0,_currentModel,0,0];

PVDZE_deb = ["sync",toArray _key];
publicVariableServer "PVDZE_deb";