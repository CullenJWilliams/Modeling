include <BOSL2/std.scad>
include <BOSL2/joiners.scad>
include <./tapers.scad>

$fn=360;

length=146;
height=33;
width=54;
thickness=1.5;

box(length,width,height,thickness);
translate([(width-27.5)/2,length-thickness,height]) overTravelStop(thickness);
translate([0,0,height]) handle(width,thickness);
//rails();

module box(length,width,height,thickness)
{
	translate([width/2,length/2,0])
	rotate([0,0,90])
	render()
	difference()
	{
		cuboid([length,width,height],anchor=BOTTOM,rounding=2,edges=[FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT,BOTTOM]);
		translate([0,0,thickness]) cuboid([length-thickness,width-thickness,height-thickness],anchor=BOTTOM,rounding=2,edges=[FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT,BOTTOM]);
	}

}

module overTravelStop(thickness)
{
	length=27.5;
	height=6.3;
	cube([length,thickness,height]);
}

module handle(back_length,thickness){
	front_length=45;
	width=10;

	// TODO trapazoid
	translate([(back_length-front_length)/2,-width+.75,-1.5])
	{
		translate([(front_length/2),width/2,0]) linear_extrude(thickness) trapezoid(width,front_length,back_length-1);
		translate([0,1.25,0]) rotate([0,90,0]) cylinder(front_length,1.25,1.25);
	}
}
