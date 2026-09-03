include <BOSL2/std.scad>

$fn=360;

inch = 25.4;

projector_flange_focal_distance=66.5;
emount_flange_focal_distance = 18;

focal_distance = projector_flange_focal_distance-emount_flange_focal_distance;

height=21;
shaft_d=35;
shaft_r=shaft_d/2;
shaft_t=.1;

render(){
	difference(){
		translate([0,0,0])rotate([180,0,0]) import("emount.stl");
		translate([0,0,0]) cylinder(focal_distance,20,20,anchor=CENTER);
	}
	difference(){
		union(){
			translate([0,0,2]) cylinder(focal_distance+.5*inch-2,shaft_r+5,shaft_r+5);
			translate([0,0,2]) cylinder(20,30.7,shaft_r+5);
		}
		translate([0,0,2]) cylinder(focal_distance-.5*inch-2,20,shaft_r+shaft_t);
		translate([0,0,focal_distance]) cylinder(1*inch,shaft_r+shaft_t,shaft_r+shaft_t,anchor=CENTER);
		translate([0,0,focal_distance+(1*inch/2)-(5/16*inch)]) rotate([90,0,0]) cylinder(40,(3/32)*inch/2,(3/32)*inch/2);
	}
}
