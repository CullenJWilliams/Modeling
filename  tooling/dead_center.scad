include <BOSL2/std.scad>
include <BOSL2/joiners.scad>
include <./tapers.scad>

$fn=360;

case_length = 100;
case_width = 46+2;
case_height = 46/2;


overall_height=77.7;
base_height=2;
echo(overall_height-base_height);

render()
difference()
{
	translate([-2,0,0]) case(case_length+2, case_width, case_height);
	translate([20,case_width/2,case_height])
		rotate([0,90,0]){
		 translate([0,0,40]) rotate([90,0,0]) cylinder(case_width,5,5,anchor=CENTER);
			hull()
				color("teal") {
					translate([0,0,-2]) cylinder(2,7,7);
					morse_taper_2(.1,false);
					translate([0,0,77.7-15.7]) cylinder(15.7,17.7/2,0);
				}
				}
	translate([8,case_width/2,case_height])
	color("teal") {
		sphere(12.5/2);
		rotate([90,0,0]) cylinder(case_width,5,5,anchor=CENTER);
	}
}

module case(length, width, height)
{
	cube([length,width,height]);
}

