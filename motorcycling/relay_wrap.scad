include <BOSL2/std.scad>

$fn=360;

inch = 25.4;

relay_length = 1*inch;
relay_width = .9*inch;

render()
difference(){
	color("grey"){
		cuboid([27.5,27.5,23],anchor=BOTTOM,rounding=2,edges=[FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT]);
		translate([27.5/2+1,0,0])
			cuboid([9,27.5,16],anchor=BOTTOM,rounding=2,edges=[FRONT+RIGHT,BACK+RIGHT]);
			translate([6/2,0,0]) cuboid([33,27.5,16],anchor=BOTTOM,rounding=2,edges=[FRONT+RIGHT,BACK+RIGHT,BACK+LEFT,FRONT+LEFT]);
	}

	translate([-1,0,0]) cuboid([relay_width,relay_length,23],anchor=BOTTOM,rounding=1,edges=[FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT]);
	translate([27.5/2+1.5,0,0])
		cuboid([3,25,16],anchor=BOTTOM,rounding=.5,edges=[FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT]);
}
