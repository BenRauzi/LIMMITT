_totalCost = ((player distance gm_taxiStart) * gm_taxiFee);
hint format ["You have ended the Journey. Total Cost: $%1", _totalCost];
gm_taxiStart = [0,0,0];
closeDialog 0;