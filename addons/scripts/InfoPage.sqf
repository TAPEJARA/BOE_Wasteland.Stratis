// infoPage.sqf
// by CRE4MPIE
// ver 0.1
// 2015-02-01 01:20pm
// contributions from BIStudio Forums, by CRE4MPIE

sleep 30;   //delay before message is displayed after logging in
	
_text = "
<t align='center'><t shadow= 1 shadowColor='#000000'><t size='1.2'><t color='#ff0000'>Clan BOE Wasteland Stratis</t>
<br />
<br />
<t align='center'><t size='1.2'><t shadow= 1 shadowColor='#000000'>Atalhos</t><br />
<br />
<t align='left'><img size='2' shadow = 0 image='mapConfig\img\windows.paa'/></t><t align='left'><t size='1'><t shadow= 1 shadowColor='#000000'> Nomes dos Jogadores</t><br />
<t align='left'><img size='2' shadow = 0 image='mapConfig\img\end.paa'/></t><t align='left'><t size='1'><t shadow= 1 shadowColor='#000000'> Add/Rem Tampões de Ouvidos</t><br />
<t align='left'><img size='2' shadow = 0 image='mapConfig\img\h.paa'/></t><t align='left'><t size='1'><t shadow= 1 shadowColor='#000000'> Guardar Arma</t><br />
<t align='left'><img size='2' shadow = 0 image='mapConfig\img\del.paa'/></t><t align='left'><t size='1'><t shadow= 1 shadowColor='#000000'> Ejetar</t><br />
<t align='left'><img size='2' shadow = 0 image='mapConfig\img\esp.paa'/></t><t align='left'> + <img size='2' shadow = 0 image='mapConfig\img\up.paa'/></t><t align='left'><t size='1'><t shadow= 1 shadowColor='#000000'> Allahu Akbar</t><br />
<br />
<t align='center'><t size='1.2'><t shadow= 1 shadowColor='#0000ff'>BOM JOGO.</t>
<br />
<t align='center'><img size='6' shadow = 0 image='mapConfig\logo.paa'/></t>";

hint parseText format ["<t align='center'>Seja Bem Vindo %2</t><br />%1",_text, name player];
 