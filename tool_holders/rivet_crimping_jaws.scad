include <BOSL2/std.scad>
include <BOSL2/joiners.scad>
include <./tapers.scad>

$fn=360;

length=155;
height=12;
thickness=1.5;
width=30+2*thickness;

difference()
{
	translate([0,0,-thickness])box(length,width,height,thickness);
	translate([thickness,-thickness,0]) jaw();
	translate([thickness+20,-thickness,0]) jaw();
}

module jaw(){
	cuboid([10,152,40],anchor=BOTTOM+BACK+LEFT);
}

module box(length,width,height,thickness)
{
	render()
		difference()
		{
			cuboid([width,length,height],anchor=BOTTOM+BACK+LEFT,rounding=2,edges=[FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT]);
		}

}
