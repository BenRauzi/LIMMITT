/*

*/
private["_civ"];
_civ = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _civ) exitWith {};

//Monitor excessive blindfolding
[] spawn
{
	private["_time"];
	while {true} do
	{
		_time = time;
		waitUntil {(time - _time) > (6 * 90)};
		
		if(!(player getVariable["blindfolded",FALSE])) exitWith {};
		if(!([west,getPos player,30] call life_fnc_nearUnits) && (player getVariable["blindfolded",FALSE]) && vehicle player == player) exitWith {

			player setVariable["blindfolded",FALSE,TRUE];
			titleText["You managed to wriggle free.","PLAIN"];
		};
	};
};

cutText ["Removed Blindfold!","PLAIN",2];	



cutText["You are blindfolded.","BLACK",0,true];			
while { true } do
{	
	if(!(player getvariable "blindfolded")) exitWith {
		cutText ["You are no longer blind folded.!","PLAIN",2];	
		player setVariable ["blindfolded",false,true];
	};
	if(!alive player) exitWith
	{
		cutText ["You are no longer blind folded.!","PLAIN",2];	
		player setVariable ["blindfolded",false,true];
	};

	if(vehicle player != player) then
	{
		//disableUserInput true;
		if(driver (vehicle player) == player) then {player action["eject",vehicle player];};
	};
	uiSleep 1;
};

//disableUserInput false;
		
if(alive player) then
{
	player switchMove "AmovPercMstpSlowWrflDnon_SaluteIn";
	player setVariable ["blindfolded",false,true];
	detach player;
};