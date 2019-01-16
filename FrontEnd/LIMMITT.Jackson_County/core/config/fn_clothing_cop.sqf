#include <macro.h>
/*
	File: fn_clothing_cop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"LSPD Clothing Store"];

_ret = [];
switch (_filter) do
{
	case 0:
	{
		_ret set[count _ret,["JD_Cadet","Cadet Uniform",0]];
		_ret set[count _ret,["JD_DOC_Plain","DOC Uniform",0]];
		_ret set[count _ret,["JD_Deputy","Deputy Uniform",0]];
		_ret set[count _ret,["JD_Corporal","Corporal Uniform",0]];
		_ret set[count _ret,["JD_Sergeant","Sergeant Uniform",0]];
		_ret set[count _ret,["JD_FTO","FTO Uniform",0]];
		_ret set[count _ret,["JD_Lieutenant","Lieutenant Uniform",0]];
		_ret set[count _ret,["JD_Captain","Capain Uniform",0]];
		_ret set[count _ret,["JD_1star","Major Uniform",0]];
		_ret set[count _ret,["JD_3star","Undersheriff Uniform",0]];
		_ret set[count _ret,["JD_4star","Sheriff Uniform",0]];
	};
	
	case 1:
	{
		_ret set[count _ret,["JD_SheriffHat_Green","Green Sheriff Hat",0]];
		_ret set[count _ret,["JD_SheriffHat_Blue","Blue Sheriff Hat",0]];
		_ret set[count _ret,["JD_SheriffHat_Tan","Tan Sheriff Hat",0]];
		_ret set[count _ret,["JD_BlackCap","Black Cap",0]];
		_ret set[count _ret,["JD_SherrifCap","Sheriff Helmet",0]];
		_ret set[count _ret,["JD_SertHat","SERT Hat",0]];
		_ret set[count _ret,["JD_SertHatB","SERT HAT2",0]];
		
		
	};
	
	case 2:
	{
		_ret = 
		[
			["G_Aviator",nil,0],
			["G_Squares",nil,0],
			["G_Lowprofile",nil,0],
			["G_Combat",nil,0],
			["G_Balaclava_blk",nil,0],
			["Mask_M40","Riot Mask",0],
			["TRYK_kio_balaclava_ESS",nil,0],
			["G_Balaclava_combat",nil,0],
			["G_Balaclava_lowprofile",nil,0],
			["G_mas_wpn_bala_mask_b",nil,0],
			["G_mas_wpn_shemag_mask",nil,0],
			["G_mas_wpn_wrap_mask_b",nil,0],
			["G_I_Diving",nil,0],
			["A3L_Balaclava",nil,0]
			
		];
	};
	
	case 3:
	{
		_ret set[count _ret,["A3L_RideAlongVest","Ride Along",0]];
		_ret set[count _ret,["JD_Belt1","Duty Belt",0]];
		_ret set[count _ret,["JD_Belt3","Belt 2",0]];
		_ret set[count _ret,["JD_Vest1","Patrol Vest",0]];
		_ret set[count _ret,["JD_Vest2","DOC Vest",0]];
		_ret set[count _ret,["JD_Vest3","SERT Vest",0]];
		_ret set[count _ret,["JD_Vest4","Detective Vest",0]];
		_ret set[count _ret,["JD_Vest7","Traffic Vest",0]];
		_ret set[count _ret,["JD_Vest10","Sheriff Traffic Vest",0]];
	};
	
	case 4:
	{
		_ret =
		[
			["cl3_police_tacticalbelt","Police Belt",0]
		];
	};
};

_ret;
