
_vehicle = _this;
_driver = driver _vehicle;
_eng = isengineon _vehicle;
_vehicle setVelocity [0,0,0];

if (_eng) then {
	_vehicle vehicleChat format ["Stop engine in 10 seconds to start service.  Service is 20 percent of watercraft cost.  Service will take 15 seconds."];
	sleep 10;
	_eng = isengineon _vehicle;
	if (_eng) exitWith {_vehicle vehicleChat format ["Engine still running. Service CANCELED!"];};
};


//if (!isnull (gunner _vehicle)) then {
//	_vehicle vehicleChat format ["Gunner must be out of seat for service! Get gunner out in 20s."];
//	sleep 10;
//	_vehicle vehicleChat format ["Gunner must be out of seat for service! Get gunner out in 10s."];
//	sleep 10;
//	if (!isnull (gunner _vehicle)) exitWith {_vehicle vehicleChat format ["Gunner still inside. Service CANCELED!"];};
//};


if((player == driver _vehicle) && (!_eng))then {
	_type = typeOf _vehicle;
	_playerMoney = player getVariable "cmoney";

	_price = 250;
	if(_type == "C_Rubberboat") then {_price = 100;};
	if(_type == "B_Lifeboat") then {_price = 100;};
	if(_type == "O_Lifeboat") then {_price = 100;};
	if(_type == "C_Boat_Civil_01_F") then {_price = 200;};
	if(_type == "C_Boat_Civil_01_rescue_F") then {_price = 180;};
	if(_type == "C_Boat_Civil_01_police_F") then {_price = 250;};
	if(_type == "B_Boat_Transport_01_F") then {_price = 125;};
	if(_type == "O_Boat_Transport_01_F") then {_price = 125;};
	if(_type == "I_Boat_Transport_01_F") then {_price = 125;};
	if(_type == "B_G_Boat_Transport_01_F") then {_price = 125;};
	if(_type == "B_SDV_01_F") then {_price = 200;};
	if(_type == "O_SDV_01_F") then {_price = 200;};
	if(_type == "I_SDV_01_F") then {_price = 200;};
	if(_type == "O_Boat_Armed_01_hmg_F") then {_price = 800;};
	if(_type == "B_Boat_Armed_01_minigun_F") then {_price = 800;};
	if(_type == "I_Boat_Armed_01_minigun_F") then {_price = 800;};

	if (_playerMoney < _price) then {
		_text = format ["Not enough money! You need $%1 to resupply %2. Service cancelled!",_price,typeOf _vehicle];
		[_text, 10] call mf_notify_client;
	} else {
		player setVariable["cmoney",(player getVariable "cmoney")-_price,true];
		player setVariable["timesync",(player getVariable "timesync")-(_price * 3),true];
		[] call fn_savePlayerData;
		
		_vehicle setFuel 0;
		_vehicle setVelocity [0,0,0];
		_text = format ["Servicing %1 for $%2. Please stand by...", _type, _price];
		[_text, 1.0] call mf_notify_client;
		sleep 1.0;
		["Repairing 1/4...", 1.0] call mf_notify_client;
		_this animate ["HideBackpacks", 1];
		_this animate ["HideBumper1", 1];
		_this animate ["HideBumper2", 1];
		_this animate ["HideDoor1", 1]; 
		_this animate ["HideDoor2", 1];
		_this animate ["HideDoor3", 1];
		sleep 1.0;
		_vehicle setFuel 0;
		["Repairing 2/4...", 1.0] call mf_notify_client;
		sleep 1.0;
		["Repairing 3/4...", 1.0] call mf_notify_client;
		sleep 1.0;
		["Repairing 4/4...", 1.0] call mf_notify_client;
		_this animate ["HideBackpacks", 0];
		_this animate ["HideBumper1", 0];
		_this animate ["HideBumper2", 0];
		_this animate ["HideDoor1", 0]; 
		_this animate ["HideDoor2", 0];
		_this animate ["HideDoor3", 0];
		sleep 1.0;
		_vehicle setDamage 0;
		_vehicle setFuel 0;
		["Reloading ammo!", 1.0] call mf_notify_client;
		sleep 1.0;
		["Reloading ammo 1/5...", 1.0] call mf_notify_client;
		sleep 1.0;
		_vehicle setFuel 0;
		["Reloading ammo 2/5...", 1.0] call mf_notify_client;
		sleep 1.0;
		_vehicle setFuel 0;
		["Reloading ammo 3/5...", 1.0] call mf_notify_client;
		sleep 1.0;
		_vehicle setFuel 0;
		["Reloading ammo 4/5...", 1.0] call mf_notify_client;
		sleep 1.0;
		_vehicle setFuel 0;
		["Reloading ammo 5/5...", 1.0] call mf_notify_client;
		sleep 1.0;
		_vehicle setFuel 0;
		_vehicle setVehicleAmmo 1;
		//["You can enter the gunner seat now but refueling will take another 10 seconds.", 10] call mf_notify_client;
		sleep 1.0;
		["Refueling 1/3...", 1.0] call mf_notify_client;
		sleep 1.0;
		["Refueling 2/3...", 1.0] call mf_notify_client;
		sleep 1.0;
		["Refueling 3/3...", 1.0] call mf_notify_client;
		sleep 1.0;
		_vehicle setFuel 1;
		_text = format ["%1 is ready.", _type];
		[_text, 15] call mf_notify_client;
		if (true) exitWith {};
	};
};