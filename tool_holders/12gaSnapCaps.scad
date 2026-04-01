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
			translate([x*12,y*11,0]){
				cylinder(59,10.25,10.25,$fn=360);
				translate([0,0,59]) cylinder(1.7,22.25/2,22.25/2,$fn=360);
				}
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
