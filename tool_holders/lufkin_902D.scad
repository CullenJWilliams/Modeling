include <BOSL2/std.scad>
include <BOSL2/joiners.scad>

$fn=360;


total_length = 128;
width=21;
thickness = 7;

case_length = total_length+6;
case_width = width+6;
case_height = thickness+2;

render()
difference()
{
	translate([-2,0,0]) case(case_length, case_width, case_height);
	color("coral")
	scale([1.02,1.02,1.02]) translate([0,3,case_height-(thickness/2)]) rotate([0,0,0]) impression(total_length,width,thickness);
	#translate([case_length/2,0,case_height-(thickness/2)-2]) scale([1.5,1,1])ycyl((case_width/2)-5,d1=22,d2=18,anchor=BOTTOM+FRONT);
	#translate([case_length/2,case_width,case_height-(thickness/2)-2]) mirror([0,1,0]) scale([1.5,1,1]) ycyl((case_width/2)-5,d1=22,d2=18,anchor=BOTTOM+FRONT);
}

module case(length, width, height)
{
	cube([length,width,height]);
}

module impression(length,width,thickness)
{
	cuboid([length,width,thickness],anchor=LEFT+FRONT+BOTTOM);
}

module spike(l,d)
{
	r=d/2;
	translate([0,0,3])cylinder(l-3,r,r);
	cylinder(3,0,r);
}

module point_holder(l,bd,td)
{
	br=bd/2;
	tr=td/2;
	cylinder(l-5,br,tr);
	translate([0,0,l-5]) cylinder(5,tr,tr);
}

module shaft(l,d)
{
	r=d/2;
	cylinder(l,r,r);
}

module mass(l,bd,td)
{
	br=bd/2;
	tr=td/2;
	cylinder(8.5,br,tr);
	translate([0,0,8.5]) cylinder(l-8.5,tr,tr);
}

module cap(l,d)
{
	r=d/2;
	cylinder(l,r,r);
	translate([0,0,l]) sphere(5.25);
}
