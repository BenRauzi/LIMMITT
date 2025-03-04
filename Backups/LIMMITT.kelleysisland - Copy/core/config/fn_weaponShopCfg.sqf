#include <macro.h>

private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_shop) do
{
        case "med_supplies":
        {
                switch (true) do
                {
                        case (playerSide != independent): {"You are not an EMS"};
                        default {
                                ["EMS Supplies Shop",
                                        [
                                            ["FirstAidKit",nil,250],
                                            ["LIMMITT_Network_Phone",nil,50],
                                            ["Medikit",nil,250],
                                            ["Harris_medkit",nil,1000],
                                            ["ToolKit",nil,250]
                                        ]
                                ];
                        };
                };
        };
        case "med_basic":
        {
                switch (true) do
                {
                        case (playerSide != independent): {"You are not an EMS"};
                        default {
                                ["EMS Basic Shop",
                                        [
                                            ["A3L_Extinguisher",nil,500],
                                            ["30Rnd_test_mag","Fire Extinguisher Refill",50],
                                            ["Harris_medkit",nil,1000],
                                            //["A3L_ChainSaw","Jaws of life (dont work)",500],
                                            //["chainsawfuel","Jaws of life fuel",50],
                                            ["A3L_Shovel",nil,500],
                                            ["tf_anprc152",nil,500],
                                            ["tf_rt1523g",nil,500],
                                            ["ItemGPS",nil,0],
                                            ["ItemMap",nil,0],
                                            ["Binocular",nil,2000],
                                            ["ToolKit",nil,250],
                                            ["pmc_earpiece",nil,250],
                                            ["Chemlight_red",nil,100]
                                        ]
                                ];
                        };
                };
        };


		case "civ_lsmo":
        {
                switch(true) do
                {
                        case (playerSide != civilian): {"You are not a civ!"};
                        case (!license_civ_lsmo): {"You are not a LSMO security officer."};
                        default
                        {
                                ["Lakeside Security Detail Store                                                                                                                                                                                                ",
                                        [
                                                ["RH_Deagleg",nil,40000],
                                                ["RH_7Rnd_50_AE",nil,50]
                                        ]
                                ];
                        };
                };
        };


        case "cop_basic":
        {
                switch(true) do
                {
                        case (playerSide != west): {"You are not in the DCSO!"};
                        default
                        {
                                ["Patrol Gear Shop",
                                        [
                                                ["Harris_keyCard",nil,250],
                                                ["LIMMITT_Network_Phone",nil,50],
                                                ["FirstAidKit",nil,250],
                                                ["Harris_medkit",nil,1000],
                                                ["Medikit",nil,250],
                                                ["ToolKit",nil,250],
                                                ["CG_BATON","Police Baton",100],
                                                ["Binocular",nil,2000],
                                                ["ItemGPS",nil,50],
                                                ["ItemMap",nil,50],
                                                ["pmc_earpiece",nil,250],
                                                ["tf_anprc152",nil,50]
                                                
                                        ]
                                ];
                        };
                };
        };
        case "recruit":
        {
                switch(true) do
                {
                        case (playerSide != west): {"You are not in the DCSO!"};
                        case (__GETC__(life_coplevel) < 1): {"You are not a Cadet!"};
                        default
                        {
                                ["Cadet Shop",
                                        [
                                            //Taser
                                            ["JD_Taser",nil,500],
                                            ["Taser_mag",nil,100],
                                            //sidearm
                                            ["RH_g19",nil,1000],
                                            ["RH_17Rnd_9x19_g17",nil,100],
                                            //Accessories
											["RH_X300",nil,100],
                                            ["RH_M6X",nil,100]
                                        ]
                                ];
                        };
                };
        };
        case "cop_patrol":
        {
                switch(true) do
                {
                        case (playerSide != west): {"You are not in the DCSO!"};
                        case (__GETC__(life_coplevel) < 3): {"You are not a Deputy!"};
                        default
                        {
                                ["Deputy Shop",
                                        [
                                            //Taser
                                            ["JD_Taser",nil,500],
                                            ["Taser_mag",nil,100],
                                            //Sidearm
                                            ["RH_g19",nil,1000],
                                            ["RH_17Rnd_9x19_g17",nil,100],
                                            //Primary
                                            ["hlc_rifle_M4",nil,1500],
                                            ["hlc_30rnd_556x45_EPR",nil,100],
                                            //Accessories
											["RH_barska_rds",nil,100],
                                            ["optic_Hamr",nil,100],
                                            ["RH_SFM952V",nil,100],
                                            ["RH_X300",nil,100]
                                        ]
                                ];
                        };
                };
        };
        case "cop_corporal":
        {
                switch(true) do
                {
                        case (playerSide != west): {"You are not in the DCSO!"};
                        case (__GETC__(life_coplevel) < 4): {"You are not a Corporal!"};
                        default
                        {
                                ["Corporal Shop",
                                        [
                                            //Taser
                                            ["JD_Taser",nil,500],
                                            ["Taser_mag",nil,100],
                                            //Sidearm
                                            ["RH_g19",nil,1000],
                                            ["RH_17Rnd_9x19_g17",nil,100],
                                            //Primary
                                            ["hlc_rifle_M4",nil,1500],
                                            ["hlc_30rnd_556x45_EPR",nil,100],
                                            //Accessories
											["RH_barska_rds",nil,100],
                                            ["optic_Hamr",nil,100],
                                            ["SMA_eotech552",nil,100],
                                            ["RH_compM2",nil,100],
                                            ["RH_SFM952V",nil,100],
                                            ["RH_X300",nil,100]
                                        ]
                                ];
                        };
                };
        };
        case "cop_sergeant":
        {
                switch(true) do
                {
                        case (playerSide != west): {"You are not in the DCSO!"};
                        case (__GETC__(life_coplevel) < 5): {"You are not a Sergeant!"};
                        default
                        {
                                ["Sergeant Shop",
                                        [
                                            //Taser
                                            ["JD_Taser",nil,500],
                                            ["Taser_mag",nil,100],
                                            //Sidearm
                                            ["RH_g19",nil,1000],
                                            ["RH_17Rnd_9x19_g17",nil,100],
                                            ["RH_p226",nil,1000],
                                            ["RH_15Rnd_9x19_SIG",nil,100],
                                            //Primary
                                            ["hlc_rifle_M4",nil,1500],
                                            ["hlc_30rnd_556x45_EPR",nil,100],
                                            ["hlc_rifle_416D10_RAHG_x15",nil,1500],
                                            ["hlc_30rnd_556x45_EPR",nil,100],
                                            //Accessories
											["RH_barska_rds",nil,100],
                                            ["optic_Hamr",nil,100],
                                            ["SMA_eotech552",nil,100],
                                            ["RH_eotech553mag",nil,100],
                                            ["RH_SFM952V",nil,100],
                                            ["RH_X300",nil,100],
                                            ["RH_M6X",nil,100]
                                        ]
                                ];
                        };
                };
        };
		case "cop_r1":
        {
                switch(true) do
                {
                        case (playerSide != west): {"You are not in the DCSO!"};
                        case (__GETC__(life_coplevel) < 5): {" You are not Part of DTU!"};
                        default
                        {
                                ["DTU Armoury",
                                        [
                                            //Taser
                                            ["JD_Taser",nil,500],
                                            ["Taser_mag",nil,100],
                                            //Sidearm
                                            ["RH_kimber_nw",nil,1000],
                                            ["",nil,100],
                                            ["RH_g18",nil,1000],
                                            ["",nil,100],
                                            ["RH_tec9",nil,1000],
                                            ["",nil,100],
                                            ["RH_p226",nil,1000],
                                            ["",nil,100],
                                            ["RH_usp",nil,1000],
                                            ["",nil,100],
                                            //Primary
                                            ["RH_ar10",nil,1500],
                                            ["RH_20Rnd_762x51_AR10",nil,100],
                                            ["hlc_rifle_CQBR",nil,1500],
                                            ["hlc_30rnd_556x45_EPR",nil,100],
                                            ["RH_PDW",nil,1500],
                                            ["RH_30Rnd_6x35_mag",nil,100],
                                            ["SMA_MK18afgBLK",nil,1500],
                                            ["SMA_30Rnd_556x45_M855A1",nil,100],
                                            ["SMA_AAC_MPW_12_Black",nil,1500],
                                            ["SMA_30Rnd_762x35_BLK_EPR",nil,100],
                                            ["arifle_AKM_F",nil,1500],
                                            ["30Rnd_762x39_Mag_F",nil,100],
                                            ["SMA_M4MOE",nil,1500],
                                            ["SMA_30Rnd_556x45_M855A1",nil,100],
                                            //Accessories
											["RH_Delft",nil,100],
                                            ["RH_barska_rds",nil,100],
                                            ["optic_Hamr",nil,100],
                                            ["SMA_eotech552",nil,100],
                                            ["RH_eotech553mag",nil,100],
                                            ["RH_pdwsd",nil,100],
                                            ["RH_ta31rmr",nil,100],
                                            ["RH_compM2",nil,100],
                                            ["RH_SFM952V",nil,100],
                                            ["RH_X300",nil,100],
                                            ["RH_M6X",nil,100]
                                        ]
                                ];
                        };
                };
        };
		case "cop_r2":
        {
                switch(true) do
                {
                        case (playerSide != west): {"You are not in the DCSO!"};
                        case (__GETC__(life_coplevel) < 6): {" You are not Part of SERT!"};
                        default
                        {
                                ["SERT Armoury",
                                        [
                                            //Taser
                                            ["JD_Taser",nil,500],
                                            ["Taser_mag",nil,100],
                                            //Sidearm
                                            ["CSW_FN57_Ballistic_Shield",nil,1000],
                                            ["CSW_20Rnd_57x28_SS190",nil,100],
                                            ["RH_usp",nil,1000],
                                            ["RH_12Rnd_45cal_usp",nil,100],
                                            ["RH_p226",nil,1000],
                                            ["RH_15Rnd_9x19_SIG",nil,100],
                                            //Primary
                                            ["hlc_rifle_RU5562",nil,1500],
                                            ["hlc_30rnd_556x45_EPR",nil,100],
                                            ["hlc_rifle_RU556",nil,1500],
                                            ["hlc_30rnd_556x45_EPR",nil,100],
                                            ["hlc_rifle_bcmblackjack",nil,1500],
                                            ["29rnd_300BLK_STANAG",nil,100],
                                            ["hlc_smg_mp510",nil,1500],
                                            ["hlc_30Rnd_10mm_B_MP5",nil,100],
                                            ["SMA_ACRREMblk",nil,1500],
                                            ["SMA_30Rnd_68x43_SPC_FMJ",nil,100],
                                            ["SMA_M4afg_SM",nil,1500],
                                            ["SMA_30Rnd_556x45_M855A1",nil,100],
                                            ["RH_Mk12mod1",nil,1500],
                                            ["RH_30Rnd_556x45_Mk262",nil,100],
                                            ["hlc_rifle_vendimus",nil,1500],
                                            ["29rnd_300BLK_STANAG",nil,100],
                                            ["SMA_Mk16_blackQCB",nil,1500],
                                            ["SMA_30Rnd_556x45_M855A1",nil,100],
                                            ["RH_M16A4",nil,1500],
                                            ["30Rnd_556x45_Stanag",nil,100],
                                            //Accessories
											["RH_barska_rds",nil,100],
                                            ["optic_Hamr",nil,100],
                                            ["SMA_eotech552",nil,100],
                                            ["RH_eotech553mag",nil,100],
                                            ["RH_ta31rmr",nil,100],
                                            ["RH_compM2",nil,100],
                                            ["optic_AMS",nil,100],
                                            ["optic_Arco_blk_F",nil,100],
                                            ["RH_shortdot",nil,100],
                                            ["CSW_FN57_Barska",nil,100],
                                            ["CSW_FN57_flashlight_normal_1",nil,100],
                                            ["CSW_FN57_Shield",nil,100],
                                            ["RH_SFM952V",nil,100],
                                            ["RH_X300",nil,100],
                                            ["RH_M6X",nil,100],
                                            ["Rangefinder",nil,100]
                                        ]
                                ];
                        };
                };
        };
        case "cop_lowcommand":
        {
                switch(true) do
                {
                        case (playerSide != west): {"You are not in the DCSO!"};
                        case (__GETC__(life_coplevel) < 6): {"You are not Command!"};
                        default
                        {
                                ["Captain Shop",
                                        [
                                            //Taser
                                            ["JD_Taser",nil,500],
                                            ["Taser_mag",nil,100],
                                            //Sidearms
                                            ["RH_g19",nil,1000],
                                            ["RH_17Rnd_9x19_g17",nil,100],
                                            //Primary
                                            ["RH_M16A4",nil,2000],
                                            ["30Rnd_556x45_Stanag",nil,200],
                                            ["RH_PDW",nil,2500],
                                            ["RH_30Rnd_6x35_mag",nil,300],
                                            ["hlc_rifle_samr2",nil,3000],
                                            ["30Rnd_556x45_Stanag",nil,500],
                                            //Accessories
                                            ["RH_barska_rds",nil,300],
                                            ["optic_Hamr",nil,300],
                                            ["SMA_eotech552",nil,300],
                                            ["RH_eotech553mag",nil,300],
                                            ["RH_ta31rmr",nil,300],
                                            ["RH_compM2",nil,300],
                                            ["optic_DMS",nil,300],
                                            ["optic_Arco_blk_F",nil,300],
                                            ["RH_SFM952V",nil,300],
                                            ["RH_X300",nil,300],
                                            ["RH_M6X",nil,300]
                                        ]
                                ];
                        };
                };
        };
        case "cop_command":
        {
                switch(true) do
                {
                        case (playerSide != west): {"You are not in the DCSO!"};
                        case (__GETC__(life_coplevel) < 7): {"You are not a part of County Command!"};
                        default
                        {
                                ["Command Store",
                                        [
                                            //Taser
                                            ["JD_Taser",nil,500],
                                            ["Taser_mag",nil,100],
                                            //Sidearms
                                            ["RH_Deaglem",nil,1000],
                                            ["RH_7Rnd_50_AE",nil,100],
                                            ["RH_p226",nil,1000],
                                            ["RH_15Rnd_9x19_SIG",nil,100],
                                            ["RH_bull",nil,1000],
                                            ["RH_6Rnd_454_Mag",nil,100],
                                            ["RH_usp",nil,1000],
                                            ["RH_12Rnd_45cal_usp",nil,100],
                                            //Primary
                                            ["SMA_ACRREMblk",nil,2000],
                                            ["SMA_30Rnd_68x43_SPC_FMJ",nil,200],
                                            ["hlc_rifle_vendimus",nil,2500],
                                            ["29rnd_300BLK_STANAG",nil,300],
                                            ["hlc_rifle_Bushmaster300",nil,3000],
                                            ["29rnd_300BLK_STANAG",nil,500],
                                            ["hlc_rifle_bcmblackjack",nil,2000],
                                            ["29rnd_300BLK_STANAG",nil,200],
                                            ["hlc_rifle_bcmjack",nil,2500],
                                            ["hlc_30rnd_556x45_EPR",nil,300],
                                            ["hlc_rifle_M27IAR_x15_grip2",nil,3000],
                                            ["hlc_30rnd_556x45_EPR",nil,500],
                                            ["arifle_SPAR_03_blk_F",nil,3000],
                                            ["20Rnd_762x51_Mag",nil,500],
                                            ["hlc_rifle_416D20_x15_grip",nil,3000],
                                            ["hlc_30rnd_556x45_EPR",nil,500],
                                            ["hlc_rifle_honeybadger",nil,3000],
                                            ["29rnd_300BLK_STANAG",nil,500],
                                            //Accessories
                                            ["RH_barska_rds",nil,100],
                                            ["optic_Hamr",nil,100],
                                            ["SMA_eotech552",nil,100],
                                            ["RH_eotech553mag",nil,100],
                                            ["RH_ta31rmr",nil,100],
                                            ["RH_compM2",nil,100],
                                            ["optic_AMS",nil,100],
                                            ["optic_DMS",nil,100],
                                            ["optic_Arco_blk_F",nil,100],
                                            ["optic_ERCO_blk_F",nil,100],
                                            ["optic_SOS",nil,100],
                                            ["RH_demz",nil,100],
                                            ["optic_Yorris",nil,100],
                                            ["RH_SFM952V",nil,100],
                                            ["RH_X300",nil,100],
                                            ["RH_M6X",nil,100],
                                            ["Rangefinder",nil,100],
                                            ["muzzle_HBADGER",nil,100]
                                        ]
                                ];
                        };
                };
        };




        case "rebel_low":
        {
                switch(true) do
                {
                        case (playerSide != civilian): {"You are not a civilian!"};
                        case (!license_civ_rebel): {"You do not have the correct rebel license. Please purchase it and try again."};
                        default
                        {
                                ["Illegal Pistols",
                                    [

                                        //Browing HP
                                        ["hgun_mas_bhp_F",nil,15000],
                                        ["15Rnd_mas_9x21_Mag",nil,1500],

                                        ["RH_kimber_nw",nil,20000],
                                        ["RH_7Rnd_45cal_m1911",nil,1000],

                                        ["hgun_ACPC2_F",nil,10000],
                                        ["9Rnd_45ACP_Mag",nil,1500],

                                        ["hgun_Pistol_heavy_01_F",nil,30000],
                                        ["11Rnd_45ACP_Mag",nil,1500],

                                        ["RH_vp70",nil,20000],
                                        ["RH_18Rnd_9x19_VP",nil,1500],

                                        //Micro Uzi
                                        ["RH_muzi",nil,30000],
                                        ["RH_30Rnd_9x19_UZI",nil,1750],

                                        //Tec9
                                        ["RH_tec9",nil,30000],
                                        ["RH_32Rnd_9x19_tec",nil,2250],

                                        ["RH_vz61",nil,30000],
                                        ["RH_20Rnd_32cal_vz61",nil,2800],

                                        //Smith gold
                                        ["hgun_007_SW_M10_gold",nil,10000],
                                        ["6Rnd_45ACP_Cylinder",nil,2250],

                                        //Glock 18
                                        ["RH_g18",nil,30000],
                                        ["RH_19Rnd_9x19_g18",nil,1500],
                                        ["RH_33Rnd_9x19_g18",nil,2250]


                                    ]
                                ];
                        };
                };
        };

        case "rebel_high":
        {
                switch(true) do
                {
                        case (playerSide != civilian): {"You are not a civilian!"};
                        case (!license_civ_rebel): {"You do not have the correct rebel license. Please purchase it and try again."};
                        default
                        {
                                ["Black Market Dealer",
                                    [
                                        //M16A4
                                        ["RH_M16A4",nil,60000],
                                        ["30Rnd_556x45_Stanag",nil,1000],
                                       
                                        //PDW
                                        ["RH_PDW",nil,85000],
                                        ["RH_30Rnd_6x35_mag",nil,1000],
                                        
                                        
                                        //Sting
                                        ["SMG_02_F",nil,60000],
                                        ["30Rnd_9x21_Mag_SMG_02",nil,1000],
                                       
                                        
                                        //Accessories
                                        ["RH_eotech553",nil,1000],
                                        ["RH_t1",nil,1000],
                                        ["FHQ_optic_AIM",nil,1000],
                                        ["RH_LTdocter",nil,1000],
                                        ["RH_barska_rds",nil,1000],
                                        ["RH_compm4s",nil,1000]

                                    ]
                             ];
                        };
                };
        };

        case "gun":
        {
                switch(true) do
                {
                        case (playerSide != civilian): {"You are not a civilian!"};
                        case (!license_civ_gun): {"You don't have a Firearms license!"};
                        default
                        {
                                ["Kaels Firearms",
                                        [
                                                ["RH_g17",nil,7500],
                                                ["RH_g19",nil,7500],
                                                ["RH_g19t",nil,7500],
                                                ["RH_17Rnd_9x19_g17",nil,1000],

                                                ["RH_m9",nil,7500],
                                                ["RH_15Rnd_9x19_M9",nil,1000],

                                                ["hgun_Rook40_F",nil,7500],
                                                ["16Rnd_9x21_Mag",nil,1100],

                                                ["RH_mk2",nil,7500],
                                                ["RH_10Rnd_22LR_mk2",nil,1250],

                                                ["RH_m9c",nil,7500],
                                                ["RH_15Rnd_9x19_M9",nil,1000],

                                                ["hgun_P07_F",nil,7500],
                                                ["16Rnd_9x21_Mag",nil,500],

                                                ["RH_gsh18",nil,7500],
                                                ["RH_18Rnd_9x19_gsh",nil,750]


                                        ]
                                ];
                        };
                };
        };

        case "rifle":
        {
                switch(true) do
                {
                        case (playerSide != civilian): {"You are not a civilian!"};
                        case (!license_civ_rifle): {"You don't have a Rifle license!"};
                        default
                        {
                                ["Hunting Rifle Shop",
                                        [
                                                ["A3L_CZ550",nil,20000],
                                                ["A3L_CZ550mag",nil,1000],
                                                ["A3L_CZ550Scope",nil,1000]
                                        ]
                                ];
                        };
                };
        };

        case "gang":
        {
                switch(true) do
                {
                        case (playerSide != civilian): {"You are not a civilian!"};
                        default
                        {
                                ["Hideout Armament",
                                        [
                                                ["A3L_Glock17",nil,7500],
                                                ["A3L_Glock17mag",nil,500]
                                        ]
                                ];
                        };
                };
        };

        case "genstore":
        {
                ["General Store",
                        [
                                //["A3L_JackHammer","Jack Hammer (Primary Slot)",10000],
                                //["jackhammerfuel","Jack Hammer Fuel",500],
                                ["ItemMap",nil,50],
                                ["LIMMITT_Network_Phone",nil,50],
                                ["Harris_medkit",nil,1000],
                                ["tf_anprc152",nil,1000],
                                ["a3l_pickaxe",nil,1000],
                                ["pickaxe_swing",nil,10],
                                ["Binocular",nil,2000],
                                ["tf_microdagr",nil,150],
                                ["ToolKit",nil,250],
                                ["ItemCompass",nil,100],
                                ["ItemGPS",nil,100],
                                ["NVGoggles_mas_h",nil,6500],
                                ["NVGoggles_OPFOR",nil,6500],
                                ["NVGoggles",nil,6500],
                                ["Chemlight_red",nil,150],
                                ["Chemlight_yellow",nil,150],
                                ["Chemlight_green",nil,150],
                                ["Chemlight_blue",nil,150],
                                ["Harris_workbench",nil,3000],
                                ["Harris_pot",nil,3000],
                                ["Harris_RDX",nil,2000],
                                ["Harris_Burlap",nil,3000],
                                ["Harris_Rope",nil,3000],
                                ["A3L_Sign2","Weed Sign(Secondary Slot)",1000],
                                ["A3L_Sign","Police Sign(Secondary Slot)",1000],
                                ["Tv_Camera","TV Camera(Secondary Slot)",15000]
                        ]
                ];
        };

        case "seedsstore":
        {
                ["Sketchy Store",
                        [
                             ["Harris_weedSeeds",nil,1000]
                        ]
                ];
        };
};
