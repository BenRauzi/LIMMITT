class CfgPatches
{
	class BaBe_core
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_UI_F"};
	};
};
class RscStandardDisplay;
class RscDisplayModLauncher: RscStandardDisplay
{
	onMouseMoving = "if (isNull ((findDisplay 157) displayCtrl 212513)) then {call (uiNamespace getVariable 'babe_core_fnc_modmenu_init'); uiNamespace setVariable ['babe_core_modmenu_init', true]};";
};
