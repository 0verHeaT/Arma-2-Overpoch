/*
	Exclusively made for [VG] Servers
	https://vectiongaming.com/

	File: twpdialog.hpp
	Description: Trade with Players (P2P Trade)
	
	Author: 0verHeaT
	https://github.com/0verHeaT
*/
class TradeWithPlayersDialog
{
	idd = 50011;
	movingenable = 0;
	onLoad = "uiNamespace setVariable ['TradeWithPlayersDialog',_this select 0]";
	class Controls 
	{
		class RscTextT_5001100: RscTextT
		{
			idc = -1;
			x = 0.245833 * safezoneW + safezoneX;
			y = 0.251851 * safezoneH + safezoneY;
			w = 0.508333 * safezoneW;
			h = 0.496296 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscTextT_5001101: RscTextT
		{
			idc = -1;
			text = "Trade With Players";
			x = 0.245833 * safezoneW + safezoneX;
			y = 0.251851 * safezoneH + safezoneY;
			w = 0.508333 * safezoneW;
			h = 0.051851 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscTextT_5001118:RscTextT
		{
			idc = -1;
			x = 0.420833 * safezoneW + safezoneX;
			y = 0.348148 * safezoneH + safezoneY;
			w = 0.158333 * safezoneW;
			h = 0.103703 * safezoneH;
			colorBackground[] = {0,0,0,0.2};
		};
		class RscTextT_5001102:RscTextT
		{
			idc = -1;
			text = "Gear";
			x = 0.258333 * safezoneW + safezoneX;
			y = 0.318518 * safezoneH + safezoneY;
			w = 0.041666 * safezoneW;
			h = 0.022222 * safezoneH;
		};
		class RscCombo_5001103:RscCombo
		{
			idc = 9000;
			x = 0.308333 * safezoneW + safezoneX;
			y = 0.318518 * safezoneH + safezoneY;
			w = 0.100000 * safezoneW;
			h = 0.022222 * safezoneH;
			onMouseButtonClick  =  "[(lbCurSel 9000)] call twp_loadGear";
		};
		class RscListbox_5001104:RscListbox //LB gear
		{
			idc = 9002;
			x = 0.258333 * safezoneW + safezoneX;
			y = 0.348148 * safezoneH + safezoneY;
			w = 0.150000 * safezoneW;
			h = 0.355555 * safezoneH;
			onMouseButtonClick  =  "[(lbCurSel 9002),TWPPlayerGearList,-1] call twp_showInfo";
			onLBDblClick = "[(lbCurSel 9002),(ctrlText 9005)] call twp_add";
		};
		class RscTextT_5001105:RscTextT // text target
		{
			idc = -1;
			text = "Items";
			x = 0.591666 * safezoneW + safezoneX;
			y = 0.318518 * safezoneH + safezoneY;
			w = 0.041666 * safezoneW;
			h = 0.022222 * safezoneH;
		};
		class RscCombo_5001106:RscCombo // Combo target
		{
			idc = 9001;
			x = 0.641666 * safezoneW + safezoneX;
			y = 0.318518 * safezoneH + safezoneY;
			w = 0.100000 * safezoneW;
			h = 0.022222 * safezoneH;
			onMouseButtonClick  =  "[(lbCurSel 9001)] call twp_loadTargetItems";
		};
		class RscListbox_5001107:RscListbox // LB target
		{
			idc = 9003;
			x = 0.591666 * safezoneW + safezoneX;
			y = 0.348148 * safezoneH + safezoneY;
			w = 0.150000 * safezoneW;
			h = 0.355555 * safezoneH;
			onMouseButtonClick  =  "[(lbCurSel 9003),TWPTargetList,1] call twp_showInfo";
			onLBDblClick = "[(lbCurSel 9003)] call twp_buy";
		};
		class RscStructuredText_5001108:RscStructuredText // Text above LB added items
		{
			idc = 9009;
			x = 0.420833 * safezoneW + safezoneX;
			y = 0.318518 * safezoneH + safezoneY;
			w = 0.158333 * safezoneW;
			h = 0.022222 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class RscListbox_5001109:RscListbox // LB added items
		{
			idc = 9004;
			x = 0.420833 * safezoneW + safezoneX;
			y = 0.348148 * safezoneH + safezoneY;
			w = 0.158333 * safezoneW;
			h = 0.103703 * safezoneH;
			onMouseButtonClick  =  "[(lbCurSel 9004),TWPPlayerList,0] call twp_showInfo";
			onLBDblClick = "[(lbCurSel 9004)] call twp_remove";
		};
		class RscStructuredText_5001110:RscStructuredText // current balance
		{
			idc = 9006;
			x = 0.420833 * safezoneW + safezoneX;
			y = 0.607407 * safezoneH + safezoneY;
			w = 0.158333 * safezoneW;
			h = 0.096296 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class RscStructuredText_5001111:RscStructuredText // item info
		{
			idc = 9007;
			x = 0.483333 * safezoneW + safezoneX;
			y = 0.488888 * safezoneH + safezoneY;
			w = 0.095833 * safezoneW;
			h = 0.103703 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class RscStructuredText_5001112:RscStructuredText // item pic
		{
			idc = 9008;
			x = 0.420833 * safezoneW + safezoneX;
			y = 0.488888 * safezoneH + safezoneY;
			w = 0.058333 * safezoneW;
			h = 0.103703 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class RscEdit_5001113:RscEdit
		{
			idc = 9005;
			x = 0.258333 * safezoneW + safezoneX;
			y = 0.711111 * safezoneH + safezoneY;
			w = 0.070833 * safezoneW;
			h = 0.022222 * safezoneH;
		};
		class RscShortcutButton_5001114:RscShortcutButton
		{
			idc = -1;
			text = "Add";
			x = 0.337500 * safezoneW + safezoneX;
			y = 0.694111 * safezoneH + safezoneY; //-0.018 - 0.693111
			w = 0.070833 * safezoneW;
			h = 0.055016 * safezoneH;
			onButtonClick = "[(lbCurSel 9002),(ctrlText 9005)] call twp_add";
		};
		class RscShortcutButton_5001115:RscShortcutButton
		{
			idc = -1;
			text = "Buy";
			x = 0.670833 * safezoneW + safezoneX;
			y = 0.694111 * safezoneH + safezoneY; //-0.018 - 0.693111
			w = 0.070833 * safezoneW;
			h = 0.055016 * safezoneH;
			onButtonClick = "[(lbCurSel 9003)] call twp_buy";
		};
		/*
		class RscShortcutButton_5001116:RscShortcutButton
		{
			idc = 000000;
			text = "Remove";
			x = 0.508333 * safezoneW + safezoneX;
			y = 0.441259 * safezoneH + safezoneY; //-0.018
			w = 0.070833 * safezoneW;
			h = 0.055016 * safezoneH;
			onButtonClick = "";
		};
		*/
		class RcsButton_5001117:RcsButton
		{
			idc = -1;
			text = "Exit";
			x = 0.708333 * safezoneW + safezoneX;
			y = 0.259259 * safezoneH + safezoneY;
			w = 0.041666 * safezoneW;
			h = 0.037037 * safezoneH;
			onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 9000);";
		};
	};
};