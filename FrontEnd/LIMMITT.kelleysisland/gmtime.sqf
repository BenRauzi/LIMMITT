while {true} do {
	waitUntil {sunOrMoon isEqualTo 0};
	diag_log format ["Detected Night Time - Speeding up time! - Current: %1 - Time %2", timeMultiplier, str daytime];
	setTimeMultiplier 120;
	waitUntil {sunOrMoon isEqualTo 1};
	diag_log format ["Detected Day Time - Slowing down time! - Current: %1 - Time %2", timeMultiplier, str daytime];
	setTimeMultiplier 10;
};