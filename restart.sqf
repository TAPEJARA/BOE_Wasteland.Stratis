while{true} do
{
	switch true do
	{
		/*case ((daytime > 4.91) && (daytime < 4.917)) : 
		{
			//titleText ["Menos de 1 minuto pro restart do servidor.", "PLAIN DOWN", 0.5];
			
		};
		
		case ((daytime > 4.79) && (daytime < 4.797)) : 
		{
			//titleText ["Restart do servidor em 3 minutos.", "PLAIN DOWN", 0.5];
			
		};
		
		case ((daytime > 4.16) && (daytime < 4.24)) : 
		{
			//titleText ["Restart do servidor em 5 minutos.", "PLAIN DOWN", 0.5];
			3000 setFog 0;
			3000 setOvercast 0;
		};
		
		case ((daytime > 2.08) && (daytime < 2.16)) : 
		{
			//titleText ["Restart do servidor em 10 minutos.", "PLAIN DOWN", 1];
			300 setFog 0.25;
		};
		
		case ((daytime > 0) && (daytime < 0.08)) : 
		{
			//titleText ["Restart do servidor em 15 minutos.", "PLAIN DOWN", 1];
			300 setFog 0.25;
		};*/
		
		case ((daytime > 19.20) && (daytime < 19.21)) : 
		{
			titleText ["Restart do servidor em 30 minutos.", "PLAIN DOWN", 1];
		
		};
		
		case ((daytime > 17.36) && (daytime < 17.367)) : 
		{
			titleText ["Restart do servidor em 1 hora.", "PLAIN DOWN", 2];
		
		};
		
		case ((daytime > 13.24) && (daytime < 13.247)) : 
		{
			titleText ["A partida terminará em 2 horas.", "PLAIN DOWN", 2];
		
		};
		
		case ((daytime > 9.12) && (daytime < 9.127)) : 
		{
			titleText ["A partida terminará em 3 horas.", "PLAIN DOWN", 2];
			
		};
		
		case ((daytime > 5.25) && (daytime < 5.257)) : 
		{
			titleText ["A partida começou faz poucos minutos, próximo restart será daqui a 4 horas.", "PLAIN DOWN", 2];
			
		};
	};
	
	if((daytime > 4.986) && (daytime < 5)) then
	{
		diag_log "RESTART";
		["Won"] call BIS_fnc_endMissionServer;
		//uiSleep 10;
		//"senha" serverCommand "#restart";		
	};
	sleep 10;
};
