include <BOSL2/std.scad>
include <BOSL2/screws.scad>

$fn=360;

render()
difference(){
	union(){
		translate([0,0,34]) cylinder(27,(17.5)/2,(17)/2);
		translate([0,0,20]) cylinder(10,(31+2)/2,(17)/2);
		translate([0,0,35]) screw("M24x2", length=12, anchor=TOP, head="none", drive="none");
		cylinder(20,(31+2)/2,(31+2)/2);
	}
	union(){
		translate([0,0,57]) rotate([25,0,0])cube(20,anchor=BOTTOM);
		translate([0,0,34]) cylinder(27,(17.5-2)/2,(17-2)/2);
		translate([0,0,29]) cylinder(5,(17.5-2)/2,(17.5-2)/2);
		translate([0,0,20]) cylinder(10,31/2,(17-2)/2);
		cylinder(20,31.5/2,31/2);
	}
}
