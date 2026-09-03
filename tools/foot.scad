include <BOSL2/std.scad>


$fn=360;

difference(){
	cylinder(5+2,20/2,20/2, anchor=TOP);
	difference(){
		cylinder(5,14.5/2,14.5/2,$fn=6  ,anchor=TOP);
		translate([0,0,-5]) #cylinder(1.5,9.5/2,9.5/2, anchor=BOTTOM);
	}
}
