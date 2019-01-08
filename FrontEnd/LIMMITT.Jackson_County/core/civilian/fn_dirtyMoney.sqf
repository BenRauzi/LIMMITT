_cops = (west countSide playableUnits);
if(_cops < 8) exitWith { hint "You need atleast 8 cops online to sell dirty money..."; }; 

_shop = dirtyMoneySign;
_robber = player;

if (tradingDirtyMoney) exitWith {};
tradingDirtyMoney = true;
if (asdih_inv_dirtymoney isEqualTo 0) exitWith {hint "You have no dirty money to trade in!"};

if (player getVariable "restrained" || player getVariable "tied") exitWith {hint "You cannot do that as you are restrained!"};

_content = format ["%1 Is selling some dirty money", name player];
[[_content],"DB_fnc_logToLogs",false,false] spawn bis_fnc_mp;

[[0,format["BRINKS: A security device in bank money is being tampered with, please respond to dirty cash cleaner.",getPlayerUID player]],"life_fnc_broadcast",west,false] spawn bis_fnc_mp;	
systemChat "While microwaving the money a small chip made a beeping noise. You should assume the police have been alerted.";

disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Trading Dirty Money (10m) (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.0001;
		

while{true} do
		{
			sleep 0.6;
			_cP = _cP + 0.01;
			_progress progressSetPosition _cP;
			_pgText ctrlSetText format["Trading Dirty Money (10m) (%1%2)...",round(_cP * 100),"%"];
			_Pos = position player;

			if(_cP >= 1) exitWith {};
			if(_robber distance _shop > 10.5) exitWith { };
			if!(alive _robber) exitWith {};
	   };

if!(alive _robber) exitWith { _rip = false; };
if(_robber distance _shop > 10.5) exitWith { hint "You need to stay within 10m!"; 5 cutText ["","PLAIN"]; _rip = false; };
5 cutText ["","PLAIN"];



_funds = 100000;

LIMMITTCASH = LIMMITTCASH + _funds; 
hint format["You have traded $%1",_funds]; 

asdih_inv_dirtymoney = asdih_inv_dirtymoney - 1;

tradingDirtyMoney = false;