/*
	File: BaseManage.hpp
	Description:
	
	Author: maca134
*/
class PlotPoleManager
{
	idd = 420002;
	movingenable = 0;
	onLoad = "uiNamespace setVariable ['PlotPoleManager', _this select 0]";
		
	class Controls {
		class RscText_1000: RscTextT
		{
			idc = -1;
			x = 0.323769 * safezoneW + safezoneX;
			y = 0.265068 * safezoneH + safezoneY;
			w = 0.352461 * safezoneW;
			h = 0.469864 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscText_1001: RscTextT
		{
			idc = -1;
			text = "Plot Pole";
			x = 0.323769 * safezoneW + safezoneX;
			y = 0.265068 * safezoneH + safezoneY;
			w = 0.352461 * safezoneW;
			h = 0.0469864 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscText_1002: RscTextT
		{
			idc = -1;
			text = "Players Nearby";
			x = 0.345798 * safezoneW + safezoneX;
			y = 0.370787 * safezoneH + safezoneY;
			w = 0.0698621 * safezoneW;
			h = 0.0223781 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class RscListbox_1500: RscListbox
		{
			idc = 4500;
			x = 0.340291 * safezoneW + safezoneX;
			y = 0.394281 * safezoneH + safezoneY;
			w = 0.0826081 * safezoneW;
			h = 0.187946 * safezoneH;
		};
		class RscListbox_1501: RscListbox
		{
			idc = 4501;
			x = 0.433913 * safezoneW + safezoneX;
			y = 0.394281 * safezoneH + safezoneY;
			w = 0.0826081 * safezoneW;
			h = 0.187946 * safezoneH;
		};
		class RscText_1003: RscTextT
		{
			idc = -1;
			text = "Friends";
			x = 0.439421 * safezoneW + safezoneX;
			y = 0.370787 * safezoneH + safezoneY;
			w = 0.0698621 * safezoneW;
			h = 0.0223781 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class RscShortcutButton_1700: RscShortcutButton
		{
			idc = 4503;
			text = "Add";
			x = 0.340291 * safezoneW + safezoneX;
			y = 0.593973 * safezoneH + safezoneY;
			w = 0.0771009 * safezoneW;
			h = 0.058733 * safezoneH;
			onButtonClick = "[(lbCurSel 4500)] call PlotAddFriend;";
		};
		class RscShortcutButton_1701: RscShortcutButton
		{
			idc = 4504;
			text = "Remove";
			x = 0.439421 * safezoneW + safezoneX;
			y = 0.593973 * safezoneH + safezoneY;
			w = 0.0771009 * safezoneW;
			h = 0.058733 * safezoneH;
			onButtonClick = "[(lbCurSel 4501)] call PlotRemoveFriend;";
		};
		class RscStructuredText_1100: RscStructuredText
		{
			idc = 4502;
			text = "Maintain information";
			x = 0.533043 * safezoneW + safezoneX;
			y = 0.367294 * safezoneH + safezoneY;
			w = 0.132173 * safezoneW;
			h = 0.226679 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class RscShortcutButton_1702: RscShortcutButton
		{
			idc = -1;
			text = "Maintain";
			x = 0.560579 * safezoneW + safezoneX;
			y = 0.593973 * safezoneH + safezoneY;
			w = 0.0771009 * safezoneW;
			h = 0.058733 * safezoneH;
			onButtonClick = "call PlotPoleMaintain;";
		};
		class RscShortcutButton_1703: RscShortcutButton
		{
			idc = -1;
			text = "Close";
			x = 0.593623 * safezoneW + safezoneX;
			y = 0.664452 * safezoneH + safezoneY;
			w = 0.0771009 * safezoneW;
			h = 0.058733 * safezoneH;
			onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 9000);";
		};
		class RscFrame_1800: RscFrame
		{
			idc = -1;
			x = 0.522029 * safezoneW + safezoneX;
			y = 0.335548 * safezoneH + safezoneY;
			w = 0.00352461 * safezoneW;
			h = 0.324855 * safezoneH;
		};
		class RscText_1004: RscTextT
		{
			idc = -1;
			text = "Player Build List";
			x = 0.389856 * safezoneW + safezoneX;
			y = 0.335548 * safezoneH + safezoneY;
			w = 0.0766717 * safezoneW;
			h = 0.0326316 * safezoneH;
			colorText[] = {1,1,1,1};
		};

		
	};
};
