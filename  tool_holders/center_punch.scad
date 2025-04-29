include <BOSL2/std.scad>
include <BOSL2/joiners.scad>

$fn=360;

case_length = 155;
case_width = 30;
case_height = 15;


render()
difference()
{
	translate([-2,0,0]) case(case_length+2, case_width, case_height);
	color("coral")
	scale([1.02,1.02,1.02]) translate([1,15,case_height]) rotate([0,90,0]) impression();
}

module case(length, width, height)
{
	cube([length,width,height]);
}

module impression()
{
	center_punch();
}

module center_punch()
{
	pl=18;
	phl=25;
	sl=81.5;
	cap_l=20;

	spike(pl,3.4);
	translate([0,0,pl])        point_holder(phl,4.85,12);//,85
	translate([0,0,pl+phl])    shaft(sl,6.53);
	translate([0,0,pl+phl+sl-60]) mass(37,16.2,25.5);
	translate([0,0,pl+phl+sl]) cap(cap_l,11.3);
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
