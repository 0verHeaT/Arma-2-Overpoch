///////////////////////////////////////////////////////////////////////////
/// Styles
///////////////////////////////////////////////////////////////////////////

// Control types
#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define CT_SLIDER           3
#define CT_COMBO            4
#define CT_LISTBOX          5
#define CT_TOOLBOX          6
#define CT_CHECKBOXES       7
#define CT_PROGRESS         8
#define CT_HTML             9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT       11
#define CT_TREE             12
#define CT_STRUCTURED_TEXT  13
#define CT_CONTEXT_MENU     14
#define CT_CONTROLS_GROUP   15
#define CT_SHORTCUTBUTTON   16
#define CT_XKEYDESC         40
#define CT_XBUTTON          41
#define CT_XLISTBOX         42
#define CT_XSLIDER          43
#define CT_XCOMBO           44
#define CT_ANIMATED_TEXTURE 45
#define CT_OBJECT           80
#define CT_OBJECT_ZOOM      81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK        98
#define CT_USER             99
#define CT_MAP              100
#define CT_MAP_MAIN         101
#define CT_LISTNBOX         102

// Static styles
#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0C

#define ST_TYPE           0xF0
#define ST_SINGLE         0x00
#define ST_MULTI          0x10
#define ST_TITLE_BAR      0x20
#define ST_PICTURE        0x30
#define ST_FRAME          0x40
#define ST_BACKGROUND     0x50
#define ST_GROUP_BOX      0x60
#define ST_GROUP_BOX2     0x70
#define ST_HUD_BACKGROUND 0x80
#define ST_TILE_PICTURE   0x90
#define ST_WITH_RECT      0xA0
#define ST_LINE           0xB0

#define ST_SHADOW         0x100
#define ST_NO_RECT        0x200
#define ST_KEEP_ASPECT_RATIO  0x800

#define ST_TITLE          ST_TITLE_BAR + ST_CENTER

// Slider styles
#define SL_DIR            0x400
#define SL_VERT           0
#define SL_HORZ           0x400

#define SL_TEXTURES       0x10

// progress bar 
#define ST_VERTICAL       0x01
#define ST_HORIZONTAL     0

// Listbox styles
#define LB_TEXTURES       0x10
#define LB_MULTI          0x20

// Tree styles
#define TR_SHOWROOT       1
#define TR_AUTOCOLLAPSE   2

// MessageBox styles
#define MB_BUTTON_OK      1
#define MB_BUTTON_CANCEL  2
#define MB_BUTTON_USER    4


class RscFrame
{
	type = 0;
	idc = -1;
	style = 64;
	shadow = 2;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	font = "Zeppelin32";
	SizeEx = 0.02156 * safezoneH;
	text = "";
};
class RscProgressF
{
	type = 8;
	style = 0;
	colorFrame[] = {1,1,1,1};
	colorBar[] = {1,1,1,0.5};
	texture = "#(argb,8,8,3)color(1,1,1,1)";
	w = 1;
	h = 0.02;
};

class RscProgressUI
{
	type = 8;
	style = 0;
	colorFrame[] = {0,0,0,1};
	w = 1;
	h = 0.03;
	//?
	
};
class RscTextUI
{
	access = 0;
	type = 13;
	idc = -1;
	style = 0;
	colorText[] = {1,1,1,1};
	class Attributes
	{
		font = "Zeppelin32";
		color = "#ffffff";
		align = "center";
		shadow = 2;
	};
	x = 0;
	y = 0;
	h = 0.035;
	w = 0.1;
	text = "";
	//size = 0.025;
	size = 0.01375 * safezoneH;
	shadow = 2;
};
class RscPictureUI 
{
	access = 0;
	type = 0;
	idc = -1;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	font = "Zeppelin33";
	SizeEx = 0.02156 * safezoneH;
	lineSpacing = 0;
	text = "";
	style = "0x30 + 0x100";
	x = 0;
	y = 0;
	w = 0.2;
	h = 0.15;
};

class VGRscText
{
	access = 0;
	type = 0;
	idc = -1;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	text = "";
	fixedWidth = 0;
	x = 0;
	y = 0;
	h = 0.037;
	w = 0.3;
	style = 0;
	shadow = 2;
	font = "Zeppelin32";
	SizeEx = 0.02156 * safezoneH;
	//SizeEx = 0.03921;
};

class VGRscShortcutButton 
{
	idc = -1;
	type = 16;
	style = 0;
	default = 0;
	shadow = 1;
	w = 0.183825;
	h = "((((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
	color[] = {1,1,1,1.0};
	colorText[] = {1,1,1,1};
	colorFocused[] = {1,1,1,1.0};
	color2[] = {0.95,0.95,0.95,1};
	colorDisabled[] = {1,1,1,0.25};
	colorBackground[] = {0,0,0,0.7};
	colorBackgroundFocused[] = {1,1,1,1};
	colorBackground2[] = {1,1,1,1};
	animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureDisabled = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
	animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
	periodFocus = 1.2;
	periodOver = 0.8;
	class HitZone
	{
		left = 0.0;
		top = 0.0;
		right = 0.0;
		bottom = 0.0;
	};
	class ShortcutPos
	{
		left = 0;
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		w = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
		h = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	};
	class TextPos
	{
		left = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		right = 0.005;
		bottom = 0.0;
	};
	period = 0.4;
	font = "Zeppelin32";
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	text = "";
	action = "";
	class Attributes
	{
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "left";
		shadow = "true";
	};
	class AttributesImage
	{
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "left";
	};
	
	soundPush[] = { "", 0, 1 };
	soundEnter[] =	{ "", 0, 1 };
	soundClick[] ={ "", 0, 1 };
	soundEscape[] ={ "", 0, 1 };
	sound[] ={ "", 0, 1 };
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	textureNoShortcut = "";
};

/////////////

class RscTextT
{
	access = 0;
	type = 0;
	idc = -1;
	colorBackground[] = {0,0,0,0};
	colorText[] = {0.8784,0.8471,0.651,1};
	text = "";
	fixedWidth = 0;
	x = 0;
	y = 0;
	h = 0.037;
	w = 0.3;
	style = 0;
	shadow = 2;
	font = "Zeppelin32";
	SizeEx = 0.02156 * safezoneH;
	//SizeEx = 0.03921;
};
class RscEdit
{
	access = 0;
	type = 2;
	x = 0;
	y = 0;
	h = 0.04;
	w = 0.2;
	colorBackground[] = {0,0,0,1};
	colorText[] = {0.95,0.95,0.95,1};
	colorSelection[] = {0.8784,0.8471,0.651,1};
	autocomplete = "";
	text = "";
	size = 0.2;
	style = "0x00 + 0x40";
	font = "Zeppelin32";
	shadow = 2;
	sizeEx = 0.03921;
};
class RscListBox
{
	access = 0;
	type = 5;
	w = 0.4;
	h = 0.4;
	rowHeight = 0;
	colorText[] = {0.8784,0.8471,0.651,1};
	colorScrollbar[] = {0.95,0.95,0.95,1};
	colorSelect[] = {0.95,0.95,0.95,1};
	colorSelect2[] = {0.95,0.95,0.95,1};
	colorSelectBackground[] = {0,0,0,1};
	colorSelectBackground2[] = {0.8784,0.8471,0.651,1};
	colorBackground[] = {0,0,0,1};
	soundSelect[] = {"",0.1,1};
	arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
	arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
	class ScrollBar
	{
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		shadow = 0;
		thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
		border = "\ca\ui\data\ui_border_scroll_ca.paa";
	};
	style = 16;
	font = "Zeppelin32";
	shadow = 2;
	SizeEx = 0.02156 * safezoneH;
	//sizeEx = 0.03921;
	color[] = {1,1,1,1};
	period = 1.2;
	maxHistoryDelay = 1;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
};
class RscCombo {
	style = 16;
	type = 4;
	x = 0;
	y = 0;
	w = 0.12;
	h = 0.035;
	shadow = 0;
	soundExpand[] = {"",0.1,1};
	colorText[] = {0.8784,0.8471,0.651,1};
	soundCollapse[] = {"",0.1,1};
	maxHistoryDelay = 1;
	colorBackground[] = {0,0,0,0.7};
	colorSelect[] = {0.95,0.95,0.95,1};
	colorSelect2[] = {0.95,0.95,0.95,1};
	colorSelectBackground[] = {0,0,0,1};
	colorSelectBackground2[] = {0.8784,0.8471,0.651,1};
	//colow_Rscrollbar[] = {1, 1, 1, 1};
	soundSelect[] = {"",0.1,1};
	arrowEmpty = "\ca\ui\data\ui_arrow_combo_ca.paa";
	arrowFull = "\ca\ui\data\ui_arrow_combo_active_ca.paa";
	wholeHeight = 10 * 0.02156 * safezoneH;
	color[] = {1,1,1,1};
	colorActive[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.25};
	font = "Zeppelin32";
	sizeEx = 0.02156 * safezoneH;
	class ScrollBar
	{
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
		border = "\ca\ui\data\ui_border_scroll_ca.paa";
		shadow = 0;
		scrollSpeed = 0.06;
		width = 0;
		height = 0;
		autoScrollEnabled = 1;
		autoScrollSpeed = -1;
		autoScrollDelay = 5;
		autoScrollRewind = 0;
	};
};
/*
class RscCombo
{
	access = 0;
	type = CT_COMBO;
	style = ST_LEFT;
	h = 0.05;
	rowHeight = 0;
	wholeHeight = 0; // Hight of the final box
	colorSelect[] = {0.6,0.6,0.6,1};
	colorText[] = {0.8784,0.8471,0.651,1};
	colorBackground[] = {0,0,0,1};
	colorScrollbar[] = {0.95,0.95,0.95,1};
	font = "Zeppelin32";
	sizeEx = 0.02156 * safezoneH;
	soundSelect[] = {"",0.1,1};
	soundExpand[] = {"",0.1,1};
	soundCollapse[] = {"",0.1,1};
	maxHistoryDelay = 1.0;
	shadow = 0;
	arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
	arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
	class ScrollBar
	{
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		shadow = 0;
		thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
		border = "\ca\ui\data\ui_border_scroll_ca.paa";
	};
};
*/
class RscShortcutButton
{
	type = 16;
	x = 0.1;
	y = 0.1;
	class HitZone
	{
		left = 0.004;
		top = 0.029;
		right = 0.004;
		bottom = 0.029;
	};
	class ShortcutPos
	{
		left = 0.0145;
		top = 0.026;
		w = 0.0392157;
		h = 0.0522876;
	};
	class TextPos
	{
		left = 0.0275 * safezoneH;
		top = 0.018 * safezoneH;
		right = 0.005;
		bottom = 0.005;
	};
	shortcuts[] = {};
	textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
	color[] = {0.8784,0.8471,0.651,1};
	color2[] = {0.95,0.95,0.95,1};
	colorDisabled[] = {1,1,1,0.25};
	colorBackground[] = {1,1,1,1};
	colorBackground2[] = {1,1,1,0.4};
	class Attributes
	{
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "left";
		shadow = "true";
	};
	idc = -1;
	style = 0;
	default = 0;
	shadow = 2;
	w = 0.183825;
	h = 0.104575;
	periodFocus = 1.2;
	periodOver = 0.8;
	animTextureNormal = "\ca\ui\data\ui_button_normal_ca.paa";
	animTextureDisabled = "\ca\ui\data\ui_button_disabled_ca.paa";
	animTextureOver = "\ca\ui\data\ui_button_over_ca.paa";
	animTextureFocused = "\ca\ui\data\ui_button_focus_ca.paa";
	animTexturePressed = "\ca\ui\data\ui_button_down_ca.paa";
	animTextureDefault = "\ca\ui\data\ui_button_default_ca.paa";
	period = 0.4;
	font = "Zeppelin32";
	size = 0.02156 * safezoneH;
	SizeEx = 0.02156 * safezoneH;
	//sizeEx = 0.03921;
	text = "";
	soundEnter[] = {"\ca\ui\data\sound\onover",0.09,1};
	soundPush[] = {"\ca\ui\data\sound\new1",0,0};
	soundClick[] = {"\ca\ui\data\sound\onclick",0.07,1};
	soundEscape[] = {"\ca\ui\data\sound\onescape",0.09,1};
	action = "";
	class AttributesImage
	{
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "left";
	};
};
class RscStructuredText
{
	access = 0;
	type = 13;
	idc = -1;
	style = 0;
	colorText[] = {0.8784,0.8471,0.651,1};
	class Attributes
	{
		font = "Zeppelin32";
		color = "#e0d8a6";
		align = "center";
		shadow = 1;
	};
	x = 0;
	y = 0;
	h = 0.035;
	w = 0.1;
	text = "";
	size = 0.02156 * safezoneH;
	//size = 0.03921;
	shadow = 2;
};
///////////////////////
class RcsButton
{
    
    access = 0;
    type = 1;
    text = "";
    colorText[] = {0.9,0.9,0.9,1};
    colorDisabled[] = {1,1,1,1};//{0.4,0.4,0.4,0};
    colorBackground[] = {0,0,0,1};
    colorBackgroundDisabled[] = {0,0,0,0};
    colorBackgroundActive[] = {0.4,0.4,0.4,0.5};
    colorFocused[] = {0,0,0,0.2};
    colorShadow[] = {0.023529,0,0.0313725,0};
    colorBorder[] = {0.023529,0,0.0313725,1};
    soundEnter[] = {"\ca\ui\data\sound\onover",0.09,1};
    soundPush[] = {"\ca\ui\data\sound\new1",0,0};
    soundClick[] = {"\ca\ui\data\sound\onclick",0.07,1};
    soundEscape[] = {"\ca\ui\data\sound\onescape",0.09,1};
    style = 2;
    x = 0;
    y = 0;
    w = 0.055589;
    h = 0.039216;
    shadow = 2;
    font = "Zeppelin32";
    sizeEx = 0.02156 * safezoneH;
    offsetX = 0;
    offsetY = 0;
    offsetPressedX = 0.002;
    offsetPressedY = 0.002;
    borderSize = 0;
	period = 1.2;
	periodFocus = 1.2;
	periodOver = 1.2;
};