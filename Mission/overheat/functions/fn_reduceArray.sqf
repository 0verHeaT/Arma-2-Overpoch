/*
	File: fnc_reduceArray.sqf
	Author: 0verHeaT

	Description:
	Creates an array of the selected element in a subranked array
	(Made for A2Epoch)
	
	Parameter(s):
	1: <array> 	selected array
	2: <scalar> 	target element
	3: <scalar> 	number of subranks
	
	Returns:
	<array> array target element
		
	Example:
	
*/
private ["_array","_sel","_rank","_result","_sub"];

_array = _this select 0;
_sel = _this select 1;
//_rank = _this select 2;

//if (_rank > 1) exitWith {}; //Currently only supports 1 subrank

_result = [];
{
	_sub = _x;
	_result set [count _result,_sub select _sel];
} count _array;
_result