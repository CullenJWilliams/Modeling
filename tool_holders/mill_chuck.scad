include <BOSL2/std.scad>
include <BOSL2/joiners.scad>
include <./tapers.scad>

$fn=360;

case_length = 155+20;
case_width = 57+2;
case_height = 50/2;

// translate([9,case_width/2,case_height-9]) rotate([0,80,0]) mill_chuck();
	render()
difference()
{
	translate([-2,0,0]) case(case_length+2, case_width, case_height);
	render()
		color("teal") {
			rotate([0,-10,0])  translate([3.5+8,case_width/2,case_height-10]) linear_extrude(50)  projection() color("teal")rotate([0,90,0]) mill_chuck();
			translate([9,case_width/2,case_height-9]) rotate([0,80,0])
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

	mta = 24.07+tolerance;
	mtd = 20.3+tolerance;
	mtk = 77.9;
	mtl = 18.6;
	mttw = 0;

	spacer_h=4.95;

	chuck_center_h = 45;
	chuck_center_d = 57.3+tolerance;

	chuck_top_height = 25;
	chuck_top_d = 38.9+tolerance;

	scale([1.02,1.02,1])
	{
		translate([0,0,tbh]) mmorse_taper(mta,mtd,mtl,0,mtk,0,true);
		translate([0,0,tbh+mtk]) cylinder(spacer_h,mta/2,mta/2);
		translate([0,0,tbh+mtk+spacer_h]) chuck_center(chuck_center_h,chuck_center_d);
		translate([0,0,tbh+mtk+spacer_h+chuck_center_h]) chuck_top(chuck_top_height,chuck_top_d);
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
