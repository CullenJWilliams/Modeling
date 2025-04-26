include <BOSL2/std.scad>
$fn=360;
difference()
{
	translate([3,3,0]) cube([25,25,30],anchor=CENTER+BOTTOM);

	// hole
	translate([0,0,-1]) cylinder(50,12.7/2,12.7/2);

	// rail cuts
	translate([10,-10,-.10]) cube([1.96,24,20]);
	translate([-10,10,-.10]) cube([24,1.96,20]);
}
