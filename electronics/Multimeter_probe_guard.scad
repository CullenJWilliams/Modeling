include <BOSL2/std.scad>
include<BOSL2/screws.scad>
$fn=360;
inch = 25.4;

length=88;
width=25;
height=30;
probe_d = 11;
r=probe_d/2;

difference()
{
	cuboid([width,length,height],rounding=1,edges=[BOTTOM+LEFT,BOTTOM+RIGHT,TOP+LEFT,TOP+RIGHT]);
	translate([probe_d-5,-2,2]) rotate([90,0,0]) cylinder(length,r,r,anchor=CENTER+FRONT);
	translate([probe_d-5,-2,-2]) rotate([90,0,0]) cylinder(length,r,r,anchor=CENTER+BACK);
	translate([-6,-2,0]) cuboid([width/3,length,height-4],rounding=1,edges=[BOTTOM+LEFT,BOTTOM+RIGHT,TOP+LEFT,TOP+RIGHT]);
}
