//Configuration for Airdrop Assistance
//Author: Apoc

APOC_AA_VehOptions =
[
// ["Menu Text",        ItemClassname,                       Price,  "Drop type"]
["Quadbike (Civilian)", "C_Quadbike_01_F",                   1200,   "vehicle"],
["Rescue Boat",         "C_Rubberboat",                      2500,   "vehicle"],
["MH-9 Hummingbird",    "B_Heli_Light_01_F",                 10000,  "vehicle"],
["Strider",             "I_MRAP_03_F",                       10000,  "vehicle"],
["Strider HMG",         "I_MRAP_03_hmg_F",                   30000,  "vehicle"],
["CRV-6e Bobcat",       "B_APC_Tracked_01_CRV_F",            45000,  "vehicle"],
//["MSE-3 Marid",         "O_APC_Wheeled_02_rcws_F",           50000,  "vehicle"],
//["UH-80 Ghost Hawk",    "B_Heli_Transport_01_camo_F",        75000,  "vehicle"],
["AH-9 Pawnee",         "B_Heli_Light_01_armed_F",           100000, "vehicle"],
["T-100 Varsuk",        "O_MBT_02_cannon_F",                 175000, "vehicle"],
["MBT-52 Kuma",         "I_MBT_03_cannon_F",                 200000, "vehicle"]
];

APOC_AA_SupOptions =
[
// ["stringItemName",   "fn_refillBox crate,                 Price,  "Drop type"]
["General Supplies",    "General_supplies",                  45000,  "supply"],
["Diving Gear",         "Diving_Gear",                       30000,  "supply"],
//["Ammo Drop",           "Ammo_Drop",                         60000,  "supply"],
["Assault Rifles",      "mission_USSpecial",                 40000,  "supply"],
["DLC Rifles",          "airdrop_DLC_Rifles",                60000,  "supply"],
["DLC LMGs",            "airdrop_DLC_LMGs",                  55000,  "supply"],
["Sniper Rifles",       "airdrop_Snipers",                   55000,  "supply"],
["Launchers",           "mission_USLaunchers",               60000,  "supply"],

//"Menu Text",          "Food Type",                         Price,  "Drop type"]
["Food",                "Land_Sacks_goods_F",                5000,  "picnic"],
["Water",              	"Land_BarrelWater_F",                5000,  "picnic"],

//"Menu Text",             "Base carrier",                   Price,  "Drop type"]
["Base in a Box (Small)",  "Land_CargoBox_V1_F",             100000,  "base"],
["Base in a Box (Medium)", "Land_Cargo20_yellow_F",          175000, "base1"],
["Base in a Box (Large)",  "Land_Cargo40_white_F",           275000, "base2"]
];
