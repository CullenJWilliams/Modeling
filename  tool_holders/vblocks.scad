include <BOSL2/std.scad>
include <BOSL2/joiners.scad>
include <./tapers.scad>

$fn=360;

case_length = 175;
case_width = 32+2;
case_height = 46/2;


overall_height=77.7;
base_height=2;
echo(overall_height-base_height);

	render()
difference()
{
	translate([-2,0,0]) case(case_length+2, case_width, case_height);
	translate([15,case_width/2,case_height]) //rotate([0,90,0])
		scale([1.02,1.02,1.02]) impression();
}

module impression()
{
	translate([0,0,-1]) vblock(41);
	translate([32+2,0,-1]) vblock(41);
	translate([64+10,8,1]) rotate([90,0,180]) clamp();
	translate([64+10,-8,1]) rotate([90,0,180]) clamp();
}

module vblock(height)
{
	difference(){
		cube([32,32,41],anchor=CENTER);
		translate([0,32/2-5.6,-height/2]) linear_extrude(height) rotate([0,0,45]) right_triangle([8,8]);
		mirror([0,1,0]) translate([0,32/2-9.8,-height/2]) linear_extrude(height) rotate([0,0,45]) right_triangle([14,14]);

		rotate([0,0,90]) translate([0,32/2,-height/2]) linear_extrude(height) rect([5,4]);
		rotate([0,0,90]) mirror([0,1,0]) translate([0,32/2,-height/2]) linear_extrude(height) rect([5,4]);
	}

}

module clamp()
{
	color("coral"){
		translate([-16-23-45/2,0,0]) rotate([0,90,0]) cylinder(20,6,6,anchor=CENTER+TOP);
		translate([-16-23-45/2,0,0]) rotate([0,90,0]) cylinder(63,4,4,anchor=CENTER+BOTTOM);
		translate([-45/2,0,0]) rotate([0,90,0]) cylinder(16,6,6,anchor=CENTER+TOP);
		cylinder(15,45/2,45/2,anchor=CENTER);
		translate([45/2,0,0]) cube([47-(45/2),45,15], anchor=CENTER+RIGHT);

	}
}

module case(length, width, height)
{
	cube([length,width,height]);
}

