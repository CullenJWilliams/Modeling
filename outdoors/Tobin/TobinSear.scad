include <BOSL2/std.scad>
$fn=360;

inch = 25.4;


sear();

module sear()
{
	sear_profile();
	pivot_hole();
	transfer_bar();
}

module sear_profile()
{
	cuboid([10,10,5]);
	circle((5/16)*inch); // front cut
}

module pivot_hole()
{
	cylinder(10,1,1,anchor=CENTER);
	cylinder(10,3,3,anchor=CENTER+BOTTOM);
}

module transfer_bar()
{
	difference(){
		cylinder(20,3,3);
		cuboid([10,10,20],anchor=FRONT+BOTTOM);
	}
}
