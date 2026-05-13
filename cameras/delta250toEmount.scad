include <BOSL2/std.scad>
use <./logikoss_microphone.scad>

$fn=360;

inch = 25.4;

base_d=113;
inner_d=82;
base_r=base_d/2;
inner_r=inner_d/2;
flange_center_d=127;
pin_d=104;

render()
difference(){
	union(){
		translate([0,0,18]) import("emount.stl");
		cylinder(18,base_r,33.3);
		rotate([0,0,45]) cuboid([flange_center_d+12,19,2] , anchor=BOTTOM,rounding=2,edges=[FRONT+LEFT,BACK+LEFT,FRONT+RIGHT,BACK+RIGHT]);
		rotate([0,0,-45]) cuboid([flange_center_d+12,19,2], anchor=BOTTOM,rounding=2,edges=[FRONT+LEFT,BACK+LEFT,FRONT+RIGHT,BACK+RIGHT]);
	}
	cylinder(18,inner_r,20);
	for(i=[0:90:360])
	{
		rotate([0,0,45+i]) translate([flange_center_d/2,0,0]) cylinder(2,9/2,9/2);
	}

	for(i=[0:60:360])
	{
		rotate([0,0,i]) translate([pin_d/2,0,0]) cylinder(7,2,2);
	}
}
