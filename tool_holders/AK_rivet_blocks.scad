include <BOSL2/std.scad>
include <BOSL2/joiners.scad>
include <./tapers.scad>

$fn=360;

length=119;
height=6;
width=130;
thickness=1.5;

difference()
{
	translate([0,0,-thickness/2])box(length,width,height,thickness);
	translate([thickness,-thickness,0]) cuboid([45,90,44],anchor=BOTTOM+BACK+LEFT);
	translate([2*thickness+45,-thickness,0]) holeDrillingJig();
	translate([thickness,-2*thickness-90,0]) cuboid([7,25.5,25],anchor=BOTTOM+BACK+LEFT);
	translate([2*thickness+7,-2*thickness-90,0]) cuboid([6.5,32.5,29],anchor=BOTTOM+BACK+LEFT);
	translate([3*thickness+7+6.5,-2*thickness-90,0]) cuboid([16,26,45],anchor=BOTTOM+BACK+LEFT);
	translate([4*thickness+7+6.5+16+2,-2*thickness-90-19,0]) cylinder(9.7,20/2,20/2, anchor=BOTTOM+BACK+LEFT);
	translate([5*thickness+7+6.5+18+30,-2*thickness-90-20,0]) cuboid([20,6.5,32],anchor=BOTTOM+BACK+LEFT);
	translate([5*thickness+7+6.5+18+60,-2*thickness-90-20,0]) cuboid([10,10,40],anchor=BOTTOM+BACK+LEFT);
}

module holeDrillingJig(){
	cuboid([70,108,58],anchor=BOTTOM+BACK+LEFT);
	for(i=[11.5,58.5])
	{
		translate([i,0,0])
		for(j=[16,108/2,92])
		{
			translate([0,-j,-5]) cylinder(10,5,5);
		}
	}
}

module box(length,width,height,thickness)
{
	render()
		difference()
		{
			cuboid([length,width,height],anchor=BOTTOM+BACK+LEFT,rounding=2,edges=[FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT]);
		}

}
