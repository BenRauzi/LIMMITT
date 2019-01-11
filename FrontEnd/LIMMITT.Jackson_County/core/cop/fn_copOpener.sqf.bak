/*
 police sender, open gates from inside the car (only for cops) 
 by Insane
 www.tdc-clan.eu
*/

{
	if (_x animationPhase "Door_1_rot" == 1) then {
		_x animate ["Door_1_rot", 0];
	} 
	else 
	{
		_x animate ["Door_1_rot", 1];
	};
	
} 

forEach (nearestObjects [player, ["A3L_Fence_Open"], 50]);
forEach (nearestObjects [player, ["Land_BarGate_F"], 50]);