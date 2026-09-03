include <BOSL2/std.scad>
include <BOSL2/rounding.scad>
include <BOSL2/screws.scad>
include <BOSL2/skin.scad>

$fn=360;


height=12;
width=10;
depth=5;


//render()
//difference()
//{
//	button();
//	block_cut();
//	translate([1,0,2]) signal_bar_cut();
//	arrow();
//	difference(){
//		translate([.8,0,0])
//		cuboid([10,14,12],anchor=RIGHT+BOTTOM);
//		translate([-5,-4,0])
//		cylinder(12,1,1);
//		translate([-5,4,0])
//		cylinder(12,1,1);
//		tex = texture("ribs");
//		linear_sweep(
//				pentagon(ir=4.6),
//				texture=tex, h=12, tex_depth=1,
//				tex_size=[1,1], style="concave"
//		);
//	}
//}
//translate([1,0,2]) #signal_bar();
//signal_bar_slot();
//translate([0,0,3]) #rotate([180,0,0]) screw("M3", head="socket",length=5);
block();

module button()
{
tex = texture("bricks");
	rounded_prism(
		pentagon(ir=5),
		height=height,
		joint_top=0.5,
		joint_bot=0.5,
		joint_sides=[6.5,.5,.5,.5,.5],
		splinesteps=32,
		anchor=BOTTOM
		);
}
module block()
{

translate([-.5,0,0])
	rotate([0,0,90])
	rotate([90,0,0])
	prismoid(size1=[5,8.5],size2=[7,8.5], h=3,anchor=FRONT);
}

module block_cut()
{
translate([-.5,0,0])
	rotate([0,0,90])
	rotate([90,0,0])
	prismoid(size1=[5,8.5],size2=[7,8.5], h=3,anchor=FRONT);
}

module signal_bar_slot()
{
cuboid([6,6,2],anchor=LEFT+BOTTOM);
}

module signal_bar()
{
	cuboid([8,6,2],anchor=LEFT+BOTTOM);
	cuboid([2,6,8.5],anchor=LEFT+BOTTOM);
	translate([0,0,8.5]) cuboid([2.6,6,2],anchor=RIGHT+TOP);
}

module signal_bar_cut()
{
	cuboid([8,6,4],anchor=LEFT+BOTTOM);
	cuboid([2,6,8.5],anchor=LEFT+BOTTOM);
	translate([0,0,8.5]) cuboid([2.8,6,3],anchor=RIGHT+TOP);
}

module arrow()
{
	color("coral")
	translate([0,0,12])
	rotate([0,0,90])
	rotate([90,0,0])
	prismoid(size1=[6,1], size2=[0,1], h=6,anchor=CENTER);
}

