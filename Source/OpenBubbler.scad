plank = 1; //variable auxiliar para hacer substracciones sólidas

//Genera un cilindro
module maintube(largo,radio,grosor)
{
	//restar cilindro, con otro cilindro más largo y delgado
	difference()
	{
		cylinder(largo,radio,radio,center=true);
		translate([0,0,-plank/2])
		cylinder(largo+plank,radio-grosor,radio-grosor,center=true);
	}
}

//Main
module OpenBubbler()
{
	maintube(120,20,2);
}

OpenBubbler();

