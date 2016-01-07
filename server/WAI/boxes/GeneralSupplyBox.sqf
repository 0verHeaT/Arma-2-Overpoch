_box = _this;

_itemfood = ["ItemSodaRabbit","FoodCanBadguy","ItemSodaMtngreen","FoodCanGriff","FoodPumpkin","ItemSodaClays","FoodCanBoneboy","ItemSodaSmasht","FoodCanCorn","FoodCanOrlok","ItemSodaDrwaste","FoodCanCurgon","FoodCanTylers","ItemSodaLemonade","FoodCanDemon","ItemSodaLvg","FoodCanFraggleos","FoodSunFlowerSeed","ItemSodaMzly","FoodCanHerpy","FoodCanPowell"];
_itemmedic = ["ItemBandage","ItemMorphine","ItemEpinephrine","ItemPainkiller","ItemAntibiotic","ItemBloodbag"];

{
	_box addMagazineCargoGlobal [_x, 1];
} count _itemfood;

{
	_box addMagazineCargoGlobal [_x, (ceil(random 3))];
} count _itemmedic;

_box addWeaponCargoGlobal ["ItemSledge",1];