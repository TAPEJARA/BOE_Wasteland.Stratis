//	@file Name: changeOwner.sqf
//	@file Author: Cael817 based on fn_chopShop.sqf from Lodac, Wiking, Gigatek (original auth)

#define CANGEOWNER_PRICE_RELATIONSHIP 2

private ["_vehicle", "_object", "_driver", "_eng", "_type", "_price", "_confirmMsg", "_playerMoney", "_vehicleCrewArr", "_text"];

_vehicle = _this;
_driver = driver _vehicle;
_eng = isengineon _vehicle;
_vehicle setVelocity [0,0,0];

if (_eng) then {
	_vehicle vehicleChat format ["Stop the engine in 10 seconds to change ownership.  The cost is 1/2 of the vehicle store price, stay in the vehicle until further notice!"];
	sleep 10;
	_eng = isengineon _vehicle;
	if (_eng) exitWith {_vehicle vehicleChat format ["The engine is still running, DEAL CANCELED!"];};
};

if((player == driver _vehicle) && (!_eng))then {
	_type = typeOf _vehicle;
	_playerMoney = player getVariable "cmoney";

	_price = 300;
	//find price from vehicle store prices
	{	
	if (_type == _x select 1) then
	{	
	_price = _x select 2;
	_price = _price / CANGEOWNER_PRICE_RELATIONSHIP;
	};
} forEach (call allVehStoreVehicles);

	if (!isNil "_price") then 
	{
		// Add total sell value to confirm message
		_confirmMsg = format ["Changing ownership on %1 will cost you $%2 for:<br/>", _type, _price];
		_confirmMsg = _confirmMsg + format ["<br/><t font='EtelkaMonospaceProBold'>1</t> x %1", _type];

		// Display confirm message
		if ([parseText _confirmMsg, "Confirm", "OK", true] call BIS_fnc_guiMessage) then
		{	
			// Ensure the player has enough money
			if (_price > _playerMoney) exitWith
			{
				hint format ["You need $%2 to change ownership on %1", _type, _price];
				playSound "FD_CP_Not_Clear_F";
			};

			// get everyone out of the vehicle
			_vehicleCrewArr = crew _vehicle;
			{
				_x action ["Eject", vehicle _x];
			} foreach _vehicleCrewArr;
		
			player setVariable["cmoney",(player getVariable "cmoney")-_price,true];
			player setVariable["timesync",(player getVariable "timesync")+(_price * 3),true];
			[] spawn fn_savePlayerData; // Changed call to spawn
			["Changing ownership will take about 1 minute", 10] call mf_notify_client;
			playSound "FD_Finish_F";
			_vehicle setVelocity [0,0,0];
			_vehicle setFuel 0;
			_text = format ["Changing ownership for %1 for $%2. Removing VIN, emptying fluids, and removing ammo.", _type, _price];
			[_text, 5] call mf_notify_client;

			sleep 5;
			["You know this shit isn't easy and you are not paying THAT much", 5] call mf_notify_client;
			sleep 5;
			["Mechanics are drinking coffee not giving a shit about you", 5] call mf_notify_client;
			sleep 10;
			["Now installing new locks", 5] call mf_notify_client;
			sleep 5;
			["Adding new VIN plate", 5] call mf_notify_client;
			sleep 5;		
			["Mechanics are taking ANOTHER coffee break", 5] call mf_notify_client;
			sleep 10;
			["and they are looking at you funny", 5] call mf_notify_client;
			sleep 5;
			["Repairing", 5] call mf_notify_client;
			_vehicle setDamage 0;
			sleep 5;
			["Rearming", 5] call mf_notify_client;
			_vehicle setVehicleAmmo 1;
			sleep 5;
			["Finishing up and refuelling", 5] call mf_notify_client;

			_vehicle setVelocity [0,0,0];
			_vehicle setFuel 1;
			_vehicle setVariable ["A3W_purchasedVehicle", true, true];
			_vehicle setVariable ["ownerUID", getPlayerUID player, true];
			_vehicle setVariable ["vehOwnerName", name player, true];
			_vehicle setVariable ["ownedVehicle", true, true];
			playSound "FD_Finish_F";
			_text = format ["%1 is now your's to lock and it saves too.  The vehicle is also fully rearmed, repaired, and refuelled!", _type];
			[_text, 10] call mf_notify_client;
		};
	} else {
		hint parseText "<t color='#ffff00'>An unknown error occurred.</t><br/>Cancelled.";
		playSound "FD_CP_Not_Clear_F";
	};
};	
