//=====CONTROLS FOR PUSHING==================

"GLB_Notice" addPublicVariableEventHandler
{
playSound _this select 1;
};

"CHT_Notice" addPublicVariableEventHandler
{
systemChat _this select 1;
};




private [];
waitUntil {
	!isNil { player } &&
	!isNull player &&
	!(player != player) &&
	!isNull (findDisplay 46)
};

disableSerialization;

//Functions
pushKeysPressed = compile preprocessFile "addons\scripts\pushKeysPressed.sqf";

//Params
player_pushing = false;


//Input handler
findDisplay 46 displayAddEventHandler ["KeyDown", "_this call pushKeysPressed"];

if (player_pushing) then { [] call pushKeysPressed; };