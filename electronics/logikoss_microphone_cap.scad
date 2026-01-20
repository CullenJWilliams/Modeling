include <BOSL2/std.scad>
use <./logikoss_microphone.scad>

$fn=360;

inch = 25.4;

difference(){
	cap_body();
	translate([0,0,-2.5])body();
	cuboid([1,5,10],rounding=.5);
}

module cap_body(){
	translate([0,4.5,0]) cuboid([10,18.5,3],anchor=BACK, rounding=4.5,
			edges=[
			BACK+LEFT,
			BACK+RIGHT,
			//BACK +TOP,
			//LEFT +TOP,
			//RIGHT+TOP
			]
			);
}
