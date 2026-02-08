include <BOSL2/std.scad>

$fn=360;


hole_diameter = 6.5;
r=hole_diameter/2;
hole_spacing = 175;
height=6;

width =3*hole_diameter;

difference()
{
	cuboid([hole_spacing+(2*hole_diameter),width,height],anchor=CENTER , rounding=hole_diameter, edges=[FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT]);
	translate([(hole_spacing)/2,0,0]) cylinder(height+2,r,r,anchor=CENTER);
	mirror([1,0,0]) translate([(hole_spacing)/2,0,0]) cylinder(height+2,r,r,anchor=CENTER);
	cuboid([158,width+2,height/2+2],anchor=TOP,rounding=height/4);
}
