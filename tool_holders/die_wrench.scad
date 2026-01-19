include <BOSL2/std.scad>
include <BOSL2/joiners.scad>

$fn=360;

case_length = 145+4;
case_width = 4+(20+14);
case_height = 10/2;


render()
difference()
{
	translate([-2,0,-2]) case(case_length, case_width, case_height);
	color("teal") {
		translate([145/2,2+(20+14)/2,0]) die_wrench();
	}
}

module case(length, width, height)
{
	cube([length,width,height]);
}

module die_wrench()
{
	d=22.3+.5;
	r=d/2;
	h=8.5;

	pin_l = 10;
	pin_r = 4/2;

	rod_d = 6.5;
	rod_r=rod_d/2;
	rod_l = 145;

	t=.5;

	cylinder(h,r+t,r+t);
	translate([0,0,h/2]) rotate([0,90,0]) cylinder(rod_l+(2*t),rod_r+t,rod_r+t,anchor=CENTER);
	translate([0,0,h/2]) rotate([90,0,45]) cylinder((pin_l*2)+d+(2*t),pin_r+t,pin_r+t,anchor=CENTER);

}
