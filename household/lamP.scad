include <BOSL2/std.scad>
$fn=360;



difference(){
	rotate([90,0,0])
		union(){
			cylinder(100,25,25,anchor=CENTER);
			cylinder(90,35,35,anchor=CENTER);
			cylinder(75,40,40,anchor=CENTER);
			cylinder(60,45,45,anchor=CENTER);
			cylinder(40,50,50,anchor=CENTER);
			cylinder(20,55,55,anchor=CENTER);
		}
	cylinder(60,10,10);
}
