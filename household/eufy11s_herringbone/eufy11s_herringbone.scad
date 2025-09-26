include <BOSL2/std.scad>
include <BOSL2/joiners.scad>
include <BOSL2/gears.scad>

height = 130;
$fn=360;

render()
difference(){
	render()
	{
		spur_gear(1.57,46,4.2,helical=0, herringbone=false, anchor=BOTTOM);
		shaft();
	}
	color("purple") axle();
}


module shaft()
{
	difference(){
		color("coral"){
			cylinder(8.20,4.25,4.25);
			cube([6,6,15], anchor=BOTTOM);
			translate([0,3,11.5]) rotate([90,0,0]) cylinder(6,3.5,3.5);
		}
		color("green"){
			translate([0,-3,8]) cube([2,.8,7], anchor=BOTTOM+FRONT);
			translate([0,3,8]) cube([2,.8,7], anchor=BOTTOM+BACK);

			//translate([3,0,5]) cube([.8,4.1,10], anchor=BOTTOM+RIGHT);
			//translate([-3,0,5]) cube([.8,4.1,10], anchor=BOTTOM+LEFT);
		}
	}
}

module axle()
{
	translate([0,0,-1]) cylinder(5,1.75,1.75);

	translate([0,0,5]) cylinder(11,1.1,1.1); // TODO this should be threaded
}
