include <BOSL2/std.scad>
include <BOSL2/screws.scad>

$fn=360;

render()
difference()
{
	union(){
		translate([0,0,35]) cylinder(25,(8)/2,(7)/2);
		translate([0,0,20]) cylinder(15,(31+2)/2,(8)/2);
		cylinder(20,(31+2)/2,(31+2)/2);
	}
	union(){
		translate([0,0,58]) rotate([25,0,0])cube(20,anchor=BOTTOM);
		translate([0,0,35]) cylinder(25,(8-2)/2,(7-2)/2);
		translate([0,0,20]) cylinder(15,31/2,(8-2)/2);
		cylinder(20,31.5/2,31/2);
	}
}
