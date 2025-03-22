include <BOSL2/std.scad>

$fn=360;

height=40;
length = 3*30;

difference(){
	base(height,length);

	color("teal"){
		translate([10 + 0  ,-10,0]) chuck_key(8.5, 14.3, height,  1);
		translate([10 + 20 ,-10,0]) lathe_key(22, 8, height,1);
		translate([10 + 65 ,-10,2.1]) tool_key(6,15, height-2,1);
	}
}

module base(height, length){
	difference()
	{
		translate([0,-25,0]) cube([length,35,height]);
		translate([-1,5,-1]) cube([length+8,1.96,height-6]);
	}
}

module chuck_key(d,td,h, t)
{
	r=(d+t)/2;
	tr=(td+t)/2;
	translate([d,0,-1]) cylinder(h,r,r, $fn=360);
	translate([d,0,height-9]) cylinder(10,r,d, $fn=360);
	translate([d,0,height]) rotate([90,0,0]) cylinder(21,tr,tr, $fn=360);
}

module lathe_key(d, td, h, t)
{
	r=(d+t)/2;
	tr=(td+t)/2;
	translate([d,0,-1])
		cylinder(h,r,r, $fn=360);
	translate([d,0,height-9]) cylinder(10,r,r+3, $fn=360);
	translate([d,21,height]) rotate([90,0,0]) cylinder(42,tr,tr, $fn=360);
}

module tool_key(l, w, h, t)
{
	translate([0,-7,0]) cube([l+t,w+t,h-5]);
	translate([3.5,1,h-5]) prismoid(size1=[l+t,w+t], size2=[l*2,w*2], h=5);
}

module hex_slot(d, h, tolerance)
{
	r=(d+tolerance)/2;
	translate([d,0,-1])
		cylinder(h,r,r, $fn=6);
	translate([d,0,height-9]) cylinder(10,r,d, $fn=6);
	translate([d,0,height]) rotate([90,0,0]) cylinder(11,r,r, $fn=6);
}
