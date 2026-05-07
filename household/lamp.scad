include <BOSL2/std.scad>
$fn=360;

inner_radius=45;

union(){
	difference(){
		translate([0,0,-5])
			render()
			//difference()
			{
				//translate([0,0,height+thickness]) sphere(inner_radius);
				rotate([0,90,0])cylinder(1,inner_radius,inner_radius,anchor=RIGHT);
				rotate([90,90,0])cylinder(1,inner_radius,inner_radius,anchor=RIGHT);
				rotate([45,90,0])cylinder(1,inner_radius,inner_radius,anchor=RIGHT);
				rotate([-45,90,0])cylinder(1,inner_radius,inner_radius,anchor=RIGHT);
			}
		cylinder(50,inner_radius,inner_radius,anchor=TOP);
	}

	//translate([25,0,0])
	path = turtle([
			"move",20,
			"left",30,
			"arcleft",45,60,
			"arcright",85,30,
			"arcleft",85,30,
			"left",90,
			"move",50]);
	//stroke( path);
	rotate_sweep(path);
}
