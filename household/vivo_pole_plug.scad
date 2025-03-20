include <BOSL2/std.scad>
difference(){
	translate([0,0,]){
		translate([0,0,30]) cylinder(10,35/2,35/2,$fn=360);
		cylinder(40,30/2,32.1/2,$fn=360);
	}
	translate([0,0,-1]) cylinder(50,12.4/2,12.2/2,$fn=360);
}
