/*
	Exclusively made for [VG] Servers
	https://vectiongaming.com/

	File: RcsTitles.hpp
	Description:
	
	Author: 0verHeaT
	https://github.com/0verHeaT
*/
class RscTitles 
{
	#include "icons.hpp"
	class VgCoinDisplay 
	{
		idd = -1;
		fadeout = 0;
		fadein = 0;
		duration = 20;
		name= "VgCoinDisplay";
		onLoad = "uiNamespace setVariable ['VgCoinDisplay', _this select 0]";
		class controlsBackground 
		{
			class CoinDisplay_Status:Hw_RscText 
			{
				idc = 4900;
				type = CT_STRUCTURED_TEXT;
				size = 0.040;
				x = 0.90 * safezoneW + safezoneX;
				y = 0.55 * safezoneH + safezoneY;
				w = 0.20; 
				h = 0.20;
				colorText[] = {1,1,1,1};
				lineSpacing = 3;
				colorBackground[] = {0,0,0,0};
				text = "";
				shadow = 2;
				class Attributes 
				{
					align = "right";
				};
			};
		};
	};
	class VgStats
	{
		idd = -1;
		fadeout = 1;
		fadein =1;
		duration = 10e10;
		name= "VgStatsDisplay";
		onLoad = "uiNamespace setVariable ['VgStatsDisplay', _this select 0]";
		class controlsBackground 
		{
			class RscTextT_VgStatsDisplay: RscTextT
			{
				idc = -1;
				x = 0.868750 * safezoneW + safezoneX;
				y = 0.081481 * safezoneH + safezoneY;
				w = 0.116666 * safezoneW;
				h = 0.270370 * safezoneH;
				colorBackground[] = {0,0,0,0.7};
			};
			class RscTextUI_VgStatsDisplay:RscTextUI 
			{
				idc = 10001;
				x = 0.870833 * safezoneW + safezoneX;
				y = 0.081481 * safezoneH + safezoneY;
				w = 0.112500 * safezoneW;
				h = 0.266666 * safezoneH;
				colorBackground[] = {0,0,0,0};
			};
		};
	};
	class VgLogo
	{
		idd = -1;
		fadeout = 0;
		fadein = 0;
		duration = 10e10;
		class controlsBackground
		{
			class VgLogoDisplay:RscPictureUI
			{
				idc = -1;
				text = "overheat\GUI\logo.paa";
				x = 0.008333 * safezoneW + safezoneX;
				y = 0.933333 * safezoneH + safezoneY;
				w = 0.029166 * safezoneW;
				h = 0.051851 * safezoneH;
			};
			
		};
	};
};

/*
class RscTextT_VgStatsDisplay: RscTextT
{
	idc = -1;
	x = 0.868750 * safezoneW + safezoneX;
	y = 0.066666 * safezoneH + safezoneY;
	w = 0.116666 * safezoneW;
	h = 0.300000 * safezoneH;
	colorBackground[] = {0,0,0,0.7};
};
class RscTextUI_VgStatsDisplay:RscTextUI 
{
	idc = 10001;
	x = 0.870833 * safezoneW + safezoneX;
	y = 0.066666 * safezoneH + safezoneY;
	w = 0.112500 * safezoneW;
	h = 0.296296 * safezoneH;
	colorBackground[] = {0,0,0,0};
};
*/