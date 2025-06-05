include <BOSL2/std.scad>
include <BOSL2/joiners.scad>
include <BOSL2/miscellaneous.scad>

$fn=360;

case_length = 66+1;
case_width = 42+2;
case_height = 25;


render()
difference()
{
	translate([-1,0,-1]) case(case_length+2, case_width, case_height);
	color("teal") {
		offset3d(.5)
		translate([25,0,26.75])
		translate([42/2,42/2+1,0]) 
		rotate([180,0,90])
		O2_Wrench();
	}
}

module case(length, width, height)
{
	cube([length,width,height]);
}

module O2_Wrench()
{
	difference(){
		color("teal"){
			O2_Wrench_Base();
			O2_Wrench_Jaws();
		}
		O2_Wrench_Socket();
		translate([0,21,0]) cube([7.5,20,27],anchor=CENTER+BOTTOM);
	}
}

module O2_Wrench_Base()
{
	d=42;
	r=d/2;
	h=8.4;
	difference(){
		hull(){
			cylinder(h,r,r);
			translate([0,-45.8,0]) cube([17.5,17.5,h],anchor=FRONT+BOTTOM);
		}
		cylinder(h,26/2,26/2);
	}
}

module O2_Wrench_Jaws()
{
	h=26.75;
	td=33.42;
	bd=42;
	tr=td/2;
	br=bd/2;

	d=25.5;
	r=d/2;

	difference(){
		cylinder(h,br,tr);

		cylinder(h,r,r,$fn=6);
		rotate([0,0,360/12]) cylinder(h,r,r,$fn=6);
	}
}

module O2_Wrench_Socket()
{
	c=13.3;
	l=c*sin(45);
	h=8.4;

	translate([0,-45.8+14.5,0]){
		cube([l,l,l],anchor=CENTER+BOTTOM);
		rotate([0,0,45]) cube([l,l,l],anchor=CENTER+BOTTOM);
	}
}
