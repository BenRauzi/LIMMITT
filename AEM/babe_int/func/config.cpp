class DefaultEventhandlers;
class CfgPatches
{
	class BABE_INT_FNC
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_BaseConfig_F","babe_core"};
	};
};
class CfgFunctions
{
	class BABE_INT
	{
		tag = "BABE_INT";
		class core
		{
			file = "\babe_int\func\core";
			class init{};
		};
		class int
		{
			file = "\babe_int\func\int";
			class replace_this{};
			class use{};
			class self{};
			class movein{};
			class fastuse{};
			class fastgetin{};
			class get_seats{};
			class inside_veh{};
		};
		class ui
		{
			file = "\babe_int\func\ui";
			class menuAd{};
		};
	};
};
