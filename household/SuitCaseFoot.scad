include <BOSL2/std.scad>
difference(){
	cylinder(3+2,16/2,9/2,$fn=360);
	cylinder(3,4.1/2,4.2/2,$fn=360);
	translate([0,0,3]) cylinder(2,8/2,8/2,$fn=360);
}
