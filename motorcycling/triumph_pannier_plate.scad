include <BOSL2/std.scad>

$fn=360;

length=50;
width =35;
height=6;

hole_diameter = 8.3;
r=hole_diameter/2;
hole_spacing = 16.9+hole_diameter;

difference()
{
	cuboid([length,width,height],rounding=width/2.5, edges=[FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT]);
	translate([hole_spacing/2,0,0]) cylinder(height+2,r,r,anchor=CENTER);
	mirror([1,0,0]) translate([hole_spacing/2,0,0]) cylinder(height+2,r,r,anchor=CENTER);
}
