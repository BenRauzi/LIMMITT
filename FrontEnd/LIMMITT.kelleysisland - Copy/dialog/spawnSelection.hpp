class life_spawn_selection
{
	idd = 38500;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		
		
		
		
		class MapView : Life_RscMapControl 
		{
			idc = 38502;
			x = 0.513221 * safezoneW + safezoneX;
			y = 0.217882 * safezoneH + safezoneY;
			w = 0.163062 * safezoneW;
			h = 0.253906 * safezoneH;
			maxSatelliteAlpha = 0.75;//0.75;
			alphaFadeStartScale = 1.15;//0.15;
			alphaFadeEndScale = 1.29;//0.29;
		};

		class IGUIBack_2200: Life_RscBackground
		{
			idc = 2200;
			x = 0.323716 * safezoneW + safezoneX;
			y = 0.217882 * safezoneH + safezoneY;
			w = 0.189505 * safezoneW;
			h = 0.253906 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class IGUIBack_2201: Life_RscBackground
		{
			idc = 2201;
			x = 0.323716 * safezoneW + safezoneX;
			y = 0.189671 * safezoneH + safezoneY;
			w = 0.352567 * safezoneW;
			h = 0.0282118 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};

		class Title : Life_RscTitle
		{
			colorBackground[] = {0,0,0,0};
			idc = -1;
			text = "$STR_Spawn_Title";
			x = 0.324599 * safezoneW + safezoneX;
			y = 0.189671 * safezoneH + safezoneY;
			w = 0.180691 * safezoneW;
			h = 0.0282118 * safezoneH;
		};
	};
	
	class controls
	{	
		class SpawnPointList: Life_RscListNBox
		{
			idc = 38510;
			text = "";
			sizeEx = 0.041;
			coloumns[] = {0,0,0.9};
			drawSideArrows = false;
			idcLeft = -1;
			idcRight = -1;
			colorBackground[] = {0,0,0,0.5};
			rowHeight = 0.050;
			x = 0.328123 * safezoneW + safezoneX;
			y = 0.227286 * safezoneH + safezoneY;
			w = 0.180691 * safezoneW;
			h = 0.235098 * safezoneH;
			onLBSelChanged = "_this call life_fnc_spawnPointSelected;";
		};
		
		class spawnButton : Life_RscButtonMenu
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "Spawn";
			onButtonClick = "[] call life_fnc_spawnConfirm";
			x = 0.323716 * safezoneW + safezoneX;
			y = 0.475549 * safezoneH + safezoneY;
			w = 0.0837348 * safezoneW;
			h = 0.0188079 * safezoneH;
		};
	};
};