include <BOSL2/std.scad>
include <BOSL2/joiners.scad>
include <./tapers.scad>

$fn=360;

length=131;
height=12;
thickness=1.5;
width=2*13.5+16.5+5+5*thickness;

difference()
{
	translate([0,0,-thickness])box(length,width,height,thickness);
	translate([thickness,-thickness,0])    toth_block();
	translate([2*thickness+13.5,-thickness,0]) toth_block();
	translate([3*thickness+2*13.5,-thickness,0])    long_block();
	translate([4*thickness+2*13.5+16.5,-thickness-20,0])    support_plate();
}

module toth_block(){
	cuboid([13.5,128,64],anchor=BOTTOM+BACK+LEFT);
}

module long_block(){
	#cuboid([16.5,128,25.5],anchor=BOTTOM+BACK+LEFT);
}

module support_plate(){
	#cuboid([5,89.5,32],anchor=BOTTOM+BACK+LEFT);
}

module box(length,width,height,thickness)
{
	render()
		difference()
		{
			cuboid([width,length,height],anchor=BOTTOM+BACK+LEFT,rounding=2,edges=[FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT]);
		}

}
