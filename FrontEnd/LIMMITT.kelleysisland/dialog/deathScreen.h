class DeathScreen
{
	idd = 7300;
	name = "Life_Death_Screen";
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
	};
	
	class Controls
	{

		class RscTextaa_1009: Life_RscBackground
		{
			idc = 220131;

			x = 0.314902 * safezoneW + safezoneX;
			y = 0.255498 * safezoneH + safezoneY;
			w = 0.370196 * safezoneW;
			h = 0.169271 * safezoneH;
			colorText[] = {0.1,0.1,0.1,1};
			colorBackground[] = {0,0,0,0.7};
		};
		
		class IGUIBack_2201: Life_RscBackground
		{
			idc = 2201;
			x = 0.314902 * safezoneW + safezoneX;
			y = 0.229167 * safezoneH + safezoneY;
			w = 0.370196 * safezoneW;
			h = 0.0282118 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class RscText_1000: Life_RscText
		{
			idc = 1000;
			text = "Killed by:"; //--- ToDo: Localize;
			x = 0.319309 * safezoneW + safezoneX;
			y = 0.274306 * safezoneH + safezoneY;
			w = 0.356975 * safezoneW;
			h = 0.0188079 * safezoneH;
		};
		class RscText_1002: Life_RscText
		{
			idc = 1002;
			text = "Distance: 100M"; //--- ToDo: Localize;
			x = 0.319309 * safezoneW + safezoneX;
			y = 0.302518 * safezoneH + safezoneY;
			w = 0.356975 * safezoneW;
			h = 0.0188079 * safezoneH;
		};
		class RscText_1001: Life_RscText
		{
			idc = 1001;
			text = "You are dead"; //--- ToDo: Localize;
			x = 0.317547 * safezoneW + safezoneX;
			y = 0.232928 * safezoneH + safezoneY;
			w = 0.356975 * safezoneW;
			h = 0.0188079 * safezoneH;
		};
		class MedicsOnline : Life_RscText
		{
			idc = 7304;
			text = "Medics: 1";
			x = 0.319309 * safezoneW + safezoneX;
			y = 0.358941 * safezoneH + safezoneY;
			w = 0.356975 * safezoneW;
			h = 0.0188079 * safezoneH;
		};
		
		class MedicsNearby : Life_RscText
		{
			idc = 7305;
			text = "Nearest Medic: 0M"; //--- ToDo: Localize;
			x = 0.319309 * safezoneW + safezoneX;
			y = 0.389035 * safezoneH + safezoneY;
			w = 0.356975 * safezoneW;
			h = 0.0188079 * safezoneH;
		};
		
		class RespawnBtn : Life_RscButtonMenu
		{
			idc = 7302;
			x = 0.314902 * safezoneW + safezoneX;
			y = 0.426649 * safezoneH + safezoneY;
			w = 0.171877 * safezoneW;
			h = 0.0188079 * safezoneH;
			text = "Respawn";
			onButtonClick = "[true] spawn life_fnc_spawnMenu;";
			colorBackground[] = {0, 0, 0, 1};
			class Attributes 
			{
				align = "center";
			};
		};
		
		class MedicBtn : Life_RscButtonMenu
		{
			idc = 7303;
			x = 0.495593 * safezoneW + safezoneX;
			y = 0.426649 * safezoneH + safezoneY;
			w = 0.189505 * safezoneW;
			h = 0.0188079 * safezoneH;
			onButtonClick = "[] call life_fnc_requestMedic;";
			text = "Request Medic";
			colorBackground[] = {0, 0, 0, 1};
			class Attributes 
			{
				align = "center";
			};
		};

		class AdminRespawn : Life_RscButtonMenu
		{
			idc = 10000;
			x = 0.314902 * safezoneW + safezoneX;
			y = 0.526649 * safezoneH + safezoneY;
			w = 0.171877 * safezoneW;
			h = 0.0188079 * safezoneH;
			text = "Instant Respawn";
			onButtonClick = "[true] spawn life_fnc_spawnMenu;";
			colorBackground[] = {0, 0, 0, 1};
			class Attributes 
			{
				align = "center";
			};
		};
		
		class AdminInstant : Life_RscButtonMenu
		{
			idc = 10001;
			x = 0.495593 * safezoneW + safezoneX;
			y = 0.526649 * safezoneH + safezoneY;
			w = 0.189505 * safezoneW;
			h = 0.0188079 * safezoneH;
			text = "Instant Revive";
			onButtonClick = "[[name player],'life_fnc_revived',player,FALSE] spawn bis_fnc_mp;";
			colorBackground[] = {0, 0, 0, 1};
			class Attributes 
			{
				align = "center";
			};
		};
		
		
		class respawnTime : Life_RScText
		{
			idc = 7301;
			text = "";
			x = 0.319309 * safezoneW + safezoneX;
			y = 0.330729 * safezoneH + safezoneY;
			w = 0.370196 * safezoneW;
			h = 0.0188079 * safezoneH;
		};
	};
};