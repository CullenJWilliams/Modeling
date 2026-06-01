include <BOSL2/std.scad>

$fn=360;


height=20;

length=125;
width =182;

battery_length=88;
battery_width=135;

bias=2;

difference()
{
	cuboid([length,width,height],anchor=BOTTOM+LEFT, rounding=2, edges=[FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT,BOTTOM]);
	translate([bias,0,5]) cuboid([battery_length,battery_width,height],anchor=BOTTOM+LEFT);
}
