class DefaultEventhandlers;
class CfgPatches
{
	class BABE_EM_FNC
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_BaseConfig_F","babe_core_fnc"};
	};
};
class CfgFunctions
{
	class BABE_EM
	{
		tag = "BABE_EM";
		class core
		{
			file = "\babe_em\func\core";
			class init{};
		};
		class EH
		{
			file = "\babe_em\func\EH";
			class handledamage_nofd{};
			class animdone{};
		};
		class move
		{
			file = "\babe_em\func\mov";
			class em{};
			class exec_em{};
			class finish_em{};
			class exec_drop{};
			class finish_drop{};
			class jump{};
			class jump_only{};
			class detect{};
			class detect_cl_only{};
			class walkonstuff{};
		};
	};
};
