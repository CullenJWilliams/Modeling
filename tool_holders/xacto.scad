include <BOSL2/std.scad>
include <BOSL2/joiners.scad>

$fn=360;

case_length = 164;
case_width = 12;
case_height = 8;


render()
difference()
{
	translate([-2,0,0]) case(case_length+2, case_width, case_height);
	translate([53,6,10]) 
	rotate([0,0,90])
	color("teal") {
		rotate([90,0,0]) cylinder(56,4,4);
		rotate([90,0,0]) cylinder(26,5,5,anchor=TOP);
		rotate([90,0,0]) translate([0,0,56]) cylinder(26,5,5,anchor=BOTTOM);
		translate([0,26,-2]) cuboid([2,28,12],anchor=FRONT);
		translate([0,-56-26,-2]) cuboid([2,28,12],anchor=BACK);
	}
}

module case(length, width, height)
{
	cube([length,width,height]);
}

module chuck()
{
	tbh=9;
	tbl=12.8;
	tbw=6.25;

	mta = 18.08;
	mtd = 14.76;
	mth = 71.15;

	cch = 45;
	ccd = 57.3;

	chuck_top_height = 25;
	chuck_top_d = 38.9;

	scale([1.02,1.02,1])
	{
		cube([tbl,tbw,tbh],anchor=CENTER+BOTTOM);
		translate([0,0,tbh]) morse_taper(mta,mtd,0,mth);
		translate([0,0,tbh+mth]) cylinder(3.5,15.6/2,15.6/2);
		translate([0,0,tbh+mth+3.5]) chuck_center(cch,ccd);
		translate([0,0,tbh+mth+3.5+cch]) chuck_top(chuck_top_height,chuck_top_d);
	}
}

module morse_taper(a,d,L,k,t)
{
	cylinder(k,(d)/2,(a)/2);
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
	translate([0,0,h]) cylinder(9.8,10,10);
}
