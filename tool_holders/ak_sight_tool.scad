include <BOSL2/std.scad>
include <BOSL2/joiners.scad>
include <./tapers.scad>

$fn=360;

length=30;
height=12;
thickness=1.5;
width=70;

#difference()
{
	translate([0,0,-thickness/2])
		box(length,width,height,thickness);
	translate([10,0,0]) sighttool();
}

module sighttool(){
	hull()
	{
		translate([5,0,0])cylinder(63,5.5/2,5.5/2,anchor=BOTTOM);
		cylinder(63,5.5/2,5.5/2,anchor=BOTTOM);
		translate([-1,0,0])cylinder(63,5.5/2,5.5/2,anchor=BOTTOM);
	}
	translate([-4,0,40])
		cuboid([38.2+.5,16.5,38.2],anchor=TOP+RIGHT);
}

module box(length,width,height,thickness)
{
	render()
		difference()
		{
			cuboid([width,length,height],anchor=BOTTOM+CENTER,rounding=2,edges=[FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT]);
		}

}
