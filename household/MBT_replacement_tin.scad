include <BOSL2/std.scad>
$fn=360;

thickness = 1;
height=39;
diameter=79.9;
radius=diameter/2;
inner_radius=(diameter-thickness)/2;

	render()
difference()
{
	translate([0,0,0]) cylinder(height,radius,radius);
	//	translate([0,0,thickness]) cylinder(height-thickness,inner_radius,inner_radius);
	translate([0,0,height+thickness]) sphere(inner_radius);
}
