/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/


Harris_Dial = {
	params["_number"];

	Harris_callNumber pushBack _number;

	Harris_numberToCall = Harris_callNumber joinString "";		

	ctrlSetText [1600, Harris_numberToCall];
};