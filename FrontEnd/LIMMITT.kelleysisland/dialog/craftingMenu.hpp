class craftingMenu
{
	idd = 36501255;
	name = "craftingMenu";
	movingEnabled = false;
	onLoad="uiNamespace setVariable ['gm_craftingMenu', _this select 0]";
	onUnLoad="uiNamespace setVariable ['gm_craftingMenu', nil]";
	class controls
	{
		class IGUIBack_2200: Life_RscBackground
		{
			idc = 2200;
			x = 0.323716 * safezoneW + safezoneX;
			y = 0.23669 * safezoneH + safezoneY;
			w = 0.352567 * safezoneW;
			h = 0.0282118 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class IGUIBack_2201: Life_RscBackground
		{
			idc = 2201;
			x = 0.323716 * safezoneW + safezoneX;
			y = 0.264902 * safezoneH + safezoneY;
			w = 0.352567 * safezoneW;
			h = 0.423177 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscText_1000: Life_RscText
		{
			idc = 1000;
			text = "Crafting Menu"; //--- ToDo: Localize;
			x = 0.326361 * safezoneW + safezoneX;
			y = 0.242332 * safezoneH + safezoneY;
			w = 0.251204 * safezoneW;
			h = 0.0188079 * safezoneH;
		};
		class RscListbox_1500: Life_RscListBox
		{
			idc = 1500;
			x = 0.328123 * safezoneW + safezoneX;
			y = 0.293114 * safezoneH + safezoneY;
			w = 0.141027 * safezoneW;
			h = 0.385561 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
			SizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			onLbSelChanged = "[] call life_fnc_craftingLBChanged;";
		};
		class RscStructuredText_1100: Life_RscStructuredText
		{
			idc = 1100;
			text = "Item Description"; //--- ToDo: Localize;
			x = 0.473557 * safezoneW + safezoneX;
			y = 0.311922 * safezoneH + safezoneY;
			w = 0.198319 * safezoneW;
			h = 0.103443 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscStructuredText_1101: Life_RscStructuredText
		{
			idc = 1101;
			text = "Item Requirements"; //--- ToDo: Localize;
			x = 0.473557 * safezoneW + safezoneX;
			y = 0.424769 * safezoneH + safezoneY;
			w = 0.198319 * safezoneW;
			h = 0.169271 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = 2400;
			text = "Craft"; //--- ToDo: Localize;
			x = 0.614584 * safezoneW + safezoneX;
			y = 0.599681 * safezoneH + safezoneY;
			w = 0.0572922 * safezoneW;
			h = 0.0188079 * safezoneH;
			onButtonClick = "[] call life_fnc_craftItem";
		};
		class IGUIBack_2202: Life_RscBackground
		{
			idc = 2202;
			x = 0.328123 * safezoneW + safezoneX;
			y = 0.274306 * safezoneH + safezoneY;
			w = 0.141027 * safezoneW;
			h = 0.0188079 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class RscText_1002: Life_RscText
		{
			idc = 1002;
			text = "Available Items"; //--- ToDo: Localize;
			x = 0.328123 * safezoneW + safezoneX;
			y = 0.274306 * safezoneH + safezoneY;
			w = 0.141027 * safezoneW;
			h = 0.0188079 * safezoneH;
		};
		class RscText_1001: Life_RscText
		{	
			idc = 100123;
			text = "Item Name"; //--- ToDo: Localize;
			x = 0.473557 * safezoneW + safezoneX;
			y = 0.279949 * safezoneH + safezoneY;
			w = 0.123399 * safezoneW;
			h = 0.0282118 * safezoneH;
			SizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
	};
};
