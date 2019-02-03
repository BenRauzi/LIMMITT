class Life_atm_management {
	idd = 2700;
	name= "life_atm_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[[player,""CL3_anim_codecrackerATM""],""life_fnc_animSync"",true,false] spawn bis_fnc_mp;";
	onUnload = "[[player,""""],""life_fnc_animSync"",true,false] spawn bis_fnc_mp;";
	class controls {

		class Life_RscTitleBackground: Life_RscBackground {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = 0.420672 * safezoneW + safezoneX;
			y = 0.294994 * safezoneH + safezoneY;
			w = 0.163062 * safezoneW;
			h = 0.0282118 * safezoneH;
		};
		
		class MainBackground:Life_RscBackground {
			x = 0.420672 * safezoneW + safezoneX;
			y = 0.323206 * safezoneH + safezoneY;
			w = 0.163062 * safezoneW;
			h = 0.404369 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		
		class CashTitle : Life_RscStructuredText
		{
			idc = 2701;
			text = "";
			
			x = 0.425079 * safezoneW + safezoneX;
			y = 0.330729 * safezoneH + safezoneY;
			w = 0.154248 * safezoneW;
			h = 0.122251 * safezoneH;
		};
		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Lakeside Valley Banking"; //--- ToDo: Localize;
			x = 0.420674 * safezoneW + safezoneX;
			y = 0.298756 * safezoneH + safezoneY;
			w = 0.154248 * safezoneW;
			h = 0.0188079 * safezoneH;
		};
		
		class WithdrawButton : life_RscButtonMenu 
		{
			idc = -1;
			onButtonClick = "[] call life_fnc_bankWithdraw";
			
			text = "Withdraw"; //--- ToDo: Localize;
			x = 0.425079 * safezoneW + safezoneX;
			y = 0.550782 * safezoneH + safezoneY;
			w = 0.154248 * safezoneW;
			h = 0.0188079 * safezoneH;
		};
		
		class DepositButton : life_RscButtonMenu 
		{
			idc = -1;
			onButtonClick = "[] call life_fnc_bankDeposit";
			
			text = "Deposit"; //--- ToDo: Localize;
			x = 0.425079 * safezoneW + safezoneX;
			y = 0.528212 * safezoneH + safezoneY;
			w = 0.154248 * safezoneW;
			h = 0.0188079 * safezoneH;
		};
		
		class moneyEdit : Life_RscEdit {
		
		idc = 2702;
		
		text = "1"; //--- ToDo: Localize;
		x = 0.425079 * safezoneW + safezoneX;
		y = 0.490596 * safezoneH + safezoneY;
		w = 0.154248 * safezoneW;
		h = 0.0282118 * safezoneH;
		colorBackground[] = {0,0,0,1};
		
		};
		
		class PlayerList : Life_RscCombo 
		{
			idc = 2703;
			
			x = 0.425079 * safezoneW + safezoneX;
			y = 0.462384 * safezoneH + safezoneY;
			w = 0.154248 * safezoneW;
			h = 0.0188079 * safezoneH;
		};
		
		class TransferButton : life_RscButtonMenu 
		{
			idc = -1;
			text = "Transfer (TAXED)";
			onButtonClick = "[] call life_fnc_bankTransfer";
			
			x = 0.425079 * safezoneW + safezoneX;
			y = 0.573352 * safezoneH + safezoneY;
			w = 0.154248 * safezoneW;
			h = 0.0188079 * safezoneH;
		};
		
		class GangDeposit : TransferButton
		{
			idc = 2705;
			onButtonClick = "[] call life_fnc_gangDeposit";
			text = "Deposit to Gang"; //--- ToDo: Localize;
			x = 0.425079 * safezoneW + safezoneX;
			y = 0.697482 * safezoneH + safezoneY;
			w = 0.154248 * safezoneW;
			h = 0.0188079 * safezoneH;

		};

		class DepositEverything : TransferButton
		{
			idc = 270512312;
			onButtonClick = "[] call life_fnc_depositAll";
			text = "Deposit Everything"; //--- ToDo: Localize;
			x = 0.425079 * safezoneW + safezoneX;
			y = 0.676794 * safezoneH + safezoneY;
			w = 0.154248 * safezoneW;
			h = 0.0188079 * safezoneH;

		};

		
	};
};