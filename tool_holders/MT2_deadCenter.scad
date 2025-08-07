include <BOSL2/std.scad>
include <BOSL2/joiners.scad>
include <./tapers.scad>

$fn=360;

case_length = 135;
case_width = 35+2;
case_height = 38/2;

// translate([9,case_width/2,case_height-9]) rotate([0,80,0]) mill_chuck();
	render()
difference()
{
	translate([-2,0,0]) case(case_length+2, case_width, case_height);
	render()
		color("teal") {
			rotate([0,-5,0])  translate([3.5-7,case_width/2,case_height-10]) linear_extrude(50)  projection() color("teal")rotate([0,90,0]) mill_chuck();
			translate([-5,case_width/2,case_height-9]) rotate([0,85,0])
				mill_chuck();
		}
}

module case(length, width, height)
{
	cube([length,width,height]);
}

module mill_chuck()
{
	tolerance = .2;

	tbh=9;
	tbl=12.8;
	tbw=6.25;

	mta = 23.8;
	mtd = 20;
	mtk = 104;
	mtl = 0;
	mttw = 0;

	dead_center_hypotenus = 23.68;
	dead_center_height=sqrt(((mta/2)^2)+(dead_center_hypotenus^2));

	chuck_center_h = 45;
	chuck_center_d = 57.3+tolerance;

	chuck_top_height = 25;
	chuck_top_d = 38.9+tolerance;

	scale([1.02,1.02,1])
	{
		translate([0,0,tbh]) mmorse_taper(mta,mtd,mtl,0,mtk,0,false);
		translate([0,0,tbh+mtk]) cylinder(dead_center_height,mta/2,0);
	}
}

module chuck_center(h,d)
{
	r=d/2;
	cylinder(h,r,r);
}

module chuck_top(h,d)
{
	r=d/2;

	cylinder(h,r,r);
	translate([0,0,h]) cylinder(16.7,10,6);
}
