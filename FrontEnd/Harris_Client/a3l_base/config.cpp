////////////////////////////////////////////////////////////////////
//DeRap: a3l_base\config.bin
//Produced from mikero's Dos Tools Dll version 6.44
//'now' is Wed Jan 09 20:55:08 2019 : 'file' last modified on Tue Apr 18 07:03:27 2017
//http://dev-heaven.net/projects/list_files/mikero-pbodll
////////////////////////////////////////////////////////////////////

#define _ARMA_

class RscText
{
	access = 0;
	type = 0;
	idc = -1;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	text = "";
	fixedWidth = 0;
	colorShadow[] = {0,0,0,0.5};
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	x = 0;
	y = 0;
	h = 0.037;
	w = 0.3;
	style = 0;
	shadow = 1;
	font = "EtelkaNarrowMediumPro";
	SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	linespacing = 1;
};
class RscStructuredText
{
	colorText[] = {0.543,0.5742,0.4102,1};
	class Attributes
	{
		font = "EtelkaNarrowMediumPro";
		color = "#99D678";
		align = "center";
		shadow = 1;
	};
	shadow = 1;
	access = 1;
	type = 13;
	font = "EtelkaNarrowMediumPro";
	idc = -1;
	style = 0;
	x = 0;
	y = 0;
	h = 0.035;
	w = 0.1;
	text = "";
	size = 0.03921;
};
class RscPicture
{
	access = 0;
	type = 0;
	idc = -1;
	style = 48;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	font = "TahomaB";
	sizeEx = 0;
	lineSpacing = 0;
	text = "";
	fixedWidth = 0;
	shadow = 0;
	x = 0;
	y = 0;
	w = 0.2;
	h = 0.15;
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
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
	colorDisabled[] = {1,1,1,0.25};
	colorSelection[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
	autocomplete = "";
	text = "";
	size = 0.2;
	style = "0x00 + 0x40";
	font = "PuristaMedium";
	shadow = 2;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	canModify = 1;
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
};
class RscCombo
{
	access = 0;
	type = 4;
	colorSelect[] = {0,0,0,1};
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,1};
	colorScrollbar[] = {1,0,0,1};
	soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1};
	soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1};
	soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1};
	maxHistoryDelay = 1;
	class ComboScrollBar
	{
		color[] = {1,1,1,1};
	};
	style = "0x10 + 0x200";
	x = 0;
	y = 0;
	w = 0.12;
	h = 0.035;
	shadow = 0;
	colorSelectBackground[] = {1,1,1,0.7};
	arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
	arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
	wholeHeight = 0.45;
	colorActive[] = {1,0,0,1};
	colorDisabled[] = {1,1,1,0.25};
	font = "PuristaMedium";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
};
class RscListBox
{
	access = 0;
	type = 5;
	w = 0.4;
	h = 0.4;
	rowHeight = 0;
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.25};
	colorScrollbar[] = {1,0,0,0};
	colorSelect[] = {0,0,0,1};
	colorSelect2[] = {0,0,0,1};
	colorSelectBackground[] = {0.95,0.95,0.95,1};
	colorSelectBackground2[] = {1,1,1,0.5};
	colorBackground[] = {0,0,0,0.3};
	soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1};
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
	arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
	class ListScrollBar
	{
		color[] = {1,1,1,1};
		autoScrollEnabled = 1;
	};
	style = 16;
	font = "PuristaMedium";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	shadow = 0;
	colorShadow[] = {0,0,0,0.5};
	period = 1.2;
	maxHistoryDelay = 1;
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
};
class RscButton
{
	access = 0;
	type = 1;
	text = "";
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.25};
	colorBackground[] = {0,0,0,0.5};
	colorBackgroundDisabled[] = {0,0,0,0.5};
	colorBackgroundActive[] = {0,0,0,1};
	colorFocused[] = {0,0,0,1};
	colorShadow[] = {0,0,0,0};
	colorBorder[] = {0,0,0,1};
	soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
	soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
	soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
	soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
	style = 2;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	shadow = 2;
	font = "PuristaMedium";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	borderSize = 0;
	offsetX = 0;
	offsetY = 0;
	offsetPressedX = 0;
	offsetPressedY = 0;
	period = 1.2;
	periodFocus = 1.2;
	periodOver = 1.2;
};
class RscShortcutButton
{
	type = 16;
	x = 0.1;
	y = 0.1;
	class HitZone
	{
		left = 0;
		top = 0;
		right = 0;
		bottom = 0;
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
		bottom = 0;
	};
	shortcuts[] = {};
	textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
	color[] = {1,1,1,1};
	colorFocused[] = {1,1,1,1};
	color2[] = {0.95,0.95,0.95,1};
	colorDisabled[] = {1,1,1,0.25};
	colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
	colorBackgroundFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
	colorBackground2[] = {1,1,1,1};
	soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
	soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
	soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
	soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
	class Attributes
	{
		font = "PuristaMedium";
		color = "#E5E5E5";
		align = "left";
		shadow = "true";
	};
	idc = -1;
	style = 0;
	default = 0;
	shadow = 1;
	w = 0.183825;
	h = "((((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
	animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
	animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
	animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";
	periodFocus = 1.2;
	periodOver = 0.8;
	period = 0.4;
	font = "PuristaMedium";
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	text = "";
	action = "";
	class AttributesImage
	{
		font = "PuristaMedium";
		color = "#E5E5E5";
		align = "left";
	};
};
class RscShortcutButtonMain
{
	idc = -1;
	style = 0;
	default = 0;
	w = 0.313726;
	h = 0.104575;
	color[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.25};
	class HitZone
	{
		left = 0;
		top = 0;
		right = 0;
		bottom = 0;
	};
	class ShortcutPos
	{
		left = 0.0145;
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)) / 2";
		w = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2) * (3/4)";
		h = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
	};
	class TextPos
	{
		left = "(((safezoneW / safezoneH) min 1.2) / 32) * 1.5";
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20)*2 - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)) / 2";
		right = 0.005;
		bottom = 0;
	};
	animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\normal_ca.paa";
	animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\disabled_ca.paa";
	animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\over_ca.paa";
	animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\focus_ca.paa";
	animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\down_ca.paa";
	animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\normal_ca.paa";
	period = 0.5;
	font = "PuristaMedium";
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
	text = "";
	action = "";
	class Attributes
	{
		font = "PuristaMedium";
		color = "#E5E5E5";
		align = "left";
		shadow = "false";
	};
	class AttributesImage
	{
		font = "PuristaMedium";
		color = "#E5E5E5";
		align = "false";
	};
};
class RscFrame
{
	type = 0;
	idc = -1;
	style = 64;
	shadow = 2;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	font = "PuristaMedium";
	sizeEx = 0.02;
	text = "";
};
class RscSlider
{
	access = 0;
	type = 3;
	style = 1024;
	w = 0.3;
	color[] = {1,1,1,0.8};
	colorActive[] = {1,1,1,1};
	shadow = 0;
	h = 0.025;
};
class IGUIBack
{
	type = 0;
	idc = 124;
	style = 128;
	text = "";
	colorText[] = {0,0,0,0};
	font = "PuristaMedium";
	sizeEx = 0;
	shadow = 0;
	x = 0.1;
	y = 0.1;
	w = 0.1;
	h = 0.1;
	colorbackground[] = {"(profilenamespace getvariable ['IGUI_BCG_RGB_R',0])","(profilenamespace getvariable ['IGUI_BCG_RGB_G',1])","(profilenamespace getvariable ['IGUI_BCG_RGB_B',1])","(profilenamespace getvariable ['IGUI_BCG_RGB_A',0.8])"};
};
class RscCheckBox
{
	idc = -1;
	type = 77;
	style = 0;
	checked = 0;
	x = "0.375 * safezoneW + safezoneX";
	y = "0.36 * safezoneH + safezoneY";
	w = "0.025 * safezoneW";
	h = "0.04 * safezoneH";
	color[] = {1,1,1,0.7};
	colorFocused[] = {1,1,1,1};
	colorHover[] = {1,1,1,1};
	colorPressed[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.2};
	colorBackground[] = {0,0,0,0};
	colorBackgroundFocused[] = {0,0,0,0};
	colorBackgroundHover[] = {0,0,0,0};
	colorBackgroundPressed[] = {0,0,0,0};
	colorBackgroundDisabled[] = {0,0,0,0};
	textureChecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	textureUnchecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	textureFocusedChecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	textureFocusedUnchecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	textureHoverChecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	textureHoverUnchecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	texturePressedChecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	texturePressedUnchecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	textureDisabledChecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	textureDisabledUnchecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	soundEnter[] = {"",0.1,1};
	soundPush[] = {"",0.1,1};
	soundClick[] = {"",0.1,1};
	soundEscape[] = {"",0.1,1};
};
class RscTextCheckBox
{
	idc = -1;
	type = 7;
	style = 0;
	x = "LINE_X(XVAL)";
	y = "LINE_Y";
	w = "LINE_W(WVAL)";
	h = 0.029412;
	colorText[] = {1,0,0,1};
	color[] = {0,0,0,0};
	colorBackground[] = {0,0,1,1};
	colorTextSelect[] = {0,0.8,0,1};
	colorSelectedBg[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
	colorSelect[] = {0,0,0,1};
	colorTextDisable[] = {0.4,0.4,0.4,1};
	colorDisable[] = {0.4,0.4,0.4,1};
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	font = "PuristaMedium";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	rows = 1;
	columns = 1;
	strings[] = {"UNCHECKED"};
	checked_strings[] = {"CHECKED"};
};
class RscButtonMenu
{
	idc = -1;
	type = 16;
	style = "0x02 + 0xC0";
	default = 0;
	shadow = 0;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureDisabled = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
	animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
	colorBackground[] = {0,0,0,0.8};
	colorBackgroundFocused[] = {1,1,1,1};
	colorBackground2[] = {0.75,0.75,0.75,1};
	color[] = {1,1,1,1};
	colorFocused[] = {0,0,0,1};
	color2[] = {0,0,0,1};
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.25};
	period = 1.2;
	periodFocus = 1.2;
	periodOver = 1.2;
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	class TextPos
	{
		left = "0.25 * (((safezoneW / safezoneH) min 1.2) / 40)";
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		right = 0.005;
		bottom = 0;
	};
	class Attributes
	{
		font = "PuristaLight";
		color = "#E5E5E5";
		align = "left";
		shadow = "false";
	};
	class ShortcutPos
	{
		left = "(6.25 * (((safezoneW / safezoneH) min 1.2) / 40)) - 0.0225 - 0.005";
		top = 0.005;
		w = 0.0225;
		h = 0.03;
	};
	soundEnter[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",0.09,1};
	soundPush[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundPush",0.09,1};
	soundClick[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundClick",0.09,1};
	soundEscape[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",0.09,1};
};
class RscButtonMenuOK
{
	idc = 1;
	shortcuts[] = {"0x00050000 + 0",28,57,156};
	default = 1;
	text = "OK";
	soundPush[] = {"\A3\ui_f\data\sound\RscButtonMenuOK\soundPush",0.09,1};
};
class RscButtonMenuCancel
{
	idc = 2;
	shortcuts[] = {"0x00050000 + 1"};
	text = "Cancel";
};
class RscControlsGroup
{
	class VScrollbar
	{
		color[] = {1,1,1,1};
		width = 0.021;
		autoScrollEnabled = 1;
	};
	class HScrollbar
	{
		color[] = {1,1,1,1};
		height = 0.028;
	};
	class Controls{};
	type = 15;
	idc = -1;
	x = 0;
	y = 0;
	w = 1;
	h = 1;
	shadow = 0;
	style = 16;
};
class RscIGText: RscText
{
	access = 0;
	h = 0.04;
	colorText[] = {0.8,0.8,0.8,1};
	font = "TahomaB";
	sizeEx = 0.024;
	style = "0x00 + 0x100";
};
class RscHitZones
{
	type = 17;
	style = 0;
	shadow = 0;
	x = 0;
	y = 0;
	w = 0;
	h = 0;
	xCount = 0;
	yCount = 0;
	xSpace = 0;
	ySpace = 0;
};
class RscProgress
{
	access = 0;
	type = 8;
	style = 0;
	colorFrame[] = {1,1,1,1};
	colorBar[] = {1,1,1,1};
	texture = "#(argb,8,8,3)color(1,1,1,1)";
	w = 1.2;
	h = 0.03;
	shadow = 0;
};
class RscIGProgress: RscProgress
{
	style = 0;
	h = 0.018;
	colorFrame[] = {0.8,0.8,0.8,0.75};
	colorBar[] = {0.8,0.8,0.8,0.5};
	texture = "#(argb,8,8,3)color(0,1,0,1)";
};
class RscPictureKeepAspect: RscPicture
{
	style = "0x30 + 0x800";
};
class CfgPatches
{
	class A3L_Base
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_Data_F"};
	};
};
class RscInGameUI
{
	access = 0;
	colorReady[] = {0.5,0.85,0.5,1};
	colorPrepare[] = {0.69,0.7,0.1,1};
	colorUnload[] = {0.75,0.29,0.29,1};
	class RscUnitInfo
	{
		idd = 300;
		movingEnable = 0;
		controls[] = {"Background","Background2","Hitzones","ValueFuel","Speed","Alt","TextArmor","TextFuel","Weapon","Ammo","AmmoCount","MagCount","Heading"};
		class Background: RscText
		{
			idc = 124;
			style = 128;
			x = 0;
			y = 0.138;
			w = 0.33;
			h = 0.09;
			text = "";
			colorBackground[] = {0,0,0,0};
			colorText[] = {0,0,0,0};
			font = "TahomaB";
			sizeEx = 0;
			fixedWidth = 0;
		};
		class Background2: RscText
		{
			idc = 124;
			style = 128;
			x = 0.67;
			y = 0.138;
			w = 0.33;
			h = 0.09;
			text = "";
			colorBackground[] = {0,0,0,0};
			colorText[] = {0,0,0,0};
			font = "TahomaB";
			sizeEx = 0;
			fixedWidth = 0;
		};
		class Speed: RscIGText
		{
			idc = 121;
			x = 0.005;
			y = 0.145;
			w = 0.2;
			text = "$STR_DISP_ERROR";
			colorText[] = {0.8,0.8,0.8,1};
		};
		class Alt: RscIGText
		{
			idc = 122;
			style = "0x01+0x100";
			x = 0.16;
			y = 0.145;
			w = 0.16;
			text = "$STR_DISP_ERROR";
			colorText[] = {0,0,0,0};
		};
		class TextArmor: RscIGText
		{
			x = 0.68;
			y = 0.145;
			w = 0.19;
			text = "$STR_UI_ABAR";
			colorText[] = {0,0,0,0};
		};
		class Hitzones: RscHitZones
		{
			idc = 111;
			x = 0.82;
			y = 0.155;
			w = 0.165;
			h = 0.025;
		};
		class TextFuel: RscIGText
		{
			x = 0.68;
			y = 0.185;
			w = 0.19;
			text = "$STR_UI_FBAR";
			colorText[] = {0,0,0,0};
		};
		class ValueFuel: RscIGProgress
		{
			idc = 113;
			x = 0.82;
			y = 0.19;
			w = 0.165;
			h = 0.025;
			colorText[] = {0,0,0,0};
		};
		class ValueReload: RscIGProgress
		{
			idc = 154;
			x = 0.92;
			y = 0.19;
			w = 0.165;
			h = 0.025;
			colorText[] = {0,0,0,0};
		};
		class Weapon: RscIGText
		{
			idc = 118;
			x = 0.005;
			y = 0.185;
			w = 0.25;
			colorText[] = {0,0,0,0};
			text = "$STR_DISP_ERROR";
		};
		class Ammo: RscIGText
		{
			idc = 119;
			style = "0x01 + 0x100";
			x = 0.17;
			y = 0.19;
			w = 0.15;
			colorText[] = {0,0,0,0};
			text = "$STR_DISP_ERROR";
		};
		class AmmoCount: RscIGText
		{
			idc = 184;
			style = "0x01 + 0x100";
			x = 0.32;
			y = 0.19;
			w = 0.15;
			colorText[] = {0,0,0,0};
			text = "$STR_DISP_ERROR";
		};
		class MagCount: RscIGText
		{
			idc = 185;
			style = "0x01 + 0x100";
			x = 0.17;
			y = 0.19;
			w = 0.15;
			colorText[] = {0,0,0,0};
			text = "$STR_DISP_ERROR";
		};
		class Heading: RscIGText
		{
			idc = 148;
			style = "0x00	+ 0x100";
			x = 0.017;
			y = 0.01;
			w = 0.17;
			colorText[] = {0,0,0,0};
		};
	};
	class RscUnitInfoSoldier: RscUnitInfo
	{
		idd = 300;
		movingEnable = 0;
		controls[] = {"Background","Weapon","Ammo","AmmoCount","MagCount","GUI_Body","GUI_Bleeding0","GUI_Bleeding0","GUI_InjuredHead0","GUI_InjuredHead1","GUI_InjuredLegs0","GUI_InjuredLegs1","GUI_InjuredLegs2","GUI_InjuredHands0","GUI_InjuredHands1","GUI_InjuredHands2"};
		class Background: RscText
		{
			idc = 124;
			style = 128;
			x = 0;
			y = 0;
			w = 0.385;
			h = 0.05;
			text = "";
			colorBackground[] = {0,0,0,0};
			colorText[] = {0,0,0,0};
			font = "TahomaB";
			sizeEx = "( 16 / 408 )";
			fixedWidth = 0;
		};
		class Weapon: RscIGText
		{
			idc = 118;
			x = 0;
			y = 0.008;
			w = 0.282;
			colorText[] = {0,0,0,0};
			text = "$STR_DISP_ERROR";
		};
		class Ammo: RscIGText
		{
			idc = 119;
			style = "0x01 + 0x100";
			x = 0;
			y = 0.009;
			w = 0.378;
			colorText[] = {0,0,0,0};
			text = "$STR_DISP_ERROR";
		};
		class AmmoCount: RscIGText
		{
			idc = 184;
			style = "0x01 + 0x100";
			x = 0.17;
			y = 0.19;
			w = 0.15;
			colorText[] = {0,0,0,0};
			text = "$STR_DISP_ERROR";
		};
		class MagCount: RscIGText
		{
			idc = 185;
			style = "0x01 + 0x100";
			x = 0.32;
			y = 0.19;
			w = 0.15;
			colorText[] = {0,0,0,0};
			text = "$STR_DISP_ERROR";
		};
		class GUI_Body: RscPicture
		{
			idc = 411;
			text = "";
		};
		class GUI_Bleeding0: RscPicture
		{
			idc = 401;
			text = "";
		};
		class GUI_Bleeding1: RscPicture
		{
			idc = 402;
			text = "";
		};
		class GUI_InjuredHead0: RscPicture
		{
			idc = 403;
			text = "";
		};
		class GUI_InjuredHead1: RscPicture
		{
			idc = 404;
			text = "";
		};
		class GUI_InjuredLegs0: RscPicture
		{
			idc = 408;
			text = "";
		};
		class GUI_InjuredLegs1: RscPicture
		{
			idc = 409;
			text = "";
		};
		class GUI_InjuredLegs2: RscPicture
		{
			idc = 410;
			text = "";
		};
		class GUI_InjuredHands0: RscPicture
		{
			idc = 405;
			text = "";
		};
		class GUI_InjuredHands1: RscPicture
		{
			idc = 406;
			text = "";
		};
		class GUI_InjuredHands2: RscPicture
		{
			idc = 407;
			text = "";
		};
	};
	class RscUnitInfoTank: RscUnitInfo
	{
		idd = 300;
		movingEnable = 0;
		controls[] = {"Background","Weapon","Ammo","AmmoCount","MagCount","Commander","Gunner","Driver","Heading"};
		class Background: RscText
		{
			idc = 124;
			style = 128;
			x = 0.02;
			y = 0.18;
			w = 0.21;
			h = 0.25;
			text = "";
			colorBackground[] = {0.2,0.15,0.1,0.8};
			colorText[] = {0,0,0,0};
			font = "TahomaB";
			sizeEx = 0;
			fixedWidth = 0;
		};
		class Weapon: RscIGText
		{
			idc = 118;
			x = 0.025;
			y = 0.38;
			w = 0.19;
			text = "$STR_DISP_ERROR";
		};
		class Ammo: RscIGText
		{
			idc = 119;
			style = "0x01 + 0x100";
			x = 0.035;
			y = 0.38;
			w = 0.19;
			text = "$STR_DISP_ERROR";
		};
		class AmmoCount: RscIGText
		{
			idc = 184;
			style = "0x01 + 0x100";
			x = 0.17;
			y = 0.19;
			w = 0.15;
			text = "$STR_DISP_ERROR";
		};
		class MagCount: RscIGText
		{
			idc = 185;
			style = "0x01 + 0x100";
			x = 0.32;
			y = 0.19;
			w = 0.15;
			text = "$STR_DISP_ERROR";
		};
		class Commander: RscIGText
		{
			idc = 125;
			x = 0.025;
			y = "0.38 + 0.04";
			w = 0.19;
			text = "$STR_DISP_ERROR";
		};
		class Gunner: RscIGText
		{
			idc = 127;
			x = 0.025;
			y = "0.38 + 2 * 0.04";
			w = 0.19;
			text = "$STR_DISP_ERROR";
		};
		class Driver: RscIGText
		{
			idc = 126;
			x = 0.025;
			y = "0.38 + 3 * 0.04";
			w = 0.19;
			text = "$STR_DISP_ERROR";
		};
		class Heading: RscIGText
		{
			idc = 148;
			style = "0x00	+ 0x100";
			x = 0.017;
			y = 0.01;
			w = 0.17;
		};
	};
	class RscUnitInfoAir: RscUnitInfo{};
	class RscStanceInfo
	{
		idd = 303;
		controls[] = {"StanceIndicatorBackground","StanceIndicator"};
		class StanceIndicatorBackground: RscPicture
		{
			colorText[] = {0,0,0,0};
			idc = 1201;
			text = "";
			x = "10.1 * IGUI_GRID_WEAPON_W + IGUI_GRID_WEAPON_X";
			y = "0 * IGUI_GRID_WEAPON_H + IGUI_GRID_WEAPON_Y";
			w = "2.3 * IGUI_GRID_WEAPON_W";
			h = "3.7 * IGUI_GRID_WEAPON_H";
		};
		class StanceIndicator: RscPictureKeepAspect
		{
			idc = 188;
			text = "";
			x = "10.1 * IGUI_GRID_WEAPON_W + IGUI_GRID_WEAPON_X";
			y = "0 * IGUI_GRID_WEAPON_H + IGUI_GRID_WEAPON_Y";
			w = "2.3 * IGUI_GRID_WEAPON_W";
			h = "2.3 * IGUI_GRID_WEAPON_H";
		};
	};
	class UnitInfoSoldier: RscUnitInfoSoldier{};
	class UnitInfoTank: RscUnitInfoTank{};
	class UnitInfoCar: RscUnitInfo{};
	class UnitInfoShip: RscUnitInfo{};
	class UnitInfoAirplane: RscUnitInfoAir{};
	class UnitInfoHelicopter: RscUnitInfoAir{};
	class RscHint
	{
		idd = 301;
		movingEnable = 0;
		controls[] = {"Background","Hint"};
		class Background: RscText
		{
			idc = 101;
			style = 128;
			x = 0;
			y = 0.02;
			w = 0.28;
			h = 0.06;
			text = "";
			colorBackground[] = {0.2,0.15,0.1,0.8};
			colorText[] = {0,0,0,0};
			font = "TahomaB";
			sizeEx = 0;
			fixedWidth = 0;
			shadow = 0;
		};
		class Hint: RscStructuredText
		{
			idc = 102;
			x = 0.001;
			y = 0.031;
			w = 0.275;
			h = 0.04;
			style = 16;
			lineSpacing = 1;
			sizeEx = 0.027;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			font = "TahomaB";
			size = 0.027;
			text = "$STR_DISP_ERROR";
			class Attributes: Attributes
			{
				color = "#ffffff";
				align = "center";
				shadow = 0;
			};
		};
	};
	class RscTaskHint
	{
		idd = 302;
		movingEnable = 0;
		class controlsBackground
		{
			class Background: RscText
			{
				idc = 103;
				style = 128;
				x = 0.36;
				y = 0.22;
				w = 0.28;
				h = 0.06;
				text = "";
				colorBackground[] = {0.2,0.15,0.1,0.8};
				colorText[] = {0,0,0,0};
				font = "TahomaB";
				sizeEx = 0;
				fixedWidth = 0;
				shadow = 0;
			};
		};
		class Controls
		{
			class Hint: RscStructuredText
			{
				idc = 104;
				x = 0.404;
				y = 0.231;
				w = 0.23;
				h = 0.04;
				style = 16;
				lineSpacing = 1;
				sizeEx = 0.027;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0,0,0,0};
				font = "TahomaB";
				size = 0.027;
				text = "$STR_DISP_ERROR";
				class Attributes: Attributes
				{
					color = "#ffffff";
					align = "left";
					shadow = 0;
				};
			};
		};
		class TaskIcon
		{
			x = 0.365;
			y = 0.235;
			w = 0.04;
			h = 0.08;
		};
	};
};
