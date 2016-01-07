_box = _this;

_gem = ["ItemObsidian","ItemCitrine","ItemTopaz","ItemRuby","ItemSapphire","ItemEmerald","ItemAmathyst"] call BIS_fnc_selectRandom;
_loot_list_high = ["ItemVault","ItemBriefcase100oz","ItemGoldBar10oz","ItemVault","ItemBriefcase_Base","ItemGoldBar10oz","ItemGoldBar10oz","ItemLockbox","ItemGoldBar10oz","ItemVault","ItemHotwireKit"] call BIS_fnc_selectRandom;
_loot_list_low = ["ItemGoldBar","ItemSilverBar10oz","ItemCopperBar10oz","ItemGoldBar","ItemSilverBar10oz","ItemCopperBar10oz","ItemGoldBar10oz"] call BIS_fnc_selectRandom;

_box addMagazineCargoGlobal [_gem,floor(random 2)];
_box addMagazineCargoGlobal [_loot_list_low,floor(random 10)];

if (floor(random 5) == 1) then {
	_box addMagazineCargoGlobal [_loot_list_high,1];
};
if ((floor(random 10)) == 1) then {_box addWeaponCargoGlobal [(wai_chainsaws call BIS_fnc_selectRandom),1];_box addMagazineCargoGlobal ["ItemMixOil",(ceil random 4)];};
if ((floor(random 5)) == 1) then {_box addWeaponCargoGlobal ["ItemSledge",1];};