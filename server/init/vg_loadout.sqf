private ["_result"];

_result = [];

if (_this > 0) then
{
	if (_this == 1) then // Sub Level 1
	{
		_result = 
		[
			["ItemFlashlight","ItemHatchet","ItemMap","ItemToolbox","ItemRadio"], // Weapons
			["ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemMorphine","ItemPainkiller","ItemWaterbottleBoiled","FoodSteakCooked"], // Mags
			"DZ_ALICE_Pack_EP1", // Backpack
			"Skin_Camo1_DZ" // Skin
		];
	};
	if (_this == 2) then // Sub Level 2
	{
		_result = 
		[
			["ItemFlashlight","ItemHatchet","ItemMap","ItemToolbox","ItemRadio","ItemCrowbar","M9SD"], // Weapons
			["ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemMorphine","ItemPainkiller","ItemWaterbottleBoiled","FoodSteakCooked","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD"], // Mags
			"DZ_Backpack_EP1", // Backpack
			"Soldier_Sniper_PMC_DZ" // Skin
		];
	};
};
_result