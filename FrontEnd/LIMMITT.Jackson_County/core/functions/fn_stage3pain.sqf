//effect for a stage 2 pain hit

"colorCorrections" ppEffectEnable true;			
"colorCorrections" ppEffectAdjust [1, 1, -0.003, [0.0, 0.0, 0.0, 0.0], [1, 1, 1, 0.011],  [0, 0, 0, 0.0]]; 
"colorCorrections" ppEffectCommit 0.3;
uiSleep 8;
"colorCorrections" ppEffectAdjust [1, 1, -0.003, [0.0, 0.0, 0.0, 0.0], [1, 1, 1, 1],  [0, 0, 0, 0.0]]; 
"colorCorrections" ppEffectCommit 3;
uiSleep 2;