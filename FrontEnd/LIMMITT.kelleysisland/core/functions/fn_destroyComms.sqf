/*
	Destroys Comms
*/


[[player,"amovpknlmstpsnonwnondnon_amovpknlmstpsraswlnrdnon"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;

cursorTarget unassignItem "ItemMap";
cursorTarget removeItem "ItemMap";
cursorTarget unassignItem "ItemGPS";
cursorTarget removeItem "ItemGPS";
cursorTarget unassignItem "ItemRadio";
cursorTarget removeItem "ItemRadio";
cursorTarget unassignItem "tf_anprc148jem_2";
cursorTarget removeItem "tf_anprc148jem_2";
cursorTarget unassignItem "tf_rt1523g_black";
cursorTarget removeItem "tf_rt1523g_black";
cursorTarget unassignItem "tf_rt1523g_rhs";
cursorTarget removeItem "tf_rt1523g_rhs";
cursorTarget unassignItem "tf_anprc152";
cursorTarget removeItem "tf_anprc152";
cursorTarget unassignItem "tf_rt1523g";
cursorTarget removeItem "tf_rt1523g";
cursorTarget unassignItem "tf_fadak_1";
cursorTarget removeItem "tf_fadak_1";
cursorTarget unassignItem "tf_microdagr";
cursorTarget removeItem "tf_microdagr";



waitUntil{animationState player != "amovpknlmstpsnonwnondnon_amovpknlmstpsraswlnrdnon";};

["Success", "Communication & Map Destroyed.", "Success"] call Harris_Notifications;