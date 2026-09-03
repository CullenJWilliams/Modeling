$fn=360;

h=50;
difference()
{
	sphere(20);
	translate([0,0,-h/2]) cylinder(h,10,10);
	#rotate([90,0,0]) translate([0,0,-h/2]) cylinder (h,10,10);
	rotate([0,90,0]) translate([0,0,-h/2]) cylinder(h,10,10);
}
