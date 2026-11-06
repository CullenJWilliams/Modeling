include <BOSL2/std.scad>

$fn=360;

thickness=10;
render()
difference()
{
	union(){
		cylinder(thickness,30,30,anchor=FRONT);
		cuboid([100,10,thickness],anchor=FRONT+LEFT);
	}
	translate([-4,0,0]) cylinder(20,30,30,anchor=FRONT);

	#color("blue")
	translate([0,65,0])
	rotate([0,0,55])
	cuboid([88,148+75,3.5],anchor=LEFT, rounding=2,edges=[FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT]);
}

