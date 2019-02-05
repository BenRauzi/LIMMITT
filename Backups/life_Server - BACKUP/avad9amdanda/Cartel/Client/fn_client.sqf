#include "\life_server\script_macros.hpp"

/*
	Heisen
	Cartel Zones
	Asylum / Olympus can blow my ass ~ NOT STOLEN ~ 'i hate blacks'
*/

fnc_gang_capture = {
	params [
		"_zone"
	];
	
	life_gang_name = group player getVariable "gang_name";
	nearcapzone = _zone;
	
	if !((side player) isEqualTo civilian) exitWith { hint "Only gangs can capture Cartels."; };
	if (isNil{life_gang_name}) exitWith { hint "Only Gangs may capture gang areas."; };
	if (life_gang_name isEqualTo "") exitWith { hint "Only gangs can capture Cartels."; };
	if ((life_gang_captures select _zone select 1 select 0) isEqualTo life_gang_name) exitWith {};
	if ((life_gang_captures select _zone select 2 select 0) isEqualTo life_gang_name) exitWith {};
	if (gangCappingNoooo) exitWith {};
	
	(life_gang_captures select _zone select 2) set [0,life_gang_name];
	(life_gang_captures select _zone select 2) set [1,true];
	
	publicVariable "life_gang_captures";
	
	life_gang_user = player;
	
	if (!((life_gang_captures select _zone select 4) isEqualTo "") && !((life_gang_captures select _zone select 4) isEqualTo life_gang_name)) exitWith {
		
		(format["capture_label_%1",nearcapzone]) setMarkerText format ["%1 - Not Controlled",life_gang_captures select nearcapzone select 0];
		
		while {((life_gang_captures select _zone select 2 select 0) isEqualTo life_gang_name)} do {
			
			_near = [_zone,life_gang_name] call fnc_gang_capture_near;
		
			if !(_near >= 1) then { 
				_capture_point = life_gang_captures select _zone select 3;
				_new = _capture_point - 1;
				life_gang_captures select _zone set [3,_new];
				(life_gang_captures select _zone select 1) set [0,""];
				(life_gang_captures select _zone select 1) set [1,false]; 
				publicVariable "life_gang_captures";
				if (life_gang_captures select _zone select 3 <=0) exitWith {
					life_gang_captures select _zone set [4,life_gang_name];
					(life_gang_captures select _zone select 2) set [0,""];
					(life_gang_captures select _zone select 2) set [1,false];
					
					call compile format ["life_gang_captures_%1 = false",_zone];
					publicVariable (format["life_gang_captures_%1",_zone]);
					
					publicVariable "life_gang_captures";
					[_zone] spawn fnc_gang_capture;
				};
				sleep 0.5;
			};
			publicVariable "life_gang_captures";
		};
	};
	
	while {((life_gang_captures select _zone select 2 select 0) isEqualTo life_gang_name)} do {
		
		_capture_point = life_gang_captures select _zone select 3;
		
		_near = [_zone,life_gang_name] call fnc_gang_capture_near;
		
		if !(_near >= 1) then { 
		
			call compile format ["life_gang_captures_%1 = false",_zone];
			publicVariable (format["life_gang_captures_%1",_zone]);
		
			_capture_point = _capture_point + 1;
			
			
			life_gang_captures select _zone set [3,_capture_point];
			life_gang_captures select _zone set [4,life_gang_name];
			publicVariable "life_gang_captures";

			if (_capture_point >= 300) exitWith {
			
				if ((life_gang_captures select _zone select 1 select 0) isEqualTo "") then {
				
					(life_gang_captures select _zone select 2) set [0,""];
					(life_gang_captures select _zone select 2) set [1,false]; 
					
					(life_gang_captures select _zone select 1) set [0,life_gang_name];
					(life_gang_captures select _zone select 1) set [1,true]; 
					
					((nearestObjects [player,["Flag_CSAT_F"],50]) select 0) setVariable["gangOwner",group player,true];
					
					["CartelZoneControlled"] spawn mav_ttm_fnc_addExp;
					(format["capture_label_%1",nearcapzone]) setMarkerText format ["%1 - Controlled by %2",life_gang_captures select nearcapzone select 0,life_gang_captures select nearcapzone select 1 select 0];
					

				} else {
				
					(life_gang_captures select _zone select 2) set [0,""];
					(life_gang_captures select _zone select 2) set [1,false]; 
					
					(life_gang_captures select _zone select 1) set [0,""];
					(life_gang_captures select _zone select 1) set [1,false]; 
					

				};
				
				publicVariable "life_gang_captures";
			
			};
			
			sleep 1;
			
		} else {
			call compile format ["life_gang_captures_%1 = true",_zone];
			publicVariable (format["life_gang_captures_%1",_zone]);
		};
		sleep 0.1;
	};
	
};


fnc_gang_captureUI = {
	
	private ["_text","_text1","_text2"];
	params [
		"_zone",
		"_type"
	];
	
	[_zone,player] remoteExec ["fnc_gangEnter_notif",-2];
	
	if (_type) then {
	
		"progressBar" cutRsc ["life_progress","PLAIN"];	
		
		while {(life_inCaptureZone)} do {
		
			_near = [_zone,life_gang_name] call fnc_gang_capture_near;
			if !(_near >= 1) then { 
				[_zone] spawn fnc_gang_capture;
			};
		
			_text1 = round((life_gang_captures select _zone select 3) / 3);
			_text2 = ((round((life_gang_captures select _zone select 3) / 3)) / 100);
		
			if (!(life_gang_captures select _zone select 1 select 1) && !(life_gang_captures select _zone select 2 select 1)) then {
				_text = format ["Nobody owns the %1",(life_gang_captures select _zone select 0)];
			};
		
			if ((life_gang_captures select _zone select 2 select 1)) then {
				_text = format ["%1 is capturing %2",(life_gang_captures select _zone select 2 select 0),(life_gang_captures select _zone select 0)];
			};
			
			if ((life_gang_captures select _zone select 1 select 1) && !(life_gang_captures select _zone select 2 select 1)) then {
				_text = format ["%1 is controlling %2",(life_gang_captures select _zone select 1 select 0),(life_gang_captures select _zone select 0)];
				_text1 = 100;
				_text2 = 1;
			};
			
			if ((call compile format ["life_gang_captures_%1",_zone])) then {
				_text = format ["%1 is contesting %2",(life_gang_captures select _zone select 2 select 0),(life_gang_captures select _zone select 0)];
			};
			
			disableSerialization;
			
			_progress = (uiNamespace getVariable "life_progress") displayCtrl 38201;
			_pgText = (uiNamespace getVariable "life_progress") displayCtrl 38202;
			
			_pgText ctrlSetText format ["%2 (%3%1)...","%",_text,_text1];
			_progress progressSetPosition _text2;
			
			sleep 0.5;
			
		};
		
	} else {
		
		if (life_gang_user isEqualTo player) then {
		
			(life_gang_captures select _zone select 2) set [0,""];
			(life_gang_captures select _zone select 2) set [1,false];
			
			call compile format ["life_gang_captures_%1 = false",_zone];
			publicVariable (format["life_gang_captures_%1",_zone]);
			
			publicVariable "life_gang_captures";
			
		};
		life_gang_user = nil;
		"progressBar" cutText ["","PLAIN"];
		
	};

};


fnc_gang_capture_near = {
	private ["_skidCount"];
	params [
		"_zone",
		"_gang"
	];
	_skidCount = 0;
	{
		_area = call compile format ["control_%1_point",_zone];		
		if (_x distance _area <=50) then {
			if !(isNil{group _x getVariable "gang_name"}) then {
				if !((group _x getVariable "gang_name") isEqualTo _gang) then {
					_skidCount = _skidCount + 1;
				};	
			};
		};
	} forEach allPlayers;
	_skidCount;
};


fnc_gangEnter_notif = {
	params [
		"_zone",
		"_player"
	];
	life_gang_name = group player getVariable "gang_name";
	_cap = life_gang_captures select _zone select 1 select 0;
	if (!(_cap isEqualTo (group _player getVariable "gang_name")) && (life_gang_name isEqualTo _cap)) exitWith {
		hint format ["An enemy gang has entered the %1",life_gang_captures select _zone select 0];
	};
};
