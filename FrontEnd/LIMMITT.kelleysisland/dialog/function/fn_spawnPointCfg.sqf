/*
	File: fn_spawnPointCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for available spawn points depending on the units side.
	
	Return:
	[Spawn Marker,Spawn Name,Image Path]
*/
private["_side","_return"];
_side = [_this,0,civilian,[civilian]] call BIS_fnc_param;

//Spawn Marker, Spawn Name, PathToImage
_return = [
	["spawn_civilian","Elwood","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
];
switch (_side) do
{
	case west:
	{
		_return = [
			["spawn_dcso","Elwood Sheriff's Office","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["spawn_dcso_doc","Department of Corrections","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"]
		];
	};
	
	case civilian:
	{
		_return = [
			["spawn_civilian","Elwood Plaza","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
		];

		// Houses & Garages
		if(count life_houses > 0) then {
			{
				_pos = call compile format["%1",_x select 0];
				_house = nearestBuilding _pos;
				_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
				
				_return set[count _return,[format["house_%1",_house getVariable "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"]];
			} foreach life_houses;
		};
	};
	
	case independent: {
		_return = [
			["spawn_dcfd","Elwood Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa"]
		];
	};
};

_return;