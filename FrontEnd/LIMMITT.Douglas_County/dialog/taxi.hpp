class Life_ComputerTaxi {	
    idd = 2701241231;
    name= "Life_ComputerTaxi";
    movingEnable = 0;
    enableSimulation = 1;
    class controls {
		class IGUIBack_2200: Life_RscBackground
		{
			idc = 2200;
			x = 0.33253 * safezoneW + safezoneX;
			y = 0.434173 * safezoneH + safezoneY;
			w = 0.334939 * safezoneW;
			h = 0.131655 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class IGUIBack_2201: Life_RscBackground
		{
			idc = 2201;
			x = 0.33253 * safezoneW + safezoneX;
			y = 0.407842 * safezoneH + safezoneY;
			w = 0.334939 * safezoneW;
			h = 0.0282118 * safezoneH;
			colorBackground[] = {0.85,0.85,0,0.7};
		};
		class RscText_1000: Life_RscText
		{
			idc = 1000;
			text = "Taxi Service Computer"; //--- ToDo: Localize;
			x = 0.33253 * safezoneW + safezoneX;
			y = 0.411603 * safezoneH + safezoneY;
			w = 0.141027 * safezoneW;
			h = 0.0188079 * safezoneH;
		};
		class RscEdit_1400: Life_RscEdit
		{
			idc = 1400;
			x = 0.366025 * safezoneW + safezoneX;
			y = 0.439816 * safezoneH + safezoneY;
			w = 0.0176284 * safezoneW;
			h = 0.0282118 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class RscText_1001: Life_RscText
		{
			idc = 1001;
			text = "Set Fee"; //--- ToDo: Localize;
			x = 0.334295 * safezoneW + safezoneX;
			y = 0.443576 * safezoneH + safezoneY;
			w = 0.0308496 * safezoneW;
			h = 0.0188079 * safezoneH;
		};
		class RscText_1002: Life_RscText
		{
			idc = 1002;
			text = "Dollar Per Meter"; //--- ToDo: Localize;
			x = 0.386297 * safezoneW + safezoneX;
			y = 0.443576 * safezoneH + safezoneY;
			w = 0.141027 * safezoneW;
			h = 0.0188079 * safezoneH;
		};
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = 2400;
			text = "START JOURNEY"; //--- ToDo: Localize;
			x = 0.335176 * safezoneW + safezoneX;
			y = 0.543259 * safezoneH + safezoneY;
			w = 0.0749206 * safezoneW;
			h = 0.0188079 * safezoneH;
			onButtonClick = "[] call life_fnc_startTaxi;"
		};
		class RscButtonMenu_2401: Life_RscButtonMenu
		{
			idc = 2401;
			text = "FINISH JOURNEY"; //--- ToDo: Localize;
			x = 0.41186 * safezoneW + safezoneX;
			y = 0.543259 * safezoneH + safezoneY;
			w = 0.0749206 * safezoneW;
			h = 0.0188079 * safezoneH;
			onButtonClick = "[] call life_fnc_endTaxi;"
		};
		class RscText_1003: Life_RscText
		{
			idc = 1003;
			text = "Current Total Fee: $0"; //--- ToDo: Localize;
			x = 0.333414 * safezoneW + safezoneX;
			y = 0.475548 * safezoneH + safezoneY;
			w = 0.163062 * safezoneW;
			h = 0.0188079 * safezoneH;
		};
		class RscButtonMenu_2402: Life_RscButtonMenu
		{
			idc = 2402;
			text = "X"; //--- ToDo: Localize;
			x = 0.650722 * safezoneW + safezoneX;
			y = 0.411603 * safezoneH + safezoneY;
			w = 0.0132213 * safezoneW;
			h = 0.0188079 * safezoneH;
			onButtonClick = "closeDialog 0";
		};
		class RscText_1004: Life_RscText
		{
			idc = 1004;
			text = "Current Total Distance: 0M"; //--- ToDo: Localize;
			x = 0.333411 * safezoneW + safezoneX;
			y = 0.498119 * safezoneH + safezoneY;
			w = 0.163062 * safezoneW;
			h = 0.0188079 * safezoneH;
		};
	};
};