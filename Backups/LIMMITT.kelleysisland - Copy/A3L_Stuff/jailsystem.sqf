fnc_arrestmenu = {
	createdialog "a3l_jail_menu";
	private["_unit","_id"];
	_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
	personyouwanjail = _unit;
	if(isNull _unit) exitWith {};
	if(isNil "_unit") exitwith {}; 
	if(!(_unit isKindOf "Man")) exitWith {}; 
	if(!isPlayer _unit) exitWith {};
	if((_unit getVariable "life_is_arrested")) exitWith {["This person is already arrested!",20,"red"] call A3L_Fnc_Msg;};
	if(!(_unit getVariable "restrained")) exitWith {["This person is not restrained!",20,"red"] call A3L_Fnc_Msg;}; 
	if(!((side _unit) in [civilian,independent])) exitWith {}; 
	if(isNull _unit) exitWith {}; 

	_display = findDisplay 5546;
	_nameofperson = _display displayCtrl 2200;
	_nametext = format ["%1",name _unit];
	_nameofperson ctrlSetText _nametext;
};

fnc_arrestbutton = {
	_display = findDisplay 5546;
	_nameofperson = _display displayCtrl 2200;
	_timeinminute = _display displayCtrl 2201;
	_reasonofjail = _display displayCtrl 2202;
	_playername = ctrlText _nameofperson;
	_jailtime = ctrlText _timeinminute;
	_reason = ctrlText _reasonofjail;
	if(isNull personyouwanjail) exitWith {};

	detach personyouwanjail;
	[[personyouwanjail,false,_jailtime,_reason],"fnc_sendtojail",personyouwanjail,false] spawn bis_fnc_mp;
	[[personyouwanjail,player,false],"life_fnc_wantedBounty",false,false] spawn bis_fnc_mp;


	_content = format ["%1 [%2] Just arrested %3 for $%4 - %5", name player, getPlayerUID player, _nameofperson, _timeinminute, _reasonofjail];
	[[_content],"DB_fnc_logToLogs",false,false] spawn bis_fnc_mp;
};

fnc_sendtojail = {
	private["_bad","_unit"];
	_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
	hint format["%1", _unit];
	if(isNull _unit) exitWith {};
	if(_unit != player) exitWith {};
	if(life_is_arrested) exitWith {};
	_bad = [_this,1,false,[false]] call BIS_fnc_param;
	life_arrestMinutes = _this select 2;
	life_arrestReason = _this select 3;

	A3L_Fnc_OldUniform = Uniform player;
	player addUniform "Inmate_Uni1";

	["Info",localize "STR_Jail_LicenseNOTF", "Info"] call Harris_Notifications;
	[1] call life_fnc_removeLicenses;


	if(_bad) then
	{
		waitUntil {alive player};
		uiSleep 1;
	};
	if(asdih_inv_heroinu > 0) then {[false,"heroinu",asdih_inv_heroinu] call life_fnc_handleInv;};
	if(asdih_inv_heroinp > 0) then {[false,"heroinp",asdih_inv_heroinp] call life_fnc_handleInv;};
	if(asdih_inv_coke > 0) then {[false,"cocaine",asdih_inv_coke] call life_fnc_handleInv;};
	if(asdih_inv_cokep > 0) then {[false,"cocainep",asdih_inv_cokep] call life_fnc_handleInv;};
	if(asdih_inv_turtle > 0) then {[false,"turtle",asdih_inv_turtle] call life_fnc_handleInv;};
	if(asdih_inv_cannabis > 0) then {[false,"cannabis",asdih_inv_cannabis] call life_fnc_handleInv;};
	if(asdih_inv_marijuana > 0) then {[false,"marijuana",asdih_inv_marijuana] call life_fnc_handleInv;};
	[[player,_bad,life_arrestMinutes,life_arrestReason],"svr_sendtojail",false,false] spawn bis_fnc_mp;
	[5] call SOCK_fnc_updatePartial;
};

fnc_jailsetup = {
	_minutes = parseNumber life_arrestMinutes;
	_hours = floor (_minutes/60);
	_minutes = _minutes % 60;
	player setVariable["restrained",false,true];
	player setVariable["Escorting",false,true];
	player setVariable["transporting",false,true];
	life_is_arrested = true;
	player setVariable["life_is_arrested",true,true];
	removeAllWeapons player;
	{player removeMagazine _x} foreach (magazines player);

	_jaillocations = [
	[9295.08,9300.44,0.5143909],
	[9291.98,9304.81,0.5143909],
	[9281.43,9302.13,0.6143909],
	[9283.14,9298.38,0.6143909],
	[9289.01,9310.3,0.5143909]
	];
	_randomer = floor random (count _jaillocations);
	_jailpos = _jaillocations select _randomer;

	player setPos _jailpos;
	if((player distance (getMarkerPos "jail_marker")) > 40) then
	{
		player setPos (getMarkerPos "jail_marker");
	};

	("A3LJAILTIME" call BIS_fnc_rscLayer) cutRsc ["a3l_jail_timer","PLAIN"]; //show
	[] spawn
	{
		while {(player distance (getMarkerPos "jail_marker")) < 60} do
		{
			uiSleep 120;
			if ((player distance (getMarkerPos "jail_marker")) < 60) then {
			("A3LJAILTIME" call BIS_fnc_rscLayer) cutText ["","PLAIN"]; //remove
			("A3LJAILTIME" call BIS_fnc_rscLayer) cutRsc ["a3l_jail_timer","PLAIN"]; //show
			_sexytext = parseText format["<t font='puristaLight' color='#B20000' align='center' size='1.8'>%1</t>",life_arrestReason];
			((uiNamespace getVariable "a3ljailtimer") displayCtrl 1101) ctrlSetStructuredText _sexytext;
			};
		};
	};
		
	_sexytext = parseText format["<t font='EtelkaNarrowMediumPro' color='#B20000' align='center' size='1.8'>%1</t>",life_arrestReason];
	((uiNamespace getVariable "a3ljailtimer") displayCtrl 1101) ctrlSetStructuredText _sexytext;
	
	[0,_minutes,_hours,0] spawn fnc_jailtimer;
};




fnc_jailtimer = {
	uiSleep 1;
	_release = 0;
	_second = _this select 0;
	_minute = _this select 1;
	_hour = _this select 2;
	_dtbsave = _this select 3;
	if (_second > 0) then {
		_second = _second - 1;
	} else { if (_minute > 0) then {
		_minute = _minute - 1;
		_second = 60;
	} else { if (_hour > 0) then {
		_hour = _hour - 1;
		_minute = 59;
		_second = 60;
	} else {};};};
	seconds = _second;
	minute = _minute;
	hour = _hour;

	_hrtext = "";
	_hourtext = "";
	_mntext = "";
	_minutetext = "";
	_sectext = "";
	_secondtext = "seconds";

	if (_hour == 0) then {_hrtext = "";} else {
	if (_hour == 1) then {_hourtext = "hour"} else {_hourtext = "hours"};
		_hrtext = parseText format["%1 %2, ",_hour,_hourtext];
	};
	if ((_hour == 0) && (_minute == 0)) then { _mntext = ""; } else {
	if (_minute == 1) then {_minutetext = "minute"} else {_minutetext = "minutes"};
		_mntext = parseText format["%1 %2 and ",_minute,_minutetext];
	};

	_dtbsave = _dtbsave + 1;
	if (_dtbsave == 300) then {  [[_hour,_minute,player],"svr_jailtodb",false,false] spawn bis_fnc_mp; _dtbsave = 0; };
	_sectext = parseText format["%1 %2",_second,_secondtext];

	_sexytext = parseText format["<t font='puristaLight' color='#B20000' align='center' size='1.0'>%1%2%3</t>",_hrtext,_mntext,_sectext];
	hintSilent _sexytext;

	if (((_hour < 1) && (_minute < 1)&& (_second < 1)) OR ((player distance (getMarkerPos "jail_marker")) > 60)) then {
		if ((_hour < 1) && (_minute < 1)&& (_second < 1)) then {
			_release = 1;
			[_release] call fnc_releaseprison;
		} else {
			_release = 2;
			[_release] call fnc_releaseprison;
		};
	} else { [_second,_minute,_hour,_dtbsave] spawn fnc_jailtimer;  };
};

fnc_releaseprison = {
	_release = _this select 0;
	life_is_arrested = false;
	player setVariable["life_is_arrested",false,true];
	[[player],"svr_releaseprison",false,false] spawn bis_fnc_mp;
	if (_release == 1) then {
		
		if (isNil "A3L_Fnc_OldUniform") then 
		{
			player addUniform "A3LShirt";
		} else
		{
			player addUniform A3L_Fnc_OldUniform;
		};
		
		[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn bis_fnc_mp;
		player setPos (getMarkerPos "jail_release");
		("A3LJAILTIME" call BIS_fnc_rscLayer) cutText ["","PLAIN"]; //remove
		["Your jailtime is over, you are a free man now!",20,"green"] call A3L_Fnc_Msg;
	} else {
		[[getPlayerUID player,profileName,"901"],"life_fnc_wantedAdd",false,false] spawn bis_fnc_mp;
		["You escaped the jail!",20,"orange"] call A3L_Fnc_Msg;
		("A3LJAILTIME" call BIS_fnc_rscLayer) cutText ["","PLAIN"]; //remove
	};
};