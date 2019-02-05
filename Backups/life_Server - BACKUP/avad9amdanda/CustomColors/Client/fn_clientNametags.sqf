#include "\life_server\script_macros.hpp"

/*
	Heisen
	Requesting Custom Colors from DB / Retrieving from Request for Custom Colors
*/

fnc_recieveNametagColors = {
	params [
		"_customColorArray"
	];
	
	customColors = _customColorArray;
	player setVariable ["nametagData",[["Life Green","#00FF00"],"Loading Stats"],true];
};

//--- Open 
fnc_openTagMenu = {
	if (customColors isEqualTo []) exitWith {
		["Can't Access this feature",30,"red"] call A3L_Fnc_Msg;
	};
	createDialog "A3L_tagmenu";
};

//--- Load Data
fnc_populateTagMenu = {
	{
		lbAdd [1500,_x select 0];
		lbSetData [1500,_forEachIndex,str _x];
	} forEach nametag_colorArray + customColors;
};

//--- Preview Tag
fnc_previewTag = {
	params ["_lbCurSel"];
	_lbCurSelArr = call compile (lbData[1500,_lbCurSel]);
	hint parseText format ["<t color='%1'>%2</t>",(_lbCurSelArr select 1),(name player)];;
};

//--- Set Tag
fnc_setTag = {
	params ["_lbCurSel"];
	_lbCurSelArr = call compile (lbData[1500,_lbCurSel]);	
	player setVariable ["nametagData",[_lbCurSelArr,"Loading Stats"],true];
	closeDialog 0;
	[format["Nametag set to %1",_lbCurSelArr select 0],30,"blue"] call A3L_Fnc_Msg;
};