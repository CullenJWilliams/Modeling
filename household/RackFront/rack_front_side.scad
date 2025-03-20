include <BOSL2/std.scad>
include <BOSL2/joiners.scad>

height = 130;
//height = 1;

bottom_hole = 35;
top_hole = 95;


rotate([0,90,0])
difference(){
	make_profile(height);

	cut_holes(bottom_hole,top_hole, 7/2);
}

module cut_holes(bottom_hole, top_hole, radius) {

	translate([-5,0,top_hole])
		rotate([0,90,0])
		cylinder(10,radius,radius,$fn=360);

	translate([-5,0,bottom_hole])
		rotate([0,90,0])
		cylinder(10,radius,radius,$fn=360);
}

module make_profile(height) {
	translate([0,0,height/2]){
		diff()
			cuboid([3,25,height]){
				attach(BACK) translate([0,height/3,0]) rotate(90) dovetail("male", slide=3, width=10, height=2,chamfer=.4,taper=2);
				tag("remove") attach(FRONT) translate([0,height/3,0]) rotate(90)  dovetail("female", slide=3, width=10, height=2,chamfer=.4,taper=-2);

				attach(BACK) translate([0,-height/3,0]) rotate(90) dovetail("male", slide=3, width=10, height=2,chamfer=.4,taper=2);
				tag("remove") attach(FRONT) translate([0,-height/3,0]) rotate(90)  dovetail("female", slide=3, width=10, height=2,chamfer=.4,taper=-2);
			}
	}
}
