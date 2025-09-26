include <BOSL2/std.scad>

$fn=360;

base_length=200;
base_width =70;
base_height=20;

fork_diameter = 40;
fork_radius = fork_diameter/2;
fork_bolt_spacing = 25;

difference()
{
	base_block(
			base_length,
			base_width,
			base_height
			);

	translate([75,0,-20]) fork_clamp();
	translate([-75,0,-20]) fork_clamp();
	fender_holes(fork_bolt_spacing);
}

module base_block(length,width,height)
{
	cube([length,width,height],anchor=CENTER);
}

module fork_clamp()
{
	cylinder(40,fork_radius,fork_radius);
}

module fender_holes(w)
{
	translate([ w, w,-20]) cylinder(40,3,3);
	translate([-w, w,-20]) cylinder(40,3,3);
	translate([-w,-w,-20]) cylinder(40,3,3);
	translate([ w,-w,-20]) cylinder(40,3,3);
}
