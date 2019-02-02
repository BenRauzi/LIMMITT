
deletemarker "nlr";

createMarkerLocal ["nlr", (getPos player)]; 
"nlr" setMarkerShapeLocal "ELLIPSE";
"nlr" setMarkerColorLocal "ColorRed";      
"nlr" setMarkerTextLocal "NLR AREA - DO NOT ENTER!";      
"nlr" setMarkerTypeLocal "WARNING";

MB_NLR = true;
MB_NLRTime = time;