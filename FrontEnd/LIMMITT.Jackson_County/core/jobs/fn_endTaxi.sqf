_totalCost = ((player distance gm_taxiStart) * gm_taxiFee);
["General", format ["You have ended the Journey. Total Cost: $%1", _totalCost], "General"] call Harris_Notifications;
gm_taxiStart = [0,0,0];
closeDialog 0;