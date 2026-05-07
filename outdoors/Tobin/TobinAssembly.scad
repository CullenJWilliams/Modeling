include <BOSL2/std.scad>
use <./TobinSear.scad>
use <./TobinSidePlate.scad>
use <./TobinSpring.scad>

$fn=360;

inch = 25.4;


hammer_pin_hole_xm = 64-(7.8);
sear_pivot_x = hammer_pin_hole_xm+((1+1/8+1/64)*inch);
sear_pivot_y = 7/8*inch;

sear_spring_axis_x = (2+1/4+1/64)*inch+hammer_pin_hole_xm;
sear_spring_axis_y = 15/32*inch;


difference(){
	side_plate();
}
translate([-sear_spring_axis_x,sear_spring_axis_y,-(5/32*inch)-.1]) rotate([0,0,25]) rotate([0,180,0]) mirror([0,0,1]) color("coral") spring();
translate([-sear_pivot_x,sear_pivot_y,0]) rotate([0,0,23]) rotate([0,0,180]) mirror([0,0,1]) color("grey") sear();
