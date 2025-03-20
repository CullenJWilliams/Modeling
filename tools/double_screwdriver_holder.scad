include <BOSL2/std.scad>

$fn=360;

feet();
difference(){
	hull()
	{
		difference(){
			color("teal"){
				backing_plate();
				translate([-43,-21.5,-1.8]) rotate([0,-20,0]) holder();
				translate([-30.5,-21.5,0]) holder();
			}
			translate([-100,-100,-10]) cube([100,100,10]);
		}
	}
	color("teal"){
		translate([-43,-21.5,-1.8]) rotate([0,-20,0]) holder_hole();
		translate([-30.5,-21.5,0]) holder_hole();
	}
}

module holder()
{
	cylinder(29,5+2,10+2);
}

module holder_hole()
{
	translate([0,0,28.9]) cylinder(10,10,10);
	cylinder(29,6,10);
	translate([0,0,-9.9]) cylinder(10,6,6);
}

module backing_plate()
{
	color("teal")
		translate([-19,-27-8,0]) cube([4,27,29]);
}

module feet()
{
	difference()
	{
		import("./pegboard_screw_driver_funnel.stl");
		translate([-35.5,-20,10]) cube(40,40,40);
	}
}
