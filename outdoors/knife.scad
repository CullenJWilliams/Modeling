include <BOSL2/std.scad>
$fn=5;

inch = 25.4;

thickness = 4.75;

path = [
	[0,0],
	[1,5],
	[35,14],
	[72,5],
	[85,20],
	[88,18],
	[82,5],
	[150,5],
	[225,0]
];

stroke(path);
mirror([0,1,0]) stroke(path);
//cube([125,40,thickness]);

module profile()
{
	difference()
	{
		path_sweep(zpath,path);

		translate([3/8*inch,-2,3/8*inch])
		rotate([90,0,0]) {
			translate([0,0,-20])cylinder(20,screw_hole_r,screw_hole_r,$fn=360);
			cylinder(20,screw_boss_r,screw_boss_r,$fn=360);
		}

		translate([9.5,-2,2*inch])
		rotate([90,0,0]) {
			translate([0,0,-20]) cylinder(20,screw_hole_r,screw_hole_r,$fn=360);
			cylinder(20,screw_boss_r,screw_boss_r,$fn=360);
		}

		translate([total_length+2,total_length-(3/8)*inch,2*inch])
		rotate([90,0,90]) {
			translate([0,0,-20]) cylinder(20,screw_hole_r,screw_hole_r,$fn=360);
			cylinder(20,screw_boss_r,screw_boss_r,$fn=360);
		}

		translate([total_length+2,total_length-(3/8)*inch,3/8*inch])
		rotate([90,0,90]) {
			translate([0,0,-20]) cylinder(20,screw_hole_r,screw_hole_r,$fn=360);
			cylinder(20,screw_boss_r,screw_boss_r,$fn=360);
		}

	}
}
