include <BOSL2/std.scad>

$fn=360;

inch = 25.4;

render()
difference(){
	render(){
		translate([0,0,18+6]) import("emount.stl");
		translate([0,0,10+6]) cylinder(6,31,31);
		difference(){
			translate([0,0,0]) import("ring_eos.stl");
			translate([0,0,16+6]) cylinder(100,100,100,anchor=BOTTOM);
		}
	}
	translate([0,0,10+6]) cylinder(6,22,20);
}
