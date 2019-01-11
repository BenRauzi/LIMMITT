/*
LAKESIDE CITY MARKET
*/
private["_robber","_shop","_timer","_funds","_dist","_success"]; 
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; 
_action = [_this,2] call BIS_fnc_param;
_timer = 75;
_funds = 5000 + round(random 14000); 
_dist = _robber distance _shop;
_success = false;

if(side _robber != civilian) exitWith { hint "You are not civilian!"; };

_cops = (west countSide playableUnits);
if(_cops < 3) exitWith { hint "My Register is locked until more Police are on Duty! (3+)"; }; 


if(vehicle player != _robber) exitWith { hint "You need to exit your vehicle!"; }; 
if (alive _robber && {currentWeapon _robber != ""} && {_funds > 0}) then {

[[1,format["911 DISPATCH: Lakeside Market has an emergency alarm triggered!",_storename]],"life_fnc_broadcast",west,false] spawn bis_fnc_mp;
hint format ["Robbing the Store! Wait %1 sec.",_timer];

_shop removeAction _action;//Deleting the action,so it won't be spammed



while {true} do {
		hintsilent format ["%1 seconds remaining.",_timer];
		uiSleep 1;
		_timer = _timer - 1;
		_dist = _robber distance _shop;

		if (!alive _robber) exitwith
			{
				[[1,format["911 DISPATCH: ONE ASSAILANT HAS DIED: Lakeside Market",_storename]],"life_fnc_broadcast",west,false] spawn bis_fnc_mp;
				hint "STORE CLERK: Oh damn, you just got blood on my cash register.";
					uiSleep 1800;
				_action = _shop addAction["Rob Store",life_fnc_robShops];
			};
			if (_dist >= 6) exitwith {
			[[1,format["911 DISPATCH: ONE ASSAILANT HAS FLED: Lakeside Market",_storename]],"life_fnc_broadcast",west,false] spawn bis_fnc_mp;
			hint "STORE CLERK: Thank you for letting me go!";
				uiSleep 1800;
			_action = _shop addAction["Rob Store",life_fnc_robShops];
			};
			if (currentWeapon _robber == "") exitwith {
			[[1,format["911 DISPATCH: ONE ASSAILANT HAS FLED: Morrison Market",_storename]],"life_fnc_broadcast",west,false] spawn bis_fnc_mp;
			hint "STORE CLERK: I dont fear you anymore!";
				uiSleep 1800;
			_action = _shop addAction["Rob Store",life_fnc_robShops];
			};

if(_timer < 1) exitWith { _success = true; }; //Kraken Cleanup - If the count-down has hit 0 (or -1..just in case) the robbery is a success!
};
if(!_success) exitWith { }; //Kraken Cleanup -If success is false, kill it! They've already got their message
LIMMITTCASH = LIMMITTCASH + _funds; //Self explanatory
_reason = "211";
[_robber,_robber,_reason] spawn life_fnc_createEvidence;
hint format["You have stolen $%1",_funds]; //Give them a nice message
[[getPlayerUID _robber,name _robber,"211"],"life_fnc_wantedAdd",false,false] spawn bis_fnc_mp;//Add the robber to the wanted list,thanks to DimitryYuri
_funds = 0;
//life_karma = life_karma - 10;
life_use_atm = false;
uiSleep 180;
life_use_atm = true;
uiSleep 900;//Cooldown between the robberies
_action = _shop addAction["Rob Store",life_fnc_robLM];//Adding action for the robbery
};