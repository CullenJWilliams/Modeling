include <BOSL2/std.scad>
include <BOSL2/joiners.scad>
include <./tapers.scad>

$fn=360;

case_length = 128;
case_width = 41+2;
case_height = 46/2;


overall_height=77.7;
base_height=2;
echo(overall_height-base_height);

render()
difference()
{
	translate([-2,0,0]) case(case_length+2, case_width, case_height);
	translate([5,case_width/2,case_height-10])
		rotate([0,80,0])
		scale([1.02,1.02,1.02]){
			color("coral")
				rotate([0,-90,0]) linear_extrude(50) projection() rotate([0,90,0])live_center();
			color("teal")
				live_center();
		}
}

module case(length, width, height)
{
	cube([length,width,height]);
}

module live_center()
{
	total_height=127;
	mt_height= 64;
	center_height=23.6;
	cone_height=32;

	echo("Expected Cone height=");
	echo(total_height-mt_height-center_height);

	translate([0,0,mt_height+center_height]) cylinder(32,20,0);
	translate([0,0,mt_height]) cylinder(23.6,20,20);
	mmorse_taper(18,14.6,0,0,mt_height,0,false);
	cylinder(4,7,7,anchor=TOP);

}
