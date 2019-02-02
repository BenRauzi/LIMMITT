class Life_Clothing {
	idd = 3100;
	name= "Life_Clothing";
	movingEnable = true;
	enableSimulation = true;
	//onLoad = "[] execVM 'core\client\keychain\init.sqf'";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.055084 * safezoneW + safezoneX;
			y = 0.0298038 * safezoneH + safezoneY;
			w = 0.264426 * safezoneW;
			h = 0.0282118 * safezoneH;
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.054884 * safezoneW + safezoneX;
			y = 0.0580156 * safezoneH + safezoneY;
			w = 0.264426 * safezoneW;
			h = 0.893373 * safezoneH;
		};
	};
	
	class controls 
	{
		class Title : Life_RscTitle 
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = 3103;
			text = "";
			x = 0.055084 * safezoneW + safezoneX;
			y = 0.0298038 * safezoneH + safezoneY;
			w = 0.264426 * safezoneW;
			h = 0.0282118 * safezoneH;
		};
		
		class ClothingList : Life_RscListBox 
		{
			idc = 3101;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "[_this] call life_fnc_changeClothes;";
			
			x = 0.0592895 * safezoneW + safezoneX;
			y = 0.0655387 * safezoneH + safezoneY;
			w = 0.255611 * safezoneW;
			h = 0.761718 * safezoneH;
		};
		
		class PriceTag : Life_RscStructuredText
		{
			idc = 3102;
			text = "";
			sizeEx = 0.035;
			
			x = 0.0592907 * safezoneW + safezoneX;
			y = 0.889322 * safezoneH + safezoneY;
			w = 0.255611 * safezoneW;
			h = 0.0188079 * safezoneH;
		};
		
		class TotalPrice : Life_RscStructuredText
		{
			idc = 3106;
			text = "";
			sizeEx = 0.035;
			
			x = 0.0592907 * safezoneW + safezoneX;
			y = 0.864872 * safezoneH + safezoneY;
			w = 0.255611 * safezoneW;
			h = 0.0188079 * safezoneH;
		};
		
		class FilterList : Life_RscCombo
		{
			idc = 3105;
			colorBackground[] = {0,0,0,0.7};
			onLBSelChanged  = "_this call life_fnc_clothingFilter";
			x = 0.0592907 * safezoneW + safezoneX;
			y = 0.831018 * safezoneH + safezoneY;
			w = 0.255611 * safezoneW;
			h = 0.0282118 * safezoneH;
		};
		
		class CloseButtonKey : Life_RscButtonMenu 
		{
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.145671 * safezoneW + safezoneX;
			y = 0.913773 * safezoneH + safezoneY;
			w = 0.0837348 * safezoneW;
			h = 0.0282118 * safezoneH;
		};
		
		class BuyButtonKey : Life_RscButtonMenu 
		{
			idc = -1;
			text = "$STR_Global_Buy";
			onButtonClick = "[] call life_fnc_buyClothes;";
			x = 0.0592907 * safezoneW + safezoneX;
			y = 0.913773 * safezoneH + safezoneY;
			w = 0.0837348 * safezoneW;
			h = 0.0282118 * safezoneH;
		};
	};
};