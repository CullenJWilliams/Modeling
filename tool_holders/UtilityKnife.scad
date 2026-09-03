include <BOSL2/std.scad>
include <BOSL2/joiners.scad>

$fn=360;

length=155;
width=24.5;
height=32;

case_length = length+4;
case_width = width+4;
case_height = height/2;



render()
difference()
{
	translate([-2,-2,-1]) case(case_length+2, case_width, case_height);
	#translate([0,0,0]) cuboid([155,24.5,32],anchor=BOTTOM+LEFT+FRONT,rounding=10,edges=[BOTTOM+FRONT,BOTTOM+BACK]);
}

module case(length, width, height)
{
	cube([length,width,height]);
}
