include <BOSL2/std.scad>

$fn=360;
inch=25.4;

bar_d=1*inch;
bar_r=bar_d/2;

cone_base_d=31;
cone_base_r=cone_base_d/2;

cone_top_d=18;
cone_top_r=cone_top_d/2;

cone_h=.25*inch;
cone_base_h=2;
shaft_h=12;

nut_r=5;

Knob();
translate([0,0,-50]) Clamp();

module Knob()
{
	difference(){
		union(){
			cyl(10,r=35/2,anchor=TOP,chamfer1=1);
			cyl(10,r=50/2,anchor=BOTTOM,texture="cubes",chamfer=1);
		}
		translate([0,0,11]) cyl(8,nut_r,$fn=6,anchor=TOP);
		translate([0,0,-20]) cylinder(100,3,3);
	}
}

module Clamp()
{
	difference(){
		union(){
			cylinder(cone_base_h,cone_base_r,cone_base_r);
			translate([0,0,cone_base_h]) cyl(cone_h,r=cone_base_r,r2=cone_top_r,texture="ribs",tex_size=[1,1],tex_taper=1,tex_depth=.2,anchor=BOTTOM);
			cyl(cone_base_h+shaft_h,cone_top_r,chamfer2=1,anchor=BOTTOM);
			cuboid([50,30,30], rounding=15, edges=[FWD+RIGHT,FWD+LEFT,BACK+LEFT,BACK+RIGHT],anchor=TOP);
		}
		translate([0,0,-(bar_r+2)]) rotate([90,0,0])cylinder(100,bar_r,bar_r,anchor=CENTER);
		translate([0,0,-15]) cuboid([100,100,2],anchor=CENTER);
		translate([20,0,0]) cylinder(100,3,3,anchor=CENTER);
		translate([-20,0,0]) cylinder(100,3,3,anchor=CENTER);
		translate([20,0,-6]) cuboid([11,2*nut_r,5]);
		translate([-20,0,-6]) cuboid([11,10,5]);
		translate([0,0,3]) cyl(7,nut_r,$fn=6,anchor=TOP);
		translate([0,0,-20]) cylinder(100,3,3);
	}
}
