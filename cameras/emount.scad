include <BOSL2/std.scad>

$fn=360;

inch = 25.4;

render()
difference()
{
	translate([0,0,-45.46+18]) import("M42_Sony_NEX_E-Mount-Lens_Adaptor.stl");
	translate([0,0,-2]) cylinder(100,100,100,anchor=TOP);
}
