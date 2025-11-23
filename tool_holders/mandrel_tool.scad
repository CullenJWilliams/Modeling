include <BOSL2/std.scad>
include <BOSL2/joiners.scad>

$fn=360;


total_length = 125;
width=26;
triangle_length = 76;
point_width = 5;
thickness = 3.5;

case_length = total_length+6;
case_width = 30;
case_height = 5;

render()
difference()
{
	translate([-2,0,0]) case(case_length, case_width, case_height);
	color("coral")
	scale([1.02,1.02,1.02]) translate([0,15,case_height-(thickness/2)]) rotate([0,0,0]) impression(total_length,width,triangle_length);
	translate([40,0,case_height-(thickness/2)-2]) scale([1.5,1,1])ycyl((case_width/2)-5,d1=22,d2=18,anchor=FRONT+BOTTOM);
	translate([40,case_width,case_height-(thickness/2)-2]) mirror([0,1,0]) scale([1.5,1,1]) ycyl((case_width/2)-5,d1=22,d2=18,anchor=FRONT+BOTTOM);
}

module case(length, width, height)
{
	cube([length,width,height]);
}

module impression(length,width,triangle_length)
{
	center_punch(length,width,triangle_length);
}

module center_punch(length,width,triangle_length)
{
	square_length = length-triangle_length; 
	cuboid([length-triangle_length,26,3.5],anchor=LEFT+BOTTOM);
	translate([square_length,0,0]) rotate([0,0,-90]) linear_extrude(3.5) trapezoid(w1=width,w2=5,ang=[74.56,90],anchor=FRONT);
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
