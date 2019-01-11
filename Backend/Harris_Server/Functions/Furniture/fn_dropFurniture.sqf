/*
	Author: Ben Harris
	Description: Drops the Furniture ----- Note: Saving System not implemented - Ready - but will not be implemented until housing update. This is simply for crafting table use
*/

Harris_dropFurniture = {
	_furniture = player getVariable ["carryingObject",objNull;

	detach _furniture;



	player setVariable ["carryingObject", nil];

	_furniture setDir (getDir _furniture);
	_furniture setPosAtl (getPosAtl _furniture);

	sleep 5;

	_furniture enableSimulation false;
};
