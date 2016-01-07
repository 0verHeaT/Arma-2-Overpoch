/*
	File: fnc_getArrayPos.sqf
	Author: 0verHeaT

	Description:
	Returns an array of numbers, that give the location of a selected element in array.
	(Made for A2Epoch)
	
	Parameter(s):
	1: <array> 	selected array
	2: <any> 		element to find
	3: <scalar>	subranks of the array; -1 for none; 0 for 1; ...
	
	Returns:
	<array> array of numbers 
		
	Example:
		[["H","A","A","H"],"A",-1] call fnc_getArrayPos
		--> [1,2]
*/
private ["_arr","_find","_result","_i","_lower"];
_arr = _this select 0;
_find = _this select 1;
_lower = _this select 2;
_result = [];
if (count _arr > 0) then
{
	_i = 0;
	{
		if (_lower < 0) then 
		{
			if (_x == _find) then 
			{
				_result = _result + [_i];
			};
		} 
		else 
		{
			if ((_x select _lower) == _find) then 
			{
				_result = _result + [_i];
			};
		};
		_i = _i + 1;
	} count _arr;
};
_result;