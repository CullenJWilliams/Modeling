include <BOSL2/std.scad>
difference(){
	translate([0,0,]){
		translate([0,0,50]) cylinder(90,35/2,35/2,$fn=360);
		cylinder(50,32/2,32/2,$fn=360);
		translate([0,0,-10]) cylinder(10,30/2,32/2,$fn=360);
	}
	translate([0,0,91]) cylinder(50,12.4/2,12.2/2,$fn=360);
}
