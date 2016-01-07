/*** Created by 0verHeaT ***/
class SettingsDialog
{
	idd = 50000;
	movingenable = 0;
	onLoad = "uiNamespace setVariable ['SettingsDialog', _this select 0]";
	
	class Controls 
	{
		class RscText_50000: RscTextT
		{
			idc = -1;
			x = 0.266666 * safezoneW + safezoneX;
			y = 0.277777 * safezoneH + safezoneY;
			w = 0.466666 * safezoneW;
			h = 0.462962 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscTextT_50001: VGRscText
		{
			idc = -1;
			text = "Welcome to VectionGaming";
			x = 0.266666 * safezoneW + safezoneX;
			y = 0.251851 * safezoneH + safezoneY;
			w = 0.466666 * safezoneW;
			h = 0.022222 * safezoneH;
			colorBackground[] = {0.7,0.1,0.1,0.7};
		};
		class RscStructuredText_50002: RscStructuredText //view_distancedisplay
		{
			idc = 5101;
			x = 0.281250 * safezoneW + safezoneX;
			y = 0.651851 * safezoneH + safezoneY;
			w = 0.437500 * safezoneW;
			h = 0.025925 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class RscStructuredText_50003: RscStructuredText //playerinfo
		{
			idc = 5102;
			x = 0.281250 * safezoneW + safezoneX;
			y = 0.337037 * safezoneH + safezoneY;
			w = 0.214583 * safezoneW;
			h = 0.218518 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class RscStructuredText_50004: RscStructuredText //serverinfo
		{
			idc = 5103;
			x = 0.504166 * safezoneW + safezoneX;
			y = 0.337037 * safezoneH + safezoneY;
			w = 0.214583 * safezoneW;
			h = 0.218518 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class RscStructuredText_50005: RscStructuredText //infobox
		{
			idc = 5104;
			x = 0.275000 * safezoneW + safezoneX;
			y = 0.292592 * safezoneH + safezoneY;
			w = 0.450000 * safezoneW;
			h = 0.433333 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};	
		class RscStructuredText_50006: RscStructuredText //admininfo
		{
			idc = 5105;
			x = 0.281250 * safezoneW + safezoneX;
			y = 0.570370 * safezoneH + safezoneY;
			w = 0.437500 * safezoneW;
			h = 0.025925 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};	
		class RscSlider_50007
		{
			idc = 5106;
			x = 0.281250 * safezoneW + safezoneX;
			y = 0.692592 * safezoneH + safezoneY;
			w = 0.364583 * safezoneW;
			h = 0.022222 * safezoneH;
			type = CT_SLIDER;
			style = SL_HORZ;
			color[] = {1,1,1,0.5}; 
			coloractive[] = {1,1,1,1};
			onSliderPosChanged = "call client_viewDistanceUpdate";
		};
		class RscEdit_50008:RscEdit
		{
			idc = 5107;
			x = 0.281250 * safezoneW + safezoneX;
			y = 0.611111 * safezoneH + safezoneY;
			w = 0.364583 * safezoneW;
			h = 0.022222 * safezoneH;
		};
		class RscButtonMenu_50009:VGRscShortcutButton
		{
			idc = -1;
			text = "Rules";
			x = 0.266666 * safezoneW + safezoneX;
			y = 0.744444 * safezoneH + safezoneY;
			w = 0.066666 * safezoneW;
			h = 0.022222 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
			onButtonClick = "call client_rules";
		};
		class RscButtonMenu_50010:VGRscShortcutButton
		{
			idc = -1;
			text = "Killboard";
			x = 0.339583 * safezoneW + safezoneX;
			y = 0.744444 * safezoneH + safezoneY;
			w = 0.066666 * safezoneW;
			h = 0.022222 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
			onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 9000); [] execVM 'overheat\actions\list_playerDeaths.sqf';";
		};
		class RscButtonMenu_50011:VGRscShortcutButton
		{
			idc = -1;
			text = "Close";
			x = 0.666666 * safezoneW + safezoneX;
			y = 0.744444 * safezoneH + safezoneY;
			w = 0.066666 * safezoneW;
			h = 0.022222 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
			onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 9000)";
		};	
		class RscButtonMenu_50012:VGRscShortcutButton
		{
			idc = 5108;
			text = "Set";
			x = 0.652083 * safezoneW + safezoneX;
			y = 0.692592 * safezoneH + safezoneY;
			w = 0.066666 * safezoneW;
			h = 0.022222 * safezoneH;
			colorBackground[] = {0.7,0.1,0.1,0.5};
			onButtonClick = "call client_setViewDistance;((ctrlParent (_this select 0)) closeDisplay 9000);";
		};	
		class RscButtonMenu_50013:VGRscShortcutButton
		{
			idc = 5109;
			text = "Request";
			x = 0.652083 * safezoneW + safezoneX;
			y = 0.611111 * safezoneH + safezoneY;
			w = 0.066666 * safezoneW;
			h = 0.022222 * safezoneH;
			colorBackground[] = {0.7,0.1,0.1,0.5};
			onButtonClick = "[(ctrlText 5107)] call client_requestAdmin;((ctrlParent (_this select 0)) closeDisplay 9000);";
		};	
	};
};