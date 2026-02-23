include <BOSL2/std.scad>
include <BOSL2/joiners.scad>
include <./tapers.scad>

$fn=360;

inch=25.4;

length=400;
height=12;
thickness=1.5;
width=38+2*thickness;

render()
difference()
{
	translate([-28,thickness,-thickness])box(length,width,height,thickness);
	translate([thickness,-thickness,0]) clocking_bar();
	translate([-1*inch/2-thickness,0,0]) ar_upper_vise();

	for(i=[400/3:400/3:400]){
		echo(i);
		translate([0,-i,0]) cuboid([100,.1,100]);
	}
}

module clocking_bar(){
	cuboid([10,395,76],anchor=BOTTOM+LEFT+BACK);
}

module ar_upper_vise(){
	translate([0,-100,1*inch/2])
	rotate([90,0,0])
	{
		translate([0,0,193]) cylinder(15,19/2,19/2);
		translate([0,0,180]) cylinder(13,1*inch/2,19/2);
		cylinder(180,(1*inch)/2,(1*inch)/2);
		cuboid([.77*inch,.77*inch,100],anchor=TOP);
	}
}

module box(length,width,height,thickness)
{
	render()
		difference()
		{
			cuboid([width,length,height],anchor=BOTTOM+BACK+LEFT,rounding=2,edges=[FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT]);
		}

}
