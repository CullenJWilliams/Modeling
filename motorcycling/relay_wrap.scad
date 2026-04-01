include <BOSL2/std.scad>

$fn=360;

render()
difference(){
	color("grey"){
		cuboid([27,27,23],anchor=BOTTOM,rounding=2,edges=[FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT]);
		translate([27/2+1,0,0])
			cuboid([9,27,16],anchor=BOTTOM,rounding=2,edges=[FRONT+RIGHT,BACK+RIGHT]);
	}

	cuboid([25,25,23],anchor=BOTTOM,rounding=1,edges=[FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT]);
	translate([27/2+1.5,0,0])
		cuboid([3,25,16],anchor=BOTTOM,rounding=.5,edges=[FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT]);
}
