class CfgPatches
{
	class BABE_CORE_FNC
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_BaseConfig_F"};
	};
};
class CfgFunctions
{
	class BABE_CORE
	{
		tag = "BABE_CORE";
		class core
		{
			file = "\babe_core\func\core";
			class init
			{
				postInit = 1;
			};
			class addEH{};
			class removeEH{};
			class keys{};
			class initFH{};
			class handleEHs{};
			class cachemoddata{};
		};
		class misc
		{
			file = "\babe_core\func\misc";
			class inbbr{};
			class inbbr_pl{};
		};
		class ui
		{
			file = "\babe_core\func\ui";
			class modmenu_init{};
			class settings_dbc{};
			class updateexplist{};
		};
	};
};
