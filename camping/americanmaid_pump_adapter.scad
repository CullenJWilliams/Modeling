include <BOSL2/std.scad>
$fn=360;

inch = 25.4;

	render()
difference(){
	render(){
		outer_geometry();
		translate([0,0,8]) inner_geometry();
	}
	translate([0,0,-50]) cylinder(100,18,18);
}

module inner_geometry()
{
	render()
		difference(){
			import("../../remixes/5Gal_American_Maid_Cap.stl");
			difference(){
				translate([0,0,-1]) cylinder(20,44,44);
				translate([0,0,-1]) cylinder(20,27,27);
			}
		}

}

module outer_geometry(){
	render(){
		difference()
		{
			color("teal"){
				cylinder(19,56.5/2,57/2);
			}
			translate([0,0,-1]) cylinder(40,27,27);
		}
		difference(){
		cylinder(10,56/2,56/2);
		cylinder(9,48/2,40/2);
		}
	}
}
