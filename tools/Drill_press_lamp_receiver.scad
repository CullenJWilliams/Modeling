include <pegmixer-main/pegmixer.scad>
include <BOSL2/std.scad>

$fn=360;
inch=24.5;

bracket();
connector();

translate([((-5*inch)/2)-65,-18.5,0])
	light_clamp();


module light_clamp()
{
	difference(){
		union(){
			cylinder(25,5+27/2,5+27/2);
			cuboid([45,5+27/2,25],anchor=BOTTOM+LEFT+FRONT);
			cuboid([45,10,25],anchor=BOTTOM+LEFT+BACK);
		}
		light_clamp_hole();
	}
}

module light_clamp_hole()
{
	cylinder(25,27/2,27/2);
	cuboid([45,2,25],anchor=BOTTOM+LEFT+FRONT);
	translate([25,0,25/2]) rotate([90,0,0]) cylinder(40,3.5,3.5,anchor=CENTER);
}

module bracket()
{
	difference(){
		cuboid([5*inch+40,14,25],rounding=8,edges=[BOTTOM+LEFT,BOTTOM+RIGHT],anchor=BOTTOM+FRONT);
		bracket_holes();
	}
}

module bracket_holes()
{
	translate([5*inch/2, 0,12])  rotate([90,0,0]) cylinder(40,4,4,anchor=CENTER);
	translate([-5*inch/2,0,12]) rotate([90,0,0]) cylinder(40,4,4,anchor=CENTER);
}

module connector()
{
	difference(){
		cuboid([5*inch+40,14,25],rounding=8,edges=[BOTTOM+RIGHT],anchor=BOTTOM+BACK);
		connector_holes();
	}
}

module connector_holes()
{
	translate([5*inch/2, 0,12])  rotate([90,0,0]) cylinder(40,9,9,anchor=CENTER);
	translate([-5*inch/2,0,12]) rotate([90,0,0])  cylinder(40,9,9,anchor=CENTER);
}
