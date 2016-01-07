_box = _this;

{_box addMagazineCargoGlobal [_x,floor random 3];} count ["100Rnd_127x99_M2","50Rnd_127x107_DSHKM"];

{
	if ((floor(random 4)) == 1) then
	{
		_box addMagazineCargoGlobal [_x,floor random 3];
	};
} count ["100Rnd_127x99_M2","50Rnd_127x107_DSHKM","2000Rnd_762x51_M134","32Rnd_40mm_GMG","48Rnd_40mm_MK19","29Rnd_30mm_AGS30"];


_rndnr = floor(random 4);

if (_rndnr == 1) then {
	{
		_box addWeaponCargoGlobal [_x,1];
	} count ammo_box_tools;
};