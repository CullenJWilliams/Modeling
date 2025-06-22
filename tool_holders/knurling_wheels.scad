include <BOSL2/std.scad>
include <BOSL2/joiners.scad>
include <BOSL2/miscellaneous.scad>

$fn=360;

case_length = 57;
case_width = 22;
case_height = 10;


	render()
difference()
{
	translate([-1,0,-1]) case(case_length+2, case_width, case_height);
	for (i=[0:10:50])
		scale([1.01,1.01,1.01]) translate([i,11,10]) rotate([0,90,0]) knurling_wheel();
}

module case(length, width, height)
{
	cube([length,width,height]);
}

module knurling_wheel()
{
	w=6.5;
	d=20;
	r=d/2;

	cylinder(w,r,r);
}
