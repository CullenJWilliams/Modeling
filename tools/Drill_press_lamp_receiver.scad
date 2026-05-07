include <pegmixer-main/pegmixer.scad>
include <BOSL2/std.scad>

$fn=360;
inch=24.5;

bracket();
connector();

translate([((-5*inch)/2)-65-3,-18.5,0])
	light_clamp();


module light_clamp()
{
	difference(){
		union(){
			cylinder(25,5+30/2,5+30/2);
			cuboid([45,5+27/2,25],anchor=BOTTOM+LEFT+FRONT);
			cuboid([45,10,25],anchor=BOTTOM+LEFT+BACK);
		}
		light_clamp_hole();
	}
}

module light_clamp_hole()
{
	cylinder(25,30/2,30/2);
	cuboid([45,4,25],anchor=BOTTOM+LEFT+FRONT);
	translate([25,0,25/2]) rotate([90,0,0]) cylinder(40,3.5,3.5,anchor=CENTER);
	cuboid([20,10,16],anchor=BOTTOM+LEFT);
}

module bracket()
{
	difference(){
		cuboid([5*inch+40+6,14,25],rounding=8,edges=[BOTTOM+LEFT,BOTTOM+RIGHT],anchor=BOTTOM+FRONT);
		bracket_holes();
	}
}

module bracket_holes()
{
	translate([((5*inch)+6)/2, 0,12])  rotate([90,0,0]) cylinder(40,4.5,4.5,anchor=CENTER);
	translate([-((5*inch)+6)/2,0,12]) rotate([90,0,0]) cylinder(40 ,4.5,4.5,anchor=CENTER);
}

module connector()
{
	difference(){
		cuboid([5*inch+40+6,14,25],rounding=8,edges=[BOTTOM+RIGHT],anchor=BOTTOM+BACK);
		connector_holes();
	}
}

module connector_holes()
{
	translate([((5*inch)+6)/2, 0,12])  rotate([90,0,0]) cylinder(40,21/2,21/2,anchor=CENTER);
	translate([-((5*inch)+6)/2,0,12]) rotate([90,0,0])  cylinder(40,21/2,21/2,anchor=CENTER);
}
