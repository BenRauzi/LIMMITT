class AAA
{
	idd = 365012;
	name = "AAA";
	onLoad = "onMapSingleClick ""player setpos _pos"";";
	onUnload = "onMapSingleClick """";";
	movingEnabled = false;
	enableSimulation = true;

	class controls
	{
		class TitleText : Life_RscText
		{
			sizeEx = 0.1;
			idc = 12312399;
			font = "PuristaLight";
			text = "EVO Menu";
			x = "SafeZoneX + (75.833333333333 / 1920) * SafeZoneW";
			y = "SafeZoneY + (60.8333333333334 / 1080) * SafeZoneH";
			w = "(1654 / 1920) * SafeZoneW";
			h = "(61.0000000000001 / 1080) * SafeZoneH";
		};
		class textTopper : life_RscText 
		{
			idc = 8661233;
			sizeEx = 0.045;
			text = "Potential Targets:";
			colorBackground[] = {0, 0, 0.3, 0.9};
			x = "SafeZoneX + (737.16666666667 / 1920) * SafeZoneW";
			y = "SafeZoneY + (100.833333333333 / 1080) * SafeZoneH";
			w = "(990 / 1920) * SafeZoneW";
			h = "(25.000000000002 / 1080) * SafeZoneH";
		};
		class cadList : life_RscListBox 
		{
			idc = 866123;
			sizeEx = 0.045;
			colorBackground[] = {0, 0, 0.3, 0.5};
			onLBSelChanged = "[_this] spawn life_fnc_viewAdmin";
			x = "SafeZoneX + (737.16666666667 / 1920) * SafeZoneW";
			y = "SafeZoneY + (125.833333333333 / 1080) * SafeZoneH";
			w = "(990 / 1920) * SafeZoneW";
			h = "(800.000000000002 / 1080) * SafeZoneH";
		};
		class infoTopper : life_RscText 
		{
			idc = 13341123;
			sizeEx = 0.045;
			text = "Target Info:";
			colorBackground[] = {0, 0, 0.3, 0.9};
			x = "SafeZoneX + (485.16666666667 / 1920) * SafeZoneW";
			y = "SafeZoneY + (100.833333333333 / 1080) * SafeZoneH";
			w = "(230 / 1920) * SafeZoneW";
			h = "(25.000000000002 / 1080) * SafeZoneH";
		};

		class theInfoList : life_RscListBox 
		{
			idc = 1334;
			sizeEx = 0.032;
			colorBackground[] = {0, 0, 0.3, 0.5};
			x = "SafeZoneX + (485.16666666667 / 1920) * SafeZoneW";
			y = "SafeZoneY + (125.833333333333 / 1080) * SafeZoneH";
			w = "(230 / 1920) * SafeZoneW";
			h = "(400.000000000002 / 1080) * SafeZoneH";
		};
		class LifeMapCAD : Life_RscMapControl
		{
			idc = 12397;
			x = "SafeZoneX + (75.833333333333 / 1920) * SafeZoneW";
			y = "SafeZoneY + (132.5 / 1080) * SafeZoneH";
			w = "(400.000000000001 / 1920) * SafeZoneW";
			h = "(400.000000000001 / 1080) * SafeZoneH";
			maxSatelliteAlpha = 0.75;//0.75;
			alphaFadeStartScale = 1.15;//0.15;
			alphaFadeEndScale = 1.29;//0.29;
		};
		class DeleteButton : Life_RscButtonMenu
		{
			x = "SafeZoneX + (1530.83333333333 / 1920) * SafeZoneW";
			y = "SafeZoneY + (937.5 / 1080) * SafeZoneH";
			w = "(198.999999999999 / 1920) * SafeZoneW";
			h = "(30.5 / 1080) * SafeZoneH";
			text = "God Mode";
			onButtonClick = "[""god""] spawn life_fnc_mainAdmin";
		};
		class BulletDebug : Life_RscButtonMenu
		{
			x = "SafeZoneX + (1530.83333333333 / 1920) * SafeZoneW";
			y = "SafeZoneY + (969.5 / 1080) * SafeZoneH";
			w = "(198.999999999999 / 1920) * SafeZoneW";
			h = "(30.5 / 1080) * SafeZoneH";
			text = "Snow Storm (4mins)";
			onButtonClick = "[""bullet""] spawn life_fnc_mainAdmin";
		};
		class ReviveButton : Life_RscButtonMenu
		{
			x = "SafeZoneX + (489.16666666667 / 1920) * SafeZoneW";
			y = "SafeZoneY + (554.833333333333 / 1080) * SafeZoneH";
			w = "(198.999999999999 / 1920) * SafeZoneW";
			h = "(30.5 / 1080) * SafeZoneH";
			text = "Revive Target";
			onButtonClick = "[""revive""] spawn life_fnc_mainAdmin";
		};
		class UncuffButton : Life_RscButtonMenu
		{
			x = "SafeZoneX + (489.16666666667 / 1920) * SafeZoneW";
			y = "SafeZoneY + (616.833333333333 / 1080) * SafeZoneH";
			w = "(198.999999999999 / 1920) * SafeZoneW";
			h = "(30.5 / 1080) * SafeZoneH";
			text = "Uncuff Target";
			onButtonClick = "[""uncuff""] spawn life_fnc_mainAdmin";
		};
		class HealButton : Life_RscButtonMenu
		{
			x = "SafeZoneX + (489.16666666667 / 1920) * SafeZoneW";
			y = "SafeZoneY + (585.833333333333 / 1080) * SafeZoneH";
			w = "(198.999999999999 / 1920) * SafeZoneW";
			h = "(30.5 / 1080) * SafeZoneH";
			text = "Heal Target";
			onButtonClick = "[""heal""] spawn life_fnc_mainAdmin";
		};
		class MapClickTeleport : Life_RscButtonMenu
		{
			x = "SafeZoneX + (75.833333333333 / 1920) * SafeZoneW";
			y = "SafeZoneY + (533.5 / 1080) * SafeZoneH";
			w = "(400.000000000001 / 1920) * SafeZoneW";
			h = "(30.5 / 1080) * SafeZoneH";
			text = "Click the map to teleport :)";
			onButtonClick = "";
		};
		class LocationButton : Life_RscButtonMenu
		{
			x = "SafeZoneX + (1330.83333333333 / 1920) * SafeZoneW";
			y = "SafeZoneY + (937.5 / 1080) * SafeZoneH";
			w = "(198.999999999999 / 1920) * SafeZoneW";
			h = "(30.5 / 1080) * SafeZoneH";
			text = "Arsenal";
			onButtonClick = "[""arsenal""] spawn life_fnc_mainAdmin";
		};
		class CameraButton : Life_RscButtonMenu
		{
			x = "SafeZoneX + (1330.83333333333 / 1920) * SafeZoneW";
			y = "SafeZoneY + (969.5 / 1080) * SafeZoneH";
			w = "(198.999999999999 / 1920) * SafeZoneW";
			h = "(30.5 / 1080) * SafeZoneH";
			text = "Camera";
			onButtonClick = "closeDialog 0; call bis_fnc_camera";
		};
		class RelocateButton : Life_RscButtonMenu
		{
			x = "SafeZoneX + (1130.83333333333 / 1920) * SafeZoneW";
			y = "SafeZoneY + (937.5 / 1080) * SafeZoneH";
			w = "(198.999999999999 / 1920) * SafeZoneW";
			h = "(30.5 / 1080) * SafeZoneH";
			text = "Teleport me > target";
			onButtonClick = "[""TPtoTHEM""] spawn life_fnc_mainAdmin";
		};
		class TPBUTTONME : Life_RscButtonMenu
		{
			x = "SafeZoneX + (1130.83333333333 / 1920) * SafeZoneW";
			y = "SafeZoneY + (969.5 / 1080) * SafeZoneH";
			w = "(198.999999999999 / 1920) * SafeZoneW";
			h = "(30.5 / 1080) * SafeZoneH";
			text = "Teleport target > me";
			onButtonClick = "[""TPtoME""] spawn life_fnc_mainAdmin";
		};
		class GateOpenButton : Life_RscButtonMenu
		{
			x = "SafeZoneX + (927.83333333333 / 1920) * SafeZoneW";
			y = "SafeZoneY + (937.5 / 1080) * SafeZoneH";
			w = "(198.999999999999 / 1920) * SafeZoneW";
			h = "(30.5 / 1080) * SafeZoneH";
			text = "Clone Gear From";
			onButtonClick = "[""cloneon""] spawn life_fnc_mainAdmin";
		};
		class GateCloseButton : Life_RscButtonMenu
		{
			x = "SafeZoneX + (927.83333333333 / 1920) * SafeZoneW";
			y = "SafeZoneY + (969.5 / 1080) * SafeZoneH";
			w = "(198.999999999999 / 1920) * SafeZoneW";
			h = "(30.5 / 1080) * SafeZoneH";
			text = "Clone Gear Onto";
			onButtonClick = "[""clonefrom""] spawn life_fnc_mainAdmin";
		};
		class RepairCurrentButton : Life_RscButtonMenu
		{
			x = "SafeZoneX + (727.83333333333 / 1920) * SafeZoneW";
			y = "SafeZoneY + (937.5 / 1080) * SafeZoneH";
			w = "(198.999999999999 / 1920) * SafeZoneW";
			h = "(30.5 / 1080) * SafeZoneH";
			text = "Repair Vehicle";
			onButtonClick = "[""repair""] spawn life_fnc_mainAdmin";
		};
		class DeleteCursorButton : Life_RscButtonMenu
		{
			x = "SafeZoneX + (727.83333333333 / 1920) * SafeZoneW";
			y = "SafeZoneY + (969.5 / 1080) * SafeZoneH";
			w = "(198.999999999999 / 1920) * SafeZoneW";
			h = "(30.5 / 1080) * SafeZoneH";
			text = "Delete CursorTarget";
			onButtonClick = "[""delete""] spawn life_fnc_mainAdmin";
		};

		class vehicleList : life_RscListBox 
		{
			idc = 8661231231;
			sizeEx = 0.045;
			colorBackground[] = {0, 0, 0.3, 0.5};
			x = 0.381008 * safezoneW + safezoneX;
			y = 0.114439 * safezoneH + safezoneY;
			w = 0.21154 * safezoneW;
			h = 0.74291 * safezoneH;
		};

		class ExecutionEdit: Life_RscEdit
		{
			idc = 14020;
			x = 0.0416624 * safezoneW + safezoneX;
			y = 0.537616 * safezoneH + safezoneY;
			w = 0.202726 * safezoneW;
			h = 0.0282118 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		
		class RscText_1015: Life_RscButtonMenu
		{
			onButtonClick = "[""execute""] spawn life_fnc_mainAdmin";

			idc = 10112312315;
			text = "Local Exec"; //--- ToDo: Localize;
			x = 0.0416624 * safezoneW + safezoneX;
			y = 0.567709 * safezoneH + safezoneY;
			w = 0.0572922 * safezoneW;
			h = 0.0188079 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
	};
};

class whitelistingMenu
{
	idd = 365019;
	name = "whitelistingMenu";
	onLoad = "";
	onUnload = "";
	movingEnabled = false;
	enableSimulation = true;

	class controls
	{
		class IGUIBack_2200: Life_RscBackground
			{
				idc = 2200;
				x = 0.345752 * safezoneW + safezoneX;
				y = 0.387153 * safezoneH + safezoneY;
				w = 0.312904 * safezoneW;
				h = 0.0846353 * safezoneH;
				colorBackground[] = {0,0,0,0.5};
			};
			class IGUIBack_2201: Life_RscBackground
			{
				idc = 2201;
				x = 0.345752 * safezoneW + safezoneX;
				y = 0.368345 * safezoneH + safezoneY;
				w = 0.312904 * safezoneW;
				h = 0.0188079 * safezoneH;
				colorBackground[] = {0,0,0,0.9};
			};
			class RscCombo_2100: Life_RscCombo
			{
				idc = 2100;
				x = 0.350159 * safezoneW + safezoneX;
				y = 0.396557 * safezoneH + safezoneY;
				w = 0.304089 * safezoneW;
				h = 0.0188079 * safezoneH;
			};
			class RscCombo_2101: Life_RscCombo
			{
				idc = 2101;
				x = 0.350159 * safezoneW + safezoneX;
				y = 0.424769 * safezoneH + safezoneY;
				w = 0.0308496 * safezoneW;
				h = 0.0188079 * safezoneH;
			};
			class RscButtonMenu_2400: Life_RscButtonMenu
			{
				idc = 2400;
				text = "Save"; //--- ToDo: Localize;
				x = 0.604892 * safezoneW + safezoneX;
				y = 0.447337 * safezoneH + safezoneY;
				w = 0.048478 * safezoneW;
				h = 0.0188079 * safezoneH;
			};
			class RscEdit_1400: Life_RscEdit
			{
				idc = 1400;
				text = "Reason"; //--- ToDo: Localize;
				x = 0.385416 * safezoneW + safezoneX;
				y = 0.424769 * safezoneH + safezoneY;
				w = 0.268833 * safezoneW;
				h = 0.0188079 * safezoneH;
				colorBackground[] = {0,0,0,0.8};
			};
	};
};