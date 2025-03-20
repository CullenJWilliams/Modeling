include <BOSL2/std.scad>

$fn=360;


difference()
{
	color("aqua"){
		linear_extrude(19)
			difference(){
				right_triangle([20,20]);
				color("cyan") translate([1,10,0]) rotate([0,0,-45]) square([13,3.5]);
			}
		mirror([0,0,1]) linear_extrude(1)
			right_triangle([20,20]);
	}
	translate([0,0,-1])
	linear_extrude(20)
		translate([-7,-7,0]) right_triangle([20,20]);
}
