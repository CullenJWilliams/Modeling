include <BOSL2/std.scad>
include <BOSL2/joiners.scad>
include <./tapers.scad>

$fn=360;
inch = 25.4;

length=188; // TODO max(length+ walls)
height=26; // TODO max(heights)
thickness=1.5;
width=2*24+thickness;

difference()
{
	translate([0,0,-thickness/2])
		box(length,width,height,thickness);
	rods();
	translate([-15,0,25]) handle();

	translate([-15,39,0]) big_jag();
	mirror([0,1,0]) translate([-15,37,0]) small_jag();

	mirror([1,0,0]) mirror([0,1,0]) translate([-15,37,0]) small_jag();

	translate([15, 22,   0]) rotate([-45,0,0]) cylinder(60,13/2,13/2,anchor=BOTTOM);
	translate([15, 22+30,0]) rotate([-45,0,0]) cylinder(60,13/2,13/2,anchor=BOTTOM);
	//translate([15,-22,   0]) rotate([45,0,0]) cylinder(60, 13/2,13/2,anchor=BOTTOM);
	//translate([15,-22-30,0]) rotate([45,0,0]) cylinder(60, 13/2,13/2,anchor=BOTTOM);
}

module big_jag()
{
	for(i=[0:15:50]){
		translate([0,i,0])cylinder(20,8/2,8/2);
	}
	translate([0,-10,7]) cuboid([20,70,30],anchor=BOTTOM+FRONT);

}

module small_jag()
{
	for(i=[0:8:50]){
		translate([0,i,0])
			cylinder(20,4.5/2,4.5/2);
	}
	translate([0,-8,7]) cuboid([20,70,30],anchor=BOTTOM+FRONT);
}

module handle()
{
	hull()
	{
		translate([0,0,10]) linear_extrude(1) projection() rotate([90,0,0]) cyl(59,12.75/2,12.75/2,anchor=CENTER+FRONT,rounding=3);
		rotate([90,0,0]) cyl(58,12.75/2,12.75/2,anchor=CENTER+FRONT,rounding=4);
	}
	hull(){
		translate([0,0,10]) linear_extrude(1) projection() rotate([90,0,0]) cylinder(80,10.75/2,10.75/2,anchor=CENTER+FRONT);
		translate([0,0,-6]) rotate([90,0,0]) cylinder(80,10.75/2,10.75/2,anchor=CENTER+FRONT);
	}
	cylinder(.5*inch,(.5*inch)/2,(.5*inch)/2);
	translate([0,0,-10]) cuboid([40,23,26],anchor=BOTTOM,rounding=21/3,edges=[BOTTOM,FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT]);
}

module rods()
{
	cuboid([6,185,26],anchor=BOTTOM,rounding=2,edges=[BOTTOM,FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT]);
	cuboid([40,23,26],anchor=BOTTOM,rounding=21/3,edges=[BOTTOM,FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT]);
}


module box(length,width,height,thickness)
{
	render()
		difference()
		{
			cuboid([width,length,height],anchor=BOTTOM+CENTER,rounding=2,edges=[FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT]);
		}

}
