/*
	Author: Nicholas Jo'Foski
	Description: Determines the probability of a dye packet going off when a player leaves the bank with dirty money (More Dirty Money > Higher Chance)
*/

Foski_dyeProbability = {
	_amnt = {_x == Foski_dirtyCash} count (items player);  
    if (_amnt > 9) exitWith {true;};
    if (random 100 < 10 * _amnt) exitWith {true};
    false;
};