include <BOSL2/std.scad>
include <BOSL2/joiners.scad>
include <BOSL2/gears.scad>

height = 130;
$fn=360;

render()
difference()
{
	render()
	{
		translate([0,0,2.7]) spur_gear(1.48,10,3.9,helical=0, herringbone=false, anchor=BOTTOM);
		rotate([0,0,1.5])spur_gear(1.345,41,2.7,helical=-26.8, herringbone=false, anchor=BOTTOM);
	}
	color("purple") axle();
	cylinder(1,4.4,4.4);
}

module axle()
{
	translate([0,0,-1]) cylinder(10,1.2,1.2);
}
