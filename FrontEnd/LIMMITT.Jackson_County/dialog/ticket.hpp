class gm_ticketIssue
{
	idd = 2650;
	name = "gm_ticketIssue";
	movingEnabled = false;
	class controls
	{		
		class IGUIBack_2200: Life_RscBackground
		{
			idc = 2200;
			x = 0.367787 * safezoneW + safezoneX;
			y = 0.199074 * safezoneH + safezoneY;
			w = 0.255611 * safezoneW;
			h = 0.0282118 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class IGUIBack_2201: Life_RscBackground
		{
			idc = 2201;
			x = 0.367787 * safezoneW + safezoneX;
			y = 0.227286 * safezoneH + safezoneY;
			w = 0.255611 * safezoneW;
			h = 0.489004 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = 2400;
			text = "Submit Ticket"; //--- ToDo: Localize;
			x = 0.438302 * safezoneW + safezoneX;
			y = 0.66739 * safezoneH + safezoneY;
			w = 0.118992 * safezoneW;
			h = 0.0376157 * safezoneH;
			onButtonClick = "[] call life_fnc_ticketGive";
		};
		class ticketReason: Life_RscEdit
		{
			idc = 1400;
			x = 0.372194 * safezoneW + safezoneX;
			y = 0.25926 * safezoneH + safezoneY;
			w = 0.246797 * safezoneW;
			h = 0.131655 * safezoneH;
			colorBackground[] = {0,0,0,1};
			text = "Insert ticket reason";
			style = "16 + 512";
		};
		class RscText_1001: Life_RscText
		{
			idc = 1001;
			text = "Ticket Reason"; //--- ToDo: Localize;
			x = 0.372194 * safezoneW + safezoneX;
			y = 0.234809 * safezoneH + safezoneY;
			w = 0.13662 * safezoneW;
			h = 0.0188079 * safezoneH;
		};
		class RscText_1002: Life_RscText
		{
			idc = 1002;
			text = "Ticket Amount"; //--- ToDo: Localize;
			x = 0.372194 * safezoneW + safezoneX;
			y = 0.394677 * safezoneH + safezoneY;
			w = 0.13662 * safezoneW;
			h = 0.0188079 * safezoneH;
		};
		class ticketAmount: Life_RscEdit
		{
			idc = 2652;
			x = 0.372196 * safezoneW + safezoneX;
			y = 0.417246 * safezoneH + safezoneY;
			w = 0.246797 * safezoneW;
			h = 0.0282118 * safezoneH;
			colorBackground[] = {0,0,0,1};
			text = "500";
		};
		class additionalNotes: Life_RscEdit
		{
			idc = 1402;
			x = 0.372194 * safezoneW + safezoneX;
			y = 0.471787 * safezoneH + safezoneY;
			w = 0.246797 * safezoneW;
			h = 0.131655 * safezoneH;
			colorBackground[] = {0,0,0,1};
			text = "Insert additional information such as vehicle description";
			style = "16 + 512";
		};
		class RscText_1003: Life_RscText
		{
			idc = 1003;
			text = "Additional Notes"; //--- ToDo: Localize;
			x = 0.372194 * safezoneW + safezoneX;
			y = 0.449218 * safezoneH + safezoneY;
			w = 0.13662 * safezoneW;
			h = 0.0188079 * safezoneH;
		};
		class RscText_1000: Life_RscText
		{
			idc = 1000;
			text = "Issuing a Ticket"; //--- ToDo: Localize;
			x = 0.370431 * safezoneW + safezoneX;
			y = 0.202836 * safezoneH + safezoneY;
			w = 0.13662 * safezoneW;
			h = 0.0188079 * safezoneH;
		};
		class RscText_1004: Life_RscText
		{
			idc = 1004;
			text = "Issuing Department"; //--- ToDo: Localize;
			x = 0.372194 * safezoneW + safezoneX;
			y = 0.609085 * safezoneH + safezoneY;
			w = 0.13662 * safezoneW;
			h = 0.0188079 * safezoneH;
		};
		class issuingDepartment: Life_RscCombo
		{
			idc = 2100;
			x = 0.372194 * safezoneW + safezoneX;
			y = 0.631655 * safezoneH + safezoneY;
			w = 0.246797 * safezoneW;
			h = 0.0188079 * safezoneH;
		};
	};
};


class Life_ticket_pay
{
	idd = 2600;
	name = "life_ticket_pay";
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.3;
			y = 0.2;
			w = 0.47;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.3;
			y = 0.2 + (11 / 250);
			w = 0.47;
			h = 0.3 - (22 / 250);
		};
	};
	
	class controls 
	{
		class InfoMsg : Life_RscStructuredText
		{
			idc = 2601;
			sizeEx = 0.020;
			text = "";
			x = 0.287;
			y = 0.2 + (11 / 250);
			w = 0.5; h = 0.12;
		};

		class payTicket: Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Ticket_PayTicket";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_ticketPay;";
			x = 0.2 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.42 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class refuseTicket : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Ticket_RefuseTicket";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "closeDialog 0;";
			x = 0.4 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.42 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};