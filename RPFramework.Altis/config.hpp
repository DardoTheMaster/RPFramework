class RPF_Config {
	// TAB by default https://community.bistudio.com/wiki/ListOfKeyCodes
	interactionKey = 15;
	
	// Vehicle trunk size is divided with this
	trunkDivivde = 300;
	
	handcuffs_item = "RPF_Items_Handcuffs";
	handcuffKeys_item = "RPF_Items_HandcuffKeys";
	
	// Add your police vehicles here
	policeCars[] = {
		"B_MRAP_01_F",
		"O_Heli_Light_02_unarmed_F",
		"C_Boat_Civil_01_police_F"
	};
	
	// Add your medic vehicles here
	medicCars[] = {
		"B_Truck_01_medical_F",
		"C_Boat_Civil_01_rescue_F",
		"B_Lifeboat"
	};
	
	// Here you can override the trunk sizes with a custom one {classname, customTrunkSize}
	trunkException[] = {
		{ "B_MRAP_01_F", 30 }
	};
	
	// Every 4 minutes deduct values according to fn_initSurvivalLoop.sqf
	SurvivalSleepLoop = 240;
	
	// You can find more config optios that are mostly for modules to change in Functions\core\Init\fn_miscVariables.sqf
	// Use (missionConfigFile >> "RPF_Config" >> "something") call BIS_fnc_getCfgData to get data from here
	// Each module has its own configuration file called config.hpp which can house shop locations, marker locations or variables, make sure to configure those as well!
	// Shop locations for module ShopSystem is on the server side! There are configs on both server and client side for modules!
};
#include "Functions\modules\CONFIG\moduleConfigs.hpp"
