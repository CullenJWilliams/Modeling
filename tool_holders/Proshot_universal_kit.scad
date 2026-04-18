include <BOSL2/std.scad>
include <BOSL2/joiners.scad>
include <./tapers.scad>

$fn=360;
inch = 25.4;

length=184; // TODO max(length+ walls)
height=21; // TODO max(heights)
thickness=1.5;
width=2*24+thickness;

difference()
{
	translate([0,0,-thickness/2])
		box(length,width,height,thickness);
	rods();
	translate([-15,0,10]) handle();
}

// TODO forloop these to have spots above and below the handle
//big_jag();
//translate([20,0,0]) small_jag();

module big_jag()
{
cylinder(20,7.5/2,7.5/2);

}

module small_jag()
{
cylinder(20,4/2,4/2);

}

module handle()
{
	// TODO shadow up
	rotate([90,0,0]) cylinder(80,12.75/2,12.75/2,anchor=CENTER+FRONT);
	cylinder(.5*inch,(.5*inch)/2,(.5*inch)/2);
}

module rods()
{
	cuboid([6,180,21],anchor=BOTTOM,rounding=2,edges=[BOTTOM,FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT]);
	cuboid([40,23,21],anchor=BOTTOM,rounding=21/3,edges=[BOTTOM,FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT]);
}


module box(length,width,height,thickness)
{
	render()
		difference()
		{
			cuboid([width,length,height],anchor=BOTTOM+CENTER,rounding=2,edges=[FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT]);
		}

}
