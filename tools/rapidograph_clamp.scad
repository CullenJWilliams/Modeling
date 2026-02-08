include <BOSL2/std.scad>
include <BOSL2/screws.scad>

$fn=360;


difference(){
	color("brown"){
		screw("M10x.7", length=3.5, anchor=BOTTOM, head="none", drive="none", bevel=false);
		difference(){
			cylinder(6,11.7/2,11.7/2,anchor=TOP);
			translate([0,0,-2]) screw_hole("M10x.7", length=2.8, anchor=TOP,thread=true, bevel1=false, $slop=.02);
			translate([0,0,-4.75]) cylinder(1.25,10.2/2,10.2/2,anchor=TOP);
		}
	}
	cylinder(20,8.6/2,8.6/2,anchor=CENTER);
}
