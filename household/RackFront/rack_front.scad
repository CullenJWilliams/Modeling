include <BOSL2/std.scad>
include <BOSL2/joiners.scad>

height = 130;

rotate([0,90,0])
difference()
{
	make_profile(height,85);
	make_inlay(2,83,62.5);
	cut_holes();
}

module make_inlay(depth,width,height)
{
	translate([-(depth+1)/2,0,65])
		color("tomato")
		cuboid([depth+1,width,height]);
}

module cut_holes() {
	display_port_hole(-5,0,102.5);
	display_port_hole(-5,10,27.5);
	display_port_hole(-5,-10,27.5);
	display_port_hole(-5,0,27.5);
}


module display_port_hole(x,y,z)
{
	color("blue"){
		r = 7/2;
		translate([x,y,z])
			rotate([90,0,90]){
				linear_extrude(20){
					rect([20,13],rounding=[3,3,3,3],$fn=100);
					rect([20+7+7,7],rounding=[r,r,r,r],$fn=100);
				}
			}
	}
}

module make_profile(height, width) {
	translate([0,0,height/2]){
		diff()
			cuboid([3,width,height]){
				attach(BACK) translate([0,height/3,0]) rotate(90) dovetail("male", slide=3, width=10, height=2,chamfer=.4,taper=2);
				tag("remove") attach(FRONT) translate([0,height/3,0]) rotate(90)  dovetail("female", slide=3, width=10, height=2,chamfer=.4,taper=-2);

				attach(BACK) translate([0,-height/3,0]) rotate(90) dovetail("male", slide=3, width=10, height=2,chamfer=.4,taper=2);
				tag("remove") attach(FRONT) translate([0,-height/3,0]) rotate(90)  dovetail("female", slide=3, width=10, height=2,chamfer=.4,taper=-2);
			}
	}
}
