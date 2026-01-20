include <BOSL2/std.scad>
include<BOSL2/screws.scad>
$fn=360;
inch = 25.4;

length=90;
width=45;
height=30;
d = 36;
r=d/2;

difference(){
	diff()
		cuboid([width,length,height])
			attach(FRONT)
					screw_hole("M16,18",anchor=TOP,thread=true,bevel1="reverse");

	cylinder(height+2,r,r,anchor=CENTER);
	translate([0,height-r-10,0]) clamp_cut();
}

translate([0,-80,-height/2]) rotate([180,0,0]) screw("M16,20",anchor=TOP,thread=true,bevel1=true,head="socket ribbed");

module clamp_cut(){
	clamp_diameter=20;
	clamp_r = clamp_diameter/2;
	difference(){
		rotate([90,0,0]) cylinder(height+1,clamp_r+.5,clamp_r+.5);
		rotate([90,0,0]) cylinder(height,clamp_r,clamp_r);
	}
}

// TODO make a screw

