class cfgInteractions
{
	class secureFunds
	{
		condition = "[typeof cursorObject == 'plp_ct_HighSecMediumBlack']";
		action = "['Securing',300,PSI_fnc_securefunds,player,'AinvPknlMstpSnonWnonDnon_medic_1',[cursorObject],'cg_mission_files\sounds\repair.ogg',0] spawn PSI_fnc_dotask";
		icon = "050-money.paa"; // Todo
		text = "Secure Funds";
	};

	class Housing
	{
		action = "";
		icon = "050-money.paa"; // Todo
		text = "Housing";
		class Purchase
		{
			condition = "[(typeOf cursorObject) in PSI_houseArray, (player distance cursorObject) <= (cursorObject getVariable 'houseRadius'), isNil {cursorObject getVariable 'Purchased'}, player distance cursorObject < 20]";
			action = "[cursorObject] spawn PSI_fnc_openBuyHouse";
			icon = "050-money.paa"; // Todo
			text = "Purchase";
		};
		class Lock
		{
			condition = "[cursorObject in PSI_House, (player distance cursorObject) <= (cursorObject getVariable 'houseRadius'), !(isNil {cursorObject getVariable 'Purchased'}), !(cursorObject getVariable 'Locked')]";
			action = "[cursorObject] spawn PSI_fnc_lockHouse";
			icon = "050-money.paa"; // Todo
			text = "Lock";
		};
		class Unlock
		{
			condition = "[cursorObject in PSI_House, (player distance cursorObject) <= (cursorObject getVariable 'houseRadius'), !(isNil {cursorObject getVariable 'Purchased'}), (cursorObject getVariable 'Locked')]";
			action = "[cursorObject] spawn PSI_fnc_unlockHouse";
			icon = "050-money.paa"; // Todo
			text = "Unlock";
		};
		class Sell
		{
			condition = "[cursorObject in PSI_Houses, (player distance cursorObject) <= (cursorObject getVariable 'houseRadius'), !(isNil {cursorObject getVariable 'Purchased'})]";
			action = "[cursorObject] spawn PSI_fnc_openSellHouse";
			icon = "046-for-sale-postGero"; // Todo
			text = "Sell";
		};
	};

	class Furniture
	{
		action = "";
		icon = "050-money.paa"; // Todo
		text = "Furniture";
		class Pickup
		{
			condition = "[(typeOf cursorObject) in HRP_furnitureTypes, (player distance cursorObject) <= 8, isNil {player getVariable 'carryingObject'}, (isNil {cursorObject getVariable 'publicFurniture'})]";
			action = "[cursorObject] spawn PSI_fnc_pickUpFurniture";
			icon = "050-money.paa"; // Todo
			text = "Pickup";
		};
		class Drop
		{
			condition = "[!(isNil {player getVariable 'carryingObject'})]";
			action = "[cursorObject] spawn PSI_fnc_dropFurniture";
			icon = "050-money.paa"; // Todo
			text = "Drop";
		};
		class PlaceBarrier
		{
			condition = "[(attachedbarrier)]";
			action = "[] spawn psi_fnc_placebarrier;";
			icon = "050-money.paa"; // Todo
			text = "Barrier";
		};
		class RemoveClosestBarrier
		{
			condition = "[(myjob == ""Cop"" || myjob ==""EMS"" || myjob == ""Fire"" )]";
			action = "_destroy = nearestObjects [player, [""plp_up_BarrierTapePolice8m"",""plp_up_BarrierTapePolice4m"",""plp_up_BarrierTapePolice1m"",""plp_up_woodbarrierlongpolice"",""plp_up_WoodBarrierShortPoliceLightsOn""], 10]; deletevehicle (_destroy select 0);";
			icon = "050-money.paa"; // Todo
			text = "Remove Barrier";
		};
	};

	class Robbery
	{
		action = "";
		icon = "050-money.paa"; // Todo
		text = "Robbery";
		class Pickup
		{
			condition = "[bankrobber == 4 && typeof cursorObject == 'plp_ct_HighSecMediumBlack']";
			action = "'Taking Money',180,PSI_fnc_takecash,player,'AinvPknlMstpSnonWnonDnon_medic_1',[cursorObject],'cg_mission_files\sounds\repair.ogg',0] spawn PSI_fnc_dotask";
			icon = "050-money.paa"; // Todo
			text = "Take Cash";
		};
		class RepairDrill
		{
			condition = "[bankrobber == 2 && typeof cursorObject == 'plp_ct_HighSecMediumBlack']";
			action = "['Repairing Drill',60,PSI_fnc_repairdrill,player,'AinvPknlMstpSnonWnonDnon_medic_1',cursorObject,'cg_mission_files\sounds\repair.ogg',0] spawn PSI_fnc_dotask";
			icon = "050-money.paa"; // Todo
			text = "Repair Drill";
		};
	};

	class GatherPelt
	{
		condition = "[myjob == 'none' && player distance (getMarkerPos 'pelt_gather') < 25]";
		action = "['Gathering Pelt',10,PSI_fnc_gatherPelt,player,'AinvPknlMstpSnonWnonDnon_medic_1',player,'cg_mission_files\sounds\repair.ogg',0] spawn PSI_fnc_dotask";
		icon = "050-money.paa"; // Todo
		text = "Gather Pelt";
	};

	class Settings
	{
		action = "";
		icon = "050-money.paa"; // Todo
		text = "Settings";
		class Sync
		{
			condition = "[alive player]";
			action = "_new = player getVariable ""wallet"";	[player, ""wallet"", _new] remoteExec [""Server_fnc_setVariable"",2]; _loadout = getunitloadout player; [player,1,getplayeruid player,name player,_loadout] remoteExec [""server_fnc_steppedsync"",2]; lastforcesync = time;";
			icon = "050-money.paa"; // Todo
			text = "Sync Data";
		};
		class OpenAtm
		{
			condition = "[alive player]";
			action = "[] call psi_fnc_openATM";
			icon = "050-money.paa"; // Todo
			text = "Open ATM";
		};
	};

	class GiveKeys
	{
		condition = "[alive player]";
		action = "[] spawn PSI_fnc_findplayerskeys;";
		icon = "050-money.paa"; // Todo
		text = "Give Keys";
	};

	class Licenses
	{
		action = "";
		icon = "050-money.paa"; // Todo
		text = "Licenses";
		class VehicleLicense
		{
			condition = "[(licensearray select 0) == 0 && (str cursorObject find ""otros"" > -1 || str cursorObject find ""garaje"" > -1 || str cursorObject find ""tallerdepinturaabandonado"" > -1 || typeof cursorObject IN [""Land_ModernShowroom""])]";
			action = "[1,1500] spawn PSI_fnc_tryLicense;";
			icon = "050-money.paa"; // Todo
			text = "Vehicle (1.5k)";
		};
		class GunLicense
		{
			condition = "[typeof cursorObject == ""Land_buildingGunStore1"" && (licensearray select 1) == 0]";
			action = "[2,5000] spawn PSI_fnc_tryLicense;";
			icon = "050-money.paa"; // Todo
			text = "Gun (5k)";
		};
		class MiningLicense
		{
			condition = "[(licensearray select 2) == 0 && typeof cursorObject IN [""Land_Coffee_DED_Coffee_02_F"",""Land_fs_roof_F"",""Land_Coffee_DED_Coffee_01_F"",""Land_Shop_DED_Shop_01_F"",""Land_Shop_DED_Shop_02_F""]]";
			action = "[""Add"",""license"",3] call PSI_fnc_sustain;";
			icon = "050-money.paa"; // Todo
			text = "Mining";
		};
		class WoodLoggingLicense
		{
			condition = "[(licensearray select 3) == 0 && typeof cursorObject IN [""Land_Coffee_DED_Coffee_02_F"",""Land_fs_roof_F"",""Land_Coffee_DED_Coffee_01_F"",""Land_Shop_DED_Shop_01_F"",""Land_Shop_DED_Shop_02_F""]]";
			action = "[""Add"",""license"",4] call PSI_fnc_sustain;";
			icon = "050-money.paa"; // Todo
			text = "Wood Logging";
		};
		class FishingLicense
		{
			condition = "[(licensearray select 4) == 0 && typeof cursorObject IN [""Land_Coffee_DED_Coffee_02_F"",""Land_fs_roof_F"",""Land_Coffee_DED_Coffee_01_F"",""Land_Shop_DED_Shop_01_F"",""Land_Shop_DED_Shop_02_F""]]";
			action = "[""Add"",""license"",5] call PSI_fnc_sustain;";
			icon = "050-money.paa"; // Todo
			text = "Fishing";
		};
		class FishingLicenseTwo
		{
			condition = "[((licensearray select 5) == 0 && myjob == ""none"")]";
			action = "[""Add"",""license"",6] call PSI_fnc_sustain;";
			icon = "050-money.paa"; // Todo
			text = "Fishing 2";
		};
	};

	class DrugRuns
	{
		action = "";
		icon = "050-money.paa"; // Todo
		text = "Drugs";
		class DumpDrugs
		{
			condition = "[(typeof cursorTarget == ""Land_House_K_6_EP1"")]";
			action = "['Dumping Drugs',15,PSI_fnc_dumpDrugs,player,'AinvPknlMstpSnonWnonDnon_medic_1',cursorObject,""cg_mission_files\sounds\patdown1.ogg"",0] spawn PSI_fnc_dotask";
			icon = "050-money.paa"; // Todo
			text = "Dump";
		};
		class FinishDrugRun
		{
			condition = "[myJob == ""Mafia"" && cursorObject == missionVehicle && !isNull missionVehicle && player distance endOfmission < 25]";
			action = "['Dumping Drugs',300,PSI_fnc_finishDrugRun,player,'AinvPknlMstpSnonWnonDnon_medic_1',cursorObject,""cg_mission_files\sounds\patdown1.ogg"",0] spawn PSI_fnc_dotask";
			icon = "050-money.paa"; // Todo
			text = "Finish Run";
		};
	};

	class Mafia
	{
		action = "";
		icon = "050-money.paa"; // Todo
		text = "Mafia";
		class TracedCalls
		{
			condition = "[myJob == ""Mafia""]";
			action = "[] spawn PSI_fnc_findTapped;";
			icon = "050-money.paa"; // Todo
			text = "Traced Calls";
		};
		class OpenLoans
		{
			condition = "[myJob == ""Mafia""]";
			action = "[player] remoteexec [""server_fnc_MafiaOwed"",2]";
			icon = "050-money.paa"; // Todo
			text = "Open Loans";
		};
		class Urinate
		{
			condition = "[isplayer cursorObject && myJob == ""Mafia"" && cursorObject distance player < 5]";
			action = "[cursorObject] spawn PSI_fnc_pee;";
			icon = "050-money.paa"; // Todo
			text = "Urinate";
		};
		class TrackCalls
		{
			condition = "[(isplayer cursorObject && vehicle cursorObject == cursorObject) && myJob == ""Mafia""]";
			action = "[] spawn PSI_fnc_tracecall;";
			icon = "050-money.paa"; // Todo
			text = "Track Calls";
		};
		class TrackPlayer
		{
			condition = " [(isplayer cursorobject && cursorobject isKindOf ""Man"") && myJob == ""Mafia""]";
			action = "[['Tracking',3,PSI_fnc_trackplayer,player,'vvv_anim_ticket',cursorObject,""cg_mission_files\sounds\patdown1.ogg"",0] spawn PSI_fnc_dotask";
			icon = "050-money.paa"; // Todo
			text = "Track Player";
		};
		class TrackCar
		{
			condition = "[(cursorObject isKindOf ""Air"" || cursorObject isKindOf ""Car"" || cursorObject isKindOf ""Boat"") && myJob == ""Mafia""]";
			action = "cursorObject setvariable [""tracking"",true,false];";
			icon = "050-money.paa"; // Todo
			text = "Track Car";
		};
		class MafiaGunStore
		{
			condition = "[(myjob == ""mafia"" && cursorObject == rebelTrader)]";
			action = "closedialog 0; createdialog ""gun_menu""; [""rebelstore""] spawn psi_fnc_LoadStore;";
			icon = "050-money.paa"; // Todo
			text = "Gun Store";
		};
	};

	class SellOre
	{
		condition = "[cursorObject == oreSeller, ClientArrested]";
		action = "['Selling ore',15,PSI_fnc_sellOrePrison,player,'AinvPknlMstpSnonWnonDnon_medic_1',cursorObject,""cg_mission_files\sounds\patdown1.ogg"",0] spawn PSI_fnc_dotask";
		icon = "050-money.paa"; // Todo
		text = "Sell Ore";
	};


	class Civilian {
		action = "";
		icon = "050-money.paa"; // Todo
		text = "Civilian";
		class CopSignIn
		{
			condition = "[(myjob == ""none"" && (player getvariable ""cop"") > 0 && (player getvariable ""cop"") < 5 && (typeof cursorobject == ""Land_PoliceStation"" || typeof cursorObject == ""Land_Kangaro0_PD_01_F"") && count currentcop < 25)]";
			action = "[player,""Cop""] spawn psi_fnc_jobstart";
			icon = "050-money.paa"; // Todo
			text = "Cop Sign In";
		};
		class CopSignInTwo
		{
			condition = "[(myjob == ""none"" && (player getvariable ""cop"") > 4  && player distance getmarkerpos ""fbiHQ"" < 50)]";
			action = "[player,""Cop""] spawn psi_fnc_jobstart";
			icon = "050-money.paa"; // Todo
			text = "Cop Sign In";
		};
		class TakeMoney
		{
			condition = "[(cursorObject isKindOf 'Man' && (animationstate cursorObject) == 'incapacitated' || (animationstate cursorObject) == 'deadstate' || (animationstate cursorObject) == 'amovpercmstpssurwnondnon' || (animationstate cursorObject) == 'amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon')]";
			action = "['Taking Money',10,psi_fnc_takePlayerMoney,cursorObject,'AinvPknlMstpSnonWnonDnon_medic_1',cursorObject,""cg_mission_files\sounds\blindfold.ogg"",0] spawn psi_fnc_dotask";
			icon = "050-money.paa"; // Todo
			text = "Take Money";
		};
		class OpenWallet
		{
			condition = "[true]";
			action = "createdialog ""wallet_Menu""";
			icon = "050-money.paa"; // Todo
			text = "Open Wallet";
		};
		class RallyTrials
		{
			condition = "[(player distance getmarkerpos ""rally_1"" < 80)]";
			action = "[] spawn psi_fnc_doRally";
			icon = "050-money.paa"; // Todo
			text = "Rally Trials";
		};
		class RaceSignIn
		{
			condition = "[(player distance getmarkerpos ""formula1"" < 40)]";
			action = "[player] remoteexec [""server_fnc_raceenter"",2]";
			icon = "050-money.paa"; // Todo
			text = "Race Sign In";
		};
		class FastestLaps
		{
			condition = "[(player distance getmarkerpos ""formula1"" < 40 || player distance getmarkerpos ""rally_1"" < 80)]";
			action = "createdialog ""racetimes""";
			icon = "050-money.paa"; // Todo
			text = "Fastest Lap";
		};
		class SexChange
		{
			condition = "[(typeof cursorobject == ""Land_buildingshospital1"")]";
			action = "if(female) then {female = false; hint ""You are now male""; } else {female = true; hint ""You are now female""; }; [""NA"",""sex"",0] call psi_fnc_sustain";
			icon = "050-money.paa"; // Todo
			text = "Sex Change";
		};
	
		class AnonCall
		{
			condition = "[(str cursorObject find ""cabinatelefonica"" > -1 && !callInProgress && !PhonesRinging && !TryingCall)]";
			action = "[] spawn psi_fnc_callMenuPP;";
			icon = "050-money.paa"; // Todo
			text = "Anonymous Call";
		};
		class HealNear
		{
			condition = "[true]";
			action = "createdialog ""FindPlayer_Menu"";";
			icon = "050-money.paa"; // Todo
			text = "Heal Near";
		};
		class Blindfold
		{
			condition = "[((cursorObject isKindOf 'Man' && (headgear cursorObject) != 'mgsr_headbag' && (animationstate cursorObject) == 'amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon' || (animationstate cursorObject) == 'Incapacitated' || (animationstate cursorObject) == 'AmovPercMstpSnonWnonDnon_Ease' || (animationstate cursorObject) == 'Acts_AidlPsitMstpSsurWnonDnon_loop'))]";
			action = "['Blindfolding',5,psi_fnc_blindfold,cursorObject,'AinvPknlMstpSnonWnonDnon_medic_1',cursorObject,""cg_sndimg\sounds\blindfold.ogg"",0] spawn psi_fnc_dotask";
			icon = "050-money.paa"; // Todo
			text = "Blindfold";
		};
		class CallJury
		{
			condition = "[((typeof cursorObject == ""Land_buildingscourthouse1"" && (myjob == ""Cop"" || myjob == ""Judge"")))]";
			action = "[] spawn psi_fnc_startJury;";
			icon = "050-money.paa"; // Todo
			text = "Call Jury";
		};
		class WorkOut
		{
			condition = "[((str cursorObject find ""gymbench"" > -1 || str cursorObject find ""gymrack"" > -1))]";
			action = """Doing Workout"",60,psi_fnc_workout,player,'AmovPercMstpSnonWnonDnon_exercisePushup',player,0] spawn psi_fnc_dotask;";
			icon = "050-money.paa"; // Todo
			text = "Work Out";
		};
		class CheckTime
		{
			condition = "[(clientarrested)]";
			action = "_time = secondsLeft / 60; hint format[""%1"",_time];";
			icon = "050-money.paa"; // Todo
			text = "Check Time";
		};
		class RemoveBlindfold
		{
			condition = "[(cursorObject isKindOf 'Man' && (headgear cursorObject) == 'mgsr_headbag')]";
			action = "['Removing Blindfold',5,psi_fnc_unblindfold,cursorObject,'AinvPknlMstpSnonWnonDnon_medic_1',cursorObject,""cg_sndimg\sounds\blindfold.ogg"",0] spawn psi_fnc_dotask";
			icon = "050-money.paa"; // Todo
			text = "Blindfold";
		};
		class ThrowInCar
		{
			condition = "[(cursorObject isKindOf 'Man' && (animationstate cursorObject) == 'amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon' || (animationstate cursorObject) == 'Incapacitated' || (animationstate cursorObject) == 'AmovPercMstpSnonWnonDnon_Ease' || (animationstate cursorObject) == 'Acts_AidlPsitMstpSsurWnonDnon_loop')]";
			action = "['Throwing in Car',10,psi_fnc_putincar,cursorObject,'AinvPknlMstpSnonWnonDnon_medic_1',cursorObject,""cg_mission_files\sounds\patdown1.ogg"",0] spawn psi_fnc_dotask";
			icon = "050-money.paa"; // Todo
			text = "Throw in Car";
		};
		class Escort
		{
			condition = "[(cursorObject isKindOf 'Man' && (animationstate cursorObject) == 'amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon' || (animationstate cursorObject) == 'Incapacitated' || (animationstate cursorObject) == 'AmovPercMstpSnonWnonDnon_Ease' || (animationstate cursorObject) == 'Acts_AidlPsitMstpSsurWnonDnon_loop')]";
			action = "['Starting Escort',5,psi_fnc_attach,cursorObject,'AinvPknlMstpSnonWnonDnon_medic_1',cursorObject,""cg_mission_files\sounds\patdown1.ogg"",0] spawn psi_fnc_dotask";
			icon = "050-money.paa"; // Todo
			text = "Escort";
		};
		class StopEscort
		{
			condition = "[(count attachedObjects player == 1 && !attachedcar)]";
			action = "['Stopping Escort',5,psi_fnc_detach,player,'AinvPknlMstpSnonWnonDnon_medic_1',cursorObject,""cg_mission_files\sounds\patdown1.ogg"",0] spawn psi_fnc_dotask";
			icon = "050-money.paa"; // Todo
			text = "Stop Escort";
		};
		class GiveCash
		{
			condition = "[(cursorObject isKindOf 'Man' && bankrobber == 1)]";
			action = "[cursorObject] call psi_fnc_giveCash";
			icon = "050-money.paa"; // Todo
			text = "Give Cash";
		};
		class OpenGarage
		{
			condition = "[(count attachedObjects player == 0 && (str cursorObject find ""embarcadero"" > -1) && (player distance cursorObject < 20))]";
			action = "[cursorObject] call psi_fnc_openGarage";
			icon = "050-money.paa"; // Todo
			text = "Open Garage";
		};
		class ReplacePhone
		{
			condition = "[(typeof cursorObject == ""Land_Market_DED_Market_03_F"")]";
			action = "closedialog 0; [] call psi_fnc_checkPhone;";
			icon = "050-money.paa"; // Todo
			text = "Replace Phone";
		};
		class RechargePhone
		{
			condition = "[(typeof cursorObject == ""Land_Market_DED_Market_03_F"")]";
			action = "closedialog 0; [""add"",""battery"",200] call psi_fnc_sustain;";
			icon = "050-money.paa"; // Todo
			text = "Recharge Phone";
		};
		class ProcessDrugs
		{
			condition = "[(cursorObject == drugProcessing && cursorObject isKindOf ""man"")]";
			action = "closedialog 0; [] spawn psi_fnc_processBricks";
			icon = "050-money.paa"; // Todo
			text = "Process";
		};
		class sellOreWood
		{
			condition = "[(cursorObject == oreProcessing)]";
			action = "closedialog 0; [] spawn psi_fnc_sellOre";
			icon = "050-money.paa"; // Todo
			text = "Sell Ore/Wood";
		};
		class CraftHackingTool
		{
			condition = "[(ClientArrested && player distance [5616.14,6313.37,0.00143433] < 8)]";
			action = "[""Crafting Hacking Tool"",20,psi_fnc_crafthackingdevice,player,'AinvPknlMstpSnonWnonDnon_medic_1',player,0] spawn psi_fnc_dotask;";
			icon = "050-money.paa"; // Todo
			text = "Craft Hacking Tool";
		};
		class curePelts
		{
			condition = "[(((player distance (getMarkerPos ""peltCuring"")) < 30))]";
			action = "closedialog 0; [] spawn psi_fnc_refinePelts";
			icon = "050-money.paa"; // Todo
			text = "Cure Pelts";
		};
		class refineFish
		{
			condition = "[(cursorObject == fishRefine)]";
			action = "closedialog 0; [] spawn psi_fnc_refineFish";
			icon = "050-money.paa"; // Todo
			text = "Refine Fish";
		};
		class refineWood
		{
			condition = "[(((player distance (getMarkerPos ""logRefinery"")) < 30))]";
			action = "closedialog 0; [] spawn psi_fnc_refineLogs";
			icon = "050-money.paa"; // Todo
			text = "Refine Wood";
		};
		class OpenCarShop
		{
			condition = "[(typeof cursorObject IN [""Land_ModernShowroom"",""Land_ADM_Car_Dealership""] || cursorObject == CarDealer1 || cursorObject == CarDealer3 || cursorObject == CarDealer4 || cursorObject == CarDealer5)]";
			action = "createdialog ""buycar"";";
			icon = "050-money.paa"; // Todo
			text = "Open Car Shop";
		};
		class refineOil
		{
			condition = "[(cursorObject == oilRefine)]";
			action = "closedialog 0; [] spawn psi_fnc_refineoil";
			icon = "050-money.paa"; // Todo
			text = "Refine Oil";
		};
		class refineOre
		{
			condition = "[(((player distance (getMarkerPos ""OreRefinery"")) < 30))]";
			action = "closedialog 0; [] spawn psi_fnc_refinemetal1";
			icon = "050-money.paa"; // Todo
			text = "Refine Ore";
		};
		class CraftLockPick
		{
			condition = "[((ClientArrested && (str cursorObject find ""gymbench"" > -1 || str cursorObject find ""gymrack""> -1 ) && getpos player distance [5644.19,6329.73,0.00143433] < 55))]";
			action = "[Crafting Lockpick"",60,psi_fnc_craftlockpick,player,'AmovPercMstpSnonWnonDnon_exercisePushup',player,0] spawn psi_fnc_dotask";
			icon = "050-money.paa"; // Todo
			text = "Craft Lockpick";
		};
		class SkinRabbit
		{
			condition = "[((typeof cursorObject == ""Rabbit_F"" && getdammage cursorobject == 1))]";
			action = "deletevehicle cursorObject; player additem ""np_upelt""; hint ""You skinned the rabbit for its pelt!";
			icon = "050-money.paa"; // Todo
			text = "Skin Rabbit";
		};

		class PostMail
		{
			condition = "[(str cursorObject find ""mailboxnorth"" > -1)]";
			action = "createdialog ""psi_findMail""";
			icon = "050-money.paa"; // Todo
			text = "Post Mail";
		};
		class SellFish
		{
			condition = "[((player distance (getMarkerPos ""fishSales"")) < 20)]";
			action = "closedialog 0; [] spawn psi_fnc_sellFish";
			icon = "050-money.paa"; // Todo
			text = "Sell Fish";
   		};
		class SearchCrate
		{
			condition = "[((str cursorObject find ""Msic_Cargo1B_military"" > -1 && getpos player distance getpos cursorObject < 4))]";
			action = "[Repairing Object"",7,psi_fnc_searchcrates,player,'AinvPknlMstpSnonWnonDnon_medic_1',player,""cg_sndimg\sounds\repair.ogg""] spawn psi_fnc_dotask";
			icon = "050-money.paa"; // Todo
			text = "Search Crate";
		};
		class QuitJob
		{
			condition = "[((myjob != ""none"" && (typeof cursorObject IN [""Land_Centrelink""])))]";
			action = "[] spawn psi_fnc_jobEnd";
			icon = "050-money.paa"; // Todo
			text = "Quit Job";
		};
	
		class ImpoundLot
		{
			condition = "[(str cursorObject find ""tallerdepinturaabandonado"" > -1 && (getpos player) distance [1055,3660,0.014] < 20)]";
			action = "[cursorObject] call psi_fnc_openCarYard";
			icon = "050-money.paa"; // Todo
			text = "Impound Lot";
		};
		class UpgradeCar
		{
			condition = "[(str cursorObject find ""otros"" > -1 || str cursorObject find ""garaje"" > -1 || str cursorObject find ""tallerdepinturaabandonado"" > -1 || typeof cursorObject IN [""Land_ModernShowroom""])]";
			action = "[] spawn psi_fnc_carupdate;";
			icon = "050-money.paa"; // Todo
			text = "Upgrade Car";
		};
		class OpenGarageTwo
		{
			condition = "[(player distance (getMarkerPos ""RebelShit"") < 100)]";
			action = "[cursorObject] call psi_fnc_openGarage";
			icon = "050-money.paa"; // Todo
			text = "Open Garage";
		};
		class OpenJobGarage
		{
			condition = "[((myjob == ""Cop"" && typeof cursorobject == ""Land_PoliceStation"") || (myjob == ""EMS"" && typeof cursorobject == ""Land_buildingsfiredept1"") || (myjob == ""EMS"" && typeof cursorobject == ""Land_buildingshospital1"") || myJob == ""Cop"" && player distance CTU_Shops < 20)]";
			action = "loseDialog 0; [] spawn psi_fnc_opengaragepolice;";
			icon = "050-money.paa"; // Todo
			text = "Open Job Garage";
		};
		class OpenJobGarageMafia
		{
			condition = "[(myJob == ""Mafia"" && ((player distance (getMarkerPos ""RebelShit"")) < 100))]";
			action = "closeDialog 0; [] spawn psi_fnc_opengaragepolice;";
			icon = "050-money.paa"; // Todo
			text = "Open Job Garage";
		};
		class SpawnJobVehicle
		{
			condition = "[((myjob != ""none"" && typeof cursorObject IN [""Land_Centrelink""]))]";
			action = "[spawn] psi_fnc_spawnjobvehicle";
			icon = "050-money.paa"; // Todo
			text = "Spawn Job Vehicle";
		};
		class OpenGarageThree
		{
			condition = "[(myjob == ""none"" && ((player distance (getMarkerPos ""marker_11"") < 50 || player distance (getMarkerPos ""marker_12"") < 50  || player distance (getMarkerPos ""marker_9"") < 50 || player distance (getMarkerPos ""marker_10"") < 50 || player distance (getMarkerPos ""marker_13"") < 50 )))]";
			action = "[cursorObject] call psi_fnc_openGarage";
			icon = "050-money.paa"; // Todo
			text = "Open Garage";
		};
		class SearchJobs
		{
			condition = "[((typeof cursorObject == ""Land_Centrelink""))]";
			action = "[player] spawn psi_fnc_startjob";
			icon = "050-money.paa"; // Todo
			text = "Search Jobs";
		};
		class UpgradeHouse
		{
			condition = "[(((player distance (getMarkerPos ""houseUpgrades"")) < 50))]";
			action = "[] spawn psi_fnc_UpgradeHouse";
			icon = "050-money.paa"; // Todo
			text = "Upgrade House (125k)";
		};
		class OpenPhone
		{
			condition = "[(count (player call TFAR_fnc_radiosList) > 0)]";
			action = "createdialog ""phoneHUD""";
			icon = "050-money.paa"; // Todo
			text = "Open Phone";
		};
		class TooManyOnDuty
		{
			condition = "[(myjob == ""none"" && (player getvariable ""cop"") > 0 && (player getvariable ""cop"") < 5 && (typeof cursorobject == ""Land_PoliceStation"" || typeof cursorObject == ""Land_Kangaro0_PD_01_F"") && count currentcop > 25)]";
			action = "";
			icon = "050-money.paa"; // Todo
			text = "Too many on duty!";
		};
};

	class StartEnd {
		action = "";
		icon = "050-money.paa";
		text = "Jobs";
		class FireDispatchSignIn
		{
			condition = "[(myjob == ""EMS"" && !dispatch && (player getvariable ""EMS"") > 0 )]";
			action = "[player,""Fire Dispatch""] spawn psi_fnc_jobstart";
			icon = "050-money.paa"; // Todo
			text = "Sign In";
		};
		class EmsDispatchSignIn
		{
			condition = "[(myjob == ""EMS"" && !dispatch && (player getvariable ""ems"") > 0)]";
			action = "[player,""Medic Dispatch""] spawn psi_fnc_jobstart";
			icon = "050-money.paa"; // Todo
			text = "Dispatch Sign In";
		};
		class SignOffFire
		{
			condition = "[(myjob == ""EMS"" && typeof cursorobject == ""Land_buildingsfiredept1"")]";
			action = "[] call psi_fnc_jobEnd";
			icon = "050-money.paa"; // Todo
			text = "Sign Off";
		};
		class SignOffEMS
		{
			condition = "[(myjob == ""EMS"" && typeof cursorobject == ""Land_buildingshospital1"")]";
			action = "[] call psi_fnc_jobEnd";
			icon = "050-money.paa"; // Todo
			text = "Sign Off";
		};
		class JudgeSignIn
		{
			condition = "[(myjob == ""none"" && (player getvariable ""ems"") > 0 && typeof cursorobject == ""Land_buildingshospital1"")]";
			action = "[player,""EMS""] spawn psi_fnc_jobstart";
			icon = "050-money.paa"; // Todo
			text = "Judge Sign In";
		};
		class LawyerSignIn
		{
			condition = "[(myjob == ""none"" && (player getvariable ""legal"") > 0)]";
			action = "[player,""Lawyer""] spawn psi_fnc_jobstart";
			icon = "050-money.paa"; // Todo
			text = "Lawyer Sign In";
		};
		class LegalSignOff
		{
			condition = "[(myjob == ""Judge"" || myjob == ""Lawyer"")]"; 
			action = "[] call psi_fnc_jobEnd";
			icon = "050-money.paa"; // Todo
			text = "Sign-Off Legal";
		};
		class FireSignIn
		{
			condition = "[(myjob == ""none"" && (player getvariable ""EMS"") > 0 && typeof cursorobject == ""Land_buildingsfiredept1"")]";
			action = "[player,""EMS""] spawn psi_fnc_jobstart";
			icon = "050-money.paa"; // Todo
			text = "Fire Department Sign In";
		};
		class EMSSignIn
		{
			condition = "[(myjob == ""none"" && (player getvariable ""ems"") > 0 && typeof cursorobject == ""Land_buildingshospital1"")]";
			action = "[player,""EMS""] spawn psi_fnc_jobstart";
			icon = "050-money.paa"; // Todo
			text = "EMS Sign In";
		};
	};

	class Shops
	{
		action = "";
		icon = "050-money.paa"; // Todo
		text = "Shops";

		class BoatShop
		{
			condition = "[(str cursorObject find ""embarcadero"" > -1)]";
			action = "createdialog ""buycar"";";
			icon = "050-money.paa"; // Todo
			text = "Boat Shop";
		};

		class RareFishSales
		{
			condition = "[(cursorObject == fishTrader)]";
			action = "closedialog 0; createdialog ""RareFish_Menu""; [""rarefish""] spawn psi_fnc_LoadStore;";
			icon = "050-money.paa"; // Todo
			text = "Fish Sales";
		};

		class TradeRarePelt
		{
			condition = "[(cursorObject == fishTrader)]";
			action = "closedialog 0; [] spawn psi_fnc_rarePelt;";
			icon = "050-money.paa"; // Todo
			text = "Trade Pelt";
		};

		class ClothingStore
		{
			condition = "[(typeof cursorObject IN [""Land_Coffee_DED_Coffee_02_F"",""Land_Coffee_DED_Coffee_01_F""])]";
			action = "closedialog 0; createdialog ""Clothing_Menu""; [""clothing""] spawn psi_fnc_LoadStore;";
			icon = "050-money.paa"; // Todo
			text = "Clothing Store";
		};

		class GunStore
		{
			condition = "[(typeof cursorObject == ""Land_buildingGunStore1"")]";
			action = "closedialog 0; createdialog ""gun_menu""; [""gunstore""] spawn psi_fnc_LoadStore;";
			icon = "050-money.paa"; // Todo
			text = "Gun Store";
		};

		class AdvancedRebel
		{
			condition = "[(((player distance (getMarkerPos ""marker_a1d1v1r1e1b1"")) < 50) && (licensearray select 5) == 1)]";
			action = "closedialog 0; createdialog ""gun_menu""; [""advancedrebel""] spawn psi_fnc_LoadStore; hint 'You've found the hidden rebel!';";
			icon = "050-money.paa"; // Todo
			text = "Advanced Rebel";
		};

		class DonutMenu
		{
			condition = "[(typeof cursorObject == ""land_cg_dunkinbronuts"")]";
			action = "closedialog 0; createdialog ""food_menu""; [""donuts""] spawn psi_fnc_LoadStore;";
			icon = "050-money.paa"; // Todo
			text = "Donut Menu";
		};

		class McDildos
		{
			condition = "[(typeof cursorObject == ""Land_Market_DED_Market_01_F"")]";
			action = "closedialog 0; createdialog ""food_menu""; [""mcdonalds""] spawn psi_fnc_LoadStore;";
			icon = "050-money.paa"; // Todo
			text = "McDildos";
		};

		class FastFood
		{
			condition = "[(str cursorobject find ""carrito"" > -1 || str cursorobject find ""modelos6ki"" > -1)]";
			action = "closedialog 0; createdialog ""food_menu""; [""hotdogs""] spawn psi_fnc_LoadStore;";
			icon = "050-money.paa"; // Todo
			text = "Fast Food";
		};

		class PizzaMenu
		{
			condition = "[(typeof cursorObject == ""land_cg_dexters"")]";
			action = "closedialog 0; createdialog ""food_menu""; [""pizza""] spawn psi_fnc_LoadStore;";
			icon = "050-money.paa"; // Todo
			text = "Pizza Menu";
		};

		class BarStore
		{
			condition = "[(typeof cursorObject == ""Land_buildingBar1"")]";
			action = "closedialog 0; createdialog ""food_menu""; [""bar""] spawn psi_fnc_LoadStore;";
			icon = "050-money.paa"; // Todo
			text = "Bar Store";
		};

		class GeneralStore
		{
			condition = "[(typeof cursorObject IN [""Land_Coffee_DED_Coffee_02_F"",""Land_fs_roof_F"",""Land_Coffee_DED_Coffee_01_F"",""Land_Shop_DED_Shop_01_F"",""Land_Shop_DED_Shop_02_F""])]";
			action = "closedialog 0; createdialog ""GeneralStore_Menu""; [""general""] spawn psi_fnc_LoadStore;";
			icon = "050-money.paa"; // Todo
			text = "General Store";
		};
	};

	class SignOffPD
	{
		condition = "[((myjob == 'Cop') && (typeof cursorObject == 'Land_Kangaro0_PD_01_F'))]";
		action = "[] call PSI_fnc_jobEnd;";
		icon = "050-money.paa"; // Todo
		text = "Sign Out";
	};

	class Police
	{
		action = "";
		icon = "050-money.paa"; // Todo
		text = "Police";
		class PoliceDispatchSignIn
		{
			condition = "[( myjob == ""Cop"" && !dispatch && (player getvariable ""cop"") > 0 )]";
			action = "[player,""Police Dispatch""] spawn psi_fnc_jobstart;";
			icon = "050-money.paa"; // Todo
			text = "Dispatch Sign In";
		};
		class DispatchSignOff
		{
			condition = "[((dispatch) && (typeof cursorObject == 'Land_Kangaro0_PD_01_F'))]";
			action = "Dispatch = false";
			icon = "050-money.paa"; // Todo
			text = "Dispatch Sign Off";
		};
		class SeizeObject
		{
			condition = "[((myJob == ""Cop"" && (count(nearestObjects [player,[""weaponholder""],3])>0)))]";
			action = "[] spawn PSI_fnc_seizeObjects;";
			icon = "050-money.paa"; // Todo
			text = "Seize Objects";
		};
		class GarageVehicle
		{
			condition = "[(myjob == ""Cop"" && cursorObject isKindOf ""Car"")]";
			action = "[""who cares"",0,cursorObject,player] remoteExec [""Server_fnc_updateCarStatus"",2];  paycheck = paycheck + 10; hint ""Impounded and Paid""";
			icon = "050-money.paa"; // Todo
			text = "Garage Vehicle ($10)";
		};
		class RevokeLicence
		{
			condition = "[(cursorObject isKindOf 'Man' && myjob == ""Cop"")]";
			action = "['Revoking',6,psi_fnc_revokelicense,cursorObject,'vvv_anim_ticket',cursorObject,""cg_mission_files\sounds\patdown1.ogg"",0] spawn psi_fnc_dotask";
			icon = "050-money.paa"; // Todo
			text = "Revoke Licenses";
		};
		class GetID
		{
			condition = "[(cursorObject isKindOf 'Man' && myjob == ""Cop"")]";
			action = "hint format[""%1"",name cursorObject];";
			icon = "050-money.paa"; // Todo
			text = "Get ID";
		};
		class PatDown
		{
			condition = "[(!(cursorObject getVariable[""dead"",false]) && cursorObject isKindOf 'Man' && (animationstate cursorObject) == 'amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon' || (animationstate cursorObject) == 'Incapacitated' || (animationstate cursorObject) == 'AmovPercMstpSnonWnonDnon_Ease' || (animationstate cursorObject) == 'Acts_AidlPsitMstpSsurWnonDnon_loop')]";
			action = "['Patting Down Target',8,psi_fnc_startpatdown,cursorObject,'AinvPknlMstpSnonWnonDnon_medic_1',cursorObject,""cg_mission_files\sounds\patdown1.ogg"",0] spawn psi_fnc_dotask";
			icon = "050-money.paa"; // Todo
			text = "Pat Down";
		};
		class Restrain
		{
			condition = "[((animationstate cursorObject) == 'incapacitated' || (animationstate cursorObject) == 'deadstate' || (animationstate cursorObject) == 'amovpercmstpssurwnondnon' || (animationstate cursorObject) == 'amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon')]";
			action = "['Restraining',3,psi_fnc_restrain,cursorObject,'AinvPknlMstpSnonWnonDnon_medic_1',cursorObject,""cg_mission_files\sounds\handcuff.ogg"",0] spawn psi_fnc_dotask";
			icon = "050-money.paa"; // Todo
			text = "Restrain";
		};
		class Unrestrain
		{
			condition = "[(myJob == ""Cop"" && cursorObject isKindOf 'Man' && ((animationstate cursorObject) == 'Acts_AidlPsitMstpSsurWnonDnon_loop' || (animationstate cursorObject) == 'amovpercmstpssurwnondnon' || (animationstate cursorObject) == 'amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon'))]";
			action = "['Unrestraining',3,psi_fnc_unrestrain,cursorObject,'AinvPknlMstpSnonWnonDnon_medic_1',cursorObject,""cg_mission_files\sounds\handcuff.ogg"",0] spawn psi_fnc_dotask";
			icon = "050-money.paa"; // Todo
			text = "Unrestrain";
		};
		class TicketUser
		{
			condition = "[(myJob == ""Cop"" && cursorObject isKindOf 'Man')]";
			action = "createdialog ""np_ticketpolice"";";
			icon = "050-money.paa"; // Todo
			text = "Ticket User";
		};
		class SendToJail
		{
			condition = "[(myJob == ""Cop"" && cursorObject isKindOf 'Man' && getpos player distance [5556.2,6291.29,0.00143433] < 100)]";
			action = "createdialog ""jailprocess"";";
			icon = "050-money.paa"; // Todo
			text = "Send To Jail";
		};
		class WantedSystem
		{
			condition = "[( myjob == ""Cop"" && (( typeof cursorobject == ""Land_PoliceStation"") || ( vehicle player != player )) )]";
			action = "createdialog ""wanted"";";
			icon = "050-money.paa"; // Todo
			text = "Wanted System";
		};
		class RaidShop
		{
			condition = "[( (isplayer cursorObject && cursorObject isKindOf ""Man"") && myjob == ""Cop"" && player getvariable ""cop"" > 5)]";
			action = " [player] remoteexec [""psi_fnc_raidshop"",cursorObject]";
			icon = "050-money.paa"; // Todo
			text = "Raid Shop";
		};
		class RaidHouse
		{
			condition = "[( (isplayer cursorObject && cursorObject isKindOf ""Man"") && myjob == ""Cop"" && player getvariable ""cop"" > 5)]";
			action = " [player] remoteexec [""psi_fnc_raidhouse"",cursorObject]";
			icon = "050-money.paa"; // Todo
			text = "Raid House";
		};
		class SeizeAllProperty
		{
			condition = "[( (isplayer cursorObject && cursorObject isKindOf ""Man"") && myjob == ""Cop"" && player getvariable ""cop"" > 5)]";
			action = " [player] remoteexec [""psi_fnc_seizeproperty"",cursorObject]";
			icon = "050-money.paa"; // Todo
			text = "Seize All Property";
		};
		class PoliceBasicGear
		{
			condition = "[((myjob == ""Cop"" && typeof cursorobject == ""Land_PoliceStation"") || (myjob == ""EMS"" && typeof cursorobject == ""Land_buildingsfiredept1"") || (myjob == ""EMS"" && typeof cursorobject == ""Land_buildingshospital1"") || myJob == ""Mafia"")]";
			action = "[""basic""] spawn psi_fnc_setGear";
			icon = "050-money.paa"; // Todo
			text = "Basic Gear";
		};
		class PoliceRiotGear
		{
			condition = "[( (myjob == ""Cop"" && typeof cursorobject == ""Land_PoliceStation"") && player getvariable ""cop"" > 7 )]";
			action = "[""riot""] spawn psi_fnc_setGear";
			icon = "050-money.paa"; // Todo
			text = "Riot Gear";
		};
		class PoliceWeaponLocker
		{
			condition = "[((myjob == ""Cop"" && typeof cursorobject == ""Land_PoliceStation""))]";
			action = "closedialog 0; createdialog ""gun_menu""; [""Police""] spawn psi_fnc_LoadStore";
			icon = "050-money.paa"; // Todo
			text = "Police Weapon Locker";
		};
	};

	class Banking
	{
		action = "";
		icon = "050-money.paa"; // Todo
		text = "Banking";
		class GiveLoan
		{
			condition = "[(isplayer cursorObject && vehicle cursorObject == cursorObject) && myJob == ""Mafia"" && player getvariable ""mafia"" > 5]";
			action = "[cursorObject] spawn PSI_fnc_giveLoan;";
			icon = "050-money.paa"; // Todo
			text = "Give Loan";
		};
	};

	//Medical / EMS
	class Medical
	{
		action = "";
		icon = "050-money.paa"; // Todo
		text = "Medical";
		class CPRPlayer
		{
			condition = "[cursorObject getVariable[""dead"",FALSE] && (count currentEMS < 0)]";
			action = "['Reviving',125,PSI_fnc_sendRevive,player,'AinvPknlMstpSnonWnonDnon_medic_1',cursorObject,""cg_mission_files\sounds\patdown1.ogg"",0] spawn PSI_fnc_dotask";
			icon = "050-money.paa"; // Todo
			text = "CPR Player";
		};
		class RevivePlayer
		{
			condition = "[cursorObject getVariable[""dead"",FALSE] && (myjob == ""EMS"" || myJob == ""Fire"")]";
			action = "['Reviving',15,PSI_fnc_sendRevive,player,'AinvPknlMstpSnonWnonDnon_medic_1',cursorObject,""cg_mission_files\sounds\patdown1.ogg"",0] spawn PSI_fnc_dotask";
			icon = "050-money.paa"; // Todo
			text = "Revive";
		};
	};

	//Hospital Interactions
	class Hospital
	{
		action = "";
		icon = "050-money.paa"; // Todo
		text = "Hospital";
		class FullHeal
		{
			condition = "[true]";
			action = "";
			icon = "050-money.paa"; // Todo
			text = "Heal";
		};
		class SearchTracking
		{
			condition = "[true]";
			action = "[] spawn PSI_fnc_disabletrackingme;";
			icon = "050-money.paa"; // Todo
			text = "Search Tracking";
		};
	};


	class PromoteUser
	{
		condition = "[(cursorObject isKindOf 'Man' && (myjob == ""Mafia"" || myjob == ""Fire"" || myjob == ""Cop"" || myjob == ""EMS"" || myjob == ""Judge"" || myjob == ""Lawyer""))]";
		action = "[cursorObject] spawn psi_fnc_promotionStart";
		icon = "050-money.paa"; // Todo
		text = "Promote";
	};

	//Inside Vehicle
	class InVehicle
	{
		action = "";
		icon = "050-money.paa"; // Todo
		text = "Vehicles";
		class SeatBeltOn
		{
			condition = "[!psi_seatbelt && vehicle player != player ]";
			action = "psi_seatbelt = true;";
			icon = "050-money.paa"; // Todo
			text = "Seatbelt On";
		};
		class SeatBeltOff
		{
			condition = "[psi_seatbelt && vehicle player != player ]";
			action = "psi_seatbelt = false;";
			icon = "050-money.paa"; // Todo
			text = "Seatbelt Off";
		};
	};

	//Outside Vehicle
	class OutVehicle
	{
		action = "";
		icon = "050-money.paa"; // Todo
		text = "Vehicle";
		class FillVehicle
		{
			condition = "[((typeof cursorobject == ""Land_fs_feed_F"" ))]";
			action = "[] spawn PSI_fnc_fillvehicle;";
			icon = "050-money.paa"; // Todo
			text = "Fill Vehicle";
		};
		class PullOut
		{
			condition = "[(cursorObject isKindOf ""Car"" && myjob IN [""Cop"",""Fire"",""EMS""] )]";
			action = "['Pulling Out Players',8,psi_fnc_pulloutplayers,player,'AinvPknlMstpSnonWnonDnon_medic_1',cursorObject,""cg_mission_files\sounds\patdown1.ogg"",0] spawn psi_fnc_dotask;";
			icon = "050-money.paa"; // Todo
			text = "Pull Out";
		};
		class ScrapVehicle
		{
			condition = "[(((getpos player) distance [1055,3660,0.014] < 30))]";
			action = "[""who cares"",0,cursorObject,player] remoteExec [""Server_fnc_updateCarStatus"",2]; paycheck = paycheck + 500; hint ""Scrapped and Paid""";
			icon = "050-money.paa"; // Todo
			text = "Scrap";
		};
		class ImpoundVehicle
		{
			condition = "[((myjob == ""Cop"" && cursorObject isKindOf ""Car""))]";
			action = "[""who cares"",0,cursorObject,player] remoteExec [""Server_fnc_updateCarStatus"",2];  paycheck = paycheck + 10; hint ""Impounded and Paid""";
			icon = "050-money.paa"; // Todo
			text = "Impound";
		};
		// class SellVehicle
		// {
		// 	condition = "[(((getpos player) distance [1055,3660,0.014] < 20 && player getvariable ""Mafia"" > 0))]";
		// 	action = "['Selling Vehicle',60,psi_fnc_sellVehicle,player,'AinvPknlMstpSnonWnonDnon_medic_1',cursorObject,""cg_mission_files\sounds\repair.ogg"",0] spawn psi_fnc_dotask";
		// 	icon = "050-money.paa"; // Todo
		// 	text = "Sell";
		// };
		class RepairVehicle
		{
			condition = "[((cursorObject isKindOf 'Car' || cursorObject isKindOf 'Air' || cursorObject isKindOf 'Boat'))]";
			action = "['Repairing',10,psi_fnc_repair,cursorObject,'AinvPknlMstpSnonWnonDnon_medic_1',cursorObject,""cg_sndimg\sounds\repair.ogg"",100] spawn psi_fnc_dotask";
			icon = "050-money.paa"; // Todo
			text = "Repair";
		};
		class UseKey
		{
			condition = "[(((vehicle player) == player && cursorObject in Current_Cars))]";
			action = "[cursorObject] call psi_fnc_useKey";
			icon = "050-money.paa"; // Todo
			text = "Use Key";
		};
		class UseKeyTwo
		{
			condition = "[(((vehicle player) in Current_Cars))]";
			action = "[cursorObject] call psi_fnc_useKey";
			icon = "050-money.paa"; // Todo
			text = "Use Key";
		};
		class UnflipVehicle
		{
			condition = "[(((cursorObject isKindOf ""Air"" || cursorObject isKindOf ""Car"" || cursorObject isKindOf ""Boat"") && cursorObject in current_cars ))]";
			action = "cursorObject setpos (getposatl cursorObject)";
			icon = "050-money.paa"; // Todo
			text = "Unflip";
		};
		class PushVehicle
		{
			condition = "[(((cursorObject isKindOf 'Car' || cursorObject isKindOf 'Ship') && player distance cursorObject < 11 && cursorObject in current_cars))]";
			action = "[] spawn psi_fnc_pushveh";
			icon = "050-money.paa"; // Todo
			text = "Push";
		};
	};

	class Buildings
	{
		action = "";
		icon = "050-money.paa"; // Todo
		text = "Buildings";
		class BrowseShops
		{
			condition = "[((typeof cursorObject) IN [""Land_buildingCommercial1"",""Land_buildingCommercial2""])]";
			action = "[typeof cursorObject,player] remoteExec [""server_fnc_retreiveStoreShopper"",2]";
			icon = "050-money.paa"; // Todo
			text = "Browse Shop";
		};
		class RentShop
		{
			condition = "[((typeof cursorObject == ""Land_buildingApartments2A"" && player distance getpos cursorObject < 20 && player getvariable ""legal"" > 0 && player distance [8186.91,2862.51,0.00143814] < 100))]";
			action = "createdialog ""rentshop""";
			icon = "050-money.paa"; // Todo
			text = "Browse Shop";
		};
		class BarberShop
		{
			condition = "[(typeof cursorObject == ""Land_buildingBarbers1"")]";
			action = "closedialog 0; createdialog ""HairDresser_Menu""; [""Glasses""] spawn psi_fnc_loadStore;";
			icon = "050-money.paa"; // Todo
			text = "Barber Shop";
		};
	};
};
