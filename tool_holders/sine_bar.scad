include <BOSL2/std.scad>
include <BOSL2/joiners.scad>
include <BOSL2/miscellaneous.scad>

$fn=360;

bar_length = 153.8;
bar_width = 49.37;
bar_height = 32;
case_length=bar_length+2;
case_width=bar_width+2;
case_height=bar_height/4;


render()
difference()
{
	translate([0,0,0]) case(case_length, case_width, case_height);
	color("teal") {
		offset3d(.5)
		translate([1,1,1])
		sine_bar(bar_length,bar_width,bar_height);
	}
}

module case(length, width, height)
{
	cube([length,width,height]);
}

module sine_bar(l,w,h)
{
	cube([l,w,h]);
}
