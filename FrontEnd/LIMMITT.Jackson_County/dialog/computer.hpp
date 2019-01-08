class Life_ComputerPolice {	
    idd = 270124;
    name= "Life_ComputerPolice";
    movingEnable = 0;
    enableSimulation = 1;
    class controls {
    	class IGUIBack_2202: Life_RscBackground
		{
			idc = 2202;
			x = 0.279645 * safezoneW + safezoneX;
			y = 0.170863 * safezoneH + safezoneY;
			w = 0.453931 * safezoneW;
			h = 0.667679 * safezoneH;
			colorBackground[] = {0,0,0,1};
			text = "";
		};
		class IGUIBack_2200: Life_RscBackground
		{
			idc = 2200;
			x = 0.284052 * safezoneW + safezoneX;
			y = 0.180267 * safezoneH + safezoneY;
			w = 0.445116 * safezoneW;
			h = 0.601851 * safezoneH;
			colorBackground[] = {0,0.1,0,1};
			text = "";
		};
		class IGUIBack_2201: Life_RscEdit
		{
			idc = 2201;
			x = 0.284052 * safezoneW + safezoneX;
			y = 0.791522 * safezoneH + safezoneY;
			w = 0.445116 * safezoneW;
			h = 0.0376157 * safezoneH;
			colorBackground[] = {0,0.1,0,1};
			text = "";
		};
		class RscListbox_1500: Life_RscListbox
		{
			idc = 1500;
			x = 0.28846 * safezoneW + safezoneX;
			y = 0.387153 * safezoneH + safezoneY;
			w = 0.436302 * safezoneW;
			h = 0.385561 * safezoneH;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.4)";
			colorSelectBackground[] = {0, 0, 0, 0};
			colorScrollbar[] = {0.2, 0.2, 0.2, 1};
			class ListScrollBar: Life_RscScrollBar
			    {
			        color[] = {0,0,0,1};
			        autoScrollEnabled = 1;
			    };
		};

		class CCTVDisplay: RscPicture
		{
			idc = 1900;
			x = 0.28846 * safezoneW + safezoneX;
			y = 0.387153 * safezoneH + safezoneY;
			w = 0.436302 * safezoneW;
			h = 0.385561 * safezoneH;
		};

		class RscPicture_1200: Life_RscPicture
		{
			idc = 1200;
			text = "doj.paa";
			x = 0.455929 * safezoneW + safezoneX;
			y = 0.18967 * safezoneH + safezoneY;
			w = 0.101363 * safezoneW;
			h = 0.169271 * safezoneH;
		};
		class RscText_1000: Life_RscText
		{
			idc = 1000;
			text = "LSPD Console"; //--- ToDo: Localize;
			x = 0.477084 * safezoneW + safezoneX;
			y = 0.362702 * safezoneH + safezoneY;
			w = 0.0616993 * safezoneW;
			h = 0.0188079 * safezoneH;
		};
		class RscButtonMenuCancel_2700: Life_RscButtonMenu
		{
			x = 0.464743 * safezoneW + safezoneX;
			y = 0.847945 * safezoneH + safezoneY;
			w = 0.101363 * safezoneW;
			h = 0.0470196 * safezoneH;
			text = "Close";
			onButtonClick = "closeDialog 0";
		};
	};
};