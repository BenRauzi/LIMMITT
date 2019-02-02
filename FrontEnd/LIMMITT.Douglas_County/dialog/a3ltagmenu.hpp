class A3L_TagMenu {
	idd = 998877;
	name= "A3L_TagMenu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn fnc_populateTagMenu";
	class controlsBackground {

		class Title: Life_RscText
		{
			idc = 1000;
			text = "Player Customisation"; //--- ToDo: Localize;
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class BG: Life_RscText
		{
			idc = 1001;
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.308 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};

	};
	class controls {

		class Listbox: Life_RscListbox
		{
			idc = 1500;
			onLBSelChanged = "[lbCurSel 1500] call fnc_previewTag";
			sizeEx = 0.035;
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.286 * safezoneH;
		};
		class CloseDialog: Life_RscButtonMenu
		{
			idc = 2400;
			text = "Close"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0;";
			x = 0.489688 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class SetButton: Life_RscButtonMenu
		{
			idc = 2401;
			text = "Set"; //--- ToDo: Localize;
			onButtonClick = "[lbCurSel 1500] call fnc_setTag";
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};

	};
};


/*
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Heisen BeiraMar, v1.063, #Wymohu)
////////////////////////////////////////////////////////

class Title: RscText
{
	idc = 1000;
	text = "Player Customisation"; //--- ToDo: Localize;
	x = 0.396875 * safezoneW + safezoneX;
	y = 0.291 * safezoneH + safezoneY;
	w = 0.185625 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
};
class BG: RscText
{
	idc = 1001;
	x = 0.396875 * safezoneW + safezoneX;
	y = 0.313 * safezoneH + safezoneY;
	w = 0.185625 * safezoneW;
	h = 0.308 * safezoneH;
	colorBackground[] = {0,0,0,0.7};
};
class Listbox: RscListbox
{
	idc = 1500;
	x = 0.402031 * safezoneW + safezoneX;
	y = 0.324 * safezoneH + safezoneY;
	w = 0.175313 * safezoneW;
	h = 0.286 * safezoneH;
};
class CloseDialog: RscButtonMenu
{
	idc = 2400;
	text = "Close"; //--- ToDo: Localize;
	x = 0.489688 * safezoneW + safezoneX;
	y = 0.621 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
};
class SetButton: RscButtonMenu
{
	idc = 2401;
	text = "Set"; //--- ToDo: Localize;
	x = 0.396875 * safezoneW + safezoneX;
	y = 0.621 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
*/