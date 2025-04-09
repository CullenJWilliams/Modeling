include <BOSL2/std.scad>
include <BOSL2/joiners.scad>

$fn=360;

case_length = 155;
case_width = 46+2;
case_height = 46/2;


render()
difference()
{
	translate([-2,0,0]) case(case_length+2, case_width, case_height);
	color("teal") {
		rotate([0,-10,0])  translate([3.25,case_width/2,case_height-10]) linear_extrude(50)  projection() color("teal")rotate([0,90,0]) chuck(.2);
		translate([1,case_width/2,case_height-10]) rotate([0,80,0]) chuck(.2);
	}
}

module case(length, width, height)
{
	cube([length,width,height]);
}

module chuck(t)
{
	tbh = 6;
	tbr = 19/2;

	mta = 23.85;
	mtd = 20;
	mth = 76.8;

	sh=2;
	sr=22.9/2;

	cch=27;
	ccd=44;

	s2h=5;
	s2r=30/2;

	chuck_top_height=35.5;
	chuck_top_d=45;

	cylinder(tbh+t,tbr+t,tbr+t);
	translate([0,0,tbh])morse_taper(mta,mtd,0,mth,t);
	translate([0,0,tbh+mth]) cylinder(sh+t,sr+t,sr+t);
	translate([0,0,tbh+mth+sh]) chuck_center(cch,ccd,t);
	translate([0,0,tbh+mth+sh+cch]) cylinder(s2h+t,s2r+t,s2r+t);
	translate([0,0,tbh+mth+sh+cch+s2h]) chuck_top(chuck_top_height,chuck_top_d);
}

module taper_base(h,d)
{
	r=d/2;
	cylinder(h,r,r);
}

module morse_taper(a,d,L,k,t)
{
	cylinder(k,(d+t)/2,(a+t)/2);
}


module chuck_center(h,d,t)
{
	cylinder(27,44/2,44/2);
	translate([0,0,27/3]) cylinder(h/3,(d+2.3)/2,(d+2.3)/2);
}

module chuck_top(height,d)
{

	base_height=height*.65;
	top_d=42.25;
	r=d/2;
	top_r=top_d/2;

	cylinder(base_height,r,r);
	translate([0,0,base_height]) cylinder(height-base_height,r,top_r);
}
