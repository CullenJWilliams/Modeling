include <BOSL2/std.scad>

$fn=360;

difference(){
	color("teal"){
		difference(){
			translate([-5,-7,-25]) import("./bracket.stl");
			translate([20-9,-1,-5]) cube([40,20,10]);
		}
		translate([20.5,16/2,-2.45])	rotate([80,0,-90]) linear_extrude(10) rect([16,3.5], rounding=[1,1,1,1]);
		translate([20.5,16/2,-10])	rotate([0,0,90]) linear_extrude(10) rect([16+20,3.5], rounding=[1,1,0,0]);
	}

	color("tomato"){
		translate([0,20,-5]) rotate([0,90,0]) cylinder(40,2.6,2.1);
		translate([0,-5,-5]) rotate([0,90,0]) cylinder(40,2.6,2.1);
	}
}
