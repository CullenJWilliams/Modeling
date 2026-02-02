include <BOSL2/std.scad>

$fn=360;

base_length=200;
base_width =70;
base_height=20;

fork_diameter = 36;
fork_radius = fork_diameter/2;
fork_spacing = 147+fork_diameter;

fender_bolt_spacing_x = 70;
fender_bolt_spacing_y = 45;

hose_clamp_height = 12.75+.5;

difference()
{
		base_block(
				base_length,
				base_width,
				base_height
				);
	translate([fork_spacing/2,0,0]) cube([30,80,40],anchor=CENTER+LEFT);
	mirror([1,0,0]) translate([fork_spacing/2,0,0]) cube([32,80,40],anchor=CENTER+LEFT);

	translate([fork_spacing/2,0,0]) fork_clamp();
	translate([-fork_spacing/2,0,0]) fork_clamp();
	fender_holes(fender_bolt_spacing_x,fender_bolt_spacing_y);

	translate([0,0,-10]) rotate([90,0,0]) scale([3,1.2,1]) cylinder(80,5,5,anchor=CENTER);
	//mirror([1,0,0]) translate([fork_spacing/3.2,0,-10]) rotate([90,0,0]) scale([3,1,1]) cylinder(80,5,5,anchor=CENTER);
}

module base_block(length,width,height)
{
render()
	intersection(){
		scale([3.5,1,1]) cylinder(base_height,base_width/2,base_width/2,anchor=CENTER);
		cube([length,width,height],anchor=CENTER);
		}
}

module fork_clamp()
{
	cylinder(40,fork_radius,fork_radius,anchor=CENTER);
	difference(){
		cylinder(hose_clamp_height,fork_radius+4,fork_radius+4,anchor=CENTER);
		cylinder(hose_clamp_height,fork_radius+2,fork_radius+2,anchor=CENTER);
	}
}

module fender_holes(x,y)
{
	translate([ x/2, y/2,-20]) cylinder(40,3,3);
	translate([-x/2, y/2,-20]) cylinder(40,3,3);
	translate([-x/2,-y/2,-20]) cylinder(40,3,3);
	translate([ x/2,-y/2,-20]) cylinder(40,3,3);

	translate([ x/2, y/2,5]) cylinder(5,6,6);
	translate([-x/2, y/2,5]) cylinder(5,6,6);
	translate([-x/2,-y/2,5]) cylinder(5,6,6);
	translate([ x/2,-y/2,5]) cylinder(5,6,6);
}
