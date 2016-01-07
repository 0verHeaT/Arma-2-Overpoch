/*
	Exclusively made for [VG] Servers
	https://vectiongaming.com/

	File: traderdialog.hpp
	Description: Advanced Trading System (SC)
	
	Author: 0verHeaT
	https://github.com/0verHeaT
*/
class SCTraderDialog
{
	idd = 50010;
	movingenable = 0;
	onLoad = "uiNamespace setVariable ['SCTraderDialog', _this select 0]";
	class Controls {
		class RscTextT_5001000: RscTextT
		{
			idc = -1;
			x = 0.245833 * safezoneW + safezoneX;
			y = 0.251851 * safezoneH + safezoneY;
			w = 0.508333 * safezoneW;
			h = 0.496296 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscTextT_5001001: RscTextT
		{
			idc = -1;
			text = "Trader Menu";
			x = 0.245833 * safezoneW + safezoneX;
			y = 0.251851 * safezoneH + safezoneY;
			w = 0.508333 * safezoneW;
			h = 0.051851 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class GEARTEXT:RscTextT
		{
			idc = -1;
			text = "Gear";
			x = 0.575000 * safezoneW + safezoneX;
			y = 0.318518 * safezoneH + safezoneY;
			w = 0.041666 * safezoneW;
			h = 0.022222 * safezoneH;
		};
		class COMBOGEAR:RscCombo
		{
			idc = 32000;
			x = 0.625000 * safezoneW + safezoneX;
			y = 0.318518 * safezoneH + safezoneY;
			w = 0.116666 * safezoneW;
			h = 0.022222 * safezoneH;
			onMouseButtonClick  =  "[(lbCurSel 32000),32001] spawn sc_loadGear;";
		};
		class LBGEAR:RscListbox
		{
			idc = 32001;
			x = 0.575000 * safezoneW + safezoneX;
			y = 0.348148 * safezoneH + safezoneY;
			w = 0.166666 * safezoneW;
			h = 0.355555 * safezoneH;
			colorBackground[] = {0,0,0,0.1};
			onMouseButtonClick  =  "ctrlSetText[32008,'1'];[(lbCurSel 32001),0,(ctrlText 32008)] call sc_showInfo;";
			onLBDblClick = "[(lbCurSel 32001),(ctrlText 32008),0] call sc_trade;";
		};
		class TEXTCAT2:RscTextT
		{
			idc = -1;
			text = "Items";
			x = 0.258333 * safezoneW + safezoneX;
			y = 0.318518 * safezoneH + safezoneY;
			w = 0.041666 * safezoneW;
			h = 0.022222 * safezoneH;
		};
		class COMBOCAT:RscCombo
		{
			idc = 32002;
			x = 0.308333 * safezoneW + safezoneX;
			y = 0.318518 * safezoneH + safezoneY;
			w = 0.116666 * safezoneW;
			h = 0.022222 * safezoneH;
			onMouseButtonClick  =  "[(lbCurSel 32002),32003] call sc_loadItems;";
		};
		class LBCAT:RscListbox
		{
			idc = 32003;
			x = 0.258333 * safezoneW + safezoneX;
			y = 0.348148 * safezoneH + safezoneY;
			w = 0.166666 * safezoneW;
			h = 0.355555 * safezoneH;
			colorBackground[] = {0,0,0,0.1};
			onMouseButtonClick  =  "ctrlSetText[32009,'1'];[(lbCurSel 32003),1,(ctrlText 32009)] call sc_showInfo;";
			onLBDblClick = "[(lbCurSel 32003),(ctrlText 32009),1] call sc_trade;";
		};
		class SHOWSELLPRICE:RscStructuredText
		{
			idc = 32004;
			x = 0.504166 * safezoneW + safezoneX;
			y = 0.666666 * safezoneH + safezoneY;
			w = 0.066666 * safezoneW;
			h = 0.066666 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class SHOWBUYPRICE:RscStructuredText
		{
			idc = 32005;
			x = 0.429166 * safezoneW + safezoneX;
			y = 0.666666 * safezoneH + safezoneY;
			w = 0.066666 * safezoneW;
			h = 0.066666 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class SHOWCURBALANCE:RscStructuredText
		{
			idc = 32006;
			x = 0.429166 * safezoneW + safezoneX;
			y = 0.555555 * safezoneH + safezoneY;
			w = 0.141666 * safezoneW;
			h = 0.096296 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class SHOWITEMINFO:RscStructuredText
		{
			idc = 32007;
			x = 0.429166 * safezoneW + safezoneX;
			y = 0.318518 * safezoneH + safezoneY;
			w = 0.141666 * safezoneW;
			h = 0.222222 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class GEARSELLSCB:RscShortcutButton
		{
			idc = -1;
			text = "Sell";
			x = 0.579166 * safezoneW + safezoneX;
			y = 0.694111 * safezoneH + safezoneY; //-0.018 - 0.693111
			w = 0.070833 * safezoneW;
			h = 0.055016 * safezoneH;
			onButtonClick = "[(lbCurSel 32001),(ctrlText 32008),0] call sc_trade;";
		};
		class CATBUYSCB:RscShortcutButton
		{
			idc = -1;
			text = "Buy";
			x = 0.350000 * safezoneW + safezoneX;
			y = 0.694111 * safezoneH + safezoneY;//-0.018 - 0.693111
			w = 0.070833 * safezoneW;
			h = 0.055016 * safezoneH;
			onButtonClick = "[(lbCurSel 32003),(ctrlText 32009),1] call sc_trade;";
		};
		class GEAREDIT:RscEdit
		{
			idc = 32008;
			x = 0.679166 * safezoneW + safezoneX;
			y = 0.711111 * safezoneH + safezoneY;
			w = 0.045833 * safezoneW;
			h = 0.022222 * safezoneH;
		};
		class GEARPLUS:RcsButton
		{
			idc = -1;
			text = "+1";
			x = 0.725000 * safezoneW + safezoneX;
			y = 0.711111 * safezoneH + safezoneY;
			w = 0.012500 * safezoneW;
			h = 0.022222 * safezoneH;
			onButtonClick = "if ((ctrlText 32008) == '' || parseNumber (ctrlText 32008) < 1 || parseNumber (ctrlText 32009) > 25) then {ctrlSetText[32008,'1'];systemChat 'Min: 1 Max: 25';}else{ctrlSetText[32008,str(parseNumber(ctrlText 32008) + 1)];};[(lbCurSel 32001),0,(ctrlText 32008)] call sc_showInfo;";
		};
		class GEARMINUS:RcsButton
		{
			idc = -1;
			text = "-1";
			x = 0.666666 * safezoneW + safezoneX;
			y = 0.711111 * safezoneH + safezoneY;
			w = 0.012500 * safezoneW;
			h = 0.022222 * safezoneH;
			onButtonClick = "if ((ctrlText 32008) == '' || parseNumber (ctrlText 32008) < 1 || parseNumber (ctrlText 32009) > 25) then {ctrlSetText[32008,'1'];systemChat 'Min: 1 Max: 25';}else{ctrlSetText[32008,str(parseNumber(ctrlText 32008) - 1)];};[(lbCurSel 32001),0,(ctrlText 32008)] call sc_showInfo;";
		};
		class CATEDIT:RscEdit
		{
			idc = 32009;
			x = 0.275000 * safezoneW + safezoneX;
			y = 0.711111 * safezoneH + safezoneY;
			w = 0.045833 * safezoneW;
			h = 0.022222 * safezoneH;
		};
		class CATPLUS:RcsButton
		{
			idc = -1;
			text = "+1";
			x = 0.320833 * safezoneW + safezoneX;
			y = 0.711111 * safezoneH + safezoneY;
			w = 0.012500 * safezoneW;
			h = 0.022222 * safezoneH;
			onButtonClick = "if ((ctrlText 32009) == '' || parseNumber (ctrlText 32009) < 1 || parseNumber (ctrlText 32009) > 25) then {ctrlSetText[32009,'1'];systemChat 'Min: 1 Max: 25';}else{ctrlSetText[32009,str(parseNumber(ctrlText 32009) + 1)];};[(lbCurSel 32003),1,(ctrlText 32009)] call sc_showInfo;";
		};
		class CATMINUS:RcsButton
		{
			idc = -1;
			text = "-1";
			x = 0.262500 * safezoneW + safezoneX;
			y = 0.711111 * safezoneH + safezoneY;
			w = 0.012500 * safezoneW;
			h = 0.022222 * safezoneH;
			onButtonClick = "if ((ctrlText 32009) == '' || parseNumber (ctrlText 32009) < 1 || parseNumber (ctrlText 32009) > 25) then {ctrlSetText[32009,'1'];systemChat 'Min: 1 Max: 25';}else{ctrlSetText[32009,str(parseNumber(ctrlText 32009) - 1)];};[(lbCurSel 32003),1,(ctrlText 32009)] call sc_showInfo;";
		};
		class EXIT:RcsButton
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