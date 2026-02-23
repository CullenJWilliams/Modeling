include <BOSL2/std.scad>
include <BOSL2/joiners.scad>
include <./tapers.scad>

$fn=360;

length=44;
height=12;
thickness=1.5;
width=2*24+thickness;

difference()
{
	box(length,width,height,thickness);
	for(x=[+1,-1])
	{
		for(y=[+1,-1])
		{
			translate([x*12,y*11,0])
				cylinder(57,11.5,11.5,$fn=6);
		}
	}
}

module jaw(){
	cuboid([10,152,40],anchor=BOTTOM+BACK+LEFT);
}

module box(length,width,height,thickness)
{
	render()
		difference()
		{
			cuboid([width,length,height],anchor=BOTTOM+CENTER,rounding=2,edges=[FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT]);
		}

}
