include <BOSL2/std.scad>

$fn=360;
base_height=9.8;
middle_height=2+3.5+2+3.5+2+3.5;

difference()
{
	union(){
		translate([0,7,0]) base(base_height);
		translate([0,0,base_height]) stem_middle();
		base_pin();
		translate([0,0,base_height+middle_height]) top();
	}
	translate([0,16,5]) screw_hole();
	stem_negative();
}

module base_pin()
{
	cylinder(3.5,9.95/2,9.95/2,anchor=TOP);
	translate([0,0,-3.5]) cylinder(3.5,9/2,9.95/2,anchor=TOP);

}

module base(height){
	difference(){
		intersection()
		{
			cuboid([19.5,35,height],anchor=BOTTOM);
			cylinder(height,35/2,35/2);
		}
		translate([0,4,height]) rotate([-5,0,0]) cuboid([19.5,19.5,5],anchor=BOTTOM+FRONT);
	}
}

module top(){
shaft_height=11;
	difference(){
		union()
		{
			cuboid([15,15,shaft_height],anchor=BOTTOM);
			translate([0,1,shaft_height]) cuboid([shaft_height,13,2.75],anchor=BOTTOM);
			translate([0,0,2.75+shaft_height]) cuboid([15,15,2.75],anchor=BOTTOM);
		}
		translate([0,-15/2,shaft_height]) cuboid([6.6,2,6],anchor=FRONT+TOP);
	}

}

module stem_middle(){
	cuboid([13,13,2+3.5+2+3.5+2],anchor=BOTTOM,rounding=1,edges=[FRONT+RIGHT,FRONT+LEFT,BACK+RIGHT,BACK+LEFT]);
	translate([0,0,2]) stem_flare();
	translate([0,0,2+3.5+2]) stem_flare();
	translate([0,0,2+3.5+2+3.5+2]) stem_flare();
}
module stem_flare(){
	intersection()
	{
		cuboid([19,21.5,3.5],anchor=BOTTOM,rounding=1,edges=[FRONT+RIGHT,FRONT+LEFT,BACK+RIGHT,BACK+LEFT]);
		translate([0,6.75,0])  cylinder(3.5,35/2,35/2);
		translate([0,-6.75,0]) cylinder(3.5,35/2,35/2);
	}
}

module stem_negative(){
	translate([0,0,-7]) cylinder(17,3,3);
	translate([0,0,base_height]) cylinder(40,4.3,4.3);
}

module screw_hole()
{
	cylinder(10,3,3,anchor=TOP);
	cylinder(16,14/2,14/2,anchor=BOTTOM);
	translate([0,2,0]) cuboid([14,15,5],anchor=BOTTOM);

}
