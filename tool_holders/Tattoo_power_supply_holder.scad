include <BOSL2/std.scad>
include <BOSL2/joiners.scad>

$fn=360;


height=100;
thickness=2;
ps_height=57;
depth=90+2*thickness;
width=120+2*thickness;


render()
{
	translate([width/2,depth/2,height]) rotate([0,0,-90]) clip(ps_height,thickness);
	translate([width/2,0,height]) top(5,width,depth,thickness);
	difference()
	{
		base(height,width,depth);
		translate([10,0,3*height/4]) pedal_slot(10,70,depth);
		magnet_holes(6,3);
		color("coral") translate([0,0,height])  feet_holes(10,6,width-2*thickness,depth-2*thickness);
	}
}

module clip(ps_height,thickness)
{
	cuboid([2,30,ps_height],anchor=BOTTOM+LEFT);
	translate([0,0,ps_height]) prismoid(size1=[15,30], size2=[0,30], shift=[-15/2,0], h=3,anchor=LEFT+BOTTOM);

}

module top(height,width,depth,thickness)
{
	difference(){
		cuboid([width,depth,height],anchor=BOTTOM);
		cuboid([width-thickness*2,depth-thickness*2,height],anchor=BOTTOM);
	}
}

module base(height,width,depth)
{
	translate([0,0,height-5]) cuboid([width,depth,5],anchor=BOTTOM+LEFT);
	prismoid(size1=[0,depth], size2=[width,depth], shift=[width/2,0], h=height-5);
}

module magnet_holes(magnet_r,magnet_h)
{
	translate([0,30,10]) rotate([0,90,0]) cylinder(magnet_h,magnet_r,magnet_r);
	mirror([0,1,0]) translate([0,30,10]) rotate([0,90,0]) cylinder(magnet_h,magnet_r,magnet_r);
	translate([0,30,40]) rotate([0,90,0]) cylinder(magnet_h,magnet_r,magnet_r);
	mirror([0,1,0]) translate([0,30,40]) rotate([0,90,0]) cylinder(magnet_h,magnet_r,magnet_r);
	translate([0,30,90]) rotate([0,90,0]) cylinder(magnet_h,magnet_r,magnet_r);
	mirror([0,1,0]) translate([0,30,90]) rotate([0,90,0]) cylinder(magnet_h,magnet_r,magnet_r);

}
module feet_holes(r,h,width,depth)
{
	translate([width+2-r,(-depth/2)+r,.1]) cylinder(h,r,r,anchor=TOP);
	translate([r+2,-depth/2+r,.1]) cylinder(h,r,r,anchor=TOP);
	translate([width/2,depth/2-r,.1]) cylinder(h,r,r,anchor=TOP);

}
module pedal_slot(height,width,depth)
{
	cuboid([width,depth,height],anchor=LEFT);

}
