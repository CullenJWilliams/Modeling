include <BOSL2/std.scad>
$fn=360;


rod_diameter = 9.6;
rod_spacing = 45;
rod_height = 14;

screw_hole_diameter=4;
screw_spacing = 110;

width=10;
thickness=2;

//translate([-52.5,-5,21]) rotate([-90,0,0]) import("weinhalter2.stl");


difference()
{
	union(){
		mounting_plate(screw_spacing,width,thickness);
		mirror([1,0,0]) 
			translate([0,0,rod_height+rod_diameter/2]) rotate([90,0,0])
			translate([rod_spacing/2,0,-width/2]) arms(rod_diameter,2);
		translate([0,0,rod_height+rod_diameter/2]) rotate([90,0,0])
			translate([rod_spacing/2,0,-width/2]) arms(rod_diameter,2);
	}
	screw_holes(screw_spacing);
	translate([0,0,rod_height+rod_diameter/2]) rotate([90,0,0])
		rod_holes(rod_diameter,rod_spacing);

}

module arms(rod_diameter,thickness)
{
	linear_extrude(width)
		difference(){
			square([80,50],center=true);
			minkowski(){
				difference(){
					square([80,50],center=true);
					minkowski()
					{
						union()
						{
							arm_length=20;
							circle(rod_diameter/2+thickness);

							translate([arm_length,0]) circle(rod_diameter/2+thickness);
							translate([arm_length/2,0]) square([arm_length,rod_diameter+2*thickness],center=true);

							arm_height=14;
							translate([arm_length,0]) rotate([180,0]) square([rod_diameter/2+thickness,rod_height+rod_diameter/2-.9],center=false);

							translate([arm_length,-rod_height-rod_diameter/2+.9]) rotate([0,0,90]) square([.1,rod_height+rod_diameter/2],center=true);
						}
						circle(2);
					}
				}
				circle(2);
			}
		}
}

module fillet()
{

}

module rod_holes(diameter,spacing)
{
	r=diameter/2;
	translate([spacing/2,0,0]) cylinder(10,r,r,anchor=CENTER);
	mirror([1,0,0]) translate([spacing/2,0,0]) cylinder(10,r,r,anchor=CENTER);
}

module mounting_plate(spacing,width,thickness)
{
	cuboid([spacing+10,width,thickness],rounding=width/2,edges=[
			FRONT+RIGHT,
			FRONT+LEFT,
			BACK+RIGHT,
			BACK+LEFT]);

}

module screw_holes(spacing)
{
	r=screw_hole_diameter/2;
	translate([spacing/2,0,0]) cylinder(10,r,r,anchor=CENTER);
	mirror([1,0,0]) translate([spacing/2,0,0]) cylinder(10,r,r,anchor=CENTER);
}
