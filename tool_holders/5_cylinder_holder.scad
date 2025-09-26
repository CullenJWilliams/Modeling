include <BOSL2/std.scad>
include <BOSL2/joiners.scad>
include <./tapers.scad>

$fn=360;


h=84;
r=12.7/2;
cylinder_count=5;

case_length = 20+cylinder_count*r+cylinder_count*10;
case_width = h+4;
case_height = r;

render()
difference()
{
	translate([0,0,-1]) case(case_length+2, case_width, case_height);
	render()
		color("teal") {
			for(i=[0:cylinder_count]){
				translate([10+i*r+i*10,2,r]) rotate([-90,0,0]) cylinder(h,r,r);
			}
		}
}

module case(length, width, height)
{
	cube([length,width,height]);
}

