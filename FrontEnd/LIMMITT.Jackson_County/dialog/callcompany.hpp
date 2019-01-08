class callCompany
{
	idd = 350123580;
	name = "callCompany";
	movingEnable = false;
	enableSimulation = true;
	class controls {
		class IGUIBack_2200: Life_RscBackground
		{
			idc = 2200;
			x = 0.411858 * safezoneW + safezoneX;
			y = 0.302518 * safezoneH + safezoneY;
			w = 0.16747 * safezoneW;
			h = 0.0282118 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class IGUIBack_2201: Life_RscBackground
		{
			idc = 2201;
			x = 0.411858 * safezoneW + safezoneX;
			y = 0.330729 * safezoneH + safezoneY;
			w = 0.16747 * safezoneW;
			h = 0.31033 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		class RscText_1000: Life_RscText
		{
			idc = 1000;
			text = "Call for company assistance"; //--- ToDo: Localize;
			x = 0.410979 * safezoneW + safezoneX;
			y = 0.30816 * safezoneH + safezoneY;
			w = 0.118992 * safezoneW;
			h = 0.0188079 * safezoneH;
		};
		class RscCombo_2100: Life_RscCombo
		{
			idc = 2100;
			x = 0.416265 * safezoneW + safezoneX;
			y = 0.340133 * safezoneH + safezoneY;
			w = 0.158655 * safezoneW;
			h = 0.0188079 * safezoneH;
		};
		class RscEdit_1400: Life_RscEdit
		{
			idc = 1400;
			x = 0.416265 * safezoneW + safezoneX;
			y = 0.387153 * safezoneH + safezoneY;
			w = 0.158655 * safezoneW;
			h = 0.21629 * safezoneH;
			colorBackground[] = {0,0,0,1};
			style = "16 + 512";
		};
		class RscText_1001: Life_RscText
		{
			idc = 1001;
			text = "Message"; //--- ToDo: Localize;
			x = 0.414503 * safezoneW + safezoneX;
			y = 0.362702 * safezoneH + safezoneY;
			w = 0.118992 * safezoneW;
			h = 0.0188079 * safezoneH;
		};
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = 2400;
			text = "Send"; //--- ToDo: Localize;
			x = 0.416265 * safezoneW + safezoneX;
			y = 0.612847 * safezoneH + safezoneY;
			w = 0.0749206 * safezoneW;
			h = 0.0188079 * safezoneH;
			onButtonClick = "[] call life_fnc_sendCompany;";
		};
		class RscButtonMenu_2401: Life_RscButtonMenu
		{
			idc = 2401;
			text = "Cancel"; //--- ToDo: Localize;
			x = 0.499117 * safezoneW + safezoneX;
			y = 0.612847 * safezoneH + safezoneY;
			w = 0.0749206 * safezoneW;
			h = 0.0188079 * safezoneH;
			onButtonClick = "closeDialog 0;";	
		};
	};
};