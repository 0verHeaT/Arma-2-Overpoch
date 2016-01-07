class RscButtonSpawn
{
	access = 0;
	type = 1;
	text = "";
	colorText[] = {0.8784,0.8471,0.651,1};
	colorDisabled[] = {0.4,0.4,0.4,1};
	colorBackground[] = {1,0.537,0,0.5};
	colorBackgroundDisabled[] = {0.95,0.95,0.95,1};
	colorBackgroundActive[] = {1,0.537,0,1};
	colorFocused[] = {1,0.537,0,1};
	colorShadow[] = {0.023529,0,0.0313725,1};
	colorBorder[] = {0.023529,0,0.0313725,1};
	soundEnter[] = {"\ca\ui\data\sound\onover",0.09,1};
	soundPush[] = {"\ca\ui\data\sound\new1",0,0};
	soundClick[] = {"\ca\ui\data\sound\onclick",0.07,1};
	soundEscape[] = {"\ca\ui\data\sound\onescape",0.09,1};
	style = 2;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	shadow = 2;
	font = "Zeppelin32";
	sizeEx = 0.03921;
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	borderSize = 0;
};
class DRN_DIALOG
{
	idd=-1;
	movingenable=true;
	class Controls
	{
		class mapTavi: RscPicture
		{
			idc = 1200;
			text = "overheat\gui\tavi.paa";
			x = 0.340983 * safezoneW + safezoneX;
			y = 0.23125 * safezoneH + safezoneY;
			w = 0.30876 * safezoneW;
			h = 0.531375 * safezoneH;
		};
		class btnByelov:RscButtonSpawn
		{
			idc = 1600;
			text = "Byelov";
			x = 0.590252 * safezoneW + safezoneX;
			y = 0.59375 * safezoneH + safezoneY;
			w = 0.0340954 * safezoneW;
			h = 0.0145 * safezoneH;
			action = "closeDialog 0;drnspawn = 0;";
		};
		class btnSabina:RscButtonSpawn
		{
			idc = 1601;
			text = "Sabina";
			x = 0.576969 * safezoneW + safezoneX;
			y = 0.526875 * safezoneH + safezoneY;
			w = 0.0325326 * safezoneW;
			h = 0.0145 * safezoneH;
			action = "closeDialog 0;drnspawn = 1;";
		};
		class btnEtan:RscButtonSpawn
		{
			idc = 1602;
			text = "Etanovsk";
			x = 0.526568 * safezoneW + safezoneX;
			y = 0.50375 * safezoneH + safezoneY;
			w = 0.0430816 * safezoneW;
			h = 0.0145 * safezoneH;
			action = "closeDialog 0;drnspawn = 2;";
		};
		class btnLypo:RscButtonSpawn
		{
			idc = 1603;
			text = "Lyepestok";
			x = 0.498828 * safezoneW + safezoneX;
			y = 0.43125 * safezoneH + safezoneY;
			w = 0.049333 * safezoneW;
			h = 0.0145 * safezoneH;
			action = "closeDialog 0;drnspawn = 3;";
		};
		class btnMartin:RscButtonSpawn
		{
			idc = 1604;
			text = "Martin";
			x = 0.569935 * safezoneW + safezoneX;
			y = 0.408125 * safezoneH + safezoneY;
			w = 0.0364397 * safezoneW;
			h = 0.0145 * safezoneH;
			action = "closeDialog 0;drnspawn = 4;";
		};
		class btnDaln:RscButtonSpawn
		{
			idc = 1605;
			text = "Dalnogorsk";
			x = 0.551964 * safezoneW + safezoneX;
			y = 0.344375 * safezoneH + safezoneY;
			w = 0.0501144 * safezoneW;
			h = 0.0145 * safezoneH;
			action = "closeDialog 0;drnspawn = 5;";
		};
		class btnYar:RscButtonSpawn
		{
			idc = 1606;
			text = "Yaroslav";
			x = 0.502343 * safezoneW + safezoneX;
			y = 0.3325 * safezoneH + safezoneY;
			w = 0.0380025 * safezoneW;
			h = 0.0145 * safezoneH;
			action = "closeDialog 0;drnspawn = 6;";
		};
		class btnKam:RscButtonSpawn
		{
			idc = 1607;
			text = "Kameni";
			x = 0.471087 * safezoneW + safezoneX;
			y = 0.304375 * safezoneH + safezoneY;
			w = 0.032142 * safezoneW;
			h = 0.0145 * safezoneH;
			action = "closeDialog 0;drnspawn = 7;";
		};
		class btnSev:RscButtonSpawn
		{
			idc = 1608;
			text = "Seven";
			x = 0.497265 * safezoneW + safezoneX;
			y = 0.726875 * safezoneH + safezoneY;
			w = 0.0321419 * safezoneW;
			h = 0.0145 * safezoneH;
			action = "closeDialog 0;drnspawn = 8;";
		};
		class btnBran:RscButtonSpawn
		{
			idc = 1609;
			text = "Branibor";
			x = 0.441785 * safezoneW + safezoneX;
			y = 0.651875 * safezoneH + safezoneY;
			w = 0.0380025 * safezoneW;
			h = 0.0145 * safezoneH;
			action = "closeDialog 0;drnspawn = 9;";
		};
		class btnShta:RscButtonSpawn
		{
			idc = 1610;
			text = "Shtangrad";
			x = 0.367552 * safezoneW + safezoneX;
			y = 0.58 * safezoneH + safezoneY;
			w = 0.0497236 * safezoneW;
			h = 0.0145 * safezoneH;
			action = "closeDialog 0;drnspawn = 10;";
		};
		class btnVed:RscButtonSpawn
		{
			idc = 1611;
			text = "Vedich";
			x = 0.423423 * safezoneW + safezoneX;
			y = 0.531875 * safezoneH + safezoneY;
			w = 0.032142 * safezoneW;
			h = 0.0145 * safezoneH;
			action = "closeDialog 0;drnspawn = 11;";
		};
		class btnKraz:RscButtonSpawn
		{
			idc = 1612;
			text = "Krazno";
			x = 0.471088 * safezoneW + safezoneX;
			y = 0.571875 * safezoneH + safezoneY;
			w = 0.0340955 * safezoneW;
			h = 0.0145 * safezoneH;
			action = "closeDialog 0;drnspawn = 12;";
		};
		class btnRand:RscButtonSpawn
		{
			idc = 1613;
			text = "Random";
			x = 0.382789 * safezoneW + safezoneX;
			y = 0.419375 * safezoneH + safezoneY;
			w = 0.0368304 * safezoneW;
			h = 0.0145 * safezoneH;
			action = "closeDialog 0;drnspawn = 13;";
		};
		class lblMap: RscText
		{
			idc = 1000;
			text = "Select spawn area";
			x = 0.358175 * safezoneW + safezoneX;
			y = 0.366875 * safezoneH + safezoneY;
			w = 0.0801985 * safezoneW;
			h = 0.018875 * safezoneH;
			tooltip = "Western Island has active bandits";
		};

	};
};
