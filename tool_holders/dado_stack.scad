include <BOSL2/std.scad>

$fn=360;

height = 21+1;
diameter = 155;
radius=155/2;
peg_diameter= 15-1;
peg_radius = peg_diameter/2;

render(){
	difference(){
		translate([0,0,-2]) cylinder(height+2,radius+1,radius+.5);
		cylinder(height,radius,radius);
	}

	cylinder(height,peg_radius,peg_radius);

	translate([150,150,height])
	rotate([0,180,0]) 
	{
		difference(){
			translate([0,0,+1]) cylinder(height+1,radius+2.1,radius+2.1);
			cylinder(height,radius+1.6,radius+1.1);
		}
	}
}
