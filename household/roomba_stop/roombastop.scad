include <BOSL2/std.scad>

linear_extrude(50)
difference()
{
	translate([0,0,0]){
		translate([0,-20,0])
			rect([40,40]);
		translate([0,10,0])
			rect([40,20],rounding=[5,5,0,0]);
	}
	translate([0,0,0]){
		translate([0,-80.7/2,0]){
				ellipse(r=[39/2,80.7/2]);
		}
		translate([15,-27,0])
		{
			rect([10,40]);
		}
	}
}
