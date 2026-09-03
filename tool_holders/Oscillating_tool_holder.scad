include <BOSL2/std.scad>
include <BOSL2/joiners.scad>
include <BOSL2/miscellaneous.scad>

$fn=360;

quantity= 4;
length = 147;
d=14.6+.2;
r=(d/2);
wall_thickness = 2;
wt= wall_thickness;

case_length = (quantity*(wt+d))+wt;
case_width = 40+2*wt;
case_height = 35;



	render()
difference()
{
	translate([-1,0,-1]) case(case_length+2, case_width, case_height);
	for (i=[0:1:quantity-1])
		scale([1,1,1])
			translate([i*d+(r+2)+(2*i),0,00])
			//rotate([-90,0,0])
				tool_slot();
}

module tool_slot()
{
	difference(){
		translate([0,0,30])
		{
			prismoid([4,40],[9,40],9,shift=[3,0],anchor=BOTTOM);
			cuboid([4,40,30],anchor=TOP);
		}
		cuboid([4,10,13],anchor=BOTTOM,rounding=4,edges=[TOP+FRONT,TOP+BACK]);
	}
}

module case(length, width, height)
{
	cube([length,width,height],anchor=BOTTOM+LEFT);
}
