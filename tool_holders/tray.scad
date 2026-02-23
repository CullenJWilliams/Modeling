include <BOSL2/std.scad>
include <BOSL2/joiners.scad>
include <./tapers.scad>

$fn=360;

length=208.5;
height=40;
width=80;
thickness=1.5;

box(length,width,height,thickness);

module box(length,width,height,thickness)
{
	translate([width/2,length/2,0])
	rotate([0,0,90])
	render()
	difference()
	{
		cuboid([length,width,height],anchor=BOTTOM,rounding=2,edges=[FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT]);
		translate([0,0,thickness]) cuboid([length-thickness,width-thickness,height-thickness],anchor=BOTTOM,rounding=4,edges=[FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT,BOTTOM]);
	}

}
