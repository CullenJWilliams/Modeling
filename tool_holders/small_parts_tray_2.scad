include <BOSL2/std.scad>
include <BOSL2/joiners.scad>
include <./tapers.scad>

$fn=360;

length=140;
height=36.3;
width=54;
thickness=1.3;

otw = 39.5;

box(length,width,height,thickness);
translate([(width-otw)/2,length-thickness,height]) overTravelStop(otw,3.5,thickness);
translate([(width/2)-(38.5/2),0,height/2]) handle_2(9, 38.5, 10, thickness);
//rails();

module box(length,width,height,thickness)
{
	translate([width/2,length/2,0])
		rotate([0,0,90])
		render()
		difference()
		{
			cuboid([length,width,height],anchor=BOTTOM,rounding=2,edges=[FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT,BOTTOM]);
			translate([0,0,thickness]) cuboid([length-(2*thickness),width-(2*thickness),height-thickness],anchor=BOTTOM,rounding=2,edges=[FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT,BOTTOM]);
		}

}

module overTravelStop(length,height,thickness)
{
	cuboid([length,thickness,height],anchor=BOTTOM+FRONT+LEFT,rounding=3,edges=[TOP+LEFT,TOP+RIGHT]);
}

module handle(back_length,thickness){
	front_length=45;
	width=10;

	translate([(back_length-front_length)/2,-width+.75,-1.5])
	{
		translate([(front_length/2),width/2,0]) linear_extrude(thickness) trapezoid(width,front_length,back_length-1);
		translate([0,1.25,0]) rotate([0,90,0]) cylinder(front_length,1.25,1.25);
	}
}

module handle_2(length, width,height,thickness){
	difference(){
		cuboid([width,length,height],anchor=BACK+LEFT,rounding=2,edges=[FRONT+LEFT,FRONT+RIGHT]);
		translate([thickness,thickness,0]) handle_2_inner(length,width, height, thickness);
		translate([19,-7.5,53]) rotate([90,0,0]) color("teal") cylinder(2,50,50);
		mirror([0,0,1])translate([19,-7.5,53]) rotate([90,0,0]) color("teal") cylinder(2,50,50);
	}
	translate([thickness,thickness,0]) linear_extrude(thickness) projection([0,0,1]) handle_2_inner(length,width,height, thickness);
}

module handle_2_inner(length, width, height,thickness){
		cuboid([width-(2*thickness),length,height+1],anchor=BACK+LEFT,rounding=1.5,edges=[FRONT+LEFT,FRONT+RIGHT]);
}
