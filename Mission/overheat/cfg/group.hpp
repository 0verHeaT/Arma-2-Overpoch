/*
	Exclusively made for [VG] Servers
	https://vectiongaming.com/

	File: group.hpp
	Description:
	
	Author: 0verHeaT
	https://github.com/0verHeaT
*/
class GroupManagement
{
	idd = 50008;
	movingenable = 0;
	onLoad = "uiNamespace setVariable ['GroupDialog', _this select 0]";
	class Controls {
		class RscTextT_5000800: RscTextT	// Background
		{
			idc = -1;
			x = 0.320833 * safezoneW + safezoneX;
			y = 0.296296 * safezoneH + safezoneY;
			w = 0.358333 * safezoneW;
			h = 0.407407 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscTextT_5000801: RscTextT	// Headline
		{
			idc = -1;
			text = "Group Management";
			x = 0.320833 * safezoneW + safezoneX;
			y = 0.296296 * safezoneH + safezoneY;
			w = 0.358333 * safezoneW;
			h = 0.051851 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscListbox_5000802: RscListbox	//Listbox all players
		{
			idc = 5800;
			x = 0.341666 * safezoneW + safezoneX;
			y = 0.400000 * safezoneH + safezoneY;
			w = 0.116666 * safezoneW;
			h = 0.222222 * safezoneH;
			colorBackground[] = {0,0,0,0.1};
			onLBSelChanged = "call group_selectChange;";
		};
		class RscListbox_5000803: RscListbox	//Listbox players in group
		{
			idc = 5801;
			x = 0.541666 * safezoneW + safezoneX;
			y = 0.400000 * safezoneH + safezoneY;
			w = 0.116666 * safezoneW;
			h = 0.222222 * safezoneH;
			colorBackground[] = {0,0,0,0.1};
		};
		class RscStructuredText_5000804: RscStructuredText //all players info
		{
			idc = 5802;
			x = 0.341666 * safezoneW + safezoneX;
			y = 0.362962 * safezoneH + safezoneY;
			w = 0.116666 * safezoneW;
			h = 0.029629 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class RscStructuredText_5000805: RscStructuredText // players in group INFO
		{
			idc = 5803;
			x = 0.541666 * safezoneW + safezoneX;
			y = 0.362962 * safezoneH + safezoneY;
			w = 0.116666 * safezoneW;
			h = 0.029629 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class RscStructuredText_5000806: RscStructuredText // players invite INFO
		{
			idc = 5804;
			x = 0.420833 * safezoneW + safezoneX;
			y = 0.637037 * safezoneH + safezoneY;
			w = 0.112500 * safezoneW;
			h = 0.044444 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class RscShortcutButton_5000807: RscShortcutButton
		{
			idc = -1;
			text = "Close";
			x = 0.341666 * safezoneW + safezoneX;
			y = 0.651851 * safezoneH + safezoneY;
			w = 0.070833 * safezoneW;
			h = 0.055016 * safezoneH;
			onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 9000);";
		};
		class RcsButton_5000809: RcsButton
		{
			idc = 5805;
			text = "Accept";
			x = 0.541666 * safezoneW + safezoneX;
			y = 0.644444 * safezoneH + safezoneY;
			w = 0.050000 * safezoneW;
			h = 0.029629 * safezoneH;
			onButtonClick = "call group_acceptInvite;";
		};
		class RcsButton_5000810: RcsButton
		{
			idc = 5806;
			text = "Decline";
			x = 0.608333 * safezoneW + safezoneX;
			y = 0.644444 * safezoneH + safezoneY;
			w = 0.050000 * safezoneW;
			h = 0.029629 * safezoneH;
			onButtonClick = "call group_declineInvite;";
		};
		class RcsButton_5000811: RcsButton
		{
			idc = 5807;
			text = "Disband";
			x = 0.475000 * safezoneW + safezoneX;
			y = 0.407407 * safezoneH + safezoneY;
			w = 0.050000 * safezoneW;
			h = 0.029629 * safezoneH;
			onButtonClick = "call group_disband;";
		};
		class RcsButton_5000812: RcsButton
		{
			idc = 5808;
			text = "Kick";
			x = 0.475000 * safezoneW + safezoneX;
			y = 0.466666 * safezoneH + safezoneY;
			w = 0.050000 * safezoneW;
			h = 0.029629 * safezoneH;
			onButtonClick = "call group_kick;";
		};
		class RcsButton_5000813: RcsButton
		{
			idc = 5809;
			text = "Invite";
			x = 0.475000 * safezoneW + safezoneX;
			y = 0.525925 * safezoneH + safezoneY;
			w = 0.050000 * safezoneW;
			h = 0.029629 * safezoneH;
			onButtonClick = "call group_inviteToGroup;";
		};
		class RcsButton_5000814: RcsButton
		{
			idc = 5810;
			text = "Leave";
			x = 0.475000 * safezoneW + safezoneX;
			y = 0.585185 * safezoneH + safezoneY;
			w = 0.050000 * safezoneW;
			h = 0.029629 * safezoneH;
			onButtonClick = "call group_leave;";
		};
	};
};