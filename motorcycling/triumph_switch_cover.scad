include <BOSL2/std.scad>

$fn=360;

length=37;
width =20;
height=6;

hole_diameter = 8.3;
r=hole_diameter/2;
hole_spacing = 16.9+hole_diameter;

cuboid([length+3,width+3,2],rounding=1, edges=[FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT],anchor=BOTTOM);
cuboid([length,width,height],rounding=1, edges=[FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT],anchor=TOP);
translate([0,0,-height]) prismoid([length,width],[length+1,width+1],h=2,rounding=1, anchor=TOP);
