include <BOSL2/std.scad>
$fn=360;

inch = 25.4;

thickness=2;
length = 131.4;

render()
difference()
{
	hull()
	color("teal")
	{
		translate([3,(13/2)-5,0]) cylinder(thickness,5,5,anchor=FRONT+BOTTOM);
		cylinder(thickness,13/2,13/2,anchor=FRONT+BOTTOM);
		translate([-70,30.8-14,0]) cylinder(thickness,7,7,anchor=FRONT+BOTTOM);
		translate([(3+(13/2))-length,25/2,0]) scale([4,1,1]) cylinder(thickness,25/2,25/2,anchor=LEFT+BOTTOM); // TODO this one sucks
		translate([-91,24.2,0]) rotate([0,0,13.5]) scale([1.65,.2,1]) cylinder(thickness,15,15);
		//translate([-93,-4.9,0])  scale([1.87,.2,1]) cylinder(thickness,15,15);
	}
	color("coral")
	{
		translate([0,13,0]) cuboid([46,50,2],anchor=RIGHT+BOTTOM+FRONT);
		translate([-45.3,13,0]) cylinder(thickness,18,18,anchor=FRONT+BOTTOM);
		translate([-69.2,37.8-14,0])
			top_radius();
	}
}
//translate([0,-20,0]) top_radius();

module top_radius()
{
		difference(){
			cuboid([10,10,thickness],anchor=LEFT+FRONT+BOTTOM);
			translate([-1,-4,0]) rotate([0,0,-45]) cuboid([10,10,thickness],anchor=LEFT+FRONT+BOTTOM);
			cylinder(2*thickness,7,7);
		}
}
