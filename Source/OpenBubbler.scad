plank = 1; //variable auxiliar para hacer substracciones sólidas

//Genera un cilindro
module maintube(largo,radio,grosor)
{
	//restar cilindro, con otro cilindro más largo y delgado
	difference()
	{
		cylinder(largo,radio,radio,center=true);
		translate([0,0,-plank/2])
		cylinder(largo+plank*2,radio-grosor,radio-grosor,center=true);
	}
}

module solidcontainer(radio)
{
	difference()
	{
		sphere(radio);
		translate([-radio,-radio,-radio*2.8])
		cube([radio*2,radio*2,radio*2]);
	}
}

module hollowcontainer(radio)
{
	difference()
    {
		solidcontainer(radio);
		scale([0.98,0.98,0.98]) solidcontainer(radio);
	}
}

//Main
module OpenBubbler(tubelength,containerradius)
{

	union()
	{
		translate([0,containerradius*2.05,containerradius*2.05])
		rotate([-45,0,0])
		maintube(tubelength,10,2);
		difference()
    		{
    			hollowcontainer(containerradius);
			union()
			{
				cube([80,800,80]);
				translate([0,containerradius*2.05,containerradius*2.05])
		rotate([-45,0,0])
		cylinder(tubelength,9,9,center=true);
		cylinder(tubelength,2,2);
			}
		}    
	}
}

OpenBubbler(120,30);



