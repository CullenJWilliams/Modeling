include <pegmixer-main/pegmixer.scad>
include <BOSL2/std.scad>

$fn=360;

difference(){
	cuboid([14,20,20],rounding=1);
	translate([0,-2,0]) cuboid([16,5,16],anchor=BACK,rounding=1);
	mirror([0,1,0]) translate([0,-2,0]) cuboid([16,5,16],anchor=BACK,rounding=1);
	translate([0,8,0]) cylinder(22,78/2,78/2,anchor=FRONT);
}
