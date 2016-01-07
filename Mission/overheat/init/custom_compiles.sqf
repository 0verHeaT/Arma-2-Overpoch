/*
	Exclusively made for [VG] Servers
	https://vectiongaming.com/

	File: custom_compiles.sqf
	Description:
	
	Author: 0verHeaT
	https://github.com/0verHeaT
*/
if !(isDedicated) then
{
	player_localSync =				compile preprocessFileLineNumbers "overheat\compile\player_localSync.sqf";

	player_smeltcoins = 				compile preprocessFileLineNumbers "overheat\actions\player_smeltcoins.sqf";
	sc_loadItems =						compile preprocessFileLineNumbers "overheat\compile\sc_loadItems.sqf";
	sc_loadGear =							compile preprocessFileLineNumbers "overheat\compile\sc_loadGear.sqf";
	sc_showInfo = 						compile preprocessFileLineNumbers "overheat\compile\sc_showInfo.sqf";
	sc_trade = 								compile preprocessFileLineNumbers "overheat\compile\sc_trade.sqf";
	sc_bankWithdraw = 					compile preprocessFileLineNumbers "overheat\compile\sc_bankWithdraw.sqf";
	sc_bankDespoit = 					compile preprocessFileLineNumbers "overheat\compile\sc_bankDespoit.sqf";
	sc_giveCoins = 						compile preprocessFileLineNumbers "overheat\compile\sc_giveCoins.sqf";
	
	EpochDeathBoardLoad =			compile preprocessFileLineNumbers "overheat\compile\deathboard_load.sqf";
	EpochDeathBoardClick =			compile preprocessFileLineNumbers "overheat\compile\deathboard_playerdeaths.sqf";
	
	player_build = 						compile preprocessFileLineNumbers "overheat\compile\player_build.sqf";
	snap_build = 							compile preprocessFileLineNumbers "overheat\compile\snap_build.sqf";
	
	player_packTent =					compile preprocessFileLineNumbers "overheat\compile\player_packTent.sqf";
	player_packVault =				compile preprocessFileLineNumbers "overheat\compile\player_packVault.sqf";
	player_unlockVault =				compile preprocessFileLineNumbers "overheat\compile\player_unlockVault.sqf";
	player_lockVault =				compile preprocessFileLineNumbers "overheat\compile\player_lockVault.sqf";
	player_updateGui =				compile preprocessFileLineNumbers "overheat\compile\player_updateGui.sqf";
	player_tentPitch =				compile preprocessFileLineNumbers "overheat\compile\tent_pitch.sqf";
	player_vaultPitch =				compile preprocessFileLineNumbers "overheat\compile\vault_pitch.sqf";
	player_unlockDoor =				compile preprocessFileLineNumbers "overheat\compile\player_unlockDoor.sqf";
	
	player_updateGui =				compile preprocessFileLineNumbers "overheat\compile\player_updateGui.sqf";
	fnc_usec_damageActions =		compile preprocessFileLineNumbers "overheat\compile\fn_damageActions.sqf";
	
	PlotGetFriends = 					compile preprocessFileLineNumbers "overheat\compile\plot_getFriends.sqf";
	PlotNearbyHumans = 				compile preprocessFileLineNumbers "overheat\compile\plot_nearbyHumans.sqf";
	PlotAddFriend = 						compile preprocessFileLineNumbers "overheat\compile\plot_addFriend.sqf";
	PlotRemoveFriend = 				compile preprocessFileLineNumbers "overheat\compile\plot_removeFriend.sqf";
	PlotPoleMaintainInfo = 		compile preprocessFileLineNumbers "overheat\compile\plot_maintainInfo.sqf";
	PlotPoleMaintain = 				compile preprocessFileLineNumbers "overheat\compile\plot_maintain.sqf";
	
	player_stats = 						compile preprocessFileLineNumbers "overheat\compile\player_stats.sqf";
	fn_gearMenuChecks =				compile preprocessFileLineNumbers "overheat\compile\fn_gearMenuChecks.sqf";
	player_disableSide = 			compile preprocessFileLineNumbers "overheat\compile\player_disableSide.sqf";
	player_updateGui =				compile preprocessFileLineNumbers "overheat\compile\player_updateGui.sqf";
	
	snap_object_custom =				compile preprocessFileLineNumbers "overheat\compile\snap_object_custom.sqf";
	player_buildControls_custom = compile preprocessFileLineNumbers "overheat\compile\player_buildControls_custom.sqf";
	player_custombuild = 			compile preprocessFileLineNumbers "overheat\compile\player_custombuild.sqf";
	player_customremove = 			compile preprocessFileLineNumbers "overheat\compile\player_customremove.sqf";
	player_tradebuildings =		compile preprocessFileLineNumbers "overheat\compile\player_tradebuildings.sqf";
	BuildingsLoadItemList = 		compile preprocessFileLineNumbers "overheat\compile\building_loadlist.sqf";
	BuildingsShowPrices = 			compile preprocessFileLineNumbers "overheat\compile\building_showprices.sqf";
	BuildingsBuy = 						compile preprocessFileLineNumbers "overheat\compile\building_buy.sqf";
	BuildingsSell = 						compile preprocessFileLineNumbers "overheat\compile\building_sell.sqf";
	
	garage_getnearVeh = 				compile preprocessFileLineNumbers "overheat\compile\garage_nearvehicles.sqf";
	garage_getstoredVeh = 			compile preprocessFileLineNumbers "overheat\compile\garage_storedvehicles.sqf";
	garage_manage = 						compile preprocessFileLineNumbers "overheat\compile\garage_manage.sqf";
	garage_fillplayers =				compile preprocessFileLineNumbers "overheat\compile\garage_fillplayers.sqf";
	garage_addfriend =					compile preprocessFileLineNumbers "overheat\compile\garage_addfriend.sqf";
	garage_removefriend = 			compile preprocessFileLineNumbers "overheat\compile\garage_removefriend.sqf";
	garage_spawnVehicle = 			compile preprocessFileLineNumbers "overheat\compile\garage_spawnvehicle.sqf";
	garage_storeVehicle = 			compile preprocessFileLineNumbers "overheat\compile\garage_storeVehicle.sqf";
	
	VehicleColourPaint = 			compile preprocessFileLineNumbers "overheat\compile\paint_vehicleColour.sqf";
	VehicleColourUpdate =			compile preprocessFileLineNumbers "overheat\compile\paint_vehicleColourUpdate.sqf";
	VehicleColourUpdate2 = 		compile preprocessFileLineNumbers "overheat\compile\paint_vehicleColourUpdate2.sqf";
	player_paint = 						compile preprocessFileLineNumbers "overheat\compile\player_paint.sqf";
	
	client_getInfo = 					compile preprocessFileLineNumbers "overheat\compile\client_getInfo.sqf";
	client_rules = 						compile preprocessFileLineNumbers "overheat\compile\client_rules.sqf";
	
	fnc_usec_selfActions =			compile preprocessFileLineNumbers "overheat\compile\fn_selfActions.sqf";
	dayz_spaceInterrupt =			compile preprocessFileLineNumbers "overheat\compile\dayz_spaceInterrupt.sqf";
	player_switchModel =				compile preprocessFileLineNumbers "overheat\compile\player_switchModel.sqf";
	player_wearClothes =				compile preprocessFileLineNumbers "overheat\compile\player_wearClothes.sqf";
	player_selectSlot =				compile preprocessFileLineNumbers "overheat\compile\ui_selectSlot.sqf";
	
	group_load = 							compile preprocessFileLineNumbers "overheat\compile\group_load.sqf";
	group_acceptInvite = 			compile preprocessFileLineNumbers "overheat\compile\group_acceptInvite.sqf";
	group_declineInvite = 			compile preprocessFileLineNumbers "overheat\compile\group_declineInvite.sqf";
	group_disband = 						compile preprocessFileLineNumbers "overheat\compile\group_disband.sqf";
	group_inviteToGroup = 			compile preprocessFileLineNumbers "overheat\compile\group_inviteToGroup.sqf";
	group_kick = 							compile preprocessFileLineNumbers "overheat\compile\group_kick.sqf";
	group_leave = 						compile preprocessFileLineNumbers "overheat\compile\group_leave.sqf";
	group_selectChange = 			compile preprocessFileLineNumbers "overheat\compile\group_selectChange.sqf";
	
	zombie_generate = 					compile preprocessFileLineNumbers "overheat\compile\zombie_generate.sqf";
	wild_spawnZombies = 				compile preprocessFileLineNumbers "overheat\compile\wild_spawnZombies.sqf";
	player_spawnCheck = 				compile preprocessFileLineNumbers "overheat\compile\player_spawnCheck.sqf";
	
	safezone_start = 					compile preprocessFileLineNumbers "overheat\compile\safezone_start.sqf";
	safezone_end = 						compile preprocessFileLineNumbers "overheat\compile\safezone_end.sqf";
	
	client_viewDistanceUpdate ={((uiNamespace getVariable "SettingsDialog") displayCtrl 5101) ctrlSetStructuredText parseText format["<t align='left' color='#9F1B1B'>View Distance: </t><t align='right' color='#FFFFFF'>(%1m)  </t>",((ceil((sliderPosition 5106) * 200)) + 400)];};
	client_setViewDistance =
	{
		VGClientViewDistance = ((ceil((sliderPosition 5106) * 200)) + 400);
		setViewDistance VGClientViewDistance;
		cutText [format["\n\nYou have changed the view distance to %1 meters.",VGClientViewDistance],"PLAIN DOWN"];
	};
	
	call compile preprocessFileLineNumbers "overheat\compile\group_icons.sqf";
	
	{
		private ["_pos","_radius","_name","_trigger","_marker","_location","_object"];
		_pos = _x select 0;
		_radius = _x select 1;

		_trigger = createTrigger ["EmptyDetector",_pos];
		_trigger setTriggerArea [_radius,_radius,0,false];
		_trigger setTriggerActivation ["ANY","PRESENT",true];
		_trigger setTriggerType "SWITCH";
		_trigger setTriggerStatements ["(vehicle player) in thisList","call safezone_start","call safezone_end"];
	
		_tcmarker = createMarkerLocal [format["TcMarker%1",_forEachIndex],_pos];
		_tcmarker setMarkerShapeLocal "ELLIPSE";
		_tcmarker setMarkerTypeLocal "Empty";
		_tcmarker setMarkerColorLocal "ColorRed";
		_tcmarker setMarkerBrushLocal "DiagGrid";
		_tcmarker setMarkerSizeLocal [_radius,_radius];
	
		for "_i" from 0 to 360 step (1440 / _radius) do
		{
			_location = [(_pos select 0) + ((cos _i) * _radius),(_pos select 1) + ((sin _i) * _radius),0];
			_object = "Sign_sphere100cm_EP1" createVehicleLocal _location;
			_object setPosATL _location;
		};
	} forEach VGSafezones;
};

fnc_removeBackItem = 				compile preprocessFileLineNumbers "overheat\functions\fn_removeBackItem.sqf";
fnc_reduceArray =						compile preprocessFileLineNumbers "overheat\functions\fn_reduceArray.sqf";
fnc_checkBackpack = 					compile preprocessFileLineNumbers "overheat\functions\fn_checkBackpack.sqf";
fnc_getArrayPos = 						compile preprocessFileLineNumbers "overheat\functions\fn_getArrayPos.sqf";
fnc_getBackpackitems = 			compile preprocessFileLineNumbers "overheat\functions\fn_getBackitems.sqf";

BIS_fnc_numberDigits = 			compile preprocessFileLineNumbers "overheat\functions\fn_numberDigits.sqf";
BIS_fnc_numberText = 				compile preprocessFileLineNumbers "overheat\functions\fn_numberText.sqf";