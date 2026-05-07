include <BOSL2/std.scad>

$fn=360;

inch = 25.4;


mirror([0,0,1])
spring();

h=(5/32)*inch;

module spring()
{
	pivot();
	translate([-5/32*inch,0,h]) key();
	translate([-5/32*inch,.75,-3/64*inch]) blade();
}

module pivot()
{

	od=4.6;
	id=1/8*inch;
	or=od/2;
	ir=id/2;

	difference(){
		union()
		{
			cylinder(h,or,or,anchor=BOTTOM);
			translate([-od/6,0,0]) rotate([0,0,-90]) rotate([90,0,0]) prismoid(size1=[4.35,h], size2=[1.5,h], h=h-od/6,anchor=FRONT+BOTTOM);
		}
		cylinder(h,ir,ir,anchor=BOTTOM);
	}
}

module key()
{
	difference(){
		cuboid([1/4*inch,3/64*inch,3/64*inch],anchor=RIGHT+BOTTOM);
		translate([-3,0,1.5]) rotate([0,-25,0]) cuboid([8.6,3/64*inch,2],anchor=RIGHT+BOTTOM);
	}
}

module blade()
{
	$fn=3600;
	height=(5/32+3/64)*inch;
	length=29/32*inch;
	render()
		difference()
		{
			cylinder(height,100,100,anchor=BACK+BOTTOM);
			translate([0,-1.5,0]) cylinder(height,100,100,anchor=BACK+BOTTOM);
			cuboid([300,300,100],anchor=LEFT);
			translate([-length,0,0]) rotate([0,0,0]) cuboid([300,300,100],anchor=RIGHT);
			translate([-length,-3.5,0]) rotate([0,0,20]) cuboid([300,300,100],anchor=RIGHT);
		}
}
