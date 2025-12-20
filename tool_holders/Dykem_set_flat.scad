include <BOSL2/std.scad>
include <BOSL2/joiners.scad>
include <BOSL2/miscellaneous.scad>

$fn=360;

quantity= 12;
length = 147;
d=14.6+.2;
r=(d/2);
wall_thickness = 2;
wt= wall_thickness;

case_length = (quantity*(wt+d))+wt;
case_width = length+2*wt;
case_height = 10;



render()
difference()
{
	translate([-1,0,-1]) case(case_length+2, case_width, case_height);
	for (i=[0:1:quantity-1])
		scale([1,1,1])
			translate([i*d+(r+2)+(2*i),2,10])
				rotate([-90,0,0])
					#cylinder(length,r,r);
}

module case(length, width, height)
{
	cube([length,width,height]);
}
