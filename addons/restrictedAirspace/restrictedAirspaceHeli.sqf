/*
	@file Version: 0.2
	@file Name: restrictedAirspaceHeli.sqf
	@file Contributions from Bistudio forum
	@Edit by CRE4MPIE
	@file Created: 7/2/2016
*/
titleText ["Você está entrando em espaço aéreo restrito, reduza sua altitude à abaixo de 1500m!", "PLAIN DOWN", 3];
//playSound3D ["A3\Sounds_F\sfx\alarmcar.wss", player]; 
sleep 5;
titleText ["Você tem menos de 20 segundos para obedecer...", "PLAIN DOWN", 3];
//playSound3D ["A3\Sounds_F\sfx\alarmcar.wss", player]; 
sleep 10;
titleText ["Você tem menos de 10 segundos para reduzir a sua altitude!", "PLAIN DOWN", 3];
//playSound3D ["A3\Sounds_F\sfx\alarmcar.wss", player]; 
sleep 5;
titleText ["Reduza sua altitude imediatamente!", 3];
//playSound3D ["A3\Sounds_F\sfx\alarmcar.wss", player]; 
sleep 5;
// playsound "explo1";
titleText ["Sistemas de vôo foram desativados!", "PLAIN DOWN", 3];
vehicle player setFuel 0;

