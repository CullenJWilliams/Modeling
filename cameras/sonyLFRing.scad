include <BOSL2/std.scad>

$fn=360;

inch = 25.4;

render(){
translate([0,0,18]) import("emount.stl");
difference(){
	translate([0,0,0]) import("ring_eos.stl");
	translate([0,0,16]) cylinder(100,100,100,anchor=BOTTOM);
}
}
