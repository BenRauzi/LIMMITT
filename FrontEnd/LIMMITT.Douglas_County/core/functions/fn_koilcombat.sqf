/*
	by jounie305
*/

private["_ui","_currenttag","_currentvest","_currentbackpack","_koilcombat"];

disableSerialization;
_ui = uiNameSpace getVariable ["playerHUD",displayNull];
if(isNull _ui) then {[] call life_fnc_hudSetup;};

_length = 1;

while{alive player} do
{

_currenttag = currentWeapon player;
_currentvest = count vestItems player;
_currentbackpack = count backpackItems player;
_currentuniformItems = count uniformItems player;

uiSleep 1;

if ( _currenttag != currentWeapon player || _currentvest != count vestItems player || _currentbackpack != count backpackItems player || _currentuniformItems != count uniformItems player || (!alive player) ) then {
			_length = 1;
			_length = 15; 
			};

			if (_length > 1) then {

			if(_length == 15) then {
				koil_checkalt = true;
			};
			_length = _length - 1;
			}; 

			if (_length == 1) then {
				koil_checkalt = false;
			};
};


