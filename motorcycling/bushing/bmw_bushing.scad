
difference(){
	{
		cylinder(14,10,10,$fn=30);
		translate([-6,-5,4.5]){

				translate([0,0,-3])
				cube([22,10,5]);

				translate([0,0,3])
					cube([22,10,5]);
		}
	}
	translate([0,0,-1])
		cylinder(20,3,3,$fn=30);

}
