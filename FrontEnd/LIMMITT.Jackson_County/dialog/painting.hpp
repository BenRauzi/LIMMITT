class gm_vehiclePainting {
	idd = 2901230;
	name= "gm_vehiclePainting";
	movingEnable = false;
	enableSimulation = true;
	class controls{
		class Life_RscBackground_2200: Life_RscBackground
		{
			idc = 2200;
			x = 0.323716 * safezoneW + safezoneX;
			y = 0.170863 * safezoneH + safezoneY;
			w = 0.352567 * safezoneW;
			h = 0.141059 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class Life_RscBackground_2201: Life_RscBackground
		{
			idc = 2201;
			x = 0.323716 * safezoneW + safezoneX;
			y = 0.142651 * safezoneH + safezoneY;
			w = 0.352567 * safezoneW;
			h = 0.0282118 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			};
		class RscText_1000: Life_RscText
		{
			idc = 1000;
			text = "Vehicle Paint Store"; //--- ToDo: Localize;
			x = 0.323718 * safezoneW + safezoneX;
			y = 0.146412 * safezoneH + safezoneY;
			w = 0.343753 * safezoneW;
			h = 0.0188079 * safezoneH;
		};
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = 2400;
			text = "Paint"; //--- ToDo: Localize;
			x = 0.323716 * safezoneW + safezoneX;
			y = 0.313801 * safezoneH + safezoneY;
			w = 0.114584 * safezoneW;
			h = 0.0188079 * safezoneH;
		};
		class RscListbox_1500: Life_RscListbox
		{
			idc = 1500;
			x = 0.326361 * safezoneW + safezoneX;
			y = 0.174624 * safezoneH + safezoneY;
			w = 0.34816 * safezoneW;
			h = 0.131655 * safezoneH;
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
	};
};