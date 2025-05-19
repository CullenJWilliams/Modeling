include <BOSL2/std.scad>
$fn=360;

slot_thickness=2;


difference()
{
	translate([3,3,0]) cube([25,25,30],anchor=CENTER+BOTTOM);

	// hole
	translate([0,0,-1]) cylinder(50,12.7/2,12.7/2);

	// rail cuts
	translate([9,-10,-.10]) cube([slot_thickness,24,20]);
	translate([-10,9,-.10]) cube([24,slot_thickness,20]);
}
