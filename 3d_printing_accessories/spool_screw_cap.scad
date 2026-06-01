include <BOSL2/std.scad>

$fn=360;

screw_d=7;
screw_r=screw_d/2;

difference(){
	prismoid([55,10],[25,10],5);
	translate([-25/2,0,0]) cylinder(3.5+.2,screw_r,screw_r);
	translate([25/2,0,0]) cylinder(3.5 +.2,screw_r,screw_r );
}
