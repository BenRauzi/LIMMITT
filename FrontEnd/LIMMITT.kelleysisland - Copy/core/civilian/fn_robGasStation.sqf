private["_robber","_shop","_kassa","_ui","_progress","_pgText","_cP","_rip","_pos"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_action = [_this,2] call BIS_fnc_param;

_shopName = _shop getVariable ["GasName", "Error"];
_robberyTime = _shop getVariable ["RobTime", 0];
_robbed = _shop getVariable ["GM_Robbed", false];

/*
robbery at 300 seconds
its 450 seconds
time - 120 = 330
330 is bigger than 300 therefore robbery cannot happen */

if (gm_robbing) exitWith {};

_job = player getVariable ["GM_Job", "Unemployed"];
if !(_job isEqualTo "Unemployed") exitWith { ["Error","You may not rob a store while employed at a company. Please press F8 to quit your job!" , "Failure"] call Harris_Notifications;};
if (_robbed) exitWith {["Error","This was robbed too recently or is being robbed." , "Failure"] call Harris_Notifications;};

if(side _robber != civilian) exitWith { ["Error","You can not rob this Gas Station!" , "Failure"] call Harris_Notifications;};
if(_robber distance _shop > 5) exitWith {["Error","You need to be within 5m of the cashier to rob him!" , "Info"] call Harris_Notifications; };

if (_rip) exitWith {  ["Error","Robbery already in progress -  Get out of there!" , "Warning"] call Harris_Notifications;};
if (vehicle player != _robber) exitWith {  ["Error","Get out of your vehicle!" , "Failure"] call Harris_Notifications;};

if !(alive _robber) exitWith {};
if (currentWeapon _robber == "" || currentWeapon _robber == "Binocular") exitWith {  ["LOL",'"HaHa, you do not threaten me! Get out of here you hobo!"', "Info"] call Harris_Notifications;};

_cops = (west countSide playableUnits);
if (_cops < 4) exitWith { ["Error","Atleast 4 police must be online for you to rob this store!", "Info"] call Harris_Notifications;};


_rip = true;
_kassa = (random 1500) * _cops;

if (_kassa > 25000) then {_kassa = 25000};
if (_kassa < 2000) then {_kassa = 2000};

_location1 = mapGridPosition player;

[[0,format["911: %1 is currently being robbed!",_shopName]],"life_fnc_broadcast",west,false] spawn bis_fnc_mp;	
[[0,format["Lakeside 7 News: %1 is currently being robbed!",_shopName]],"life_fnc_broadcast",civilian,false] spawn bis_fnc_mp;	



_shop setVariable ["GM_Robbed", true, true];

gm_robbing = true;

disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Robbery in Progress, stay close (10m) (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.0001;

if(_rip) then
{
	while{true} do
	{
		sleep 0.5;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["Robbery in Progress, stay close (10m) (%1%2)...",round(_cP * 100),"%"];
		_Pos = position player; // by ehno: get player pos
		if(_cP >= 1) exitWith {};
		if(_robber distance _shop > 10.5) exitWith { };
		if!(alive _robber) exitWith {};
	};
if!(alive _robber) exitWith { _rip = false; gm_robbing = false;};
if(_robber distance _shop > 10.5) exitWith { gm_robbing = false; ["Error","You need to stay within 10m to Rob register! - Now the register is locked.", "Info"] call Harris_Notifications; 5 cutText ["","PLAIN"]; _rip = false; [[0,format["911: %1 Offender has fled the scene!",_shopName]],"life_fnc_broadcast",west,false] spawn bis_fnc_mp;	
[[0,format["Lakeside 7 News: %1 Offender has fled the scene!",_shopName]],"life_fnc_broadcast",civilian,false] spawn bis_fnc_mp;	};
5 cutText ["","PLAIN"];

titleText[format["You have stolen $%1, now get away before the cops arrive!",[_kassa] call life_fnc_numberText],"PLAIN"];

_content = format ["%1 [%2] Just robbed %3 for $%4", name player, getPlayerUID player, _shopName, _kassa];
[[_content],"DB_fnc_logToLogs",false,false] spawn bis_fnc_mp;

LIMMITTCASH = LIMMITTCASH + _kassa;
gm_robbing = false;
_rip = false;
life_use_atm = false;
sleep (50 + random(180));
life_use_atm = true;

_shop setVariable ["GM_Robbed", false, true];

if!(alive _robber) exitWith {};
	[getPlayerUID _robber,name _robber,"211"] remoteExec ["life_fnc_wantedAdd",2];
};
