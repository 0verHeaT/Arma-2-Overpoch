spawn_group = 				compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\compile\wai_spawnGroup.sqf";
spawn_group_cqb = 			compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\compile\wai_spawnGroupCQB.sqf";
group_waypoints =			compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\compile\patrol.sqf";
spawn_static  =				compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\compile\wai_spawnStatic.sqf";
//heli_para  = 				compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\compile\heli_para.sqf";
//heli_patrol = 			compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\compile\heli_patrol.sqf";
vehicle_patrol = 			compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\compile\vehicle_patrol.sqf";
on_kill = 						compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\compile\ai_killed.sqf";
veh_monitor = 				compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\compile\vehicle_monitor.sqf";
custom_publish  = 			compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\compile\custom_publishVehicle.sqf";
WAI_mission_startup = 	compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\compile\wai_missionStart.sqf";
wai_createMarker = 		compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\compile\wai_marker.sqf";
WAI_Send_Msg = 				compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\compile\wai_sendMsg.sqf";

// Compile Loot
box_b_large = 				compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\boxes\BuildingBoxLarge.sqf";
box_b_medium = 				compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\boxes\BuildingBoxMedium.sqf";
box_b_small = 				compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\boxes\BuildingBoxSmall.sqf";
box_general = 				compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\boxes\GeneralSupplyBox.sqf";
box_nato = 						compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\boxes\NATOBox.sqf";
box_nato_crash = 			compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\boxes\NATOCrash.sqf";
box_cache = 					compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\boxes\WeaponsBox.sqf";
box_chain = 					compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\boxes\ChainBulletBox.sqf";
box_treasure = 				compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\boxes\box_treasure.sqf";

createCenter east;
WEST setFriend [EAST,0];
EAST setFriend [WEST,0];
WAIconfigloaded = False;
WAImissionconfig = False;

ai_ground_units = 0;
ai_emplacement_units = 0;
ai_air_units = 0;
ai_vehicle_units = 0;

call compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\AIconfig.sqf";
waitUntil {WAIconfigloaded};
diag_log "WAI: AI Config File Loaded";

[] spawn {
	sleep 120;
	while {1 == 1} do {
		if (ai_clean_dead) then {
			{
				_killedat = _x getVariable "killedat";
				if (!isNil "_killedat") then {
					if ((time - _killedat) >= cleanup_time) then {
						deleteVehicle _x;
					};
				};
			} forEach allDead;
		};
		sleep 600;
	};
};

clean_running_mission = false;

call compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\missionCfg.sqf";
waitUntil {WAImissionconfig};
diag_log "WAI: Mission Config File Loaded";

sleep 60;
[] spawn WAI_mission_startup;