include <BOSL2/std.scad>

$fn=360;

linear_extrude(2)
{
	difference(){
		color("green"){
			difference(){
				hull()
					color("cyan"){
						circle(d=54);
					}

				color("tomato"){
					circle(d=48);
				}
			}
			translate([48/2-1,0,0]) circle(d=9);
		}
		translate([48/2-1,0,0]) circle(d=4);
	}
}

translate([48/2-.4,4.4,1]) fillet(l=2,r=3,spin=102);
translate([48/2-.4,-4.4,1]) fillet(l=2,r=3,spin=168);
