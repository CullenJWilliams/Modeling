include <BOSL2/std.scad>
include <./bmw_headlight_bracket.scad>


$fn=360;

translate([105,-100,0]) rotate([0,0,90]) headlight_bracket();
translate([-105,-100,0]) rotate([0,0,90]) left_headlight_bracket();
rotate([-15,0,0])headlight_bucket();
translate([0,30,0]) windshield();

module windshield(){
	difference(){
		windshield_profile();
		translate([0,-10,0])windshield_profile();
		translate([0,20,0]) headlight_bucket();
	}
}

module windshield_profile()
{
	hull(){
		translate([0,0,85])
		{
			rotate([15,0,0])
				hull(){
					cuboid([86,1,265-85],anchor=BOTTOM);
					cuboid([210,1,1],anchor=BOTTOM);
					translate([0,0,265-85])
						rotate([90,90,0]) prismoid([1,85],[1,195],48);
				}
		}
		cuboid([210,20,85],anchor=BOTTOM+BACK);
	}
}

module headlight_bucket()
{
	translate([0,30,0])
	{
		rotate([90,0,0]) 
			cylinder(20,210/2,210/2);
		difference(){
			sphere(210/2);
			rotate([-90,0,0])
				cylinder(110,210/2,210/2);
		}
	}
}
