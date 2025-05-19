include <BOSL2/std.scad>
$fn=360;

render(){
	//translate([-180.65,-379.5,-54.7]) import("./Rhino_Bayonet_Adapter.stl");
	color("teal") translate([0,0,10]) rotate([85,0,180]) import("./Wilcox_Dovetail_v4.stl");
	//color("teal") projection() translate([-250-37,-3.6,20])import("./NVG Gen 3 Bridge.stl");

	translate([0,0,0]) cube([10,25,13],anchor=BOTTOM+FRONT);

	color("coral") 
		difference(){
			translate([0,-15,0]) cuboid([40,50,4],anchor=CENTER+BOTTOM+FRONT,rounding=2, edges=[FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT]);
			translate([-13.75,5,0]){
				//translate([13.75,-5,0]) linear_extrude(4) trapezoid(30,31.5,61,anchor=FRONT,rounding=2);

				hull(){
					translate([0,-15,0])     cylinder(10,1.65,1.65);
					translate([0,0,0])       cylinder(10,1.65,1.65);
					translate([0,20.8,0])    cylinder(10,1.65,1.65);
				}
				hull(){
					translate([27.5,-15,0])    cylinder(10,1.65,1.65);
					translate([27.5,0,0])      cylinder(10,1.65,1.65);
					translate([27.5,20.8,0])   cylinder(10,1.65,1.65);
				}
				hull(){
					translate([0,-15,0])     translate([0,0,2]) cylinder(4,4,4);
					translate([0,0,0])       translate([0,0,2]) cylinder(4,4,4);
					translate([0,20.8,0])    translate([0,0,2]) cylinder(4,4,4);
				}
				hull(){
					translate([27.5,-15,0])  translate([0,0,2]) cylinder(4,4,4);
					translate([27.5,0,0])    translate([0,0,2]) cylinder(4,4,4);
					translate([27.5,20.8,0]) translate([0,0,2]) cylinder(4,4,4);
				}
			}
		}
}
