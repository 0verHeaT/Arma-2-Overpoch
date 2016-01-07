/*
	File: bank_dialog.hpp
	Description:
	
	Author: maca134
*/
class GivePlayerDialog
{
	idd = 420001;
	movingenable = 0;

	class Controls {
		class RscTextT_1000: RscTextT
		{
			idc = -1;
			x = 0.283646 * safezoneW + safezoneX;
			y = 0.22492 * safezoneH + safezoneY;
			w = 0.432709 * safezoneW;
			h = 0.398866 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscTextT_1001: RscTextT
		{
			idc = -1;
			text = "Give Player";
			x = 0.283646 * safezoneW + safezoneX;
			y = 0.22492 * safezoneH + safezoneY;
			w = 0.432709 * safezoneW;
			h = 0.055016 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscTextT_1002: RscTextT
		{
			idc = -1;
			text = "Player";
			x = 0.351256 * safezoneW + safezoneX;
			y = 0.307444 * safezoneH + safezoneY;
			w = 0.108177 * safezoneW;
			h = 0.041262 * safezoneH;
		};
		class RscTextT_1006: RscTextT
		{
			idc = -1;
			text = "Amount";
			x = 0.37154 * safezoneW + safezoneX;
			y = 0.417476 * safezoneH + safezoneY;
			w = 0.0473275 * safezoneW;
			h = 0.041262 * safezoneH;
		};
		class RscTextT_1004: RscTextT
		{
			idc = 14001;
			text = "";
			x = 0.351256 * safezoneW + safezoneX;
			y = 0.348706 * safezoneH + safezoneY;
			w = 0.108177 * safezoneW;
			h = 0.041262 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class RscEdit_1400: RscEdit
		{
			idc = 14000;
			x = 0.425628 * safezoneW + safezoneX;
			y = 0.417476 * safezoneH + safezoneY;
			w = 0.141983 * safezoneW;
			h = 0.041262 * safezoneH;
		};
		class RscShortcutButton_1700: RscShortcutButton
		{
			idc = -1;
			text = "Give Amount";
			x = 0.351256 * safezoneW + safezoneX;
			y = 0.486246 * safezoneH + safezoneY;
			w = 0.0878939 * safezoneW;
			h = 0.055016 * safezoneH;
			onButtonClick = "[(ctrlText 14000)] spawn sc_giveCoins; ((ctrlParent (_this select 0)) closeDisplay 9000);";
		};
		class RscShortcutButton_1702: RscShortcutButton
		{
			idc = -1;
			text = "Close";
			x = 0.466195 * safezoneW + safezoneX;
			y = 0.555016 * safezoneH + safezoneY;
			w = 0.0743718 * safezoneW;
			h = 0.055016 * safezoneH;
			onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 9000);";
		};
	};
};