include <BOSL2/std.scad>

$fn=360;

inch = 25.4;

base_d=113;
inner_d=82;
base_r=base_d/2;
inner_r=inner_d/2;
flange_center_d=127;
pin_d=104;
height=21;

render()
difference(){
	union(){
		cylinder(height,base_r,base_r);
		rotate([0,0,45]) cuboid([flange_center_d -10,12,height+20] , anchor=BOTTOM,rounding=2,edges=[FRONT+LEFT,BACK+LEFT,FRONT+RIGHT,BACK+RIGHT]);
		rotate([0,0,-45]) cuboid([flange_center_d-10,12,height+20], anchor=BOTTOM,rounding=2,edges=[FRONT+LEFT,BACK+LEFT,FRONT+RIGHT,BACK+RIGHT]);
	}
	cylinder(height+20,base_r-3,base_r-3);
	translate([0,0,height]) cylinder(20,base_r,base_r);
}


