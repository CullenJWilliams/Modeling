include <BOSL2/std.scad>

$fn=360;

height=40;
length = 5*30;

difference(){
	base(height,length);

	color("teal"){
		translate([10 + 0  ,-1,0]) hex_slot(9, height,  1);
		translate([10 + 30 ,-1,0]) hex_slot(6.8, height,1);
		translate([10 + 60 ,-1,0]) hex_slot(5.6, height,.9);// NOTE: unprinted
		translate([10 + 90 ,-1,0]) hex_slot(4.5, height,.8);// NOTE: unprinted
		translate([10 + 120,-1,0]) hex_slot(3.3, height,.8);// NOTE: unprinted
	}
}

module base(height, length){
	difference()
	{
		translate([0,-10,0]) cube([length,20,height]);
		translate([-1,5,-1]) cube([length+8,1.96,height-6]);
	}
}


module hex_slot(d,h,tolerance)
{
	r=(d+tolerance)/2;
	translate([d,0,-1])
		cylinder(h,r,r, $fn=6);
	translate([d,0,height-9]) cylinder(10,r,d, $fn=6);
	translate([d,0,height]) rotate([90,0,0]) cylinder(11,r,r, $fn=6);
}
